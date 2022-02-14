#
# Cookbook:: kitchen_demo_cookbook
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

package 'chrony'
service 'chronyd' do
  action [ :start, :enable ]
end

case node['environment']
when 'production'
  timezone 'Asia/Tokyo'
when 'staging'
  timezone 'Europe/Dublin'
end

chef_client_cron 'Run Chef Infra Client as a cron job' do
  accept_chef_license true
  minute "#{node['chef_client_cron']['minute']}"
end
