#
# Cookbook Name:: brocadevtm
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

if node['brocadevtm']['rest_user'].nil? or node['brocadevtm']['rest_pass'].nil?
	raise 'Please set [brocadevtm][rest_user] and [brocadevtm][rest_pass] attributes!'
end

if node['brocadevtm']['rest_ip'].nil? or node['brocadevtm']['rest_port']
	raise 'Please set [brocadevtm][rest_ip] and [brocadevtm][rest_port] attributes!'
end

brocadevtm 'default' do
	action :setup
end


