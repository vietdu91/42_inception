# Inception...
## ... quand Docker se glisse dans nos rêves
```
You musn't be afraid to dream a little bigger, darling. 💭💭💭
```
![Screenshot](makefile_img.png)

## Comment faire marcher la machine des rêves ? 🤖

C'est simple : tu fais un ```make```

Par la suite, va vers ton navigateur et tape sur la barre d'adresses : ```https://emtran.42.fr```

... et laisse-toi guider !

### Choix :

* Alpine
* VM : Debian LXDE

## La machine des rêves : mode d'emploi 🐳

### Tutoriel le plus sympathique :

* Le superbe tutoriel [GradeMe](https://tuto.grademe.fr/inception/) de [mprigent](https://github.com/mprigent/Inception) pour ne pas perdre le fil du projet !
* Le README du grand [vbachele](https://github.com/vbachele/Inception) qui énumère les commandes et les ressources indispensables pour le projet 

### Installation du projet :

* Installation de [Docker Engine](https://docs.docker.com/engine/install/ubuntu/)

## Docker, Docker-compose, Docker-image, Docker-network... mais putain c'est quoi tout ce merdier 💩 ?!

### Comment Docker fonctionne 🐳 ?

Docker est un système de virtualisation de conteneur qui te permet de créer, déployer et exécuter des applications dans des environnements isolés appelés conteneurs. Il utilise le noyau de l'hôte pour créer des espaces de noms et des cgroups qui isolent les processus d'un conteneur des autres conteneurs et de l'hôte.

Voici les étapes générales de fonctionnement de Docker :

1. Tout d'abord, tu crées un fichier de configuration appelé ```Dockerfile``` qui décrit les étapes nécessaires pour construire une image de conteneur. Cette image contient toutes les dépendances et les configurations nécessaires pour exécuter ton application.

2. Une fois le fichier Dockerfile créé, tu peux utiliser la commande ```docker build``` pour créer une image à partir de celui-ci. Cette image est stockée dans le ```Docker daemon``` local, ou télécharger depuis un registre d'image Docker public ou privé.

3. Ensuite, tu peux utiliser la commande ```docker run``` pour démarrer un conteneur à partir de cette image. Lorsque tu exécutes cette commande, Docker crée un nouveau espace de noms et des cgroups pour isoler les processus du conteneur. Il copie également les fichiers nécessaires à partir de l'image pour créer un système de fichiers pour le conteneur.

4. Lorsque le conteneur est en cours d'exécution, il est isolé des autres conteneurs et de l'hôte. Il a son propre système de fichiers, ses propres processus et ses propres réseaux. Tu peux utiliser des commandes telles que ```docker exec``` pour exécuter des commandes dans un conteneur en cours d'exécution.

5. Si tu souhaites arrêter un conteneur, tu peux utiliser la commande ```docker stop```. Cela enverra un signal de fin de processus aux processus en cours d'exécution dans le conteneur, ce qui les arrêtera proprement.

6. Enfin, tu peux utiliser la commande ```docker rm``` pour supprimer un conteneur arrêté, ou utiliser la commande ```docker rmi``` pour supprimer une image que tu n'utilises plus.

### Que fait donc Docker-compose de plus ? 🐳❤️🐳❤️🐳

Docker Compose est un outil qui te permet de définir et de gérer facilement des applications multi-conteneurs en utilisant un fichier de configuration appelé ```docker-compose.yml```. Il est construit sur les commandes Docker, mais il offre une interface haut niveau pour gérer les dépendances entre les conteneurs, les volumes de données et les réseaux.

Le fichier ```docker-compose.yml``` contient une description de tous les conteneurs, volumes et réseaux de votre application. Chaque section dans le fichier définit une partie de votre application, telle qu'une base de données ou un serveur web. Vous pouvez spécifier des options pour chaque conteneur, telles que les ports à exposer ou les variables d'environnement à utiliser.

Avec Docker Compose, vous pouvez facilement démarrer, arrêter et gérer l'état de votre application en utilisant des commandes simples comme docker-compose up, docker-compose down et docker-compose logs. Les commandes up lanceront tous les conteneurs définis dans le fichier de configuration, en garantissant que les dépendances sont satisfaites et les options de configuration sont appliquées.

En utilisant Docker Compose, vous pouvez également facilement gérer les dépendances entre les conteneurs, telles que la configuration d'une base de données pour un serveur web. En définissant ces dépendances dans le fichier de configuration, vous pouvez être sûr que les conteneurs seront démarrés dans le bon ordre et que les variables d'environnement appropriées seront transmises à chaque conteneur.

En gros Docker-compose est un outil pour faciliter la création, configuration et démarrage des conteneurs multiples en utilisant un fichier de configuration unique, donc cela facilite le déploiement, test et maintenace d'une application en utilisant des conteneurs.
