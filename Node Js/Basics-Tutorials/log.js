//we have created an object with three functions - info(), warning() and error(). At the end, we have assigned this object to module.exports. The module.exports exposes a log object as a module.
/*var log = {
    info: function (info) {
        console.log('Info: ' + info);
    },
    warning: function (warning) {
        console.log('Warning: ' + warning);
    },
    error: function (error) {
        console.log('Error: ' + error);
    }
};

module.exports = log*/
module.exports.log = function (msg) {
    console.log(msg);
};