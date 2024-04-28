'use strict';

const express = require('express');
const router = express.Router();

// router.post('/signup', userControll.addUser);
// router.post('/login', userControll.logIn);
// router.put('/update/:id', userControll.updateUserInfo);

//------------ API USER ------------
const userControll = require('../controllers/users_controller');
const { getAllEmployees,
    getAllCustomers,
    getAllBrokers } = userControll;

router.get('/user/employees', getAllEmployees);   // Get all employees from the database and return them as a response to an HTTP request
router.get('/user/customers', getAllCustomers);
router.get('/user/brokers', getAllBrokers);

//------------ API BRIEF ------------
const briefControll = require('../controllers/briefs_controller');
const { getBriefPoint,
    getAllBrief,
    getAllAsset,
    getAllAppraisalPlan,
    getAllAppraisalDocumentDetail,
    getAllAppraisalPlanDetail } = briefControll;

router.get('/briefs_point', getBriefPoint);
router.get('/briefs', getAllBrief);
router.get('/assets', getAllAsset);
router.get('/appraisal_plans', getAllAppraisalPlan);
router.get('/appraisal_plans_detail', getAllAppraisalPlanDetail);
router.get('/appraisal_documents_etail', getAllAppraisalDocumentDetail);
//------------ API CATEGORIES ------------
const categorieController = require('../controllers/categories_controller');
const { getAllAppraisalPlanTypes,
    getAllCustomerTypes,
    getAllAssetTypes,
    getAllVocatives,
    getAllEmployeePositions } = categorieController;

router.get('/appraisal_plan_types', getAllAppraisalPlanTypes);
router.get('/user/customer_types', getAllCustomerTypes);
router.get('/asset_types', getAllAssetTypes);
router.get('/user/vocatives', getAllVocatives);
router.get('/user/employee_positions', getAllEmployeePositions);
//-------------------
module.exports = {
    router: router
};
