**TP1 Docker - MAZOYER Alexandre**

**3- Installation de l'image Apache HTTP Server**

1. **Ouverture de Visual Studio Code :**
- Ouvrez Visual Studio Code.
- Accédez à la vue Terminal (Vue > Terminal).
2. **Pull de l'image Apache HTTP Server depuis Docker Hub :**
- Utilisez la commande suivante pour télécharger l'image Apache HTTP Server depuis Docker Hub :

Unset![](Aspose.Words.ed76d1cf-1288-4998-a038-d3765fc86e21.001.png)

docker pull httpd

- Cette commande récupère la dernière version de l'image Apache HTTP Server depuis le référentiel Docker Hub.

**Exécution du Conteneur Apache HTTP Server**

1. **Exécution du Conteneur** J’ai utilisez la commande suivante pour démarrer un conteneur Apache HTTP Server en exposant le port 8080 :

Unset![](Aspose.Words.ed76d1cf-1288-4998-a038-d3765fc86e21.002.png)

docker run -d -p 8080:80 -v C:\Users\alex\Desktop\COUR\docker\Docker-github\Docker\html:/u sr/local/apache2/htdocs --name httpd1 httpd

2. **Vérification de l'Exécution :**

![](Aspose.Words.ed76d1cf-1288-4998-a038-d3765fc86e21.003.jpeg)

**Vérification des Images Docker**

1\. **Vérification des Images :**

- J’ai utilisez la commande suivante pour afficher la liste des images Docker sur votre système :

Unset![](Aspose.Words.ed76d1cf-1288-4998-a038-d3765fc86e21.004.png)

docker images

![](Aspose.Words.ed76d1cf-1288-4998-a038-d3765fc86e21.005.png)

- J’ai utilisez la commande suivante pour afficher la liste des containers Docker sur votre système :

![](Aspose.Words.ed76d1cf-1288-4998-a038-d3765fc86e21.006.png)

4. Maintenant, on creer le container httpd2 sur le port 80 et on lie le fichier html de httpd1

![](Aspose.Words.ed76d1cf-1288-4998-a038-d3765fc86e21.007.png)

Voici le résultat :

![](Aspose.Words.ed76d1cf-1288-4998-a038-d3765fc86e21.008.jpeg)

La page a bien été liée.

5. supprimer le container :

![](Aspose.Words.ed76d1cf-1288-4998-a038-d3765fc86e21.009.png)

6. Docker cp : commande :

![](Aspose.Words.ed76d1cf-1288-4998-a038-d3765fc86e21.010.png)

Résultat :

![](Aspose.Words.ed76d1cf-1288-4998-a038-d3765fc86e21.011.jpeg)

On observe le même résultat que précédemment, il s’agit de 22 manières différentes de procédés, la première est plus efficace est rapide (une commande pour : création du container + copie du fichier html).

4-

- Configuration du fichier Dockerfile:

![](Aspose.Words.ed76d1cf-1288-4998-a038-d3765fc86e21.012.jpeg)

b. Exécuter cette nouvelle image pour servir ./html/index.html:

![](Aspose.Words.ed76d1cf-1288-4998-a038-d3765fc86e21.013.jpeg)

**Montage de Volumes (option -v) :** Avantages :

- Les modifications apportées dans le répertoire local sont **immédiatement** reflétées dans le conteneur, éliminant le besoin de reconstruire l'image.
- Particulièrement pratique pendant le développement, permettant l'édition du code sans besoin de reconstruction.

Inconvénients :

- Requiert l'accès au répertoire local au moment de l'exécution, ce qui peut poser des problèmes dans certains scénarios de déploiement.

**Copie (COPY dans le Dockerfile ou docker cp) :** Avantages :

- Plus portable, car le contenu est directement inclus dans l'image, rendant l'application autonome.
- Utile pour la distribution d'applications autonomes sans dépendance directe sur le système de fichiers local.

Inconvénients :

- Nécessite la reconstruction de l'image pour prendre en compte les modifications dans le contenu, ce qui peut être un processus plus lourd.

Le choix entre le montage de volumes et la copie dépend des besoins et du contexte d'utilisation de notre application.

Si la flexibilité et la réactivité aux changements sont cruciales, notamment pendant le développement, le montage de volumes peut être préférable. En revanche, si on a besoin d’une solution autonome et portable, la copie du contenu dans l'image peut être la meilleure option.
