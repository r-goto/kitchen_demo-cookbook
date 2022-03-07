# InSpec test for recipe node_setup::timezone_setup.rb

# The InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

control 'firefox package lock' do
  title 'package version ロック 設定確認テスト'
  describe bash('yum versionlock status | grep firefox') do
    its('stdout') { should include 'firefox' }
  end
end
