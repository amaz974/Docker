### **TP2 Docker - MAZOYER Alexandre**

**Fichier models/inex.js adapté :**

[![](https://github.com/amaz974/Docker/raw/main/Compte%20rendu-TP2/Aspose.Words.c4f4ec50-e611-49d2-bc10-f1a09b745afd.001.jpeg)](https://github.com/amaz974/Docker/blob/main/Compte%20rendu-TP2/Aspose.Words.c4f4ec50-e611-49d2-bc10-f1a09b745afd.001.jpeg)

**Fichier db.config.js adapté :**

[![](https://github.com/amaz974/Docker/raw/main/Compte%20rendu-TP2/Aspose.Words.c4f4ec50-e611-49d2-bc10-f1a09b745afd.002.jpeg)](https://github.com/amaz974/Docker/blob/main/Compte%20rendu-TP2/Aspose.Words.c4f4ec50-e611-49d2-bc10-f1a09b745afd.002.jpeg)

Reconstruction de l'image Docker :

[![](https://github.com/amaz974/Docker/raw/main/Compte%20rendu-TP2/Aspose.Words.c4f4ec50-e611-49d2-bc10-f1a09b745afd.003.jpeg)](https://github.com/amaz974/Docker/blob/main/Compte%20rendu-TP2/Aspose.Words.c4f4ec50-e611-49d2-bc10-f1a09b745afd.003.jpeg)

Lancement du conteneur avec la nouvelle image :

[![](https://github.com/amaz974/Docker/raw/main/Compte%20rendu-TP2/Aspose.Words.c4f4ec50-e611-49d2-bc10-f1a09b745afd.004.png)](https://github.com/amaz974/Docker/blob/main/Compte%20rendu-TP2/Aspose.Words.c4f4ec50-e611-49d2-bc10-f1a09b745afd.004.png)

Voici le fichier Dockerfile :

[![](https://github.com/amaz974/Docker/raw/main/Compte%20rendu-TP2/Aspose.Words.c4f4ec50-e611-49d2-bc10-f1a09b745afd.005.jpeg)](https://github.com/amaz974/Docker/blob/main/Compte%20rendu-TP2/Aspose.Words.c4f4ec50-e611-49d2-bc10-f1a09b745afd.005.jpeg)

La commande _**docker-compose up**_ construira les images, démarrera les deux services et configurera les conteneurs selon les spécifications du fichier **docker-compose.yml.**

[![](https://github.com/amaz974/Docker/raw/main/Compte%20rendu-TP2/Aspose.Words.c4f4ec50-e611-49d2-bc10-f1a09b745afd.006.jpeg)](https://github.com/amaz974/Docker/blob/main/Compte%20rendu-TP2/Aspose.Words.c4f4ec50-e611-49d2-bc10-f1a09b745afd.006.jpeg)

Pour que l’application Node.js puisse utiliser la base de données conteneurisée dans Docker Compose, nous devons nous assurer que les services peuvent se connecter les uns aux autres. Voici le fichier **docker-compose.yml** :

[![](https://github.com/amaz974/Docker/raw/main/Compte%20rendu-TP2/Aspose.Words.c4f4ec50-e611-49d2-bc10-f1a09b745afd.007.jpeg)](https://github.com/amaz974/Docker/blob/main/Compte%20rendu-TP2/Aspose.Words.c4f4ec50-e611-49d2-bc10-f1a09b745afd.007.jpeg)

**Problème rencontré :** 
```shell
Docker-compose up
```


La sortie indique:

```shell
"dependency failed to start: container mariadb-container has no healthcheck configured."
```

Pour résoudre cela, j’ai ajouté une configuration de santé (healthcheck) pour le service MariaDB dans le fichier **docker-compose.yml.**

[![](https://github.com/amaz974/Docker/raw/main/Compte%20rendu-TP2/Aspose.Words.c4f4ec50-e611-49d2-bc10-f1a09b745afd.008.png)](https://github.com/amaz974/Docker/blob/main/Compte%20rendu-TP2/Aspose.Words.c4f4ec50-e611-49d2-bc10-f1a09b745afd.008.png)

[![](https://github.com/amaz974/Docker/raw/main/Compte%20rendu-TP2/Aspose.Words.c4f4ec50-e611-49d2-bc10-f1a09b745afd.009.png)](https://github.com/amaz974/Docker/blob/main/Compte%20rendu-TP2/Aspose.Words.c4f4ec50-e611-49d2-bc10-f1a09b745afd.009.png)

Un autre message d’erreur est apparue après la commande **docker-compose up** :

[![](https://github.com/amaz974/Docker/raw/main/Compte%20rendu-TP2/Aspose.Words.c4f4ec50-e611-49d2-bc10-f1a09b745afd.010.png)](https://github.com/amaz974/Docker/blob/main/Compte%20rendu-TP2/Aspose.Words.c4f4ec50-e611-49d2-bc10-f1a09b745afd.010.png)

Après investigation, un service tourne sur mon PC sur le port **3306**, je me suis aperçu que c’était **Mysqld**, je l’ai donc arrêté.

De plus, node se lançait avant mariadb, cela peut entraîner des erreurs de connexion à la base de données, car la base de données ne serait pas encore disponible. Pour éviter cela j’ai changé l’ordre du fichier et ajouté une option : depends_on. (visible dans le fichier final)

---
**Q1 : Que se passe t'il si un de mes ports publiés est déjà utilisé ?**

Docker affichera un message d'erreur et ne pourra pas démarrer le conteneur.

[![](https://github.com/amaz974/Docker/raw/main/Compte%20rendu-TP2/Aspose.Words.c4f4ec50-e611-49d2-bc10-f1a09b745afd.011.png)](https://github.com/amaz974/Docker/blob/main/Compte%20rendu-TP2/Aspose.Words.c4f4ec50-e611-49d2-bc10-f1a09b745afd.011.png)

Dans ce cas, on doit choisir un autre port disponible ou libérer le port déjà utilisé sur votre machine avant de relancer Docker Compose.

---
**Q2 : quelle option de la commande npm install permet de n'installer que les dépendances de production ?**

```shell
npm install --production
```
Cela installera uniquement les dépendances listées dans la section "dependencies" de votre fichier package.json.

---
**Q2bis : pourquoi faire cela ?**

```
l'utilisation de l'option **--production** est une bonne pratique pour garantir que votre environnement de production n'inclut que ce qui est strictement nécessaire pour exécuter votre application, tout en évitant les éléments superflus liés au développement.
```

---

**Q3 : Comment peut-on analyser la sécurité d'une application comme celle-ci (dépendances & image docker)**

```
Il y a des Outils de sécurité des dépendances : npm audit

De plus, il existe des outils de scanning d'images Docker tels que **Clair** ou **Trivy** pour analyser les images Docker à la recherche de vulnérabilités connues.
```

---
**Q4 : Pourquoi à l'étape 6 mon container node n'arrive pas à communiquer avec ma base de données si je laisse "localhost" en hostname ?**

```
Quand vous utilisez "localhost" comme nom d'hôte dans votre application Node.js pour se connecter à la base de données, cela signifie que votre application tente de se connecter à la base de données sur la même machine (le même conteneur Docker, dans ce cas). Cependant, dans un environnement Docker, chaque conteneur a son propre espace réseau isolé.
```
