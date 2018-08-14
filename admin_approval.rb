require 'all_require'


def admin_approval(server,driver,browser)

  password= ConstantVariables::PASSWORD
  small_file=ConstantVariables::SMALL_FILE
  large_file=ConstantVariables::LARGE_FILE
  password_email = ConstantVariables::PASSWORD_EMAIL

  describe 'Self registration for '+ConstantVariables::USER_NAME[1] do

    context 'user '+ConstantVariables::USER_NAME[1] do
      it 'should register' do
        email = ['sakib1@nilavodev.com']
        restricted_email = 'sakib1@nilavodev.com'
        tos_value = nil
        self_registration_without_reCaptcha(@server,@driver,email,password,tos_value,restricted_email,@browser)
      end

      it 'should Check the email of '+ ConstantVariables::USER_NAME[1] +' for the Biscom SFT account activation link' do

        sleep 5
        user_name="sakib1"
        expected_mail_subject = 'Biscom SFT account activation link'
        ob=Email::EmailAccess.new
        subject = ob.get_email_subject(@server, @driver, user_name, password_email)
        puts expected_mail_subject
        puts subject
        expect(delivery_name).to be == subject
        if expected_mail_subject == subject

          puts 'Got email'

        else puts 'No email'

        end

      end

    end
  end



  describe 'Approve a pending user request for '+ConstantVariables::USER_NAME[1]+' and Edit user role' do

    context 'user Admin'  do

      it 'should Sign in as admin user' do
        ob=SignIn::UserSignIn.new
        ob.admin(@server,@driver)
=begin
        expected_value = signInConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)
=end


      end

      it 'should Approve the request for pending user request for '+ConstantVariables::USER_NAME[1] do

        ob=EditUser::UserEdit.new
        ob.pending_user_approval(@server,@driver,ConstantVariables::USER_NAME[1])#sakib1
        #expected_value = pendingUserApprovedConfirmation(@server,@driver)
        #assert_value = Assertion.new
        #expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

      end

      it 'should Give the sender role to the approved user ' + ConstantVariables::USER_NAME[1] do

        role=1
        ob=EditUser::UserEdit.new
        ob.user_role_edit(@server,@driver,ConstantVariables::USER_NAME[1],role)
        expect(userRoleConfirmationBoolean(@server,@driver,"Sender")).to be == true

      end

      it 'should Check the email of '+ ConstantVariables::USER_NAME[1] +' for the registration approval email' do

        sleep 5
        user_name="sakib1"
        expected_email_subject_one = 'Biscom SFT registration request received'
        expected_email_subject_two = 'Welcome to Biscom SFT'
        ob=Email::EmailAccess.new
        subject = ob.get_email_subject(@server, @driver, user_name, password_email)
        puts expected_email_subject_one
        puts expected_email_subject_two
        puts subject
        expect(delivery_name).to be == subject
        if expected_email_subject_one == subject

          puts 'Got email'

        elsif expected_email_subject_two == subject

          puts 'Got email'

        else puts 'No email'

        end

      end

      it 'should Sign out form Admin user account' do

        ob=SignOut::UserSignOut.new
        ob.sign_out(@server,@driver)
        expected_value = signOutConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

      end

    end

  end

  describe 'Enable applet from account '+ConstantVariables::USER_NAME[1]do

    context 'user '+ConstantVariables::USER_NAME[1] do

      it 'should Sign in ' do

        ob=SignIn::UserSignIn.new
        ob.user_signin(@server,@driver,ConstantVariables::USER_NAME[1],password)#skaib1
        expected_value = signInConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

      end

      it 'should Enable applet' do

        ob=UserPreference::SetPreferences.new
        ob.applet_settings(@server,@driver)
        expect(appletEnableConfirmationBoolean(@server,@driver)).to be == true

      end

      it 'should Sign out from '+ConstantVariables::USER_NAME[1]+' account' do

        ob=SignOut::UserSignOut.new
        ob.sign_out(@server,@driver)
        expected_value = signOutConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

      end

    end

  end

  describe 'Create user '+ConstantVariables::USER_NAME[2]+ ' and Edit user role' do

    context 'user Admin'  do

      it 'should Sign in' do

        ob=SignIn::UserSignIn.new
        ob.admin(@server,@driver)
        expected_value = signInConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

      end

      it 'should Create user '+ConstantVariables::USER_NAME[2] do

        ob=UserCreation::CreateUser.new
        ob.create_user_sender(@server,@driver,ConstantVariables::USER_NAME[2],password)#sakib2
        expect(userCreatedConfirmationBoolean(@server,@driver,ConstantVariables::USER_NAME[2])).to be == true

      end

      it 'should Assign Recipient role to '+ConstantVariables::USER_NAME[2] do

        role=2
        ob=EditUser::UserEdit.new
        ob.user_role_edit(@server,@driver,ConstantVariables::USER_NAME[2],role)
        expect(userRoleConfirmationBoolean(@server,@driver,"Recipient")).to be == true

      end

      it 'should Check the email of '+ ConstantVariables::USER_NAME[2] +' for the Welcome email' do

        sleep 5
        user_name="sakib2"

        expected_email_subject = 'Welcome to Biscom SFT'
        ob=Email::EmailAccess.new
        subject = ob.get_email_subject(@server, @driver, user_name, password_email)
        puts expected_email_subject
        puts subject
        expect(delivery_name).to be == subject
        if expected_email_subject == subject

          puts 'Got email'

        else puts 'No email'

        end

      end

      it 'should Sign out from '+ConstantVariables::USER_NAME[2]+ 'account' do

        ob=SignOut::UserSignOut.new
        ob.sign_out(@server,@driver)
        expected_value = signOutConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

      end

    end

  end

  describe 'Enable applet from account '+ConstantVariables::USER_NAME[2] do

    context 'user '+ConstantVariables::USER_NAME[2] do

      it 'should Sign in' do

        ob=SignIn::UserSignIn.new
        ob.user_signin(@server,@driver,ConstantVariables::USER_NAME[2],password)
        expected_value = signInConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

      end

      it 'should Enable applet' do

        ob=UserPreference::SetPreferences.new
        ob.applet_settings(@server,@driver)
        expect(appletEnableConfirmationBoolean(@server,@driver)).to be == true

      end

      it 'should Sign out from '+ConstantVariables::USER_NAME[2]+' account' do

        ob=SignOut::UserSignOut.new
        ob.sign_out(@server,@driver)
        expected_value = signOutConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

      end

    end

  end
end