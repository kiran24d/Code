const {
    exec
} = require('child_process');

exec('ls', (err, sout, serr) => {
    if (err) {
        //one way to refer vars
        console.error(`exec error: ${err}`);
        return
    }
    //other way to refer vars
    console.log("Result:" + sout);
});