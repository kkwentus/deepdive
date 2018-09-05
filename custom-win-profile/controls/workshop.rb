# encoding: utf-8
# copyright: 2015, The Authors

title 'workshop example profile by Karen'

##label of the control
control 'example1' do     
  ##Impact 0.0 - 1.0                  
  impact 0.5     

  title 'Set Account lockout threshold to 10 or fewer invalid logon attempts but not 0'            
  desc 'Account lockout threshold test'

  ##the inSpec test
  describe security_policy do
    its('LockoutBadCount') { should be <= 10 }
    its('LockoutBadCount') { should be > 0 }
  end        

end


##label of the control
control 'example2' do     
  ##Impact 0.0 - 1.0                  
  impact 0.5     

  title 'Force Encrypted Windows Network Passwords'            
  desc 'Test to disallow plain text passwords'

  ##the inSpec test
  describe registry_key('HKLM\System\CurrentControlSet\Services\LanmanWorkstation\Parameters') do
    it { should exist }
    its('EnablePlainTextPassword') { should eq 0 }
  end
end

