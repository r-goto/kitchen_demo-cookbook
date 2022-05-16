#
# Cookbook:: ngxin_version_lock_cookbook
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

# デモシナリオ：手動yum updateのバージョンアップは不可で、
# レシピのみでバージョンアップを行うレシピを用意する。

execute 'yum update -y --skip-broken'
package 'yum-plugin-versionlock'

# インストールしていないパッケージに :unlock アクション
yum_package 'samba' do
  action :unlock
end

# 手動の`yum update`ではバージョン固定され、レシピでバージョンを上げる。(version peculiar to amazonlinux2)
yum_package 'samba' do
  # action [ :install ]
  action [ :install, :lock ]
  version '4.6.2'
  # version '4.10.16'
end
