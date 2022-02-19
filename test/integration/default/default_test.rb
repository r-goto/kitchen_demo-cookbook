# Chef InSpec test for recipe kitchen_demo_cookbook::default

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

if os.windows?
  describe windows_task('chef-client') do
    it { should be_enabled }
  end
  describe windows_firewall_rule('Block RDP') do
    it { should be_enabled }
    it { should_not be_allowed }
    it { should be_tcp }
    its('remote_port') { should eq 'Any' }
    its('local_port') { should eq '3389' }
  end
end

if os.linux?
  describe user('root') do
    it { should exist }
  end
  describe port(3389) do
    it { should_not be_listening }
  end
end
