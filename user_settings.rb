require 'all_require'

def user_settings(server,driver,browser)

  password= ConstantVariables::PASSWORD
  small_file=ConstantVariables::SMALL_FILE
  large_file=ConstantVariables::LARGE_FILE


  describe 'Set manage user page sort order Descending' do

    context 'user Admin' do

      it 'should Sign in' do

        ob=SignIn::UserSignIn.new
        ob.admin(@server,@driver)
        expected_value = signInConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

      end

      it 'should Set Descending sort order preference for Manage user page' do

        ob=UserProfile::EditProfile.new
        ob.set_preferences_delivery_sort_order_Descending(@server,@driver)
        expected_value = ascendingSortOrderForManageUsersConfirmation(@server,@driver)
        expect(expected_value).to be == false

      end

      it 'should Sing out from Admin account' do

        ob=SignOut::UserSignOut.new
        ob.sign_out(@server,@driver)
        expected_value = signOutConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

      end
    end

  end

  describe 'Enable user quota and set user quota' do

    context 'user Admin' do

      it 'should Sign in' do

        ob=SignIn::UserSignIn.new
        ob.admin(@server,@driver)
        expected_value = signInConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

      end

      it 'should Go to manage user page' do

        ob=Home::GoToHome.new
        ob.home_page(@server,@driver)
        ob.manage_user_page(@server,@driver)
        expected_value = manageUserPageConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

      end

      it 'should Enable quota ' do

        ob=UserQuotaConfiguration::Quota.new
        ob.enable_quota(@server,@driver)
        expected_value = quotaEnableConfirmationBoolean(@server,@driver)
        expect(expected_value).to be == true

      end

      it 'should Set quota min = 30 and max = 50' do

        quota_max= "50"
        quota_min= "30"
        ob=UserQuotaConfiguration::Quota.new
        ob.set_quota(@server,@driver,quota_max,quota_min)
        expected_value = quotaValueConfirmation(@server,@driver)
        expect(expected_value).to be == ['50','30']

      end

      it 'should Sign out from Admin account' do

        ob=SignOut::UserSignOut.new
        ob.sign_out(@server,@driver)
        expected_value = signOutConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

      end

    end

  end

  describe 'Set new password for user account '+ConstantVariables::USER_NAME[1] do

    context 'user '+ConstantVariables::USER_NAME[1] do

      it 'should Sign in' do

        ob=SignIn::UserSignIn.new
        ob.user_signin(@server,@driver,ConstantVariables::USER_NAME[1],password) #sakib1
        expected_value = signInConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

      end

      it 'should Set new password for account '+ConstantVariables::USER_NAME[1] do

        new_password="2Bt!#"
        ob=UserProfile::EditProfile.new
        ob.view_profile(@server,@driver)
        ob.change_password(@server,@driver,password,new_password)
        expected_value = passwordChangeConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

      end

      it 'should Sign out from account '+ConstantVariables::USER_NAME[1] do

        ob=SignOut::UserSignOut.new
        ob.sign_out(@server,@driver)
        expected_value = signOutConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

      end

      it 'should Check the new password work with action sign in' do

        new_password="2Bt!#"
        ob=SignIn::UserSignIn.new
        ob.user_signin(@server,@driver,ConstantVariables::USER_NAME[1],new_password) #sakib1
        expected_value = signInConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

      end

      it 'should Sign out from account '+ConstantVariables::USER_NAME[1] do

        ob=SignOut::UserSignOut.new
        ob.sign_out(@server,@driver)
        expected_value = signOutConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

      end

    end

  end

  describe 'Change manage user page sort order Ascending' do

    context 'user Admin' do

      it 'should Sign in' do

        ob=SignIn::UserSignIn.new
        ob.admin(@server,@driver)
        expected_value = signInConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

      end

      it 'should Set Ascending sort order preference for manage user' do

        ob=UserProfile::EditProfile.new
        ob.set_preferences_delivery_sort_order_Ascending(@server,@driver)
        expected_value = ascendingSortOrderForManageUsersConfirmation(@server,@driver)
        expect(expected_value).to be == true


      end

      it 'should Sign out from admin user account' do

        ob=SignOut::UserSignOut.new
        ob.sign_out(@server,@driver)
        expected_value = signOutConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

      end

    end

  end

  describe 'Set old password for user account '+ConstantVariables::USER_NAME[1] do

    context 'user '+ConstantVariables::USER_NAME[1] do

      it 'should Sign in' do

        new_password="2Bt!#"
        ob=SignIn::UserSignIn.new
        ob.user_signin(@server,@driver,ConstantVariables::USER_NAME[1],new_password) #sakib1
        expected_value = signInConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

      end

      it 'should Set old password for account '+ConstantVariables::USER_NAME[1] do

        new_password="2Bt!#"
        ob=UserProfile::EditProfile.new
        ob.change_password(@server,@driver,new_password,password)
        expected_value = passwordChangeConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)


      end

      it 'should Sign out from user account '+ConstantVariables::USER_NAME[1] do

        ob=SignOut::UserSignOut.new
        ob.sign_out(@server,@driver)
        expected_value = signOutConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)


      end
    end

  end
end