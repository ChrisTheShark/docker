require 'spec_helper'

describe 'docker::repository' do

  context 'with default params on a RedHat system' do
    let :facts do 
    { 
      :osfamily => 'RedHat' 
    }
    end
    let :params do
    {
      :package => 'docker-engine'
    }
    end
    it { is_expected.to contain_exec('yum_update')
      .with_command('yum update -y')
      .with_path('/usr/bin')
      .with_before('Package[docker-engine]')
      .with_unless('/usr/bin/test -f /usr/bin/docker')
    }
  end

  context 'with default params on a Ubuntu 12.04 system' do
    let :facts do
    {
      :osfamily               => 'Debian',
      :operatingsystem        => 'Ubuntu',
      :operatingsystemrelease => '12.04'
    }
    end
    let :params do
    {
      :package => 'docker-engine'
    }
    end
    it { is_expected.to contain_exec('addDockerKey')
      .with_command('apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D')
      .with_path('/bin/:/usr/bin/')
      .with_before('Package[docker-engine]')
      .with_unless('/usr/bin/test -f /usr/bin/docker')
    }
    it { is_expected.to contain_exec('apt_update')
      .with_command('apt-get update -y')
      .with_path('/usr/bin')
      .with_before('Package[docker-engine]')
      .with_require('Exec[addDockerKey]')
      .with_unless('/usr/bin/test -f /usr/bin/docker')
    }
  end

  context 'with default params on a Ubuntu 14.04 system' do
    let :facts do
    {
      :osfamily               => 'Debian',
      :operatingsystem        => 'Ubuntu',
      :operatingsystemrelease => '14.04'    
    }
    end
    let :params do
    {
      :package => 'docker-engine'
    }
    end
    it { is_expected.to contain_exec('addDockerKey')
      .with_command('apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D')
      .with_path('/bin/:/usr/bin/')
      .with_before('Package[docker-engine]')
      .with_unless('/usr/bin/test -f /usr/bin/docker')
    }
    it { is_expected.to contain_exec('apt_update')
      .with_command('apt-get update -y')
      .with_path('/usr/bin')
      .with_before('Package[docker-engine]')
      .with_require('Exec[addDockerKey]')
      .with_unless('/usr/bin/test -f /usr/bin/docker')
    }
  end

  context 'with default params on a Ubuntu 15.10 system' do
    let :facts do
    {
      :osfamily               => 'Debian',
      :operatingsystem        => 'Ubuntu',
      :operatingsystemrelease => '15.10'
    }
    end
    let :params do
    {
      :package => 'docker-engine'
    }
    end
    it { is_expected.to contain_exec('addDockerKey')
      .with_command('apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D')
      .with_path('/bin/:/usr/bin/')
      .with_before('Package[docker-engine]')
      .with_unless('/usr/bin/test -f /usr/bin/docker')
    }
    it { is_expected.to contain_exec('apt_update')
      .with_command('apt-get update -y')
      .with_path('/usr/bin')
      .with_before('Package[docker-engine]')
      .with_require('Exec[addDockerKey]')
      .with_unless('/usr/bin/test -f /usr/bin/docker')
    }
  end
end
