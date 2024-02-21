# Utilisez l'image Node.js v18 avec Alpine Linux
FROM node:18-alpine

# Créez et définissez le répertoire de travail
WORKDIR /app

# Copiez le fichier package.json et package-lock.json dans le répertoire de travail
COPY src/package*.json ./

# Installez les dépendances
RUN npm install

# Copiez tous les fichiers de l'application dans le répertoire de travail
COPY src/ .

# Exposez le port 3000 pour l'application
EXPOSE 3000

# Commande pour démarrer l'application
CMD ["node", "server.js"]