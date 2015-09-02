class TemplateDSL

  def mapping_region_2_examples
    mapping 'Region2Examples',
      :'us-east-1'      => { Examples: 'https://s3.amazonaws.com/cloudformation-examples-us-east-1' },
      :'us-west-2'      => { Examples: 'https://s3-us-west-2.amazonaws.com/cloudformation-examples-us-west-2' },
      :'us-west-1'      => { Examples: 'https://s3-us-west-1.amazonaws.com/cloudformation-examples-us-west-1' },
      :'eu-west-1'      => { Examples: 'https://s3-eu-west-1.amazonaws.com/cloudformation-examples-eu-west-1' },
      :'eu-central-1'   => { Examples: 'https://s3-eu-central-1.amazonaws.com/cloudformation-examples-eu-central-1' },
      :'ap-southeast-1' => { Examples: 'https://s3-ap-southeast-1.amazonaws.com/cloudformation-examples-ap-southeast-1' },
      :'ap-northeast-1' => { Examples: 'https://s3-ap-northeast-1.amazonaws.com/cloudformation-examples-ap-northeast-1' },
      :'ap-southeast-2' => { Examples: 'https://s3-ap-southeast-2.amazonaws.com/cloudformation-examples-ap-southeast-2' },
      :'sa-east-1'      => { Examples: 'https://s3-sa-east-1.amazonaws.com/cloudformation-examples-sa-east-1' },
      :'cn-north-1'     => { Examples: 'https://s3.cn-north-1.amazonaws.com.cn/cloudformation-examples-cn-north-1' }
  end

  def mapping_aws_instance_type_2_arch
    mapping 'AWSInstanceType2Arch',
      :'t1.micro'    => { Arch: 'PV64' },
      :'t2.micro'    => { Arch: 'HVM64' },
      :'t2.small'    => { Arch: 'HVM64' },
      :'t2.medium'   => { Arch: 'HVM64' },
      :'m1.small'    => { Arch: 'PV64' },
      :'m1.medium'   => { Arch: 'PV64' },
      :'m1.large'    => { Arch: 'PV64' },
      :'m1.xlarge'   => { Arch: 'PV64' },
      :'m2.xlarge'   => { Arch: 'PV64' },
      :'m2.2xlarge'  => { Arch: 'PV64' },
      :'m2.4xlarge'  => { Arch: 'PV64' },
      :'m3.medium'   => { Arch: 'HVM64' },
      :'m3.large'    => { Arch: 'HVM64' },
      :'m3.xlarge'   => { Arch: 'HVM64' },
      :'m3.2xlarge'  => { Arch: 'HVM64' },
      :'c1.medium'   => { Arch: 'PV64' },
      :'c1.xlarge'   => { Arch: 'PV64' },
      :'c3.large'    => { Arch: 'HVM64' },
      :'c3.xlarge'   => { Arch: 'HVM64' },
      :'c3.2xlarge'  => { Arch: 'HVM64' },
      :'c3.4xlarge'  => { Arch: 'HVM64' },
      :'c3.8xlarge'  => { Arch: 'HVM64' },
      :'c4.large'    => { Arch: 'HVM64' },
      :'c4.xlarge'   => { Arch: 'HVM64' },
      :'c4.2xlarge'  => { Arch: 'HVM64' },
      :'c4.4xlarge'  => { Arch: 'HVM64' },
      :'c4.8xlarge'  => { Arch: 'HVM64' },
      :'g2.2xlarge'  => { Arch: 'HVMG2' },
      :'r3.large'    => { Arch: 'HVM64' },
      :'r3.xlarge'   => { Arch: 'HVM64' },
      :'r3.2xlarge'  => { Arch: 'HVM64' },
      :'r3.4xlarge'  => { Arch: 'HVM64' },
      :'r3.8xlarge'  => { Arch: 'HVM64' },
      :'i2.xlarge'   => { Arch: 'HVM64' },
      :'i2.2xlarge'  => { Arch: 'HVM64' },
      :'i2.4xlarge'  => { Arch: 'HVM64' },
      :'i2.8xlarge'  => { Arch: 'HVM64' },
      :'d2.xlarge'   => { Arch: 'HVM64' },
      :'d2.2xlarge'  => { Arch: 'HVM64' },
      :'d2.4xlarge'  => { Arch: 'HVM64' },
      :'d2.8xlarge'  => { Arch: 'HVM64' },
      :'hi1.4xlarge' => { Arch: 'HVM64' },
      :'hs1.8xlarge' => { Arch: 'HVM64' },
      :'cr1.8xlarge' => { Arch: 'HVM64' },
      :'cc2.8xlarge' => { Arch: 'HVM64' }
  end

  def mapping_aws_region_arch_2_ami
    mapping 'AWSRegionArch2AMI',
      :'us-east-1'      => { PV64: 'ami-0f4cfd64', HVM64: 'ami-0d4cfd66', HVMG2: 'ami-5b05ba30' },
      :'us-west-2'      => { PV64: 'ami-d3c5d1e3', HVM64: 'ami-d5c5d1e5', HVMG2: 'ami-a9d6c099' },
      :'us-west-1'      => { PV64: 'ami-85ea13c1', HVM64: 'ami-87ea13c3', HVMG2: 'ami-37827a73' },
      :'eu-west-1'      => { PV64: 'ami-d6d18ea1', HVM64: 'ami-e4d18e93', HVMG2: 'ami-72a9f105' },
      :'eu-central-1'   => { PV64: 'ami-a4b0b7b9', HVM64: 'ami-a6b0b7bb', HVMG2: 'ami-a6c9cfbb' },
      :'ap-northeast-1' => { PV64: 'ami-1a1b9f1a', HVM64: 'ami-1c1b9f1c', HVMG2: 'ami-f644c4f6' },
      :'ap-southeast-1' => { PV64: 'ami-d24b4280', HVM64: 'ami-d44b4286', HVMG2: 'ami-12b5bc40' },
      :'ap-southeast-2' => { PV64: 'ami-ef7b39d5', HVM64: 'ami-db7b39e1', HVMG2: 'ami-b3337e89' },
      :'sa-east-1'      => { PV64: 'ami-5b098146', HVM64: 'ami-55098148', HVMG2: 'NOT_SUPPORTED' },
      :'cn-north-1'     => { PV64: 'ami-bec45887', HVM64: 'ami-bcc45885', HVMG2: 'NOT_SUPPORTED' }
  end

  def mapping_subnets
    Table.mapping_load('config/subnets.txt')
  end

  def mapping_aws_account_numbers
    mapping "AwsAccountNumbers",
      dev: { account: "406340174657" },
      uat: { account: "175790611204" },
      sit: { account: "175790611204" },
      prd: { account: "906463626478" }
  end

  def mapping_application_subnets
    mapping mapping_'CsdsSubnets', subnets.get_multimap({ name: 'application_subnet' }, :region, :env, :cidr)
  end

  def mapping_vpc_cidr_blocks
    mapping mapping_"VpcCidrBlocks", subnets.get_map({ name: 'vpc' }, :region, :env, :cidr)
  end

  def mapping_trusted_addresses
    mapping "TrustedAddresses",
      site_a: { CidrBlock: "203.192.71.30/32" },
      site_b: { CidrBlock: "4.34.48.2/32"     },
      site_c: { CidrBlock: "62.119.163.98/32" }
  end

  def mapping_hosted_zones
    mapping "HostedZones",
      master: { id: "Z27QZ7K601YRVI", zone: "example.com" },
      prd:    { id: "Z27QZ7K601YRVI", zone: "prd.example.com" },
      uat:    { id: "Z3I8D0KED8WT6Y", zone: "uat.example.com" },
      dev:    { id: "ZMQOGN25R7IPD",  zone: "dev.example.com" },
      sit:    { id: "Z267B6OA756YMV", zone: "sit.example.com" }
  end

  def mapping_instance_tenancy
    mapping "InstanceTenancy",
      dev: { value: "default"   },
      sit: { value: "default"   },
      uat: { value: "dedicated" },
      prd: { value: "dedicated" }
  end

  def mapping_application_instance_amis
    mapping "ApplicationInstanceAmis",
      "ap-southeast-2" => { ImageId: "ami-1f117325", Name: "Ubuntu 14.04.1 LTS (Trusty Tahr) [20140927]" },
      "eu-west-1"      => { ImageId: "ami-f6b11181", Name: "Ubuntu 14.04.1 LTS (Trusty Tahr) [20140927]" },
      "us-east-1"      => { ImageId: "ami-98aa1cf0", Name: "Ubuntu 14.04.1 LTS (Trusty Tahr) [20140927]" }
  end

  def mapping_vpc_availability_zones
    mapping "VpcAvailabilityZones",
      "us-east-1" => {
        zone: ["us-east-1b", "us-east-1c", "us-east-1d"],
        name: "n-virginia"
      },
      "eu-west-1" => {
        zone: ["eu-west-1c", "eu-west-1b"],
        name: "ireland"
      },
      "ap-southeast-2" => {
        zone: ["ap-southeast-2a", "ap-southeast-2b"],
        name: "sydney"
      }
  end

end
