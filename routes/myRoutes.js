'use strict';

const express = require('express');
const router = express.Router();

// router.post('/signup', userControll.addUser);
// router.post('/login', userControll.logIn);
// router.put('/update/:id', userControll.updateUserInfo);

//------------ API USER ------------
const userControll = require('../controllers/usersController');
const { getAllEmployees,
    getAllCustomers,
    getAllBrokers } = userControll;

router.get('/user/allEmployees', getAllEmployees);   // Get all employees from the database and return them as a response to an HTTP request
router.get('/user/allCustomers', getAllCustomers);
router.get('/user/allBrokers', getAllBrokers);

//------------ API BRIEF ------------
const briefControll = require('../controllers/briefsController');
const { getBriefPoint,
    getAllBrief,
    getAllAsset,
    getAllAppraisalPlan } = briefControll;

router.get('/briefPoint', getBriefPoint);
router.get('/briefs', getAllBrief);
router.get('/assets', getAllAsset);
router.get('/appraisalPlans', getAllAppraisalPlan);
//------------ API CATEGORIES ------------
const categorieController = require('../controllers/categoriesController');
const { getAllAppraisalPlanTypes,
    getAllCustomerTypes,
    getAllAssetTypes,
    getAllVocatives,
    getAllEmployeePositions } = categorieController;


router.get('/appraisalPlanTypes', getAllAppraisalPlanTypes);
router.get('/user/customerTypes', getAllCustomerTypes);
router.get('/assetTypes', getAllAssetTypes);
router.get('/user/vocatives', getAllVocatives);
router.get('/user/employeePositions', getAllEmployeePositions);
//-------------------
module.exports = {
    router: router
};


// ---- thêm các giá trị này

// --select * from ChiTietHoSoThamDinh
// --select * from ChiTietKeHoachThamDinh