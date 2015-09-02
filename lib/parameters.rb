class TemplateDSL

  def parameter_vpc_id
    parameter 'VpcId',
      Type: 'AWS::EC2::VPC::Id',
      Description: 'VpcId of your existing Virtual Private Cloud (VPC)',
      ConstraintDescription: 'must be the VPC Id of an existing Virtual Private Cloud.'
  end

  def parameter_subnets
    parameter 'Subnets',
      Type: 'List<AWS::EC2::Subnet::Id>',
      Description: 'The list of SubnetIds in your Virtual Private Cloud (VPC)',
      ConstraintDescription: 'must be a list of an existing subnets in the selected Virtual Private Cloud.'
  end

  def parameter_azs
    parameter 'AZs',
      Type: 'List<String>',
      Description: 'The list of AvailabilityZones for your Virtual Private Cloud (VPC)',
      ConstraintDescription: 'must be a list if valid EC2 availability zones for the selected Virtual Private Cloud'
  end

  def parameter_key_name
    parameter 'KeyName',
      Description: 'Name of an existing EC2 KeyPair to enable SSH access to the instances',
      Type: 'AWS::EC2::KeyPair::KeyName',
      ConstraintDescription: 'must be the name of an existing EC2 KeyPair.'
  end

  def parameter_ssh_location
    parameter 'SSHLocation',
      Description: 'Lockdown SSH access to the bastion host (default can be accessed from anywhere)',
      Type: 'String',
      MinLength: '9',
      MaxLength: '18',
      Default: '0.0.0.0/0',
      AllowedPattern: '(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})/(\\d{1,2})',
      ConstraintDescription: 'must be a valid CIDR range of the form x.x.x.x/x.'
  end

  def parameter_instance_type
    parameter 'InstanceType',
      Description: 'WebServer EC2 instance type',
      Type: 'String',
      Default: 'm1.small',
      AllowedValues: %w(t1.micro t2.micro t2.small t2.medium m1.small m1.medium m1.large m1.xlarge m2.xlarge m2.2xlarge m2.4xlarge m3.medium m3.large m3.xlarge m3.2xlarge c1.medium c1.xlarge c3.large c3.xlarge c3.2xlarge c3.4xlarge c3.8xlarge c4.large c4.xlarge c4.2xlarge c4.4xlarge c4.8xlarge g2.2xlarge r3.large r3.xlarge r3.2xlarge r3.4xlarge r3.8xlarge i2.xlarge i2.2xlarge i2.4xlarge i2.8xlarge d2.xlarge d2.2xlarge d2.4xlarge d2.8xlarge hi1.4xlarge hs1.8xlarge cr1.8xlarge cc2.8xlarge cg1.4xlarge),
      ConstraintDescription: 'must be a valid EC2 instance type.'
  end

  def parameter_instance_count
    parameter 'InstanceCount',
      Description: 'Number of EC2 instances to launch',
      Type: 'Number',
      Default: '1'
  end

end
