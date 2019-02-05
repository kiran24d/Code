/*https://docs.aws.amazon.com/sdk-for-javascript/v2/developer-guide/creating-and-calling-service-objects.html
Import the Amazon EC2 service client
*/
const EC2 = require('aws-sdk/clients/ec2');
//set region and apiversion and Create Service Object
let ec2 = new EC2({
    apiVersion: '2016-11-15',
    region: 'us-east-1'
});
//Specify Service Object Parameters
ec2.describeAvailabilityZones((err, data) => {
    if (err) {
        throw err;
    } else {
        console.log("azes: ", data);
    }
});

/*
var AWS = require('aws-sdk');
// Set the region 
AWS.config.update({
    region: 'us-east-1'
});

// Create EC2 service object
var ec2 = new AWS.EC2({
    apiVersion: '2016-11-15'
});

// Retrieves availability zones only for region of the ec2 service object
ec2.describeAvailabilityZones(params = {}, (err, data) => {
    if (err) {
        console.log("Error", err);
    } else {
        console.log("AZs: ", data.AvailabilityZones.length);
    }
});*/