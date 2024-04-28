const swaggerAutogen = require('swagger-autogen')();

const doc = {
    info: {
        version: '1.0.0',      // by default: '1.0.0'
        title: 'DSV Software API',        // by default: 'REST API'
        description: 'How does human communication happen? People can express thoughts, needs, and ideas through language (written and spoken), gestures, or facial expressions, right? At the same time, our interaction with computers, apps, and websites requires user interface (UI) components – a screen with a menu and graphical elements, a keyboard, and a mouse. Software or its elements, on the other hand, don’t need a graphical user interface to talk to each other. To communicate and exchange data and functionalities, programs use machine-readable interfaces called APIs. If you ever read tech magazines or blogs, you’ve probably seen the abbreviation API. It sounds solid, but what does it stand for? API stands for Application Programming Interface. This post will explain what APIs are, how they work, and why you should care about them in the first place.',  // by default: ''
    },
    host: 'localhost:3000',      // by default: 'localhost:3000'
    basePath: '/',  // by default: '/'
    schemes: ['http'],   // by default: ['http']
    consumes: ['application/json'],  // by default: ['application/json']
    produces: ['application/json'],  // by default: ['application/json']
};

const outputFile = '../swagger-output.json';
const endpointsFiles = ['../routes/routes.js'];

swaggerAutogen(outputFile, endpointsFiles, doc).then(async () => {
    await import('../index.js'); // Your project's root file
});