"use strict";

const categorieData = require("../data/categories");

const getAllAppraisalPlanTypes = async (req, res) => {
  try {
    const appraisal_plan_type_code = req.param("appraisal_plan_type_code");
    let data;
    if (appraisal_plan_type_code != undefined)
      data = await categorieData.getAppraisalPlanTypeByCode(
        appraisal_plan_type_code
      );
    else data = await categorieData.getAppraisalPlanType();
    res.status(200).json(data);
  } catch (err) {
    console.log(err);
    res.status(500).json({ error: err });
  }
};

const getAllCustomerTypes = async (req, res) => {
  try {
    const customer_type_code = req.param("customer_type_code");
    let data;
    if (customer_type_code != undefined)
      data = await categorieData.getCustomerTypeByCode(customer_type_code);
    else data = await categorieData.getCustomerTypes();
    res.status(200).json(data);
  } catch (err) {
    console.log(err);
    res.status(500).json({ error: err });
  }
};
const getAllAssetTypes = async (req, res) => {
  try {
    const asset_type_code = req.param("asset_type_code");
    let data;
    if (asset_type_code != undefined)
      data = await categorieData.getAssetTypeByCode(asset_type_code);
    else data = await categorieData.getAssetTypes();
    res.status(200).json(data);
  } catch (err) {
    console.log(err);
    res.status(500).json({ error: err });
  }
};

const getAllVocatives = async (req, res) => {
  try {
    const vocative_code = req.param("vocative_code");
    let data;
    if (vocative_code != undefined)
      data = await categorieData.getVocativeByCode(vocative_code);
    else data = await categorieData.getVocatives();
    res.status(200).json(data);
  } catch (err) {
    console.log(err);
    res.status(500).json({ error: err });
  }
};

const getAllEmployeePositions = async (req, res) => {
  try {
    const employee_position_code = req.param("employee_position_code");
    let data;
    if (employee_position_code != undefined)
      data = await categorieData.getEmployeePositionByCode(
        employee_position_code
      );
    else data = await categorieData.getEmployeePositions();
    res.status(200).json(data);
  } catch (err) {
    console.log(err);
    res.status(500).json({ error: err });
  }
};

module.exports = {
  getAllAppraisalPlanTypes,
  getAllCustomerTypes,
  getAllAssetTypes,
  getAllVocatives,
  getAllEmployeePositions,
};
