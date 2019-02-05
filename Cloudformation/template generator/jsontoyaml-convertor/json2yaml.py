#!/usr/bin/env python3

from cfn_flip import flip, to_yaml

json_file = './vpc.cf.json'
yaml_file = './vpc.cf.yaml'

with open(json_file) as jt:
    bytestream = jt.read()
with open(yaml_file, 'w+') as yf:
    #yf.write(flip(template))
    yf.write(to_yaml(bytestream, clean_up=True))