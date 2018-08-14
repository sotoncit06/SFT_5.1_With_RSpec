require 'all_require'

def collaboration(server,driver,browser)


  password= ConstantVariables::PASSWORD
  small_file=ConstantVariables::SMALL_FILE
  large_file=ConstantVariables::LARGE_FILE
  password_email = ConstantVariables::PASSWORD_EMAIL

  describe 'Send delivery with collaboration' do

    delivery_name="Delivery with collaboration"
    context 'user '+ConstantVariables::USER_NAME[1] do

      it 'should Sign in' do

        ob=SignIn::UserSignIn.new
        ob.user_signin(@server,@driver,ConstantVariables::USER_NAME[1],password)#skaib1
        expected_value = signInConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

      end

      it 'should Send a delivery with collaboration to: '+ConstantVariables::USER_NAME[2] do

        puts "Delivery with collaboration"
        delivery_name="Delivery with collaboration"
        ob=ExpressDelivery::CreateExpressDelivery.new
        #ob.send_express_delivery_html5_indirect(server,Thread.current[:driver],ConstantVariables::USER_NAME[2],delivery_name,small_file,browser)#recipient sakib2
        ob.send_express_delivery_html5_indirect_ckeditor(@server,@driver,ConstantVariables::USER_NAME[2],delivery_name,small_file,@browser)#recipient sakib2
        sleep 5

      end

      it 'should Allow "secure reply to all" option from edit package' do

        ob=Package::EditPackage.new
        ob.allow_secure_reply_to_all(@server,@driver,delivery_name)

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

  describe 'Received delivery with collaboration' do

    delivery_name= "Delivery with collaboration"
    file_name="small_file"
    context 'user '+ConstantVariables::USER_NAME[2] do

      it 'should Sign in' do

        ob=SignIn::UserSignIn.new
        ob.user_signin(@server,@driver,ConstantVariables::USER_NAME[2],password)#skaib2
        expected_value = signInConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

      end

      it 'should Receive delivery: '+delivery_name+' and download file: '+file_name+' under that delivery from user: '+ConstantVariables::USER_NAME[1] do

        delivery_name= 'Delivery with collaboration'
        ob=Received::ReceivedDeliveries.new
        ob.received_delivery(@server,@driver,delivery_name,'small_file')

      end

      it 'should Check the email of '+ ConstantVariables::USER_NAME[2] +' for the corresponding delivery' do

        sleep 5
        user_name="sakib2"
        ob=Email::EmailAccess.new
        subject = ob.get_email_subject(@server, @driver, user_name, password_email)
        puts delivery_name
        puts subject
        expect(delivery_name).to be == subject
        if delivery_name == subject

          puts 'Got email'

        else puts 'No email'

        end

      end

      it 'should Give secure reply to the delivery: '+delivery_name do

        ob=SecureReply::DeliverySecureReply.new
        #ob.secure_reply_all(server,Thread.current[:driver],small_file)
        ob.secure_reply_all_ckeditor(@server,@driver,small_file)

      end

      it 'should Sign out from user account: '+ConstantVariables::USER_NAME[2] do

        ob=SignOut::UserSignOut.new
        ob.sign_out(@server,@driver)
        expected_value = signOutConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

      end

      it 'should Check the email of '+ ConstantVariables::USER_NAME[1] +' for the corresponding reply' do

        sleep 5
        user_name="sakib1"

        delivery_name= "Re: "+"Delivery with collaboration"
        ob=Email::EmailAccess.new
        subject = ob.get_email_subject(@server, @driver, user_name, password_email)
        puts delivery_name
        puts subject
        expect(delivery_name).to be == subject
        if delivery_name == subject

          puts 'Got email'

        else puts 'No email'

        end
      end
    end

  end

  describe 'Add file to a package' do

    delivery_name= "Delivery with collaboration"
    context 'user '+ConstantVariables::USER_NAME[1] do

      it 'should Sign in as ' do

        ob=SignIn::UserSignIn.new
        ob.user_signin(@server,@driver,ConstantVariables::USER_NAME[1],password)#skaib1
        expected_value = signInConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

      end

      it 'should Add file to the package' do

        sender_name="everyone"
        ob=Sent::SentDeliveries.new
        ob.sent_delivery_collaboration_file_add_to_package(@server,@driver,sender_name,delivery_name)

      end

      it 'should Confirm the addition of file to the package: '+delivery_name do

        text="Uploaded via secure ..."
        text2=" Uploaded via secure reply from sakib2@nilavodev.com"
        ob=Package::EditPackage.new
        ob.package_file_details_text_presence_check(@server,@driver,delivery_name,text2)

      end

      it 'should Sign out from user account: '+ConstantVariables::USER_NAME[1] do

        ob=SignOut::UserSignOut.new
        ob.sign_out(@server,@driver)
        expected_value = signOutConfirmation(@server,@driver)
        assert_value = Assertion.new
        expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

      end

    end

  end



end