require 'spec_helper'

describe 'docker::config' do
  context 'with default params on a RedHat system' do
    let :facts do 
    { 
      :osfamily => 'RedHat' 
    }
    end
    let :params do
    {
      :dockerrepo => 'docker.repo'
    }
    end
    it { is_expected.to contain_file('docker.repo')
      .with_ensure('file')
      .with_path('/etc/yum.repos.d/docker.repo')
      .with_source('puppet:///modules/docker/docker.repo')
    }
  end

  context 'with default params on a Debian 12.04 system' do
    let :facts do
    {
      :osfamily               => 'Debian',
      :operatingsystem        => 'Ubuntu',
      :operatingsystemrelease => '12.04'
    }
    end
    let :params do
    {
      :dockerrepo => 'docker.repo'
    }
    end
    it { is_expected.to contain_file('docker.repo')
      .with_ensure('file')
      .with_path('/etc/apt/sources.list.d/docker.list')
      .with_source('puppet:///modules/docker/docker.12.04.list')
    }
  end

  context 'with default params on a Debian 14.04 system' do
    let :facts do
    {
      :osfamily               => 'Debian',
      :operatingsystem        => 'Ubuntu',
      :operatingsystemrelease => '14.04'
    }
    end
    let :params do
    {
      :dockerrepo => 'docker.repo'
    }
    end
    it { is_expected.to contain_file('docker.repo')
      .with_ensure('file')
      .with_path('/etc/apt/sources.list.d/docker.list')
      .with_source('puppet:///modules/docker/docker.14.04.list')
    }
  end

  context 'with default params on a Debian 15.10 system' do
    let :facts do
    {
      :osfamily               => 'Debian',
      :operatingsystem        => 'Ubuntu',
      :operatingsystemrelease => '15.10'
    }
    end
    let :params do
    {
      :dockerrepo => 'docker.repo'
    }
    end
    it { is_expected.to contain_file('docker.repo')
      .with_ensure('file')
      .with_path('/etc/apt/sources.list.d/docker.list')
      .with_source('puppet:///modules/docker/docker.15.10.list')
    }
  end
end
