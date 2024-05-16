"use strict";

const utils = require("../utils");
const config = require("../../config");
const sql = require("mssql");



const getAllInternalCreditCriteria = async () => {
    try {
        const pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries("criterias");
        const internal_credit_criterias = await pool
            .request()
            .query(sqlQueries.internal_credit_criterias);
        console.log(internal_credit_criterias);
        return internal_credit_criterias.recordset;
    } catch (err) {
        console.log("Error: ", err);
    }
};

const getAllRootInternalCreditCriteria = async () => {
    try {
        const pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries("criterias");
        const root_internal_credit_criterias = await pool
            .request()
            .query(sqlQueries.root_internal_credit_criterias);
        console.log(root_internal_credit_criterias);
        return root_internal_credit_criterias.recordset;
    } catch (err) {
        console.log("Error: ", err);
    }
};

const getAllSubInternalCreditCriteria = async () => {
    try {
        const pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries("criterias");
        const sub_internal_credit_criterias = await pool
            .request()
            .query(sqlQueries.sub_internal_credit_criterias);
        console.log(sub_internal_credit_criterias);
        return sub_internal_credit_criterias.recordset;
    } catch (err) {
        console.log("Error: ", err);
    }
};

const getAllSubByRootInternalCreditCriteria = async (input) => {
    try {
        const pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries("criterias");
        const sub_by_root_internal_credit_criterias = await pool
            .request()
            .input("input_ma_loai_tieu_chi", input)
            .query(sqlQueries.sub_by_root_internal_credit_criterias);
        console.log(sub_by_root_internal_credit_criterias);
        return sub_by_root_internal_credit_criterias.recordset;
    } catch (err) {
        console.log("Error: ", err);
    }
};


const getAllRootByInternalCreditCriteria = async (input) => {
    try {
        const pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries("criterias");
        const root_by_internal_credit_criterias = await pool
            .request()
            .input("input_ma_loai_tieu_chi_tin_dung", input)
            .query(sqlQueries.root_by_internal_credit_criterias);
        console.log(root_by_internal_credit_criterias);
        return root_by_internal_credit_criterias.recordset;
    } catch (err) {
        console.log("Error: ", err);
    }
};

module.exports = {
    getAllInternalCreditCriteria,
    getAllRootInternalCreditCriteria,
    getAllSubInternalCreditCriteria,
    getAllSubByRootInternalCreditCriteria,
    getAllRootByInternalCreditCriteria
};
