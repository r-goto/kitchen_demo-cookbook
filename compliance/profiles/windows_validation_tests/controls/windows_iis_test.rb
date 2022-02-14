# InSpec test for recipe node_setup::timezone_setup.rb

# The InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

control 'IIS Setup' do
  title 'Windows Recipe Validation Test'

  describe port(80) do
    it { should be_listening }
  end

  describe service('W3SVC') do
    it { should be_installed }
    it { should be_running }
  end

  describe iis_site('Default Web Site') do
    it { should exist }
    it { should be_running }
    it { should have_app_pool('DefaultAppPool') }
    it { should have_binding('http *:80:') }
    it { should have_path('%SystemDrive%\\inetpub\\wwwroot') }
  end
end
