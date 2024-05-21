"use strict";

const utils = require("../utils");
const config = require("../../config");
const sql = require("mssql");

const createFile = async (name, url, file_type, date_create) => {
    try {
        const pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries("files");
        const file = await pool.request()
            .input("name", name)
            .input("url", url)
            .input("file_type", file_type)
            .input("date_create", date_create)
            .query(sqlQueries.create_file);
        console.log(file)
        return file.recordset;
    } catch (err) {
        console.log("Error: ", err);
    }
};

const getAllFiles = async () => {
    try {
        const pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries("files");
        const file = await pool.request().query(sqlQueries.files);
        console.log(file)
        return file.recordset;
    } catch (err) {
        console.log("Error: ", err);
    }
};

module.exports = {
    createFile,
    getAllFiles
};