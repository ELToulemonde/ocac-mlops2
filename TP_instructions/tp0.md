summary: TP0 - Setup de l'environnement de travail
id: tp0
categories: setup
tags: setup
status: Published
authors: OCTO Technology
Feedback Link: https://gitlab.com/octo-technology/les-bg-de-la-data/s-s-all/formation/dsin2/-/issues/new

# TP0 - Setup de l'environnement de travail

## Overview
Duration: 1

Cette partie permet de préparer l'environnement de travail pour les TPs.

## Créer un compte sur Gitlab
Duration: 2

### Création du compte

Rendez-vous sur le site de gitlab afin de créer un compte si vous n'en possédez pas déjà un: <https://gitlab.com/users/sign_in>.

Puis, cliquer sur `Register now`:

![Page de connexion à gitlab.com](./docs/tp0/gitlab-sign-in-page.png)

### Fork du repo de TP dans votre espace personnel gitlab

Une fois votre compte créé, rendez-vous sur la page du repository de code de cette formation: <https://...>

Puis `forkez` le repo à l'aide du bouton en haut à droite pour récupérer une copie de ce dernier dans votre espace gitlab personnel:

![bouton fork](docs/tp0/gitlab-fork-button.png)

🏁 Vous possédez désormais une copie personnelle du repo de code pour les TPs ! Nous allons désormais la cloner dans votre environnement de développement.

## Préparer son environnement et cloner le repo
Duration: 3

Rendez-vous sur votre environnement de développement.

L'url de ce dernier vous sera communiqué pendant la formation.

Ouvrez VSCode en cliquant sur la tuile éponyme:
![tuile_vscode](docs/tp0/dslab-home-vscode-tile.png)

Pour cloner le repository de code des TPs, ouvrez un terminal:
![vscode_terminal](docs/tp0/dslab-vscode-new-terminal.png)

Puis tapez la commande `$> git clone <url>;` avec l'URL de clonage en HTTPS dans le repo que vous avez forké sur gitlab:
![bouton clonage](docs/tp0/gitlab-clone-button.png)


Pour réaliser ce TP vous devant ensuite checkout le tag `0_initial_state` :

```bash
cd dsin2-public-ocac
git checkout 0_initial_state
```

Ensuite, nous allons créer un environnement de travail Python avec Conda et installer les dépendances:

```bash
conda create -yqf python=3.8 --name python_indus_avancee
source activate python_indus_avancee
pip install -e ".[test]"
```

Exécutons les tests pour s'assurer que tout marche !

```bash
make tests-unitaires
```
