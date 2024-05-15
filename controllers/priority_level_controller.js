"use strict";

const priority_level_data = require("../data/priority_level");

const getAllProrityLevel = async (req, res) => {
    try {
        const priority_level_code = req.param("priority_level_code");
        let data;
        if (priority_level_code != undefined)
            data = await priority_level_data.getAllProrityLevelByCode(priority_level_code);
        else data = await priority_level_data.getAllProrityLevel();
        res.status(200).json(data);
    } catch (err) {
        console.log(err);
        res.status(500).json({ error: err });
    }
};

module.exports = {
    getAllProrityLevel
};