require 'spec_helper'

describe 'docker' do
  context 'with default params on a RedHat system' do
    let :facts do 
    { 
      :osfamily => 'RedHat' 
    }
    end
    it { should compile }
    it { is_expected.to contain_class('docker::config') 
      .with_dockerrepo('docker.repo')
    }
    it { is_expected.to contain_class('docker::repository')
      .with_package('docker-engine')
    }
    it { is_expected.to contain_class('docker::install')
      .with_package('docker-engine')
      .with_dockerrepo('docker.repo')
    }
    it { is_expected.to contain_class('docker::service')
      .with_service('docker')
      .with_package('docker-engine')
    }
  end

  context 'with provided version on a RedHat system' do
    let :facts do
    {
      :osfamily => 'RedHat'
    }
    end
    let :params do
    {
      :version => '1.9.1'
    }
    end
    it { should compile }
    it { is_expected.to contain_class('docker::config')
      .with_dockerrepo('docker.repo')
    }
    it { is_expected.to contain_class('docker::repository')
      .with_package('docker-engine')
    }
    it { is_expected.to contain_class('docker::install')
      .with_version('1.9.1')
      .with_package('docker-engine')
      .with_dockerrepo('docker.repo')
    }
    it { is_expected.to contain_class('docker::service')
      .with_service('docker')
      .with_package('docker-engine')
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
    it { should compile }
    it { is_expected.to contain_class('docker::config')
      .with_dockerrepo('docker.repo')
    }
    it { is_expected.to contain_class('docker::repository')
      .with_package('docker-engine')
    }
    it { is_expected.to contain_class('docker::install')
      .with_package('docker-engine')
      .with_dockerrepo('docker.repo')
    }
    it { is_expected.to contain_class('docker::service')
      .with_service('docker')
      .with_package('docker-engine')
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
    it { should compile }
    it { is_expected.to contain_class('docker::config')
      .with_dockerrepo('docker.repo')
    }
    it { is_expected.to contain_class('docker::repository')
      .with_package('docker-engine')
    }
    it { is_expected.to	contain_class('docker::install')
      .with_package('docker-engine')
      .with_dockerrepo('docker.repo')
    }
    it { is_expected.to	contain_class('docker::service')
      .with_service('docker')
      .with_package('docker-engine')
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
    it { should compile }
    it { is_expected.to contain_class('docker::config')
      .with_dockerrepo('docker.repo')
    }
    it { is_expected.to contain_class('docker::repository')
      .with_package('docker-engine')
    }
    it { is_expected.to contain_class('docker::install')
      .with_package('docker-engine')
      .with_dockerrepo('docker.repo')
    }
    it { is_expected.to contain_class('docker::service')
      .with_service('docker')
      .with_package('docker-engine')
    }
  end
end
