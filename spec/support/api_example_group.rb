require 'active_support/concern'

module ApiExampleGroup
  extend ActiveSupport::Concern

  RSpec.configure do |config|
    config.include self,
      :type => :api,
      :example_group => { :file_path => %r(spec/lib/api) }
  end

  def buzzerbeater_session_id
    'gsuwpzrr5a5aor45msxudtrl'
  end

  def buzzerbeater_auth_token
    '66D2973FC89C55F9F607ACA71F573687441D71178BD32D08DAD521350E235A9EFB70B49C7FBE6DA03409DA95B2BD1C6BB566C12A7C940016A7E545009E8E0D2E70A16033DC535E1A2B038341D705AF076F59D6EF060C87254EE13EB23FF800048FC3B4F4F1D17A02277F036AD230FEE6A8E07BFA'
  end
end