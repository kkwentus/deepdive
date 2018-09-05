# encoding: utf-8
# copyright: 2015, The Authors

title 'workshop example profile by Karen'

##label of the control
control 'example1' do
  ##Impact 0.0 - 1.0                  
  impact 0.5
  title 'Set Account lockout threshold to 10 or fewer invalid logon attempts but not 0'
  
  ##the inSpec test
  describe security_policy do
    its('LockoutBadCount') { should be <= 10 }
    its('LockoutBadCount') { should be > 0 }
  end
end

control 'example2' do     
  impact 0.5
  title 'Force Encrypted Windows Network Passwords'
  desc 'Test to disallow plain text passwords'

  describe registry_key('HKLM\System\CurrentControlSet\Services\LanmanWorkstation\Parameters') do
    it { should exist }
    its('EnablePlainTextPassword') { should eq 0 }
  end
end

control 'example3' do
  impact 1.0
  title 'Enforce Windows Firewall'
  desc 'Firewall Settings'

  describe registry_key("HKEY_LOCAL_MACHINE\\Software\\Policies\\Microsoft\\WindowsFirewall\\PrivateProfile") do
    it { should have_property "EnableFirewall" }
    its("EnableFirewall") { should cmp == 1 }
  end
end

control 'example4' do
  impact 0.7
  title 'Windows Password Complexity is Enabled'
  desc 'Password Settings'
  describe security_policy do
    its('PasswordComplexity') { should eq 1 }
  end
end