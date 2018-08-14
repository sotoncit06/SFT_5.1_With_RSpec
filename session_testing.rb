require 'all_require'

def session(browser)
  password= ConstantVariables::PASSWORD
describe "Session Testing Starts" do
  context "User admin" do
    it "Should Signin admin User" do
      username='admin'
      pass='admin'
      ob=SignIn::UserSignIn.new
      ob.user_signin(@server, @driver,username, pass)
    end

    it "Should Disable User Quota" do
      ob=UserQuotaConfiguration::Quota.new
      ob.disable_quota(@server,@driver)
    end

    it "Should Create User with Sender role" do
      ob=UserCreation::CreateUser.new
      ob.create_user_sender(@server, @driver, 'tanim1@nilavodev.com', password)
    end

    it "Should Set session time-out to 1 and sigm out" do
      timeout='1'
      ob=Session::SessionConfiguration.new
      ob.session_configuration(@server, @driver, timeout)

      ob=SignOut::UserSignOut.new
      ob.sign_out(@server, @driver)
    end
    it "Should Signin Create a Delivery having attachment of 1GB " do
      ob=SignIn::UserSignIn.new
      ob.user_signin(@server, @driver,'tanim1@nilavodev.com', password)

      ob=UserPreference::SetPreferences.new
      ob.applet_set_no(@server, @driver)

      subject='Session_testing'
      filename='C:\Users\Sakib\RubymineProjects\General_SFT_5.0\Files\1gb.txt'
      #browser='firefox'
      recipient='tanim2@nilavodev.com'
      ob=Session::SessionConfiguration.new
      ob.ckeditor_session_send_express_delivery_html5(@server,@driver,recipient,subject,filename,browser)

      ob=SignOut::UserSignOut.new
      ob.sign_out(@server, @driver)
    end
    it "Should Signin as Admin will configure Default and Sign out" do
      ob=SignIn::UserSignIn.new
      ob.user_signin(@server, @driver,'admin', 'admin')

      timeout='20'
      ob=Session::SessionConfiguration.new
      ob.session_configuration(@server, @driver, timeout)

      ob=SignOut::UserSignOut.new
      ob.sign_out(@server, @driver)
    end
  end

end
end