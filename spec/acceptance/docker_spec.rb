require 'spec_helper_acceptance'

describe 'docker class' do
  context 'default parameters' do
    # Using puppet_apply as a helper
    it 'should work with no errors based on the example' do
      pp = <<-EOS
        include docker
      EOS

      # Run it twice and test for idempotency
      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    describe command('docker -v') do
      its(:exit_status) { is_expected.to eq 0 }
      its(:stdout) { is_expected.to include "Docker version" }   
    end

    describe command('docker ps') do
      its(:exit_status) { is_expected.to eq 0 }
    end
  end  
 
  context 'with updated version' do
    # Using puppet_apply as a helper
    it 'should work with no errors based on the example' do
      pp = <<-EOS
        class { 'docker':
          version => '1.9.1-1.el7.centos',
        }
      EOS
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    describe command('docker -v') do
      its(:exit_status) { is_expected.to eq 0 }
      its(:stdout) { is_expected.to include "Docker version 1.9.1" }
    end

    describe command('docker ps') do
      its(:exit_status) { is_expected.to eq 0 }
    end
  end
 
  context 'with updated version and docker user' do
    # Using puppet_apply as a helper
    it 'should work with no errors based on the example' do
      pp = <<-EOS
        class { 'docker':
          version => '1.9.1-1.el7.centos',
        }
        docker::docker_user { 'test_user': } 
      EOS
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    describe command('docker -v') do
      its(:exit_status) { is_expected.to eq 0 }
      its(:stdout) { is_expected.to include 'Docker version 1.9.1' }
    end

    describe command('docker ps') do
      its(:exit_status) { is_expected.to eq 0 }
    end

    describe command('id test_user | grep docker') do
      its(:exit_status) { is_expected.to eq 0 }
      its(:stdout) { is_expected.to include 'docker' }
    end
  end
end
