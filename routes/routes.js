'use strict';

const express = require('express');
const router = express.Router();

// router.post('/signup', userControll.addUser);
// router.put('/update/:id', userControll.updateUserInfo);

//------------ API USER ------------
const userControll = require('../controllers/users_controller');
const { getAllEmployees,
    getAllCustomers,
    getAllBrokers,
    onCalculatePersionPoint,
    onSaveCalculatePersionPoint,
    getAllCustomerFull,
    login } = userControll;

router.post('/auth/login', login);

router.get('/user/employees', getAllEmployees);   // Get all employees from the database and return them as a response to an HTTP request
router.get('/user/customers', getAllCustomers);
router.get('/user/customer_full_information', getAllCustomerFull);
router.post('/user/on_calculate_persion_point', onCalculatePersionPoint);
router.post('/user/on_save_calculate_persion_point', onSaveCalculatePersionPoint);
router.get('/user/brokers', getAllBrokers);

//------------ API BRIEF ------------
const briefControll = require('../controllers/briefs_controller');
const { getBriefPoint,
    getAllBrief,
    getAllAsset,
    getAllAppraisalPlan,
    getAllAppraisalDocumentDetail,
    getAllAppraisalPlanDetail,
    SuperDetailByBriefCode,
    SuperDetailByCustomerCode,
    getAssetDetail,
    approvalBrief,
    disapprovalBrief } = briefControll;

router.get('/brief/briefs_point', getBriefPoint);
router.get('/brief/briefs', getAllBrief);
router.get('/brief/super_detail_by_brief_code', SuperDetailByBriefCode);
router.get('/brief/super_detail_by_customer_code', SuperDetailByCustomerCode);
router.get('/assets', getAllAsset);
router.get('/assets/assets_detail', getAssetDetail);
router.get('/appraisal_plans', getAllAppraisalPlan);
router.get('/appraisal_plans_detail', getAllAppraisalPlanDetail);
router.get('/appraisal_documents_detail', getAllAppraisalDocumentDetail);

router.post('/brief/approval', approvalBrief);
router.post('/brief/dis_approval', disapprovalBrief);
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
//------------ API Priority Level ------------
const priorityLevelController = require('../controllers/priority_level_controller');
const {
    getAllProrityLevel
} = priorityLevelController;

router.get('/priority_levels', getAllProrityLevel);
//------------ API File ------------
const fileController = require('../controllers/file_controller');
const {
    getAllFiles
} = fileController;

router.get('/files', getAllFiles);
//------------ API Priority Level ------------
const criteriaController = require('../controllers/internal_credit_criterias_controller');
const {
    getAllInternalCreditCriteria,
    getAllRootInternalCreditCriteria,
    getAllSubInternalCreditCriteria
} = criteriaController;

router.get('/criteria/internal_credit_criterias', getAllInternalCreditCriteria);
router.get('/criteria/root_internal_credit_criterias', getAllRootInternalCreditCriteria);
router.get('/criteria/sub_internal_credit_criterias', getAllSubInternalCreditCriteria);


//------------ API File ------------
const { initializeApp } = require("firebase/app");
const upload = require("../middleware/multer");
const firebaseConfig = require("../config/firebase.config");

//Initialize a firebase application
initializeApp(firebaseConfig);
// Setting up multer as a middleware to grab photo uploads
router.post("/files/upload_firebase", upload.single("filename"), fileController.uploadByFireBase);
router.post("/files/upload_cloundinary", upload.single("filename"), fileController.uploadByCloudinary);
//--------------------API Trust Contract ------------
const trustContractController = require('../controllers/trust_contract_controller');
const { getAllCustomer,
    getAllLoanAgreement,
    getAllGroupCustomer,
    getAllTrustContract
} = trustContractController;

router.get('/trust_contracts/trust_contracts', getAllTrustContract);
router.get('/trust_contracts/loan_agreements', getAllLoanAgreement);
router.get('/trust_contracts/group_customer', getAllGroupCustomer);
router.get('/trust_contracts/customer', getAllCustomer);
//-------------------
module.exports = {
    router: router
};
