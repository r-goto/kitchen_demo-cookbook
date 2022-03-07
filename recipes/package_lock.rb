#
# Cookbook:: ngxin_version_lock_cookbook
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

package 'yum-plugin-versionlock'

yum_package 'firefox' do
  action :unlock
end

yum_package 'firefox' do
  action [ :install, :lock ]
  # version '78.5.0'
  version '68.10.0'
end
