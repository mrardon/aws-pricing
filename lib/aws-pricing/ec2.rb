module AWSPricing
  class EC2
    #Elastic Compute pricing data

    EC2_BASE_URL          = '/ec2/pricing/pricing-'
    EC2_BASE_RESERVED_URL = '/ec2/pricing/'


    #Returns Hash of on-demand server instance pricing information
    def self.instances
      Base.get(EC2_BASE_URL + 'on-demand-instances')
    end

    #Returns Hash of reserved linux light utilization instance pricing information
    def self.reserved_linux_light_instances
      Base.get(EC2_BASE_RESERVED_URL + '/ri-light-linux')
    end
    #Returns Hash of reserved linux medium utilization instance pricing information
    def self.reserved_linux_medium_instances
      Base.get(EC2_BASE_RESERVED_URL + '/ri-medium-linux')
    end
    #Returns Hash of reserved linux heavy utilization instance pricing information
    def self.reserved_linux_heavy_instances
      Base.get(EC2_BASE_RESERVED_URL + '/ri-heavy-linux')
    end

    #Returns Hash of reserved mswin light utilization instance pricing information
    def self.reserved_mswin_light_instances
      Base.get(EC2_BASE_RESERVED_URL + '/ri-light-mswin')
    end
    #Returns Hash of reserved mswin medium utilization instance pricing information
    def self.reserved_mswin_medium_instances
      Base.get(EC2_BASE_RESERVED_URL + '/ri-medium-mswin')
    end
    #Returns Hash of reserved mswin heavy utilization instance pricing information
    def self.reserved_mswin_heavy_instances
      Base.get(EC2_BASE_RESERVED_URL + '/ri-heavy-mswin')
    end

    #Returns Hash of current spot instance pricing information (5m)
    def self.spot_instances
      callback_response = Net::HTTP.get_response(URI.parse 'http://spot-price.s3.amazonaws.com/spot.js').body
      callback_response.gsub!('callback(','')
      callback_response.slice!(callback_response.length-1)
      JSON.parse callback_response
    end

    #Returns Hash of elastic block storage pricing information
    def self.ebs
      Base.get(EC2_BASE_URL + 'ebs')
    end

    #Returns Hash of data transfer pricing information
    def self.data_transfer
      Base.get(EC2_BASE_URL + 'data-transfer')
    end

    #Returns Hash of elastic IP pricing information
    def self.elastic_ips
      Base.get(EC2_BASE_URL + 'elastic-ips')
    end

    #Returns Hash of Cloudwatch monitoring pricing information
    def self.cloud_watch
      Base.get(EC2_BASE_URL + 'cloudwatch')
    end

    #Returns Hash of elastic loadbalancer pricing information
    def self.elb
      Base.get(EC2_BASE_URL + 'elb')
    end

  end
end
