#!/usr/bin/env python3
import boto3

template_file = './vpc.cf.json'
STACK_NAME = 'ystack'

cloudformation = boto3.client('cloudformation')

try:
    with open(template_file) as tf:
        TEMPLATE = tf.read()
    print(cloudformation.validate_template(
        TemplateBody = TEMPLATE
    ))
except Exception as error:
    print(error)
else:           #run if try block runs
    try:
        stack_args = {
            'StackName': STACK_NAME,
            'TemplateBody': TEMPLATE,
            'DisableRollback': True,
            'EnableTerminationProtection': False
        }
        print(cloudformation.create_stack(**stack_args)['StackId'])  #Returns a Dic
    except Exception as error:
        print(error)
finally:
    for stack in cloudformation.describe_stacks()['Stacks']:
        print(F"Name = {stack['StackName']}, Status = {stack['StackStatus']}\n")