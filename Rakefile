require 'rake/docker_lib'
require 'rake/copy_if_obsolete'

Rake::DockerLib.new("registry.deliverous.net/deliverous/registry-proxy") do
    copy_if_obsolete "#{ENV['GOPATH']}/bin/dockerize", 'dockerize'
    sh 'strip', 'dockerize'
end
