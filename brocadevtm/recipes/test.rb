#
# Cookbook Name:: simplevTM
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

vtmrest_pools 'pool1' do
	action = :create
	nodes_table = []
	monitors = ["Ping"]
end

