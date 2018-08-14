require 'all_require'

def account_check(server,driver,browser)


  password= ConstantVariables::PASSWORD
  small_file=ConstantVariables::SMALL_FILE
  large_file=ConstantVariables::LARGE_FILE

  describe 'Lock user account '+ConstantVariables::USER_NAME[1]+ ' for wrong password' do

    context 'user '+ConstantVariables::USER_NAME[1] do

      it 'should Try to sign with wrong password: attempt 1' do
        wrong_password= "Sakib"
        ob=SignIn::UserSignIn.new
        ob.user_signin(@server,@driver,ConstantVariables::USER_NAME[1],wrong_password) #skaib1
=begin
        expected_value = signInFailConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)
=end
      end

      it 'should Try to sign with wrong password in account: attempt 2' do
        wrong_password= "1234"
        ob=SignIn::UserSignIn.new
        ob.user_signin(@server,@driver,ConstantVariables::USER_NAME[1],wrong_password) #skaib1
=begin
        expected_value = signInFailConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)
=end
      end

      it 'should Try to sign with wrong password in account: attempt 3 and get locked' do
        wrong_password= "Sakib1"
        ob=SignIn::UserSignIn.new
        ob.user_signin(@server,@driver,ConstantVariables::USER_NAME[1],wrong_password) #skaib1
=begin
        expected_value = userLockedForInvalidPasswordConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)
=end
      end

      it 'should Check the account locked message and Go to the log in page' do

       # expect(userLockedForInvalidPasswordConfirmation(@server,@driver)).to be == User_locked_for_invalid_password_value
        ob=Home::GoToHome.new
        ob.home_page(@server,@driver)
        expected_value = signInPageConfirmation(@server,@driver)
        assert_value = Assertion.new
        #expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)
      end

    end

  end

  describe 'Unlock the user '+ConstantVariables::USER_NAME[1]+' account' do

    context 'user Admin' do

      it 'should Sign in' do

        ob=SignIn::UserSignIn.new
        ob.admin(@server,@driver)
        expected_value = signInConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

      end

      it 'should Unlock the user account '+ConstantVariables::USER_NAME[1] do

        ob=EditUser::UserEdit.new
        ob.unlock_user(@server,@driver,ConstantVariables::USER_NAME[1]) #sakib1
        expect(userAccountLockedConfirmationBoolean(@server,@driver)).to be == false

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

  describe 'should Check the account for user '+ConstantVariables::USER_NAME[1]+' is Unlocked' do

    context 'user '+ConstantVariables::USER_NAME[1] do

      it 'should Sign in and check account unlocked' do

        ob=SignIn::UserSignIn.new
        ob.user_signin(@server,@driver,ConstantVariables::USER_NAME[1],password) #skaib1
        expected_value = signInConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

        sleep 4

      end

      it 'should Sign out from '+ConstantVariables::USER_NAME[1] do

        ob=SignOut::UserSignOut.new
        ob.sign_out(@server,@driver)
        expected_value = signOutConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

      end

    end

  end

end