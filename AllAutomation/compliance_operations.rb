require 'all_require'

def compliance_operations(server, driver)

    #password= ConstantVariables::PASSWORD
=begin
    ob=SignIn::UserSignIn.new
    ob.user_signin(server,driver,'admin','admin')

    ob=Compliance::ComplianceSettings.new
    ob.enable_compliance(server, driver)

    username='tanim5@nilavodev.com'
    ob=UserCreation::CreateUser.new
    ob.create_user_compliance(server,driver,username,'1234')

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,driver)
=end
    ob=SignIn::UserSignIn.new
    ob.user_signin(server,driver, 'tanim5@nilavodev.com','1234' )

    ob=Compliance::ComplianceSettings.new
    ob.compliance_operations(server, driver)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,driver)

end
