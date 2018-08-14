require 'all_require'

def limited_sender_functionality(browser)

    describe "Functionality of limited sender" do
        context "User admin" do
            it "Should sign in as admin" do
                user_name='admin'
                password='admin'
                admin=SignIn::UserSignIn.new
                admin.user_signin(@server,@driver,user_name,password)
            end

            it "Should enable limited sender" do
                ob=LimitedSender::LimitedSenderConfiguration.new
                ob.enable_limited_sender(@server,@driver)
            end

            it "Should Create user with limited sender-recipient-recipient role" do
                password= ConstantVariables::PASSWORD
                ob=UserCreation::CreateUser.new
                username='tanim2@nilavodev.com'
                ob.create_limited_sender(@server, @driver,username, password)
                username='tanim3@nilavodev.com'
                ob.create_user_recipient(@server, @driver,username, password)
                username='tanim4@nilavodev.com'
                ob.create_user_recipient(@server, @driver,username, password)
            end


            it "Should Create user with Compliance role" do
                username='tanim5@nilavodev.com'
                password= ConstantVariables::PASSWORD
                ob=UserCreation::CreateUser.new
                ob.create_user_compliance(@server,@driver,username,password)
            end
            it "Should edit user role" do
                role=2
                user='tanim2@nilavodev.com'
                ob=EditUser::UserEdit.new
                ob.user_role_edit(@server, @driver, user,role )
            end

            it "Should sign out user" do
                ob=SignOut::UserSignOut.new
                ob.sign_out(@server,@driver)

            end


            it "Should sign in as limited sender" do
                username='tanim2@nilavodev.com'
                password= ConstantVariables::PASSWORD
                ob=SignIn::UserSignIn.new
                ob.user_signin(@server,@driver,username,password)
            end

            it "Should create a limited delivery" do
                recipient='tanim3@nilavodev.com'
                subject='Limited_sign_in'
                filename='C:\Users\Sakib\RubymineProjects\General_SFT_5.0\Files\test.txt'
                ob=ExpressDelivery::CreateExpressDelivery.new
                ob.send_limited_express_delivery_ckeditor(@server,@driver, recipient, subject,filename, browser)
            end


            it "Should go to home page and sign out" do
                ob=Home::GoToHome.new
                ob.home_page(@server, @driver)

                ob=SignOut::UserSignOut.new
                ob.sign_out(@server,@driver)
            end

            it "Should Sign in as recipient" do
                username='tanim3@nilavodev.com'
                password= ConstantVariables::PASSWORD
                ob=SignIn::UserSignIn.new
                ob.user_signin(@server,@driver,username, password)
            end


            it "Should view the delivery and sign out" do
                delivery_name='Limited_sign_in'
                file_name='test.txt'

                ob=LimitedSender::LimitedSenderConfiguration.new
                ob.received_delivery(@server,@driver,delivery_name,file_name)

                ob=SignOut::UserSignOut.new
                ob.sign_out(@server,@driver)
            end

            it "Should Sign in as admin Uncheck Sequire Signin and Sign out" do
                ob=SignIn::UserSignIn.new
                ob.user_signin(@server,@driver, 'admin', 'admin')

                ob=LimitedSender::LimitedSenderConfiguration.new
                ob.require_sender_to_sign_in_uncheck(@server,@driver)

                ob=SignOut::UserSignOut.new
                ob.sign_out(@server,@driver)
            end

            it "Should go to Send.Do page and send a Limited No-Signin Delivery" do
                ob=LimitedSender::LimitedSenderConfiguration.new
                ob.go_send_do_page(@server, @driver)

                sender='tanim2@nilavodev.com'
                recipient='tanim3@nilavodev.com'
                subject='Limited_no_sign_in'
                filename='C:\Users\Sakib\RubymineProjects\General_SFT_5.0\Files\test.txt'
                #browser='chrome'
                ob=LimitedSender::LimitedSenderConfiguration.new
                ob.ckeditor_send_limited_delivery_send_do(@server,@driver,sender,recipient,subject,filename, browser)
            end


            it "Should view the Sent Items and sign out" do
                username='tanim2@nilavodev.com'
                password= ConstantVariables::PASSWORD
                ob=SignIn::UserSignIn.new
                ob.user_signin(@server,@driver, username, password)

                subject='Limited_no_sign_in'

                ob=LimitedSender::LimitedSenderConfiguration.new
                ob.view_delivery(@server,@driver,subject)

                ob=SignOut::UserSignOut.new
                ob.sign_out(@server,@driver)
            end

            it "Should sign in as recipient View the Received delivery and sign out" do
                username='tanim3@nilavodev.com'
                password= ConstantVariables::PASSWORD

                ob=SignIn::UserSignIn.new
                ob.user_signin(@server,@driver, username,password)


                delivery_name='Limited_no_sign_in'
                file_name='test.txt'

                ob=LimitedSender::LimitedSenderConfiguration.new
                ob.received_delivery(@server,@driver,delivery_name,file_name)

                ob=SignOut::UserSignOut.new
                ob.sign_out(@server,@driver)

            end

            it "Should sign in as Admin; Check Require to Signin and sign out" do
                ob=SignIn::UserSignIn.new
                ob.user_signin(@server,@driver, 'admin', 'admin')

                ob=LimitedSender::LimitedSenderConfiguration.new
                ob.require_sender_to_sign_in_check(@server,@driver)

                ob=SignOut::UserSignOut.new
                ob.sign_out(@server,@driver)
            end

            it "Should goto Send.Do page and Redirect to Home page" do
                ob=LimitedSender::LimitedSenderConfiguration.new
                ob.go_send_do_page(@server, @driver)

                ob=Home::GoToHome.new
                ob.home_page(@server, @driver)
            end

        end
    end

end

