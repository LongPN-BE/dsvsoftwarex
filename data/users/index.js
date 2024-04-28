'use strict';

const utils = require('../utils');
const config = require('../../config');
const sql = require('mssql');

const getAllEmployees = async () => {
    try {
        const pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('users');
        const userList = await pool.request().query(sqlQueries.ViewEmployees);
        console.log(userList)
        return "Success : " + userList.recordset;
    } catch (err) {
        console.log("Error: ", err);
    };
}

const getAllCustomers = async () => {
    try {
        const pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('users');
        const userList = await pool.request().query(sqlQueries.ViewCustomers);
        console.log(userList)
        return "Success : " + userList.recordset;
    } catch (err) {
        console.log("Error: ", err);
    };
}

const getAllBrokers = async () => {
    try {
        const pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('users');
        const userList = await pool.request().query(sqlQueries.ViewBrokers);
        console.log(userList)
        return "Success : " + userList.recordset;
    } catch (err) {
        console.log("Error: ", err);
    };
}

module.exports = {
    getAllEmployees,
    getAllCustomers,
    getAllBrokers
}