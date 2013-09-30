require 'active_support/concern'

module ApiExampleGroup
  extend ActiveSupport::Concern

  RSpec.configure do |config|
    config.include self,
      :type => :api,
      :example_group => { :file_path => %r(spec/lib/api) }
  end

  def buzzerbeater_session_id
    '0ykhuz45wyjblx4505c4uy55'
  end

  def buzzerbeater_auth_token
    'C4771653C9BB57D20A10FEA3283167944A26F8571C0993A9B520BE93ADEE623EF62C43E9853F142E0FF02A28648002276F6A42AF91FA19CB9067AB140626C1F0180F500DE9D2CA1087200A56E54F1EE9B835AA0E863647A1D0B63F82A31E6AD50D637EE969FDDBBB81C87630329011A5FFEB1A99'
  end
end