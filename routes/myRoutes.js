'use strict';

const express = require('express');
const userControll = require('../controllers/usersController');
const router = express.Router();

// router.post('/signup', userControll.addUser);
// router.get('/login', userControll.logIn);
// router.put('/update/:id', userControll.updateUserInfo);

const {getAllUser}= userControll;

router.get( '/allUsers', getAllUser );  // GET: http://localhost:3000
//?page=2&limit=5

module.exports = {
    router: router
};