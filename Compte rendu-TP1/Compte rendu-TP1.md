**TP1 Docker - MAZOYER Alexandre**

## **3- Installation de l'image Apache HTTP Server**

### 1. **Ouverture de Visual Studio Code :**
```shell
- Ouvrez Visual Studio Code.
- Accédez à la vue Terminal (Vue > Terminal).
```
### 2. **Pull de l'image Apache HTTP Server depuis Docker Hub :**

- Utilisez la commande suivante pour télécharger l'image Apache HTTP Server

    ```shell
     docker pull httpd
    ```
- Cette commande récupère la dernière version de l'image Apache HTTP Server depuis le référentiel Docker Hub.
    

#### **Exécution du Conteneur Apache HTTP Server**

J’ai utilisez la commande suivante pour démarrer un conteneur Apache HTTP Server en exposant le port 8080 :
```shell
docker run -d -p 8080:80 -v C:\Users\alex\Desktop\COUR\docker\Docker-github\Docker\ht ml:/usr/local/apache2/htdocs --name httpd1 httpd
 ```

 **Vérification de l'Exécution :**

[![](https://github.com/amaz974/Docker/raw/main/Compte%20rendu-TP1/Aspose.Words.27bf2957-a534-4898-b968-520bf927ed1b.001.jpeg)](https://github.com/amaz974/Docker/blob/main/Compte%20rendu-TP1/Aspose.Words.27bf2957-a534-4898-b968-520bf927ed1b.001.jpeg)

**Vérification des Images Docker**

1. **Vérification des Images :**

```shell
docker images
```

[![](https://github.com/amaz974/Docker/raw/main/Compte%20rendu-TP1/Aspose.Words.27bf2957-a534-4898-b968-520bf927ed1b.002.png)](https://github.com/amaz974/Docker/blob/main/Compte%20rendu-TP1/Aspose.Words.27bf2957-a534-4898-b968-520bf927ed1b.002.png)

- J’ai utilisez la commande suivante pour afficher la liste des containers Docker sur votre système :

```shell
Container ls 
```

[![](https://github.com/amaz974/Docker/raw/main/Compte%20rendu-TP1/Aspose.Words.27bf2957-a534-4898-b968-520bf927ed1b.003.png)](https://github.com/amaz974/Docker/blob/main/Compte%20rendu-TP1/Aspose.Words.27bf2957-a534-4898-b968-520bf927ed1b.003.png)

4. Maintenant, on créer le container httpd2 sur le port 80 et on lie le fichier html de httpd1

[![](https://github.com/amaz974/Docker/raw/main/Compte%20rendu-TP1/Aspose.Words.27bf2957-a534-4898-b968-520bf927ed1b.004.png)](https://github.com/amaz974/Docker/blob/main/Compte%20rendu-TP1/Aspose.Words.27bf2957-a534-4898-b968-520bf927ed1b.004.png)

Voici le résultat :

[![](https://github.com/amaz974/Docker/raw/main/Compte%20rendu-TP1/Aspose.Words.27bf2957-a534-4898-b968-520bf927ed1b.005.jpeg)](https://github.com/amaz974/Docker/blob/main/Compte%20rendu-TP1/Aspose.Words.27bf2957-a534-4898-b968-520bf927ed1b.005.jpeg)

La page a bien été liée.

5. supprimer le container :

[![](https://github.com/amaz974/Docker/raw/main/Compte%20rendu-TP1/Aspose.Words.27bf2957-a534-4898-b968-520bf927ed1b.006.png)](https://github.com/amaz974/Docker/blob/main/Compte%20rendu-TP1/Aspose.Words.27bf2957-a534-4898-b968-520bf927ed1b.006.png)

6. Docker cp : commande :

[![](https://github.com/amaz974/Docker/raw/main/Compte%20rendu-TP1/Aspose.Words.27bf2957-a534-4898-b968-520bf927ed1b.007.png)](https://github.com/amaz974/Docker/blob/main/Compte%20rendu-TP1/Aspose.Words.27bf2957-a534-4898-b968-520bf927ed1b.007.png)

Résultat :

[![](https://github.com/amaz974/Docker/raw/main/Compte%20rendu-TP1/Aspose.Words.27bf2957-a534-4898-b968-520bf927ed1b.008.jpeg)](https://github.com/amaz974/Docker/blob/main/Compte%20rendu-TP1/Aspose.Words.27bf2957-a534-4898-b968-520bf927ed1b.008.jpeg)

On observe le même résultat que précédemment, il s’agit de 22 manières différentes de procédés, la première est plus efficace est rapide (une commande pour : création du container + copie du fichier html).

4-

- Configuration du fichier Dockerfile:

[![](https://github.com/amaz974/Docker/raw/main/Compte%20rendu-TP1/Aspose.Words.27bf2957-a534-4898-b968-520bf927ed1b.009.jpeg)](https://github.com/amaz974/Docker/blob/main/Compte%20rendu-TP1/Aspose.Words.27bf2957-a534-4898-b968-520bf927ed1b.009.jpeg)

b. Exécuter cette nouvelle image pour servir ./html/index.html:

[![](https://github.com/amaz974/Docker/raw/main/Compte%20rendu-TP1/Aspose.Words.27bf2957-a534-4898-b968-520bf927ed1b.010.jpeg)](https://github.com/amaz974/Docker/blob/main/Compte%20rendu-TP1/Aspose.Words.27bf2957-a534-4898-b968-520bf927ed1b.010.jpeg)

**Montage de Volumes (option -v) :** 

**Avantages :**

---
- Les modifications apportées dans le répertoire local sont **immédiatement** reflétées dans le conteneur, éliminant le besoin de reconstruire l'image.
- Particulièrement pratique pendant le développement, permettant l'édition du code sans besoin de reconstruction.
---

**Inconvénients :**

---
- Requiert l'accès au répertoire local au moment de l'exécution, ce qui peut poser des problèmes dans certains scénarios de déploiement.
---

**Copie (COPY dans le Dockerfile ou docker cp) :** 

**Avantages :**

---
- Plus portable, car le contenu est directement inclus dans l'image, rendant l'application autonome.
- Utile pour la distribution d'applications autonomes sans dépendance directe sur le système de fichiers local.
---

**Inconvénients :**

---
- Nécessite la reconstruction de l'image pour prendre en compte les modifications dans le contenu, ce qui peut être un processus plus lourd.
---

Le choix entre le montage de volumes et la copie dépend des besoins et du contexte d'utilisation de notre application.

Si la flexibilité et la réactivité aux changements sont cruciales, notamment pendant le développement, le montage de volumes peut être préférable. En revanche, si on a besoin d’une solution autonome et portable, la copie du contenu dans l'image peut être la meilleure option.

5. **Utiliser une base de données dans un conteneur Docker**
6. **Récupérer les images MySQL (ou MariaDB) et phpMyAdmin depuis le Docker Hub:**

```shell
- docker pull **mysql**
- docker pull **phpmyadmin/phpmyadmin**
```
2. **Exécuter 2 conteneurs à partir des images:**

- **Créez un réseau Docker docker network + exécution des conteneurs**
```shell
    - create mon_network
    - docker run -d --name mysql_container --network mon_network -e MYSQL_ROOT_PASSWORD=root mysql
    - docker run -d --name phpmyadmin_container --network mon_network -p 8081:80 -e PMA_ARBITRARY=1 -e PMA_HOST=mysql_container phpmyadmin/phpmyadmin
```
**Création d’une table :**

[![](https://github.com/amaz974/Docker/raw/main/Compte%20rendu-TP1/Aspose.Words.27bf2957-a534-4898-b968-520bf927ed1b.011.png)](https://github.com/amaz974/Docker/blob/main/Compte%20rendu-TP1/Aspose.Words.27bf2957-a534-4898-b968-520bf927ed1b.011.png)

6. **Utilisation de docker-compose.yml**
7. **À quoi sert la commande docker-compose par rapport à docker run ?**

- La commande **docker-compose** est utilisée pour définir et exécuter des applications multi-conteneurs. Elle est basée sur un fichier de configuration YAML appelé **docker-compose.yml** qui décrit les services, les réseaux et les volumes nécessaires pour l'application.
- **docker-compose** simplifie le processus de gestion des applications complexes avec plusieurs conteneurs en les définissant dans un seul fichier de configuration.

2. **Commande pour lancer tous les conteneurs définis dans le fichier YAML et pour les arrêter :**

- Pour lancer tous les conteneurs définis dans le fichier **docker-compose.yml** :
```shell
    - docker-compose up -d
```
- Pour arrêter tous les conteneurs définis dans le fichier **docker-compose.yml** :
```shell
- docker-compose down
```
3. **Exemple de fichier docker-compose.yml pour servir une base de données et phpMyAdmin :**

[![](https://github.com/amaz974/Docker/raw/main/Compte%20rendu-TP1/Aspose.Words.27bf2957-a534-4898-b968-520bf927ed1b.012.jpeg)](https://github.com/amaz974/Docker/blob/main/Compte%20rendu-TP1/Aspose.Words.27bf2957-a534-4898-b968-520bf927ed1b.012.jpeg)

- phpMyAdmin est configuré pour se connecter au service MySQL avec l'alias db.
- Les ports 8081 de l'hôte sont mappés sur le port 80 du conteneur phpMyAdmin.
- Ce fichier définit deux services : _db_ pour MySQL (ou MariaDB) et _phpmyadmin_ pour phpMyAdmin.
