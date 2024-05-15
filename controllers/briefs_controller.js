"use strict";

const briefData = require("../data/briefs");

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
    const brief_code = req.param("brief_code");
    let data;
    if (brief_code != undefined)
      data = await briefData.getBriefByCode(brief_code);
    else data = await briefData.getAllBrief();
    res.status(200).json(data);
  } catch (err) {
    console.log(err);
    res.status(500).json({ error: err });
  }
};

const getAllAsset = async (req, res) => {
  try {
    const asset_code = req.param("asset_code");
    let data;
    if (asset_code != undefined)
      data = await briefData.getAssetByCode(asset_code);
    else data = await briefData.getAllAsset();
    res.status(200).json(data);
  } catch (err) {
    console.log(err);
    res.status(500).json({ error: err });
  }
};

const getAllAppraisalPlan = async (req, res) => {
  try {
    const appraisal_plan_code = req.param("appraisal_plan_code");
    let data;
    if (appraisal_plan_code != undefined)
      data = await briefData.getAppraisalPlanByCode(appraisal_plan_code);
    else data = await briefData.getAllAppraisalPlan();
    res.status(200).json(data);
  } catch (err) {
    console.log(err);
    res.status(500).json({ error: err });
  }
};

const getAllAppraisalDocumentDetail = async (req, res) => {
  try {
    const appraisal_documents_detail_code = req.param("appraisal_documents_detail_code");
    let data;
    if (appraisal_documents_detail_code != undefined)
      data = await briefData.getAppraisalDocumentDetailByCode(
        appraisal_documents_detail_code
      );
    else data = await briefData.getAllAppraisalDocumentDetail();

    res.status(200).json(data);
  } catch (err) {
    console.log(err);
    res.status(500).json({ error: err });
  }
};

const getAllAppraisalPlanDetail = async (req, res) => {
  try {
    const appraisal_plan_detail_code = req.param("appraisal_plan_detail_code");
    let data;
    if (appraisal_plan_detail_code != undefined)
      data = await briefData.getAppraisalPlanDetailByCode(
        appraisal_plan_detail_code
      );
    else data = await briefData.getAllAppraisalPlanDetail();
    res.status(200).json(data);
  } catch (err) {
    console.log(err);
    res.status(500).json({ error: err });
  }
};

module.exports = {
  getBriefPoint,
  getAllBrief,
  getAllAsset,
  getAllAppraisalPlan,
  getAllAppraisalDocumentDetail,
  getAllAppraisalPlanDetail,
};
