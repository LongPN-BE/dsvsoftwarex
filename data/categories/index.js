'use strict';

const utils = require('../utils');
const config = require('../../config');
const sql = require('mssql');

const getAppraisalPlanType = async () => {
    try {
        const pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('categories');
        const appraisalPlanTypes = await pool.request().query(sqlQueries.appraisal_plan_types);
        console.log(appraisalPlanTypes);
        return "Success : " + appraisalPlanTypes.recordset;
    } catch (err) {
        console.log("Error: ", err);
    };
}
const getCustomerTypes = async () => {
    try {
        const pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('categories');
        const customerTypes = await pool.request().query(sqlQueries.customer_types);
        console.log(customerTypes);
        return "Success : " + customerTypes.recordset;
    } catch (err) {
        console.log("Error: ", err);
    };
}
const getAssetTypes = async () => {
    try {
        const pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('categories');
        const assetTypes = await pool.request().query(sqlQueries.asset_types);
        console.log(assetTypes);
        return "Success : " + assetTypes.recordset;
    } catch (err) {
        console.log("Error: ", err);
    };
}

const getVocatives = async () => {
    try {
        const pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('categories');
        const vocatives = await pool.request().query(sqlQueries.vocatives);
        console.log(vocatives);
        return "Success : " + vocatives.recordset;
    } catch (err) {
        console.log("Error: ", err);
    };
}
const getEmployeePositions = async () => {
    try {
        const pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('categories');
        const employeePositions = await pool.request().query(sqlQueries.employee_positions);
        console.log(employeePositions);
        return "Success : " + employeePositions.recordset;
    } catch (err) {
        console.log("Error: ", err);
    };
}

module.exports = {
    getAppraisalPlanType,
    getCustomerTypes,
    getAssetTypes,
    getVocatives,
    getEmployeePositions
}