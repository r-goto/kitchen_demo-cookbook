# InSpec test for recipe node_setup::timezone_setup.rb

# The InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

control 'samba package lock' do
  title 'パッケージのバージョンがロックされているかテスト'

  describe package('samba') do
    it { should be_installed }
    its('version') { should include '4.6.2' }
  end

  describe bash('yum versionlock list | grep samba') do
    its('stdout') { should include 'samba' }
  end
end
