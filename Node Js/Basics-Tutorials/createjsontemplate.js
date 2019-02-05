let reg = "us-east-1"; //calculate from aws sdks
let azs = ["a", "b", "c", "d", "e", "f"]; //String.fromCharCode('a'.charCodeAt() + 1) // Returns B
let cb = "10.10.0.0"; // use process.argv
let cidrsubnets = [];

if (cb.match("10.10.0.0")) {
    for (let i = 0, v = 1; i < azs.length; i++ , v++) {
        cidrsubnets[i] = `10.10.${v}0.0/23`;
    }
} else if (cb.match("10.0.0.0")) {
    for (let i = 0, v = 1; i < azs.length; i++ , v++) {
        cidrsubnets[i] = `10.0.${v}.0/24`;
    }
} else {
    console.log("Please Choose Between the Two");
}

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
for (let s = 0, v = 1, set_subnet_type = "Private"; s < azs.length; s++ , v++) {

    if (s >= azs.length / 2) {
        set_subnet_type = "Public";
    }

    subnet[s] = {
        "vpc_id": "${aws_vpc.default.id}",
        "cidr_block": cidrsubnets[s],
        "availability_zone": `${reg}${azs[s]}`
    };
    let sliced = cidrsubnets[s].slice(0, 10);
    subnet[s].tags = {
        "Name": `${reg}${azs[s]}-${sliced}-${set_subnet_type}`
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