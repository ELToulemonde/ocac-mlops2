import os
from unittest.mock import patch

import pandas as pd
from pytest import fixture
from sqlalchemy import create_engine

from dags.config import MONITORING_TABLE_NAME
from formation_indus_ds_avancee.monitoring import monitor_with_io


@fixture
def get_sqlite_db_conn():
    engine = create_engine('sqlite:///test_db.db')
    db_conn = engine.connect()
    yield db_conn
    db_conn.close()
    os.remove('test_db.db')


@patch('pandas.read_csv')
def test_monitor_with_io_should_write_predictions_mean_to_db(mocked_read_csv, get_sqlite_db_conn):
    # Given
    predictions_folder = 'test_pred_folder'
    given_date = pd.to_datetime('20200101-120000', format='%Y%m%d-%H%M%S')
    predictions = pd.DataFrame({'predictions_time': [given_date, given_date],
                                'predictions': [12, 14]})
    mocked_read_csv.return_value = predictions
    db_con_str = 'sqlite:///test_db.db'
    expected = pd.DataFrame({'predictions_mean': [13.]})

    # When
    monitor_with_io(predictions_folder, db_con_str, monitoring_table_name=MONITORING_TABLE_NAME)
    actual = pd.read_sql(f'SELECT * FROM {MONITORING_TABLE_NAME}', get_sqlite_db_conn, parse_dates=['predictions_time'])

    # Then
    pd.testing.assert_frame_equal(expected, actual)


def test_monitoring_table_name_as_been_changed():
    assert MONITORING_TABLE_NAME != "monitoring"
