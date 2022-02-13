# InSpec test for recipe node_setup::timezone_setup.rb

# The InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

title "タイムゾーン確認"

chef_node = attribute('chef_node', description: 'Chef Node')
environment = "#{chef_node['environment']}"

case environment
when 'production'
  describe bash('timedatectl status | grep Tokyo') do
    its('stdout') { should_not include 'Time zone: Asia/Tokyo' }
    its('stderr') { should eq '' }
    its('exit_status') { should eq 0 }
  end
when 'staging'
  describe bash('timedatectl status | grep Dublin') do
    its('stdout') { should include 'Time zone: Europe/Dublin' }
    its('stderr') { should eq '' }
    its('exit_status') { should eq 0 }
  end
end
