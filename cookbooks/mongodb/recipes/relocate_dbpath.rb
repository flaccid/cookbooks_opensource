# Cookbook Name:: mongodb
# Recipe:: relocate_dbpath
#
# Copyright 2010, RightScale Inc.
#
# Author: Chris Fordham <chris.fordham@rightscale.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

log "Relocate MongoDB dbpath."

link "/var/lib/mongodb" do
  to node.mongodb.dbpath
  notifies :restart, "service[mongodb]", :delayed
  action :nothing
end

directory "/var/lib/mongodb"

#mv = execute "move dir" do
#  command "mv -v /var/lib/mongodb #{node.mongodb.dbpath}"
#  notifies :create, "link[/var/lib/mongodb]", :immediately
#  action :nothing
#end

ruby_block do
  block do
    if File.directory?('/var/lib/mongodb')
      log "/var/lib/mongodb is a directory."
      mv.run_action(:run)
    end
  end
end

