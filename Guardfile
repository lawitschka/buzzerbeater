guard 'rspec' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})       { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')    { "spec" }

  # Clear terminal before running the tests
  callback(:run_on_changes_begin) { system 'clear' }
end