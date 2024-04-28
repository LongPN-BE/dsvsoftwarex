'use strict';

const briefData = require('../data/brief');

const getBriefPoint = async (req, res) => {
    try {
        const points = await briefData.getBriefPoint();
        res.status(200).json(points);
    } catch (err) {
        console.log(err);
        res.status(500).json({ error: err });
    }
};

const getAllBrief = async (req, res) => {
    try {
        const briefs = await briefData.getAllBrief();
        res.status(200).json(briefs);
    } catch (err) {
        console.log(err);
        res.status(500).json({ error: err });
    }
};

const getAllAsset = async (req, res) => {
    try {
        const assets = await briefData.getAllAsset();
        res.status(200).json(assets);
    } catch (err) {
        console.log(err);
        res.status(500).json({ error: err });
    }
};
const getAllAppraisalPlan = async (req, res) => {
    try {
        const appraisalPlans = await briefData.getAllAppraisalPlan();
        res.status(200).json(appraisalPlans);
    } catch (err) {
        console.log(err);
        res.status(500).json({ error: err });
    }
};


module.exports = {
    getBriefPoint,
    getAllBrief,
    getAllAsset,
    getAllAppraisalPlan
};