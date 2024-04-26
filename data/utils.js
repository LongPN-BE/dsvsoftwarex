'use strict';

const fs = require('fs-extra');
const { join } = require('path');

const loadSqlQueries = async (folderName) => {
    const filePath = join(process.cwd(), 'data', folderName);  // relative to the root of
    const files = await fs.readdir(filePath);
    const sqlFiles = files.filter((fileName) => fileName.endsWith('.sql'));
    let queries = {};

    for (const sqlFile of sqlFiles) {
        const query = fs.readFileSync(join(filePath, sqlFile), "utf8");
        queries[sqlFile.split(".sql", "")] = query;
    }
    return queries;
}

module.exports = {
    loadSqlQueries
};