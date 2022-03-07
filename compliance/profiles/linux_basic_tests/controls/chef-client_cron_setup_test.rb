# InSpec test for recipe node_setup::timezone_setup.rb

# The InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

control 'chef-client cron' do
  title 'chef-client cron 設定確認テスト'
  describe crontab(path: '/etc/cron.d/chef-client') do
    its('entries.length') { should cmp 1 }
    its('hours') { should cmp '*' }
    its('minutes') { should cmp '0,15' }
    its('days') { should cmp '*' }
    its('months') { should cmp '*' }
  end
end
