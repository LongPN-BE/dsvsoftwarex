'use strict';

const express = require('express');
const router = express.Router();

// router.post('/signup', userControll.addUser);
// router.put('/update/:id', userControll.updateUserInfo);

//------------ API USER ------------
const userControll = require('../controllers/users_controller');
const { getAllEmployees,
    getAllCustomers,
    getAllBrokers } = userControll;

router.post('/auth/login', userControll.login);

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

router.get('/brief/briefs_point', getBriefPoint);
router.get('/brief/briefs', getAllBrief);
router.get('/assets', getAllAsset);
router.get('/appraisal_plans', getAllAppraisalPlan);
router.get('/appraisal_plans_detail', getAllAppraisalPlanDetail);
router.get('/appraisal_documents_detail', getAllAppraisalDocumentDetail);
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
const { getStorage, ref, getDownloadURL, uploadBytesResumable } = require("firebase/storage");
const multer = require("multer");
const dotenv = require('dotenv');
const fileData = require("../data/files");

dotenv.config();

const firebaseConfig = {
    apiKey: process.env.API_KEY,
    authDomain: process.env.AUTH_DOMAIN,
    projectId: process.env.PROJECT_ID,
    databaseURL: process.env.FIRESTORE_DB_URL,
    storageBucket: process.env.STORAGE_BUCKET,
    messagingSenderId: process.env.MESSAGING_SENDER_ID,
    appId: process.env.APP_ID,
    measurementId: process.env.MEASUREMENT_ID,
};
//Initialize a firebase application
initializeApp(firebaseConfig);

// Initialize Cloud Storage and get a reference to the service
const storage = getStorage();

// Setting up multer as a middleware to grab photo uploads
const upload = multer({ storage: multer.memoryStorage() });

router.post("/files/upload", upload.single("filename"), async (req, res) => {
    try {
        const dateTime = giveCurrentDateTime();

        const storageRef = ref(storage, `files/${req.file.originalname + "       " + dateTime}`);

        // Create file metadata including the content type
        const metadata = {
            contentType: req.file.mimetype,
        };

        // Upload the file in the bucket storage
        const snapshot = await uploadBytesResumable(storageRef, req.file.buffer, metadata);
        //by using uploadBytesResumable we can control the progress of uploading like pause, resume, cancel

        // Grab the public url
        const downloadURL = await getDownloadURL(snapshot.ref);

        console.log('File successfully uploaded.');
        await fileData.createFile(req.file.originalname, downloadURL, 1, 1, 1, dateTime);
        const file = await fileData.getAllFiles();
        console.log({
            message: 'file uploaded to firebase storage',
            name: req.file.originalname,
            type: req.file.mimetype,
            downloadURL: downloadURL
        })
        console.log(file)
        return res.status(200).send(file);
    } catch (error) {
        return res.status(400).send(error.message)
    }
});

const giveCurrentDateTime = () => {
    const today = new Date();
    const date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
    const time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
    const dateTime = date + ' ' + time;
    return dateTime;
}

//-------------------
module.exports = {
    router: router
};
