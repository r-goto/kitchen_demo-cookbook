# InSpec test for recipe node_setup::timezone_setup.rb

# The InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

cookboko_version = '1.0.0'

title "適用されたCookbookバージョンの確認"

chef_node = attribute('chef_node', description: 'Chef Node')

if chef_node['cookbooks']['kitchen_demo_cookbook']['version'] != cookboko_version
  raise Exception.new "Cookbook バージョンが正常ではありません。Converged Version: #{chef_node['cookbooks']['kitchen_demo_cookbook']['version']}"
else
  p "Cookbook Version: v#{chef_node['cookbooks']['kitchen_demo_cookbook']['version']} Converged Successfully"
end
