#!/usr/bin/python3

#short script to print list of my aws instances name
import boto3

client=boto3.client('ec2','us-east-2')
response = client.describe_instances()

for reservation in (response["Reservations"]):
	for instance in reservation["Instances"]:
		for name in instance['Tags']:
			if(name['Key'] == 'Name'):
				print(name['Value'])

