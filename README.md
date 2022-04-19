
# Project HYPNOS

Réalisation d'une application web et mobile de réservation de suites romantiques pour le 
groupe hôtelier Hypnos. Ce site comporte une page d'accueil, une page catalogue hôtel, une page catalogue Suites, une pge de détail pour un hôtel répertoriant les suites et une page détail suite. On y retrouvera également une page réservation, contact et inscription / login.




## Authors

- [@delphine Gavaud](https://github.com/delphine5656)


## Tech Stack

**Client:** twig, css, js, bootstrap

**Server:** symfony, php


## Récupérer le projet

Installer le projet

Créer un dossier en local 
ouvrez php storm
Sélectionner dans la fenêtre modal « Checkout from Version Control->Git »
Remplir les informations demandées
Installer les dépendances avec la console 
```bash
git clone
composer install
symfony console cache:clear
composer update
```
Récupérer la structure de la base de données
Modifier le fichier parameters.yml
Dans le terminal: 
```bash
php bin/console doctrine:database:create
php bin/console doctrine:schema:update –dump-sql
php bin/console doctrine:schema:update –force
php bin/console make:entity --regenerate
php bin/console doctrine:migrations:diff
php bin/console doctrine:migrations:migrate
```


## Déploiement Heroku

Créer un compte sur Heroku

```bash
heroku login
composer create-project symfony/website-skeleton symfony-heroku/
cd symfony-heroku
```
Créer un répository github
puis initialiser le dépot git dans le terminal du project
```bash
git init
Initialized empty Git repository in ~/symfony-heroku/.git/
git add .
git commit -m "initial import"
```
Créer l'application heroku : 

```bash
heroku create

```
Créer un fichier procfile

```bash
echo 'web: heroku-php-apache2 public/' > Procfile
git add Procfile
git commit -m "Heroku Procfile"

```
Passer l'application en mode production sur le fichier .env*

```bash
heroku config:set APP_ENV=prod

```
Importer l'addons JawsDb pour lier notre base de donnée:
```bash
heroku addons:create jawsdb
heroku config:get JAWSDB_URL
mysql://username:password@hostname:port/default_schema

```
Pour avoir vos identifiants de connexion, ouvrez le tableau de bord de JawsDb
```bash
heroku addons:open jawsdb
```
faites un export de votre base de donnée sql pour ensuite l'importer dans votre nouvelle base de donnée JawsDb
Installer HEIDI puis connecter JawsDb à HEIDI

Réecriture des Url avec le fichier htaccess:
```bash
composer require symfony/apache-pack
git add composer.json composer.lock symfony.lock public/.htaccess
git commit -m "apache-pack"
```
Pour vos fichiers webbcore 
installer npm et télécharger le pluggin node js:
```bash
heroku plugins:install buildpack-registry 
```
Puis configurer votre fichier package.json:
```bash
"engines": { 
    "node": "v14.17.1", 
    "npm": "7.18.1" 
} 

déployer l'application 
```bash
git push heroku master
```
Ouvrir l'application:
```bash
heroku open
```




    
## Création administrateur back office

On va d’abord configurer notre fichier security.yaml. On veut récupérer nos données via la BDD 
Je décommente l’access contrôle et défini que les pages admin sont accessibles qu’aux admins 
```bash
access_control: 
     - { path: ^/admin, roles: ROLE_ADMIN } 
     - { path: ^/profile, roles: ROLE_USER } 
```
Je crée mon premier utilisateur avec le makerBundle :  
```bash
symfony console make:user 
 
The name of the security user class (e.g. User) [User]: 
> User 
 
Do you want to store user data in the database (via Doctrine)? (yes/no) [yes]: 
> yes 
 
Enter a property name that will be the unique "display" name for the user (e.g. 
email, username, uuid [email] 
> email 
 
Does this app need to hash/check user passwords? (yes/no) [yes]: 
> yes 

```
Mes admins se connecteront via un email et cet email sera forcément unique avec un mot de passe qui sera hashé pour la sécurité. 


##Utilisation de easyadmin pour la gestion de l'administration
première étape est d'installer le bundle easyadmin
```bash
composer require easycorp/easyadmin-bundle
```
J'installe easyadmin sur mon application:
```bash
composer req admin 
Symfony console make:admin:dashboard 
symfony console make:admin:crud 
```
Je lie ensuite toutes mes entités. 
Dans admin puis dans dashboardController, je rempli le chemin de la gestion mon admin: 
```bash
yield MenuItem::linkToDashboard('Dashboard', 'fa fa-home'); 
yield MenuItem::linkToCrud('Client', 'fas fa-user', User::class); 

```





