"use strict";

const utils = require("../utils");
const config = require("../../config");
const sql = require("mssql");

const getAppraisalPlanType = async () => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("categories");
    const appraisalPlanTypes = await pool
      .request()
      .query(sqlQueries.appraisal_plan_types);
    console.log(appraisalPlanTypes);
    return appraisalPlanTypes.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const getAppraisalPlanTypeByCode = async (input) => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("categories");
    const appraisalPlanTypes = await pool
      .request()
      .input("input", input)
      .query(sqlQueries.appraisal_plan_types_by_code);
    return appraisalPlanTypes.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const getCustomerTypes = async () => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("categories");
    const customerTypes = await pool.request().query(sqlQueries.customer_types);
    console.log(customerTypes);
    return customerTypes.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const getCustomerTypeByCode = async (input) => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("categories");
    const customerTypes = await pool
      .request()
      .input("input", input)
      .query(sqlQueries.customer_types_by_code);
    return customerTypes.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const getAssetTypes = async () => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("categories");
    const assetTypes = await pool.request().query(sqlQueries.asset_types);
    console.log(assetTypes);
    return assetTypes.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const getAssetTypeByCode = async (input) => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("categories");
    const assetTypes = await pool
      .request()
      .input("input", input)
      .query(sqlQueries.asset_types_by_code);
    return assetTypes.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const getVocatives = async () => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("categories");
    const vocatives = await pool.request().query(sqlQueries.vocatives);
    console.log(vocatives);
    return vocatives.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const getVocativeByCode = async (input) => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("categories");
    const vocative = await pool
      .request()
      .input("input", input)
      .query(sqlQueries.vocatives_by_code);
    return vocative.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const getEmployeePositions = async () => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("categories");
    const employeePositions = await pool
      .request()
      .query(sqlQueries.employee_positions);
    console.log(employeePositions);
    return employeePositions.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const getEmployeePositionByCode = async (input) => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("categories");
    const employeePositions = await pool
      .request()
      .input("input", input)
      .query(sqlQueries.employee_positions_by_code);
    return employeePositions.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

module.exports = {
  getAppraisalPlanType,
  getCustomerTypes,
  getAssetTypes,
  getVocatives,
  getEmployeePositions,
  getAppraisalPlanTypeByCode,
  getCustomerTypeByCode,
  getEmployeePositionByCode,
  getAssetTypeByCode,
  getVocativeByCode,
};
