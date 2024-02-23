// Comment this block to disable sqlite
/*module.exports = {
    dialect: "sqlite",
    storage: "./my-db.sqlite",
}*/

// Uncomment this block to use mysql
module.exports = {
    dialect: "mysql",
    hostname: process.env.DB_HOST || "db",
    username: process.env.DB_USER || "root",
    password: process.env.DB_PASSWORD || "root",
    database: process.env.DB_NAME || "mydatabase",
    port: process.env.DB_PORT || 3306
};

// TODO : adapt this file to load parameters from environment variables (process.env.VARIABLE_NAME)
