const {
    writeFile
} = require('fs');

writeFile('sample.txt', "test", (err) => {
    if (err) {
        throw err;
    }
    console.log("file saved TO " + __dirname);
    console.log("file saved TO " + process.cwd());
});