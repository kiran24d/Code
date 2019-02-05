//Import the Amazon EC2 service client
const EC2 = require('aws-sdk/clients/ec2');
//set region and apiversion and Create Service Object
let reg = "us-east-1"; // use process.argv
let ec2 = new EC2({
    apiVersion: '2016-11-15',
    region: `${reg}`
});
let azs = [];
let cb = "10.10.0.0"; // use process.argv
let cidrsubnets = [];

tf = {};
tf.terraform = {};

let t = tf.terraform;
t.backend = {};
t.provider = {};
t.resource = {};
t.output = {};

t.backend.s3 = {
    "bucket": "y-tfstate-bucket",
    "key": "VPC/terraform.tfstate",
    "region": `${reg} `
}

t.provider.aws = {
    "region": `${reg} `
}

let r = t.resource;
r.aws_vpc = {};
r.aws_subnet = {};
r.aws_internet_gateway = {};
r.aws_eip = {};
r.aws_nat_gateway = {};
r.aws_route_table = {};
r.aws_main_route_table_association = {};
r.aws_route_table_association = {};
r.aws_security_group = {};
r.aws_security_group_rule = {};

let vpc = r.aws_vpc;
vpc.default = {
    "cidr_block": `${cb}/16`,
    "enable_dns_support": "true",
    "enable_dns_hostnames": "true"
}
vpc.default.tags = {
    "Name": `${reg}-${cb}`
}
let subnet = r.aws_subnet;

ec2.describeAvailabilityZones((err, data) => {
    return new Promise((resolve, reject) => {
        if (err) {
            return reject(err);
        } else {
            resolve(data);
        }
    });
}).promise().then(azes => {

    for (let i = 0; i < azes.AvailabilityZones.length; i++) {
        azs[i] = azes.AvailabilityZones[i].ZoneName;
    }
    let subnetazs = [];
    for (let j = azs.length; subnetazs.length < 6; j++) {
        subnetazs = subnetazs.concat(azs);
    }

    if (cb.match("10.10.0.0")) {
        for (let i = 0, v = 1; i < azs.length; i++, v++) {
            cidrsubnets[i] = `10.10.${v}0.0/23`;
        }
    } else if (cb.match("10.0.0.0")) {
        for (let i = 0, v = 1; i < azs.length; i++, v++) {
            cidrsubnets[i] = `10.0.${v}.0/24`;
        }
    } else {
        console.log("Please Choose Between the Two");
    }

    for (let s = 0, set_subnet_type = "Private"; s < azs.length; s++) {

        if (s >= 3) {
            set_subnet_type = "Public";
        }

        subnet[s] = {
            "vpc_id": "${aws_vpc.default.id}",
            "cidr_block": cidrsubnets[s],
            "availability_zone": subnetazs[s]
        };
        let sliced = cidrsubnets[s].slice(0, 10);
        subnet[s].tags = {
            "Name": `${subnetazs[s]}-${sliced}-${set_subnet_type}`
        };
    }
    let prettyjson = JSON.stringify(tf, null, 2);
    console.log(prettyjson);
    /*const {
    writeFileSync
} = require('fs');
writeFileSync('./test/template.tf.json', prettyjson);
//run terraform init
const {
    exec
} = require('child_process');
exec('cd ./test; terraform init; terraform plan', (err, sout, serr) => {
    if (err) {
        //one way to refer vars
        console.error(`exec error: ${err}`);
        return
    }
    //other way to refer vars
    console.log("Result:" + sout);
});*/
}).catch((err) => {
    console.error(err);
});