# Inception...
## ... quand Docker se glisse dans nos rêves
```
You musn't be afraid to dream a little bigger, darling. 💭💭💭
```
<div id="top"></div>

![Screenshot](makefile_img.png)

## Comment faire marcher la machine des rêves ? 🤖

C'est simple : tu fais un ```make```

Par la suite, va vers ton navigateur et tape sur la barre d'adresses : ```https://emtran.42.fr```

... et laisse-toi guider !

### Choix :

* Alpine
* VM : Xubuntu

## La machine des rêves : mode d'emploi 🐳

### Tutoriel le plus sympathique :

* Le superbe tutoriel [GradeMe](https://tuto.grademe.fr/inception/) de [mprigent](https://github.com/mprigent/Inception) pour ne pas perdre le fil du projet !
* Le README du grand [vbachele](https://github.com/vbachele/Inception) qui énumère les commandes et les ressources indispensables pour le projet 

### Installation du projet :

* Installation de [Docker Engine](https://docs.docker.com/engine/install/ubuntu/)

## Docker, Docker-compose, Docker-image, Docker-network... mais putain c'est quoi tout ce merdier 💩 ?!

<details>
  <summary><b>Comment Docker fonctionne 🐳 ?</b></summary>
  <br>
Docker est un système de virtualisation de conteneur qui te permet de créer, déployer et exécuter des applications dans des environnements isolés appelés conteneurs. Il utilise le noyau de l'hôte pour créer des espaces de noms et des cgroups qui isolent les processus d'un conteneur des autres conteneurs et de l'hôte.

Voici les étapes générales de fonctionnement de Docker :

1. Tout d'abord, tu crées un fichier de configuration appelé ```Dockerfile``` qui décrit les étapes nécessaires pour construire une image de conteneur. Cette image contient toutes les dépendances et les configurations nécessaires pour exécuter ton application.

2. Une fois le fichier Dockerfile créé, tu peux utiliser la commande ```docker build``` pour créer une image à partir de celui-ci. Cette image est stockée dans le ```Docker daemon``` local, ou télécharger depuis un registre d'image Docker public ou privé.

3. Ensuite, tu peux utiliser la commande ```docker run``` pour démarrer un conteneur à partir de cette image. Lorsque tu exécutes cette commande, Docker crée un nouveau espace de noms et des cgroups pour isoler les processus du conteneur. Il copie également les fichiers nécessaires à partir de l'image pour créer un système de fichiers pour le conteneur.

4. Lorsque le conteneur est en cours d'exécution, il est isolé des autres conteneurs et de l'hôte. Il a son propre système de fichiers, ses propres processus et ses propres réseaux. Tu peux utiliser des commandes telles que ```docker exec``` pour exécuter des commandes dans un conteneur en cours d'exécution.

5. Si tu souhaites arrêter un conteneur, tu peux utiliser la commande ```docker stop```. Cela enverra un signal de fin de processus aux processus en cours d'exécution dans le conteneur, ce qui les arrêtera proprement.

6. Enfin, tu peux utiliser la commande ```docker rm``` pour supprimer un conteneur arrêté, ou utiliser la commande ```docker rmi``` pour supprimer une image que tu n'utilises plus.
<div align="right">
  <b><a href="#top">↥ viser la Lune 🌛</a></b>
</div>
</details>
<details>
  <summary><b>Que fait donc Docker-compose de plus ? 🐳❤️🐳❤️🐳</b></summary>
  <br>
Docker-compose est un outil qui te permet de définir et de gérer facilement des applications multi-conteneurs en utilisant un fichier de configuration appelé ```docker-compose.yml```. Il est construit sur les commandes Docker, mais il offre une interface haut niveau pour gérer les dépendances entre les conteneurs, les volumes de données et les réseaux.

Le fichier ```docker-compose.yml``` contient une description de tous les conteneurs, volumes et réseaux de votre application. Chaque section dans le fichier définit une partie de votre application, telle qu'une base de données ou un serveur web. Vous pouvez spécifier des options pour chaque conteneur, telles que les ports à exposer ou les variables d'environnement à utiliser.

Avec Docker-compose, vous pouvez facilement démarrer, arrêter et gérer l'état de ton application en utilisant des commandes simples comme ```docker-compose up```, ```docker-compose down``` et ```docker-compose logs```. Les commandes ```up``` lanceront tous les conteneurs définis dans le fichier de configuration, en garantissant que les dépendances sont satisfaites et les options de configuration sont appliquées.

En utilisant Docker-compose, tu peux également facilement gérer les dépendances entre les conteneurs, telles que la configuration d'une base de données pour un serveur web. En définissant ces dépendances dans le fichier de configuration, tu peux être sûr que les conteneurs seront démarrés dans le bon ordre et que les variables d'environnement appropriées seront transmises à chaque conteneur.

En gros, Docker-compose est un outil pour faciliter la création, la configuration et le démarrage des conteneurs multiples en utilisant un fichier de configuration unique, donc cela facilite le déploiement, le test et la maintenance d'une application en utilisant des conteneurs.
<div align="right">
  <b><a href="#top">↥ viser la Lune 🌛</a></b>
</div>
</details>
<details>
  <summary><b>Mais à quoi ça sert une image Docker alors ? 🖼️</b></summary>
  <br>
  <img src="https://miro.medium.com/max/1400/1*p8k1b2DZTQEW_yf0hYniXw.png" alt="level1">
  <br><br>
Comme on l'a dit précédemment, une image Docker est un fichier qui contient toutes les informations nécessaires pour créer un conteneur. Une fois créée, une image Docker peut être utilisée pour démarrer autant de conteneurs que nécessaire.

Ainsi, une image Docker peut être utilisée pour créer un conteneur qui exécute une application particulière, alors qu'avec Docker-compose, tu peux définir plusieurs images Docker qui travaillent ensemble pour créer une application plus complexe.

En utilisant Docker-compose, tu peux facilement créer, configurer et démarrer plusieurs conteneurs en utilisant un seul fichier de configuration. Tu peux également définir des dépendances entre les conteneurs, telles que la configuration d'une base de données pour un serveur web, de manière à garantir que les conteneurs sont démarrés dans le bon ordre et que les variables d'environnement appropriées sont transmises à chaque conteneur.

Avec cela, l'utilisation de docker-compose permet un déploiement d'une application plus simple, efficace et modulable qu'une image Docker seule.
<div align="right">
  <b><a href="#top">↥ viser la Lune 🌛</a></b>
</div>
</details>

<details>
  <summary><b>Et c'est quoi encore docker-network ? 🌐</b></summary>
  <br>
Docker-network est un mécanisme intégré à Docker qui permet de créer et gérer des réseaux pour les conteneurs Docker. Il tee permet de définir des réseaux privés dans lesquels tes conteneurs peuvent communiquer entre eux, ainsi que de connecter des conteneurs à des réseaux externes.

Il existe différents types de réseaux disponibles dans Docker:

* ```bridge```: C'est le réseau par défaut utilisé lorsque tu démarres un conteneur sans spécifier de réseau. Il permet aux conteneurs de communiquer entre eux, mais ils sont isolés du reste de l'hôte et des autres réseaux.

* ```host```: Ce réseau permet aux conteneurs de partager l'adresse IP et les interfaces réseau de l'hôte. Cela signifie que les conteneurs peuvent accéder directement aux réseaux externes et aux autres conteneurs sur l'hôte, mais ils ne bénéficient pas de l'isolation réseau.

* ```none```: Ce réseau désactive toutes les connexions réseau pour un conteneur donné.

* ```user-defined```: Il te permet de créer vos propres réseaux personnalisés et de connecter des conteneurs à ces réseaux en utilisant la commande ```docker network connect```.

Il existe d'autres options pour plus de flexibilité en utilisant les ```network driver``` (bridge, host, none, overlay, macvlan).
<div align="right">
  <b><a href="#top">↥ viser la Lune 🌛</a></b>
</div>
</details>

<details>
  <summary><b>En quoi ça change des machines virtuelles finalement 🎰 ?</b></summary>
  <br>
Docker et les machines virtuelles sont tous les deux des technologies de virtualisation qui permettent de créer des environnements isolés pour exécuter des applications, mais ils fonctionnent de manière différente et ont des avantages différents.

Les avantages de Docker par rapport aux machines virtuelles sont :

* la légèreté : Docker utilise un système de virtualisation de conteneur plutôt qu'un système de virtualisation de machine, ce qui signifie qu'il n'a pas besoin de créer une machine virtuelle complète pour chaque conteneur. Cela rend les conteneurs plus légers et plus rapides à démarrer et à arrêter que les machines virtuelles.
* le partage des ressources : les conteneurs Docker partagent les ressources de l'hôte, ce qui les rend plus efficaces en termes de mémoire, de stockage et de CPU que les machines virtuelles.
* la portabilité : les conteneurs Docker sont entièrement indépendants de l'environnement hôte, ils peuvent donc être facilement déplacés d'un ordinateur à l'autre, ou même d'un cloud à l'autre. Les machines virtuelles, d'autre part, nécessitent un hyperviseur spécifique pour fonctionner.
* la facilité de déploiement : Docker rend le déploiement d'une application plus simple, car vous pouvez créer une image qui contient toutes les dépendances et les configurations nécessaires pour exécuter l'application, puis la déployer sur n'importe quel environnement pris en charge par Docker.
* le partage de l'image : Docker permet de partager des images entre les développeurs et les opérateurs de manière simple et rapide, cela permet de partager des images de conteneur prêtes à l'emploi sur un registre d'images (public ou privé).

Cela dit, il y a également des cas où les machines virtuelles sont préférables, comme par exemple pour les cas où l'on a besoin d'avoir des différentes versions de systèmes d'exploitation (Windows et Linux par exemple) sur la même machine physique, ou pour des cas où l'on a besoin de niveau de sécurité plus élevé pour séparer les applications.
<div align="right">
  <b><a href="#top">↥ viser la Lune 🌛</a></b>
</div>
</details>
