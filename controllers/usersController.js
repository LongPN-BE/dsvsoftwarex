'use strict';

const userData = require('../data/users');

const getAllEmployees = async (req, res) => {
    try {
        const employees = await userData.getAllEmployees();
        res.status(200).json(employees);
    } catch (err) {
        console.log(err);
        res.status(500).json({ error: err });
    }
};

const getAllCustomers = async (req, res) => {
    try {
        const customers = await userData.getAllCustomers();
        res.status(200).json(customers);
    } catch (err) {
        console.log(err);
        res.status(500).json({ error: err });
    }
};

const getAllBrokers = async (req, res) => {
    try {
        const brokers = await userData.getAllBrokers();
        res.status(200).json(brokers);
    } catch (err) {
        console.log(err);
        res.status(500).json({ error: err });
    }
};

module.exports = {
    getAllEmployees,
    getAllCustomers,
    getAllBrokers
};