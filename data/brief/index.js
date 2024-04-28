'use strict';

const utils = require('../utils');
const config = require('../../config');
const sql = require('mssql');

const getAllBrief = async () => {
    try {
        const pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('brief');
        const briefs = await pool.request().query(sqlQueries.Briefs);
        console.log(briefs);
        return "Success : " + briefs.recordset;
    } catch (err) {
        console.log("Error: ", err);
    };
}

const getBriefPoint = async () => {
    try {
        const pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('brief');
        const briefPoint = await pool.request().query(sqlQueries.BriefPoint);
        console.log(briefPoint);
        return "Success : " + briefPoint.recordset;
    } catch (err) {
        console.log("Error: ", err);
    };
}
const getAllAsset = async () => {
    try {
        const pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('brief');
        const assets = await pool.request().query(sqlQueries.Assets);
        console.log(assets);
        return "Success : " + assets.recordset;
    } catch (err) {
        console.log("Error: ", err);
    };
}
const getAllAppraisalPlan = async () => {
    try {
        const pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('brief');
        const appraisalPlans = await pool.request().query(sqlQueries.AppraisalPlans);
        console.log(appraisalPlans);
        return "Success : " + appraisalPlans.recordset;
    } catch (err) {
        console.log("Error: ", err);
    };
}
AppraisalPlans
module.exports = {
    getBriefPoint,
    getAllBrief,
    getAllAsset,
    getAllAppraisalPlan
}