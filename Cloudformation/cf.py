#!/usr/bin/env python3
import boto3

cloudformation = boto3.client('cloudformation')
template_file = './vpc.cf.json'
STACK_NAME = 'ystack'
wait_kwargs = {
    'StackName': STACK_NAME,
    'WaiterConfig': {
        'Delay': 5,
        'MaxAttempts': 30
    }
}

def _get_validated_template(template_file):
    try:
        with open(template_file) as tf:
            TEMPLATE = tf.read()
        cloudformation.validate_template(
            TemplateBody = TEMPLATE
        )
    except Exception as error:
        print(error)
    else:
        return TEMPLATE

def _stack_exists(STACK_NAME):
    for _ in cloudformation.list_stacks()['StackSummaries']:
        if _['StackName'] == STACK_NAME:
            if _['StackStatus'] == 'DELETE_COMPLETE':
                return False
            else:
                return True

def create_cf_stack(STACK_NAME, TEMPLATE):
    try:
        stack_kwargs = {
            'StackName': STACK_NAME,
            'TemplateBody': TEMPLATE
        }
        if _stack_exists(STACK_NAME):
            print(F"Updating {STACK_NAME}")
            print(cloudformation.update_stack(**stack_kwargs))
            _waiter('stack_update_complete')
        else:
            print(F"Creating {STACK_NAME}")
            print(cloudformation.create_stack(**stack_kwargs)['StackId'])
            _waiter('stack_create_complete')
    except Exception as error:
        print(error)

def list_cf_stacks():
    for _ in cloudformation.describe_stacks()['Stacks']:
        print(F"Name = {_['StackName']}, Status = {_['StackStatus']}\n")

def delete_cf_stack(STACK_NAME):
    cloudformation.delete_stack(StackName=STACK_NAME)
    _waiter('stack_delete_complete')
    print("Stack Deleted")

def _waiter(command):
    waiter = cloudformation.get_waiter(command)
    waiter.wait(**wait_kwargs)
    # work in future
    '''attempts = 3
    while attempts > 0:
        waiter.wait(**wait_kwargs)
        print(F"Attempt {attempts}")
        for _ in cloudformation.describe_stack_events(StackName=STACK_NAME)['StackEvents']:
            print(F"{_['ResourceType']} {_['ResourceStatus']}\n")
        attempts -= 1'''

def main():
    create_cf_stack(STACK_NAME, _get_validated_template(template_file))
    #delete_cf_stack(STACK_NAME)

main()