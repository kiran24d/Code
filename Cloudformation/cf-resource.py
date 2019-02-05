#!/usr/bin/env python3
import boto3

INFRA_FILE = './vpc.cf.json'
STACK_NAME = 'myteststack'
CLOUDFORMATION = boto3.resource('cloudformation')

def read_conf(path):
    with open(path, 'r') as f:
        return f.read().replace('\n', '')

def create_cf_stack(STACK_NAME, INFRA_STR):
    # Create Stack
    stack = CLOUDFORMATION.create_stack(
        StackName=STACK_NAME,
        TemplateBody=INFRA_STR,
        DisableRollback=True,
        EnableTerminationProtection=False
    )
    return stack.stack_status

def delete_cf_stack():
    # Delete Stack
    stack = CLOUDFORMATION.Stack(STACK_NAME)
    return stack.delete()

def list_cf_stack():
    for _ in CLOUDFORMATION.stacks.all():
        print(F"Name = { _.stack_name}, Status = {_.stack_status}\n")

def main():
    #print(create_cf_stack(STACK_NAME, INFRA_STR))
    #print(delete_cf_stack())
    list_cf_stack()

INFRA_STR = read_conf(INFRA_FILE)

main()