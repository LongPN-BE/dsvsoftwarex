"use strict";

const userData = require("../data/users");

const login = async (req, res) => {
  try {
    const username = req.body.username;
    const password = req.body.password;
    if (!username || !password)
      return res.status(400).send({
        code: -1,
        message: "Vui lòng hãy nhập ký tự. Không đươc bỏ trống",
      });
    const user = await userData.login(username, password);
    if (user[0][0].outputNumber == 0) res.status(200).json(user[3][0]);
    else
      return res.status(404).json({
        code: user[0][0].outputNumber,
        message: user[0][0].outputResult,
      });
  } catch (err) {
    console.log(err);
    res.status(500).json({ error: err });
  }
};

const getAllEmployees = async (req, res) => {
  try {
    const employee_code = req.param("employee_code");
    let data;
    if (employee_code != undefined)
      data = await userData.getEmployeeByCode(employee_code);
    else data = await userData.getAllEmployees();
    res.status(200).json(data);
  } catch (err) {
    console.log(err);
    res.status(500).json({ error: err });
  }
};

const getAllCustomers = async (req, res) => {
  try {
    const customer_code = req.param("customer_code");
    let data;
    if (customer_code != undefined)
      data = await userData.getCustomerByCode(customer_code);
    else data = await userData.getAllCustomers();
    res.status(200).json(data);
  } catch (err) {
    console.log(err);
    res.status(500).json({ error: err });
  }
};

const getAllBrokers = async (req, res) => {
  try {
    const broker_code = req.param("broker_code");
    let data;
    if (broker_code != undefined)
      data = await userData.getBrokersByCode(broker_code);
    else data = await userData.getAllBrokers();
    res.status(200).json(data);
  } catch (err) {
    console.log(err);
    res.status(500).json({ error: err });
  }
};

module.exports = {
  login,
  getAllEmployees,
  getAllCustomers,
  getAllBrokers,
};
