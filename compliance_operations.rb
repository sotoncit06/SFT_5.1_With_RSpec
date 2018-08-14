require 'all_require'

def compliance_operations()

    password= ConstantVariables::PASSWORD

describe "Compliance Starts" do
    context " User tanim5 having Compliance role" do
        it "Should Logged in" do
            ob=SignIn::UserSignIn.new
            ob.user_signin(@server,@driver, 'tanim5@nilavodev.com',password )
        end

        it "Should Perform" do
            ob=Compliance::ComplianceSettings.new
            ob.compliance_operations(@server, @driver)
        end

        it "Should Logged out" do
            ob=SignOut::UserSignOut.new
            ob.sign_out(@server,@driver)
        end
    end

end
end
