#
# Cookbook:: kitchen_demo_cookbook
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

if !platform?('ubuntu')
  %w(samba chrony openssh).each do |pkg|
    package pkg
  end
else
  %w(samba chrony openssh-server).each do |pkg|
    package pkg
  end
end

if !platform?('ubuntu')
  %w(smb nmb chronyd).each do |svc|
    service svc do
      action [ :start, :enable ]
    end
  end
else
  %w(smbd nmbd chronyd).each do |svc|
    service svc do
      action [ :start, :enable ]
    end
  end
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
