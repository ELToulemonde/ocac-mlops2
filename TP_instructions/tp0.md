test
summary: TP0 - Setup de l'environnement de travail
id: tp0
categories: setup
tags: setup
status: Published
authors: OCTO Technology
Feedback Link: https://gitlab.com/octo-technology/les-bg-de-la-data/s-s-all/formation/dsin2/-/issues/new

# TP0 - Setup de l'environnement de travail

## Overview
Duration: 15

Cette partie permet de préparer l'environnement de travail pour les TPs.

## Créer un compte sur Gitlab
Duration: 2

### Création du compte

Rendez-vous sur le site de gitlab afin de créer un compte si vous n'en possédez pas déjà un: <https://gitlab.com/users/sign_in>.

Puis, cliquer sur `Register now`:

![Page de connexion à gitlab.com](./docs/tp1/gitlab-sign-in-page.png)

### Fork du repo de TP dans votre espace personnel gitlab

Une fois votre compte créé, rendez-vous sur la page du repository de code de cette formation: <https://gitlab.com/mhouacine/dsin2>

Puis `forkez` le repo à l'aide du bouton en haut à droite pour récupérer une copie de ce dernier dans votre espace gitlab personnel:

![bouton fork](docs/tp1/gitlab-fork-button.png)

🏁 Vous possédez désormais une copie personnelle du repo de code pour les TPs ! Nous allons désormais la cloner dans votre environnement de développement.

## Prise en main de jupyterhub l'environnement de tp.
Duration: 3

Pour vous connecter sur l'interface de TP, l'instructeur vous aura donner votre identifiant mot de passe :
![Connection](docs/tp0/connection.png)

Une fois connecté, une page de chargement apparaît pendant ce temps votre environment de tp est crée : 
![StartingServer](docs/tp0/starting_server.png)

Cela peut prendre 1 à 2 minutes, mais pas plus. Si votre environment ne démarre pas vous pouvez essayer d'actualiser puis faire appel à votre formateur.

Une fois que le serveur est démarré vous êtes redirigés vers la page principale :
![HomePage](docs/tp0/homepage.png)

Depuis cette page vous pouvez ouvrir :
- Un terminal : dans other / terminal
- Un éditeur de code en ligne : dans Notebook / VS Code
- Airflow que nous manipulerons
- MLFlow que nous seront amené à manipuler



## Préparer son environnement et cloner le repo
Duration: 3

Rendez-vous sur votre environnement de développement.

L'url de ce dernier vous sera communiqué pendant la formation.

Dans VSCode, ouvrez un terminal afin d'y cloner le repository de code des TPs avec la commande `$> git clone <url>;`. Vous trouverez l'URL de clonage en HTTPS sur gitlab, dans le repo que vous avez forké:

Pour ouvrir un terminal il faut cliquer sur les 2 barres parallèles en haut à droite puis `terminal` puis `new terminal`. 
![bouton clonage](docs/tp1/gitlab-clone-button.png)

Pour réaliser ce TP vous devant ensuite checkout la branche `0_initial_state` :

```bash
cd dsin2
git checkout 0_initial_state
```

Ensuite, nous allons créer un environnement de travail Python avec Conda et installer les dépendances:

```bash
conda create -yqf python=3.9 --name python_indus_avancee
source activate python_indus_avancee
pip install -e .
pip install -r requirements_test.txt
```

Exécutons les tests pour s'assurer que tout marche !

```bash
make tests-unitaires
```


