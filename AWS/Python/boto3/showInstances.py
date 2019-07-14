#!/usr/bin/python3

import boto3

ec2 = boto3.resource('ec2')
ec2client = boto3.client('ec2')

#instances = ec2.instances.filter()
response = ec2client.describe_instances()
for reservation in response["Reservations"]:
    for instance in reservation["Instances"]:
        # This sample print will output entire Dictionary object
        print(instance)
	print(ec2.Instance(instance["InstanceId"]))




#for instance in instances:
#	for tag in instance.tags:
#		if 'Name'in tag['Key']:
#			print(tag['Value'])
#for instance in instances:
 # print(instance.id, instance.instance_type, instance.tags)
