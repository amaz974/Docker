# Utilise l'image Node.js v18 avec Alpine Linux
FROM node:18-alpine

# Créez et définissez le répertoire de travail
WORKDIR /app

# Copie le fichier package.json et package-lock.json dans le répertoire de travail
COPY src/package*.json ./

# Installe les dépendances
RUN npm install

# Copie tous les fichiers de l'application dans le répertoire de travail
COPY src/ .

# Expose le port 3000 pour l'application
EXPOSE 3000

# Ajoute une pause de 10 secondes 
CMD ["sh", "-c", "sleep 10 && node server.js"]