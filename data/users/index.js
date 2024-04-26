'use strict';

const utils = require('../utils');
const config = require('../../config');
const sql = require('mssql');

const getAll = async () => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('users');
        const userList = await pool.request().query(sqlQueries.GetAllUsers);
        return "Success : " + userList.recordsets;
    } catch (err) {
        console.log("Error: ", err);
    };
}

module.exports = {
    getAll
}