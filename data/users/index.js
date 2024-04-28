'use strict';

const utils = require('../utils');
const config = require('../../config');
const sql = require('mssql');

const getAllEmployees = async () => {
    try {
        const pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('users');
        const userList = await pool.request().query(sqlQueries.employees);
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
        const userList = await pool.request().query(sqlQueries.customers);
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
        const userList = await pool.request().query(sqlQueries.brokers);
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