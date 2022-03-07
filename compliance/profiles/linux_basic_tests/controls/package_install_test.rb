# InSpec test for recipe node_setup::timezone_setup.rb

# The InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

chef_node = input('chef_node', description: 'Chef Node')

control 'Pakage Setup' do
  title 'パッケージセットアップ確認テスト'
  if chef_node['platform'] == 'ubuntu'
    %w(samba chrony openssh-server).each do |pkg|
      describe package(pkg) do
        it { should be_installed }
      end
    end
    %w(smbd nmbd chronyd).each do |svc|
      describe service(svc) do
        it { should be_running }
        it { should be_enabled }
      end
    end
  else
    %w(samba chrony openssh).each do |pkg|
      describe package(pkg) do
        it { should be_installed }
      end
    end
    %w(smb nmb chronyd).each do |svc|
      describe service(svc) do
        it { should be_running }
        it { should be_enabled }
      end
    end
  end
end
