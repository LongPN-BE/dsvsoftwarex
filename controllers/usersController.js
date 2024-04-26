'use strict';

const userData = require('../data/users');

const getAllUser = async (req, res) => {
    try {
        const allUsers = await userData.getAll();
        res.status(200).json(allUsers);
    } catch (err) {
        console.log(err);
        res.status(500).json({ error: err });
    }
};

module.exports = {
    getAllUser
};