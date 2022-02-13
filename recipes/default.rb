#
# Cookbook:: kitchen_demo_cookbook
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

include_recipe 'kitchen_demo_cookbook::demo'
include_profile "kitchen_demo_cookbook::*"
include_input "kitchen_demo_cookbook::*"
# include_waiver "node_setup::*"
