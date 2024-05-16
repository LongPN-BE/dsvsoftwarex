"use strict";

const utils = require("../utils");
const config = require("../../config");
const sql = require("mssql");

const login = async (userName, passWord) => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("users");
    const user = await pool
      .request()
      .input("paramUserName", userName)
      .input("paramPassWord", passWord)
      .query(sqlQueries.authen_login);
    return user.recordsets;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const getAllEmployees = async () => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("users");
    const userList = await pool.request().query(sqlQueries.employees);
    return userList.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const getEmployeeByCode = async (input) => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("users");
    const userList = await pool
      .request()
      .input("input_employee_code", input)
      .query(sqlQueries.employee_by_code);
    return userList.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const getAllCustomers = async () => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("users");
    const userList = await pool.request().query(sqlQueries.customers);
    return userList.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const getCustomerByCode = async (input) => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("users");
    const userList = await pool
      .request()
      .input("input", input)
      .query(sqlQueries.customer_by_code);
    return userList.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const getAllBrokers = async () => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("users");
    const userList = await pool.request().query(sqlQueries.brokers);
    return userList.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const getBrokersByCode = async (input) => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("users");
    const userList = await pool
      .request()
      .input("input", input)
      .query(sqlQueries.broken_by_code);
    console.log(userList.recordset);
    return userList.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

const onCalculatePersionPoint = async (input) => {
  try {
    const pool = await sql.connect(config.sql);
    const sqlQueries = await utils.loadSqlQueries("users");
    const userList = await pool
      .request()
      .input("input_hocvan", input.input_hocvan)
      .input("input_sohuutaisan", input.input_sohuutaisan)
      .input("input_thunhapchinh", input.input_thunhapchinh)
      .input("input_chitieuhangthang", input.input_chitieuhangthang)
      .input("input_nghenghiep", input.input_nghenghiep)
      .input("input_thoigianlamviec", input.input_thoigianlamviec)
      .input("input_thunhapkhac", input.input_thunhapkhac)
      .input("input_thunhapnguoidongtrachnhiem", input.input_thunhapnguoidongtrachnhiem)
      .input("input_lienketxahoi", input.input_lienketxahoi)
      .input("input_thoigiansinhsong", input.input_thoigiansinhsong)
      .input("input_nguoiphuthuoc", input.input_nguoiphuthuoc)
      .input("input_loaihinhsinhsong", input.input_loaihinhsinhsong)
      .input("input_nguoibaolanh", input.input_nguoibaolanh)
      .input("input_quanhetindung", input.input_quanhetindung)
      .query(sqlQueries.broken_by_code);
    console.log(userList.recordset);
    return userList.recordset;
  } catch (err) {
    console.log("Error: ", err);
  }
};

module.exports = {
  login,
  getAllEmployees,
  getEmployeeByCode,
  getAllCustomers,
  getAllBrokers,
  getCustomerByCode,
  getBrokersByCode,
  onCalculatePersionPoint
};
