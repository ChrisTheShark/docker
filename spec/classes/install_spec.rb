require 'spec_helper'

describe 'docker::install' do
  context 'with default params' do
    it { is_expected.to contain_package('docker-engine')
      .with_ensure('latest')
      .with_require('File[docker.repo]')
    }
  end
end
