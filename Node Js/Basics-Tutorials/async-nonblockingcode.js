/*The program does not wait for file reading and proceeds to print "Finish" and at the same time, the program without blocking continues reading the file.

https://nodejs.org/api/fs.html#fs_fs_readfile_path_options_callback 
SYTAX : fs.readFile(path[, options], callback)
*/
const fs = require('fs');

fs.readFile('/home/yogesh/ySPACE/NodeJS/Code/input.txt', (err, data) => {
    if (err) {
        throw err;
    };
    console.log(data); //this will print buffer data
});
console.log("non blocking finish 1st");

fs.readFile('/home/yogesh/ySPACE/NodeJS/Code/input.txt', (err, data) => {
    if (err) {
        throw err;
    };
    console.log(data.toString()); // this will print the actual contents
});
console.log("non blocking finish 2nd");

//Other way to write the same thing
fs.readFile('/home/yogesh/ySPACE/NodeJS/Code/input.txt', function (err, data) {
    if (err)
        return console.error(err);
    return console.log(data.toString());
});
console.log("Finish");