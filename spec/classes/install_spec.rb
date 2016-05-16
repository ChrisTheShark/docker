require 'spec_helper'

describe 'docker::install' do
  context 'with default params' do
    it { is_expected.to contain_package('docker-engine')
      .with_ensure('latest')
      .with_require('File[docker.repo]')
    }
  end
  context 'with updated version' do
    let :params do {
      :version => '1.9.1'      
    }
    end
    it { is_expected.to contain_package('docker-engine')
      .with_ensure('1.9.1')
      .with_require('File[docker.repo]')
    }
  end
end
