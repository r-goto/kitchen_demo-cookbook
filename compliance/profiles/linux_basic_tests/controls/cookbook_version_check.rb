# InSpec test for recipe node_setup::timezone_setup.rb

# The InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

# $cookboko_version = '1.0.0'

cookbook_version = '1.0.0'
chef_node = input('chef_node', description: 'Chef Node')

title '適用されたCookbookバージョンの確認'

if chef_node['cookbooks']['kitchen_demo_cookbook']['version'] != cookbook_version
  raise Exception, "Cookbook バージョンが正常ではありません。Converged Version: #{chef_node['cookbooks']['kitchen_demo_cookbook']['version']}"
else
  puts "\n##############################################\nConverged Cookbook バージョン: v#{chef_node['cookbooks']['kitchen_demo_cookbook']['version']}\n##############################################"
end
