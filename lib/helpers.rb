class TemplateDSL

  def aws_region_name
    ref('AWS::Region')
  end

  def all_internet
    "0.0.0.0/0"
  end

end
