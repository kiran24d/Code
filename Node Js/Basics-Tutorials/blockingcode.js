//import { readFileSync } from "fs"; // another way to import 
const fs = require('fs');
// Synatx  : fs.readFileSync(path[, options])
let data = fs.readFileSync('/home/yogesh/ySPACE/NodeJS/Code/input.txt');

console.log(data.toString()); //data variable conatins buffer data thats why we used tostring() method
console.log("built-in support for JavaScript, TypeScript and Node.js");
/*program blocks until it reads the file and then only it proceeds to end the program. */