#
# Cookbook:: kitchen_demo_cookbook
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

if platform?('windows')
  include_recipe 'kitchen_demo_cookbook::windows_demo'
  include_profile 'kitchen_demo_cookbook::windows_validation_tests'
else
  include_recipe 'kitchen_demo_cookbook::linux_demo'
  include_profile 'kitchen_demo_cookbook::linux_validation_tests'
end
# include_input 'kitchen_demo_cookbook::*'
# include_waiver "node_setup::*"
