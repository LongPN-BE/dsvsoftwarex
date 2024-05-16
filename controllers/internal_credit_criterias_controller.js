"use strict";

const criteriaData = require("../data/criterias");

const getAllInternalCreditCriteria = async (req, res) => {
    try {
        const internal_credit_criteria_code = req.param("internal_credit_criteria_code");
        let data;
        if (internal_credit_criteria_code != undefined)
            data = await criteriaData.getAllRootByInternalCreditCriteria(internal_credit_criteria_code);
        else
            data = await criteriaData.getAllInternalCreditCriteria();
        res.status(200).json(data);
    } catch (err) {
        console.log(err);
        res.status(500).json({ error: err });
    }
};

const getAllRootInternalCreditCriteria = async (req, res) => {
    try {
        const root_internal_credit_criteria_code = req.param("root_internal_credit_criteria_code");
        let data;
        if (root_internal_credit_criteria_code != undefined)
            data = await criteriaData.getAllSubByRootInternalCreditCriteria(root_internal_credit_criteria_code);
        else data = await criteriaData.getAllRootInternalCreditCriteria();
        res.status(200).json(data);
    } catch (err) {
        console.log(err);
        res.status(500).json({ error: err });
    }
};

const getAllSubInternalCreditCriteria = async (req, res) => {
    try {
        const criteria = await criteriaData.getAllSubInternalCreditCriteria();
        res.status(200).json(criteria);
    } catch (err) {
        console.log(err);
        res.status(500).json({ error: err });
    }
};

module.exports = {
    getAllInternalCreditCriteria,
    getAllRootInternalCreditCriteria,
    getAllSubInternalCreditCriteria
};
