# InSpec test for recipe mongo::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
# describe port(27017) do
#   it { should be_listening }
# end
# describe ip(0.0.0.0) do
#   it { should be_listening }
# end
describe package 'mongodb-org' do
  it{ should be_installed }
  its('version') { should match /3\./ }
end

describe service 'mongod' do
  it{ should be_running }
  it{ should be_enabled }
end

describe port(27017) do
  it{ should be_listening }
  its('processes') { should cmp 'mongod' }
  its('addresses') { should include '0.0.0.0'}
end
