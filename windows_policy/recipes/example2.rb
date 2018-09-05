registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging' do
    values [{
      name: 'EnableScriptBlockLogging',
      type: :dword,
      data: 0
    }]
    action :create
    recursive true
  end