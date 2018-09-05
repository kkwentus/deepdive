registry_key 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile' do
    values [{
      name: 'EnableFirewall',
      type: :dword,
      data: 1
    }]
    action :create
    recursive true
  end