"use strict";

const trust_contract_data = require("../data/trust_contract");

const getAllTrustContract = async (req, res) => {
    try {
        let data = await trust_contract_data.getAllTrustContract();
        res.status(200).json(data);
    } catch (err) {
        console.log(err);
        res.status(500).json({ error: err });
    }
};

const getAllLoanAgreement = async (req, res) => {
    try {
        let data = await trust_contract_data.getAllLoanAgreement();
        res.status(200).json(data);
    } catch (err) {
        console.log(err);
        res.status(500).json({ error: err });
    }
};

const getAllGroupCustomer = async (req, res) => {
    try {
        let data = await trust_contract_data.getAllGroupCustomer();
        res.status(200).json(data);
    } catch (err) {
        console.log(err);
        res.status(500).json({ error: err });
    }
};

const getAllCustomer = async (req, res) => {
    try {
        let data = await trust_contract_data.getAllCustomer();
        res.status(200).json(data);
    } catch (err) {
        console.log(err);
        res.status(500).json({ error: err });
    }
};

module.exports = {
    getAllTrustContract,
    getAllLoanAgreement,
    getAllGroupCustomer,
    getAllCustomer
};