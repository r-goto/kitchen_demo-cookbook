#
# Cookbook:: kitchen_demo_cookbook
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

chef_client_scheduled_task 'Run chef-client named run-list daily' do
  task_name 'chef-client'
  frequency 'minute'
  frequency_modifier '1'
end
powershell_script 'Install IIS' do
  code <<-EOH
    Install-WindowsFeature -name Web-Server -IncludeManagementTools
    Add-WindowsFeature Web-Server
    EOH
  not_if '(Get-WindowsFeature -Name Web-Server).Installed'
end
windows_firewall_rule 'IIS' do
  local_port '80'
  protocol 'TCP'
  firewall_action :allow
end
windows_firewall_rule 'Block RDP' do
  local_port 3389
  remote_port 'Any'
  protocol 'TCP'
  firewall_action :block
end
reboot 'app_requires_reboot' do
  action :nothing # :request_reboot
  reason 'Need to reboot when the run completes successfully.'
  delay_mins 0
end
