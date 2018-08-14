require 'all_require'

def antivirus_functionality(browser)
    password= ConstantVariables::PASSWORD
    describe "Starts AV Testing" do
        context "User Admin" do
            it "Should sign in as admin and Enable AV" do
                username='admin'
                pass='admin'
                admin=SignIn::UserSignIn.new
                admin.user_signin(@server,@driver,username,pass)

                ob=Antivirus::AntivirusSettings.new
                ob.antivirus_enable(@server,@driver)
            end

            it "Should Sign in as Sender" do
                ob=SignIn::UserSignIn.new
                ob.user_signin(@server,@driver,'tanim1@nilavodev.com', password)
            end

            it "Should Send Delivery With Applet" do
                ob=UserPreference::SetPreferences.new
                ob.applet_set_no(@server, @driver)

                recipient='tanim2@nilavodev.com'
                subject='Anti_virus_with_applet'
                ob=ExpressDelivery::CreateExpressDelivery.new
                ob.send_express_delivery_applet_ckeditor(@server,@driver,recipient, subject)
            end

            it "Should Send Delivery With CkEditor and Sign out" do
                recipient='tanim2@nilavodev.com'
                subject='Anti_virus_with_Html5'
                filename='C:\Users\Sakib\RubymineProjects\General_SFT_5.0\Files\test.txt'
                ob=ExpressDelivery::CreateExpressDelivery.new
                ob.send_express_delivery_html5(@server,@driver,recipient,subject,filename,browser)

                sleep 2
                ob=SignOut::UserSignOut.new
                ob.sign_out(@server,@driver)
            end

            it "Should SignIn as Recipient and view the HTML Delivery and send Secure reply " do

                password= ConstantVariables::PASSWORD
                username='tanim2@nilavodev.com'
                ob=SignIn::UserSignIn.new
                ob.user_signin(@server,@driver,username, password)

                ob=UserPreference::SetPreferences.new
                ob.applet_set_no(@server,@driver)

                subject='Anti_virus_with_Html5'
                filename='test.txt'
                ob=Received::ReceivedDeliveries.new
                ob.received_delivery(@server,@driver,subject,filename)

                ob=Home::GoToHome.new
                ob.home_page(@server, @driver)

                filename='C:\Users\Sakib\RubymineProjects\General_SFT_5.0\Files\test.txt'
                delivery_name='Anti_virus_with_Html5'
                ob=SecureReply::DeliverySecureReply.new
                ob.secure_reply_from_inbox_ckeditor_without_applet(@server, @driver, delivery_name, browser, filename)
            end

            it "Should View the Applet Delinvery and send Secure Reply " do
                ob=UserPreference::SetPreferences.new
                ob.applet_settings(@server, @driver)

                subject='Anti_virus_with_applet'
                ob=Received::ReceivedDeliveries.new
                ob.received_delivery_download_applet(@server,@driver,subject)

                ob=Home::GoToHome.new
                ob.home_page(@server, @driver)

                delivery_name='Anti_virus_with_applet'
                ob=SecureReply::DeliverySecureReply.new
                ob.secure_reply_from_inbox_ckeditor_with_applet(@server,@driver, delivery_name)
                sleep 2
                ob=SignOut::UserSignOut.new
                ob.sign_out(@server,@driver)
            end

            it "Should Disable Antivirus" do
                username='admin'
                pass='admin'
                admin=SignIn::UserSignIn.new
                admin.user_signin(@server,@driver,username,pass)

                ob=Antivirus::AntivirusSettings.new
                ob.antivirus_disable(@server, @driver)

                ob=SignOut::UserSignOut.new
                ob.sign_out(@server,@driver)
            end

        end
    end

  end





