# Utilisez l'image officielle d'Apache HTTP Server
FROM httpd:latest

# Copiez votre fichier index.html dans le répertoire des documents d'Apache
COPY C:\Users\alex\Desktop\COUR\docker\Docker-github\Docker\html/index.html /usr/local/apache2/htdocs/

# Exposez le port 80 pour permettre l'accès à Apache
EXPOSE 80