'use strict';

const categorieData = require('../data/categories');

const getAllAppraisalPlanTypes = async (req, res) => {
    try {
        const appraisalPlanTypes = await categorieData.getAppraisalPlanType();
        res.status(200).json(appraisalPlanTypes);
    } catch (err) {
        console.log(err);
        res.status(500).json({ error: err });
    }
};

const getAllCustomerTypes = async (req, res) => {
    try {
        const customerTypes = await categorieData.getCustomerTypes();
        res.status(200).json(customerTypes);
    } catch (err) {
        console.log(err);
        res.status(500).json({ error: err });
    }
};
const getAllAssetTypes = async (req, res) => {
    try {
        const assetTypes = await categorieData.getAssetTypes();
        res.status(200).json(assetTypes);
    } catch (err) {
        console.log(err);
        res.status(500).json({ error: err });
    }
};
const getAllVocatives = async (req, res) => {
    try {
        const vocatives = await categorieData.getVocatives();
        res.status(200).json(vocatives);
    } catch (err) {
        console.log(err);
        res.status(500).json({ error: err });
    }
};
const getAllEmployeePositions = async (req, res) => {
    try {
        const employeePositions = await categorieData.getEmployeePositions();
        res.status(200).json(employeePositions);
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
    getAllEmployeePositions
};