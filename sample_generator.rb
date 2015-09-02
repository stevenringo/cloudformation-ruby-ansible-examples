#!/usr/bin/env ruby

require_relative 'lib/requires'

template do

  value AWSTemplateFormatVersion: '2010-09-09'

  value Description: 'AWS Hello CloudFormation Sample Template VPC_AutoScaling_and_ElasticLoadBalancer: Create a load balanced, Auto Scaled sample website in an existing Virtual Private Cloud (VPC). This example creates an Auto Scaling group behind a load balancer with a simple health check using a basic getting start AMI that has a simple Apache Web Server-based PHP page. The web site is available on port 80, however, the instances can be configured to listen on any port (8888 by default). **WARNING** This template creates one or more Amazon EC2 instances and an Elastic Load Balancer. You will be billed for the AWS resources used if you create a stack from this template.'

  parameter_vpc_id
  parameter_subnets
  parameter_azs
  parameter_key_name
  parameter_ssh_location
  parameter_instance_type
  parameter_instance_count

  mapping_region_2_examples
  mapping_aws_instance_type_2_arch
  mapping_aws_region_arch_2_ami

  resource 'WebServerGroup', Type: 'AWS::AutoScaling::AutoScalingGroup', CreationPolicy: { ResourceSignal: { Timeout: 'PT15M' } }, UpdatePolicy: { AutoScalingRollingUpdate: { MinInstancesInService: '1', MaxBatchSize: '1', PauseTime: 'PT15M', WaitOnResourceSignals: 'true' } }, Properties: {
      AvailabilityZones: ref('AZs'),
      VPCZoneIdentifier: ref('Subnets'),
      LaunchConfigurationName: ref('LaunchConfig'),
      MinSize: '1',
      MaxSize: '10',
      DesiredCapacity: ref('InstanceCount'),
      LoadBalancerNames: [ ref('ElasticLoadBalancer') ],
  }

  resource 'LaunchConfig', Type: 'AWS::AutoScaling::LaunchConfiguration', Metadata: { Comment: 'Install a simple application', :'AWS::CloudFormation::Init' => { config: { packages: { yum: { httpd: [] } }, files: { :'/var/www/html/index.html' => { content: join("\n", '<img src="', find_in_map('Region2Examples', aws_region, 'Examples'), '/cloudformation_graphic.png" alt="AWS CloudFormation Logo"/>', '<h1>Congratulations, you have successfully launched the AWS CloudFormation sample.</h1>'), mode: '000644', owner: 'root', group: 'root' }, :'/etc/cfn/cfn-hup.conf' => { content: join('', "[main]\n", 'stack=', aws_stack_id, "\n", 'region=', aws_region, "\n"), mode: '000400', owner: 'root', group: 'root' }, :'/etc/cfn/hooks.d/cfn-auto-reloader.conf' => { content: join('', "[cfn-auto-reloader-hook]\n", "triggers=post.update\n", "path=Resources.LaunchConfig.Metadata.AWS::CloudFormation::Init\n", 'action=/opt/aws/bin/cfn-init -v ', '         --stack ', aws_stack_name, '         --resource LaunchConfig ', '         --region ', aws_region, "\n", "runas=root\n") } }, services: { sysvinit: { httpd: { enabled: 'true', ensureRunning: 'true' }, :'cfn-hup' => { enabled: 'true', ensureRunning: 'true', files: [ '/etc/cfn/cfn-hup.conf', '/etc/cfn/hooks.d/cfn-auto-reloader.conf' ] } } } } } }, Properties: {
      AssociatePublicIpAddress: 'true',
      ImageId: find_in_map('AWSRegionArch2AMI', aws_region, find_in_map('AWSInstanceType2Arch', ref('InstanceType'), 'Arch')),
      SecurityGroups: [ ref('InstanceSecurityGroup') ],
      KeyName: ref('KeyName'),
      InstanceType: ref('InstanceType'),
      UserData: base64(interpolate(file('user_data/sample.sh')))
  }

  resource 'ElasticLoadBalancer', Type: 'AWS::ElasticLoadBalancing::LoadBalancer', Properties: {
      CrossZone: 'true',
      SecurityGroups: [ ref('LoadBalancerSecurityGroup') ],
      Subnets: ref('Subnets'),
      Listeners: [
          { LoadBalancerPort: '80', InstancePort: '80', Protocol: 'HTTP' },
      ],
      HealthCheck: { Target: 'HTTP:80/', HealthyThreshold: '3', UnhealthyThreshold: '5', Interval: '30', Timeout: '25' },
  }

  resource 'LoadBalancerSecurityGroup', Type: 'AWS::EC2::SecurityGroup', Properties: {
      GroupDescription: 'Enable HTTP access on port 80',
      VpcId: ref('VpcId'),
      SecurityGroupIngress: [ { IpProtocol: 'tcp', FromPort: '80', ToPort: '80', CidrIp: '0.0.0.0/0'  } ],
      SecurityGroupEgress:  [ { IpProtocol: 'tcp', FromPort: '80', ToPort: '80', CidrIp: all_internet } ],
  }

  resource 'InstanceSecurityGroup', Type: 'AWS::EC2::SecurityGroup', Properties: {
      GroupDescription: 'Enable HTTP access and SSH access',
      VpcId: ref('VpcId'),
      SecurityGroupIngress: [
        { IpProtocol: 'tcp', FromPort: '80', ToPort: '80', SourceSecurityGroupId: ref('LoadBalancerSecurityGroup') },
        { IpProtocol: 'tcp', FromPort: '22', ToPort: '22', CidrIp: ref('SSHLocation') },
      ]
  }

  output 'URL',
    Description: 'URL of the website',
    Value: join('', 'http://', get_att('ElasticLoadBalancer', 'DNSName'))

end.exec!
