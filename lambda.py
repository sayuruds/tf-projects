import boto3

def lambda_handler(event, context):
    # Initialize the EC2 client
    ec2_client = boto3.client('ec2')

    # Specify the VPC ID where you want to check and modify security groups
    vpc_id = 'vpc-04380015d0da90a59'

    # Describe all security groups in the specified VPC
    response = ec2_client.describe_security_groups(Filters=[{'Name': 'vpc-id', 'Values': [vpc_id]}])

    # Iterate through each security group in the response
    for group in response['SecurityGroups']:
        group_id = group['GroupId']
        group_name = group['GroupName']
        print(f"Checking security group: {group_name} ({group_id})")

        # Check each inbound rule of the security group
        for permission in group['IpPermissions']:
            print(permission)
            
            if permission.get('IpProtocol') == '-1':
                print("IpProtocol is '-1' in the dictionary.")
                ec2_client.revoke_security_group_ingress(
                GroupId=group_id,
                IpPermissions=[permission]
                )
            else:
                print("IpProtocol is not '-1' in the dictionary.")
          
          
            for ip_range in permission['IpRanges']:
                if ip_range['CidrIp'] == '0.0.0.0/0':
                    # Remove the rule if it allows all traffic
                    #print(f"Removing rule allowing all traffic from {ip_range['CidrIp']} in port {permission['FromPort']} - {permission['ToPort']}")
                    ec2_client.revoke_security_group_ingress(
                        GroupId=group_id,
                        IpPermissions=[permission]
                    )

    return {
        'statusCode': 200,
        'body': 'Security group checks completed'
    }
