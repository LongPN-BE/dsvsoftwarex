"use strict";

const utils = require("../utils");
const config = require("../../config");
const sql = require("mssql");

const getAllTrustContract = async () => {
    try {
        const pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries("trust_contract");
        const data = await pool.request().query(sqlQueries.trust_contracts);
        console.log(data)
        return data.recordset;
    } catch (err) {
        console.log("Error: ", err);
    }
};

const getAllLoanAgreement = async () => {
    try {
        const pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries("trust_contract");
        const data = await pool.request().query(sqlQueries.loan_agreements);
        console.log(data)
        return data.recordset;
    } catch (err) {
        console.log("Error: ", err); loan_agreements
    }
};

const getAllGroupCustomer = async () => {
    try {
        const pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries("trust_contract");
        const data = await pool.request().query(sqlQueries.group_customer);
        console.log(data)
        return data.recordset;
    } catch (err) {
        console.log("Error: ", err); loan_agreements
    }
};

const getAllCustomer = async () => {
    try {
        const pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries("trust_contract");
        const data = await pool.request().query(sqlQueries.customer);
        console.log(data)
        return data.recordset;
    } catch (err) {
        console.log("Error: ", err); loan_agreements
    }
};


module.exports = {
    getAllTrustContract,
    getAllLoanAgreement,
    getAllGroupCustomer,
    getAllCustomer
};