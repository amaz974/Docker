const { Sequelize } = require('sequelize');
const dbConfig = require('../db.config');

// Comment this block to disable Sqlite
/*const instance = new Sequelize({
    dialect: dbConfig.dialect,
    storage: dbConfig.storage
});*/

// Uncomment this block to use Mysql, don't forget to adapt db.config.js
const instance = new Sequelize(dbConfig.database, dbConfig.username, dbConfig.password, {
    host: dbConfig.hostname,
    port: dbConfig.port,
    dialect: "mysql"
});

module.exports = {
    instance,
    books: require('./books')(instance)
};