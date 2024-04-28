'use strict';

const utils = require('../utils');
const config = require('../../config');
const sql = require('mssql');

const getAllBrief = async () => {
    try {
        const pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('brief');
        const briefs = await pool.request().query(sqlQueries.briefs);
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
        const briefPoint = await pool.request().query(sqlQueries.brief_point);
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
        const assets = await pool.request().query(sqlQueries.assets);
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
        const appraisalPlans = await pool.request().query(sqlQueries.appraisal_plans);
        console.log(appraisalPlans);
        return "Success : " + appraisalPlans.recordset;
    } catch (err) {
        console.log("Error: ", err);
    };
}
const getAllAppraisalPlanDetail = async () => {
    try {
        const pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('brief');
        const appraisalPlanDetail = await pool.request().query(sqlQueries.appraisal_plans_detail);
        console.log(appraisalPlanDetail);
        return "Success : " + appraisalPlanDetail.recordset;
    } catch (err) {
        console.log("Error: ", err);
    };
}
const getAllAppraisalDocumentDetail = async () => {
    try {
        const pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('brief');
        const appraisalDocumentDetail = await pool.request().query(sqlQueries.appraisal_documents_detail);
        console.log(68, appraisalDocumentDetail);
        return "Success : " + appraisalDocumentDetail.recordset;
    } catch (err) {
        console.log("Error: ", err);
    };
}
module.exports = {
    getBriefPoint,
    getAllBrief,
    getAllAsset,
    getAllAppraisalPlan,
    getAllAppraisalDocumentDetail,
    getAllAppraisalPlanDetail
}