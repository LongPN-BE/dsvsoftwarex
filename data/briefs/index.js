"use strict";

const utils = require("../utils");
const config = require("../../config");
const sql = require("mssql");

const getAllBrief = async () => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("briefs");
    const briefs = await pool.request().query(sqlQueries.briefs);
    // console.log(briefs);
    return briefs.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const getBriefByCode = async (input) => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("briefs");
    const briefs = await pool
      .request()
      .input("input", input)
      .query(sqlQueries.briefs_by_code);
    return briefs.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const getBriefPoint = async () => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("briefs");
    const briefPoint = await pool.request().query(sqlQueries.brief_point);
    // console.log(briefPoint);
    return briefPoint.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const getAllAsset = async () => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("briefs");
    const assets = await pool.request().query(sqlQueries.assets);
    console.log(assets);
    return assets.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const getAssetByCode = async (input) => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("briefs");
    const asset = await pool
      .request()
      .input("input", input)
      .query(sqlQueries.asset_by_code);
    return asset.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const getAllAppraisalPlan = async () => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("briefs");
    const appraisalPlans = await pool
      .request()
      .query(sqlQueries.appraisal_plans);
    // console.log(appraisalPlans);
    return appraisalPlans.recordset;
  } catch (err) {
    consoe.log("Error: ", err);
  }
};

const getAppraisalPlanByCode = async (input) => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("briefs");
    const appraisalPlan = await pool
      .request()
      .input("input", input)
      .query(sqlQueries.appraisal_plans_by_code);
    return appraisalPlan.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const getAllAppraisalPlanDetail = async () => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("briefs");
    const appraisalPlanDetail = await pool
      .request()
      .query(sqlQueries.appraisal_plans_detail);
    // console.log(appraisalPlanDetail);
    return appraisalPlanDetail.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const getAppraisalPlanDetailByCode = async (input) => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("briefs");
    const appraisalPlan = await pool
      .request()
      .input("input", input)
      .query(sqlQueries.appraisal_plans_detail_by_code);
    return appraisalPlan.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const getAllAppraisalDocumentDetail = async () => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("briefs");
    const appraisalDocumentDetail = await pool
      .request()
      .query(sqlQueries.appraisal_documents_detail);
    // console.log(68, appraisalDocumentDetail);
    return appraisalDocumentDetail.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const getAppraisalDocumentDetailByCode = async (input) => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("briefs");
    const appraisalDocumentDetail = await pool
      .request()
      .input("input", input)
      .query(sqlQueries.appraisal_documents_detail_by_code);
    return appraisalDocumentDetail.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const SuperDetailByBriefCode = async (input) => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("briefs");
    const data = await pool
      .request()
      .input("input", input)
      .query(sqlQueries.super_detail_by_brief_code);
    return data.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const SuperDetailByCustomerCode = async (input) => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("briefs");
    const data = await pool
      .request()
      .input("input", input)
      .query(sqlQueries.super_detail_by_customer_code);
    return data.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const getAllSuperDetail = async () => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("briefs");
    const data = await pool
      .request()
      .query(sqlQueries.all_super_detail);
    return data.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const getAllAssetDetail = async () => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("briefs");
    const data = await pool
      .request()
      .query(sqlQueries.assets_detail);
    return data.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const getAllAssetDetailByCustomer = async (input) => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("briefs");
    const data = await pool
      .request()
      .input("input", input)
      .query(sqlQueries.assets_detail_by_customer_code);
    return data.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const getAllAssetDetailByType = async (input) => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("briefs");
    const data = await pool
      .request()
      .input("input", input)
      .query(sqlQueries.assets_detail_by_type);
    return data.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const getAssetDetailByCode = async (input) => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("briefs");
    const data = await pool
      .request()
      .input("input", input)
      .query(sqlQueries.assets_detail_by_code);
    return data.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const getAssetDetailByCustomerXAsset = async (input_customer_code, input_asset_code) => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("briefs");
    const data = await pool
      .request()
      .input("input_asset_code", input_asset_code)
      .input("input_customer_code", input_customer_code)
      .query(sqlQueries.asset_detail_by_customer_vs_asset_code);
    return data.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};
const getAssetDetailByCustomerXAssetType = async (input_customer_code, input_asset_type_code) => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("briefs");
    const data = await pool
      .request()
      .input("input_asset_type_code", input_asset_type_code)
      .input("input_customer_code", input_customer_code)
      .query(sqlQueries.asset_detail_by_customer_vs_asset_type_code);
    return data.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const approvalBrief = async (input) => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("briefs");
    const data = await pool
      .request()
      .input("input", input)
      .query(sqlQueries.approval_brief);
    return data.recordsets;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const disapprovalBrief = async (input) => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("briefs");
    const data = await pool
      .request()
      .input("input", input)
      .query(sqlQueries.disapproval_brief);
    return data.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const getIs_Approval = async (input) => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("briefs");
    const data = await pool
      .request()
      .input("input", input)
      .query(sqlQueries.is_approval);
    return data.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

module.exports = {
  getBriefPoint,
  getAllBrief,
  getAllAsset,
  getAllAppraisalPlan,
  getAllAppraisalDocumentDetail,
  getAllAppraisalPlanDetail,
  getBriefByCode,
  getAssetByCode,
  getAppraisalPlanByCode,
  getAppraisalPlanDetailByCode,
  getAppraisalDocumentDetailByCode,
  SuperDetailByBriefCode,
  SuperDetailByCustomerCode,
  getAllSuperDetail,
  getAllAssetDetail,
  getAllAssetDetailByType,
  getAssetDetailByCode,
  getAllAssetDetailByCustomer,
  getAssetDetailByCustomerXAsset,
  getAssetDetailByCustomerXAssetType,
  approvalBrief,
  disapprovalBrief,
  getIs_Approval
};
