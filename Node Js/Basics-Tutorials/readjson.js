/*const {
    readFileSync
} = require('fs');

let bufferedata = readFileSync('./sampleread.json');
console.log(bufferedata);
//console.log(bufferedata.toString());
let parsedata = JSON.parse(bufferedata);
console.log(parsedata);

let json = '{"result":true, "count":42}';
obj = JSON.parse(json);
console.log(obj.count);
*/
/*-----------OR---------------------------
Here, NodeJS automatically read the file, parse the content to a JSON object and assigns that to the left hand side variable
*/

let fileobj = require('./sampleread.json');
console.log(fileobj);

//access a key
console.log(fileobj.gender);

//add a key
fileobj.country = 'Amerika';
console.log(fileobj.country);

//delete a key
delete fileobj.age;
console.log(fileobj);

//iterate elments
for (let k in fileobj) {
    console.log("keyof:" + k + ", value:" + fileobj[k]);
}

//check for key
if (fileobj.hasOwnProperty('name')) {
    console.log("key exist");
}

//Pretify JSON
//https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify
let preetyjson = JSON.stringify(fileobj, null, 2);
console.log(preetyjson);

const {
    writeFileSync
} = require('fs');
writeFileSync('template.json', preetyjson);