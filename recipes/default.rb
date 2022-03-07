#
# Cookbook:: kitchen_demo_cookbook
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

if platform?('windows')
  include_recipe 'kitchen_demo_cookbook::windows_demo'
  include_profile 'kitchen_demo_cookbook::windows_basic_tests'
else
  ## Basic Demo
  include_recipe 'kitchen_demo_cookbook::linux_demo'
  include_profile 'kitchen_demo_cookbook::linux_basic_tests'

  ## package :lock use Rhel7
  # include_recipe 'kitchen_demo_cookbook::package_lock'
  # include_profile 'kitchen_demo_cookbook::linux_package_lock_tests'
end
