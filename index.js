'use strict';

const express = require('express');
const config = require('./config');
const cors = require('cors');
const bodyParser = require('body-parser');
const userRoutes = require('./routes/myRoutes');

const app = express();
app.use(express.json());
app.use(cors({ origin: true })); // allow all origins
app.use(bodyParser.urlencoded({ extended: false }));

// API routes ==> https://localhost:8081/api/{domain api}
app.use('/api', userRoutes.router);
app.listen(config.port);