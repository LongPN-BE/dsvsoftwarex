"use strict";

const utils = require("../utils");
const config = require("../../config");
const sql = require("mssql");


const getAllProrityLevel = async () => {
    try {
        const pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries("priority_level");
        const prorityLevel = await pool.request().query(sqlQueries.priority_level);
        console.log(prorityLevel)
        return prorityLevel.recordset;
    } catch (err) {
        console.log("Error: ", err);
    }
};

const getAllProrityLevelByCode = async (input) => {
    try {
        const pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries("priority_level");
        const prorityLevel = await pool.request()
            .input('input', input)
            .query(sqlQueries.priority_level_by_code);
        console.log(prorityLevel)
        return prorityLevel.recordset;
    } catch (err) {
        console.log("Error: ", err);
    }
};


module.exports = {
    getAllProrityLevel,
    getAllProrityLevelByCode
};