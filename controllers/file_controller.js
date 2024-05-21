"use strict";

const fileData = require("../data/files");
const helper = require("../utils/helpers");
const cloudinary = require("../config/cloudinary.config");

const getAllFiles = async (req, res) => {
    try {
        const files = await fileData.getAllFiles();
        res.status(200).json(files);
    } catch (err) {
        console.log(err);
        res.status(500).json({ error: err });
    }
};

const uploadByFireBase = async (req, res) => {
    try {
        const dateTime = helper.giveCurrentDateTime();

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
};

const uploadByCloudinary = async (req, res) => {
    try {
        console.log(53, req.file.originalname)
        cloudinary.uploader.upload(req.file.path,
            {
                resource_type: "raw",
                folder: "files",
                format: req.file.path.split('.').pop()
            },
            async function (err, result) {
                if (err) {
                    console.log(err);
                    return res.status(500).json({
                        success: false,
                        message: "Error"
                    })
                } else {
                    console.log(result);
                    await fileData.createFile(
                        req.file.originalname,
                        result.url,
                        req.file.path.split('.').pop(),
                        helper.giveCurrentDateTime());
                    res.status(200).json({
                        success: true,
                        message: "Uploaded!",
                        data: result
                    })
                }
            })
    }
    catch (error) {
        return res.status(400).send(error.message)
    }
}

module.exports = {
    getAllFiles,
    uploadByFireBase,
    uploadByCloudinary
};
