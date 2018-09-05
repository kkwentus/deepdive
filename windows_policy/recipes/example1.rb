security_policy 'Lockout Policy' do
    policy_template 'C:\Windows\security\templates\chefNewPolicy.inf'
    database 'C:\Windows\security\database\chef.sdb'
    action :configure
end