require 'spec_helper'

describe 'docker::docker_user', :type => :define do
  let (:title) { 'bamboo' }
  context 'with default parameters' do
    it { should contain_user('bamboo') 
      .with_ensure('present')
      .with_managehome('true')
      .with_before('Exec[add_group]')
    }
    it { should contain_exec('add_group')
      .with_command('usermod -aG docker bamboo')
      .with_require('Package[docker-engine]')
      .with_path('/usr/sbin:/usr/bin') 
    }
  end
end
