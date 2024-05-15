"use strict";

const fileData = require("../data/files");

const getAllFiles = async (req, res) => {
    try {
        const files = await fileData.getAllFiles();
        res.status(200).json(files);
    } catch (err) {
        console.log(err);
        res.status(500).json({ error: err });
    }
};

module.exports = {
    getAllFiles
};
