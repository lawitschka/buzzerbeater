require 'active_support/concern'

module ApiExampleGroup
  extend ActiveSupport::Concern

  RSpec.configure do |config|
    config.include self,
      :type => :api,
      :example_group => { :file_path => %r(spec/lib/api) }
  end

  def buzzerbeater_session_id
    'fxtxzr55zfugfr45fa5wnx55'
  end

  def buzzerbeater_auth_token
    '5A72C708E8F03359EC400F7D4CC903EF5FB7601E6EB0DEE4A3D7307B6FAD6E17985FF29BC402E341E1A6317B62B91643EDFC7B989FD4EEE2734282785470AF1DABB51C67EA89C57980982D4B459A9283DEDE2F611EFA0D186AEA0E1DA15726CF13A9047BC05734CB0D6766CDD75811C8E1DCC694'
  end
end