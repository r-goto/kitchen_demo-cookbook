#
# Cookbook:: kitchen_demo_cookbook
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

if platform?('windows')
  chef_client_scheduled_task 'Run chef-client named run-list daily' do
    frequency '1'
  end
  reboot 'app_requires_reboot' do
    action :request_reboot
    reason 'Need to reboot when the run completes successfully.'
    delay_mins 0
  end
else
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
end
