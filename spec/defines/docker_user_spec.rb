require 'spec_helper'

describe 'docker::docker_user', :type => :define do
  let (:title) { 'bamboo' }
  context 'with default parameters' do
    it { should contain_user('bamboo') }
    it { should contain_exec('add_group')
      .with_command('usermod -aG docker bamboo')
      .with_unless('/bin/cat /etc/group | grep \'^docker:\' | grep -qw bamboo')
      .with_require('Service[docker]')
      .with_path('/usr/sbin:/usr/bin') 
    }
  end
end
