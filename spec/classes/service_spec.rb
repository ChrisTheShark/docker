require 'spec_helper'

describe 'docker::service' do
  context 'with default params' do
    let :params do
    {
      :service => 'docker',
      :package => 'docker-engine'
    }
    end
    it { is_expected.to contain_service('docker')
      .with_ensure('running')
      .with_require('Package[docker-engine]')
    }
  end
end
