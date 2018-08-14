require 'all_require'

def delivery_app(server,driver,browser)

  password= ConstantVariables::PASSWORD
  small_file=ConstantVariables::SMALL_FILE
  large_file=ConstantVariables::LARGE_FILE
  password_email=ConstantVariables::PASSWORD_EMAIL


  xdescribe 'Small file delivery with Applet' do

    describe 'Send delivery' do

      context 'user '+ConstantVariables::USER_NAME[1] do

        it 'should Sign in' do

          ob=SignIn::UserSignIn.new
          ob.user_signin(@server,@driver,ConstantVariables::USER_NAME[1],password)#skaib1
          expected_value = signInConfirmation(@server,@driver)
          assert_value = Assertion.new
          expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

        end

        it 'should Send a delivery with applet to: '+ConstantVariables::USER_NAME[2] do

          puts "Small file with applet"
          subject="Small file with applet"
          ob=ExpressDelivery::CreateExpressDelivery.new
          #ob.send_express_delivery_direct_by_applet(@server,@driver,ConstantVariables::USER_NAME[2],subject) #recipient
          ob.send_express_delivery_direct_by_applet_ckeditor(@server,@driver,ConstantVariables::USER_NAME[2],subject) #recipient

=begin
          expected_value = sendDeliveryConfirmation(@server,@driver)
          assert_value = Assertion.new
          expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)
=end
          sleep 5

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

    describe 'Receive delivery,Download file and Give secure reply' do

      delivery_name= "Small file with applet"
      filename="small_file"
      context 'user '+ConstantVariables::USER_NAME[2] do

        it 'should Sign in' do

          ob=SignIn::UserSignIn.new
          ob.user_signin(@server,@driver,ConstantVariables::USER_NAME[2],password)#skaib2
          expected_value = signInConfirmation(@server,@driver)
          assert_value = Assertion.new
          expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

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

        it 'should Receive delivery: '+delivery_name+' and download file: '+filename+' under that delivery from user: '+ConstantVariables::USER_NAME[1] do

          #delivery_name= "Small file with applet"
          #filename="small_file"
          ob=Received::ReceivedDeliveries.new
          ob.received_delivery(@server,@driver,delivery_name,filename)

        end


        it 'should Check the email of '+ ConstantVariables::USER_NAME[1] +' for viewing the corresponding delivery' do

          sleep 5
          user_name="sakib1"
          expected_email_subject = 'sakib2@nilavodev.com viewed delivery '+"'Small file with applet'"
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

        it 'should Secure reply against the delivery '+delivery_name+' with applet' do

          puts "Small file with applet"
          ob=SecureReply::DeliverySecureReply.new
          #ob.secure_reply_applet_direct(@server,@driver)
          ob.secure_reply_applet_direct_ckeditor(@server,@driver)

        end

        it 'should Sign out from user account :'+ConstantVariables::USER_NAME[2] do

          ob=SignOut::UserSignOut.new
          ob.sign_out(@server,@driver)
          expected_value = signOutConfirmation(@server,@driver)
          assert_value = Assertion.new
          expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

        end

      end

    end

    describe 'Receive secure reply' do

      context 'user '+ConstantVariables::USER_NAME[1] do

        it 'should Sign in' do

          ob=SignIn::UserSignIn.new
          ob.user_signin(@server,@driver,ConstantVariables::USER_NAME[1],password)#skaib1
          expected_value = signInConfirmation(@server,@driver)
          assert_value = Assertion.new
          expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

        end

        it 'should Check the email of '+ ConstantVariables::USER_NAME[1] +' for the corresponding reply' do

          sleep 5
          user_name="sakib1"
          delivery_name= "Re: "+"Small file with applet"
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

        it 'should Receive secure reply and download corresponding file from user: '+ConstantVariables::USER_NAME[1] do

          delivery_name= "Small file with applet"
          ob=Sent::SentDeliveries.new
          ob.sent_deliver_received_secure_reply(@server,@driver,ConstantVariables::USER_NAME[2],delivery_name,'small_file')

        end

        it 'should Go to home page' do

          ob=Home::GoToHome.new
          ob.home_page(@server,@driver)

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

  xdescribe 'Large file delivery with Applet' do

    describe 'Send delivery' do

      context 'user '+ConstantVariables::USER_NAME[1] do

        it 'should Sign in' do

          ob=SignIn::UserSignIn.new
          ob.user_signin(@server,@driver,ConstantVariables::USER_NAME[1],password)#skaib1
          expected_value = signInConfirmation(@server,@driver)
          assert_value = Assertion.new
          expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

        end

        it 'should Send a delivery with applet to: '+ConstantVariables::USER_NAME[2] do

          puts "Large file with applet"
          subject="Large file with applet"
          ob=ExpressDelivery::CreateExpressDelivery.new
          #ob.send_express_delivery_direct_by_applet(@server,@driver,ConstantVariables::USER_NAME[2],subject) #recipient
          ob.send_express_delivery_direct_by_applet_ckeditor(@server,@driver,ConstantVariables::USER_NAME[2],subject) #recipient
          sleep 5

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

    describe 'Receive delivery,Download file and Give secure reply' do

      delivery_name= "Large file with applet"
      filename="large_file"
      context 'user '+ConstantVariables::USER_NAME[2] do

        it 'should Sign in' do

          ob=SignIn::UserSignIn.new
          ob.user_signin(@server,@driver,ConstantVariables::USER_NAME[2],password)#skaib2
          expected_value = signInConfirmation(@server,@driver)
          assert_value = Assertion.new
          expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

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

        it 'should Receive delivery: '+delivery_name+' and download file: '+filename+' under that delivery from user: '+ConstantVariables::USER_NAME[1] do

          delivery_name= "Large file with applet"
          ob=Received::ReceivedDeliveries.new
          ob.received_delivery(@server,@driver,delivery_name,'large_file')

        end

        it 'should Check the email of '+ ConstantVariables::USER_NAME[1] +' for viewing the corresponding delivery' do

          sleep 5
          user_name="sakib1"
          expected_email_subject = 'sakib2@nilavodev.com viewed delivery '+"'Large file with applet'"
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

        it 'should Secure reply against the delivery '+delivery_name+' with applet' do

          puts "Large file with applet"
          ob=SecureReply::DeliverySecureReply.new
          #ob.secure_reply_applet_direct(@server,@driver)
          ob.secure_reply_applet_direct_ckeditor(@server,@driver)

        end

        it 'should Sign out from user account :'+ConstantVariables::USER_NAME[2] do

          ob=SignOut::UserSignOut.new
          ob.sign_out(@server,@driver)
          expected_value = signOutConfirmation(@server,@driver)
          assert_value = Assertion.new
          expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

        end
      end

    end

    describe 'Receive secure reply' do

      context 'user '+ConstantVariables::USER_NAME[1] do

        it 'should Sign in' do

          ob=SignIn::UserSignIn.new
          ob.user_signin(@server,@driver,ConstantVariables::USER_NAME[1],password)#skaib1
          expected_value = signInConfirmation(@server,@driver)
          assert_value = Assertion.new
          expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

        end

        it 'should Check the email of '+ ConstantVariables::USER_NAME[1] +' for the corresponding reply' do

          sleep 5
          user_name="sakib1"
          delivery_name= "Re: "+"Large file with applet"
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

        it 'should Receive secure reply and download corresponding file from user: '+ConstantVariables::USER_NAME[1] do

          delivery_name= "Large file with applet"
          ob=Sent::SentDeliveries.new
          ob.sent_deliver_received_secure_reply(@server,@driver,ConstantVariables::USER_NAME[2],delivery_name,'large_file')

        end

        it 'should Go to home page' do

          ob=Home::GoToHome.new
          ob.home_page(@server,@driver)

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

  describe 'Small file delivery without Applet' do


    describe 'Send delivery' do

      context 'user '+ConstantVariables::USER_NAME[1] do

        it 'should Sign in' do

          ob=SignIn::UserSignIn.new
          ob.user_signin(@server,@driver,ConstantVariables::USER_NAME[1],password)#skaib1
=begin
          expected_value = signInConfirmation(@server,@driver)
          assert_value = Assertion.new
          expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)
=end

        end

        it 'should Send a delivery without applet to: '+ConstantVariables::USER_NAME[2] do

          puts "Small file without applet"
          delivery_name="Small file without applet"
          ob=ExpressDelivery::CreateExpressDelivery.new
          # ob.send_express_delivery_html5_indirect(@server,@driver,ConstantVariables::USER_NAME[2],delivery_name,small_file,browser)
          ob.send_express_delivery_html5_indirect_ckeditor(@server,@driver,ConstantVariables::USER_NAME[2],delivery_name,small_file,@browser)
          sleep 5

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

    describe 'Receive delivery,Download file and Give secure reply' do

      delivery_name= "Small file without applet"
      filename="small_file"
      context 'user '+ConstantVariables::USER_NAME[2] do

        it 'should Sign in' do

          ob=SignIn::UserSignIn.new
          ob.user_signin(@server,@driver,ConstantVariables::USER_NAME[2],password)#skaib2
          expected_value = signInConfirmation(@server,@driver)
          assert_value = Assertion.new
          expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

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

        it 'should Receive delivery: '+delivery_name+' and download file: '+filename+' under that delivery from user: '+ConstantVariables::USER_NAME[1] do

          delivery_name= "Small file without applet"
          ob=Received::ReceivedDeliveries.new
          ob.received_delivery(@server,@driver,delivery_name,'small_file')

        end


        it 'should Check the email of '+ ConstantVariables::USER_NAME[1] +' for viewing the corresponding delivery' do

          sleep 5
          user_name="sakib1"
          expected_email_subject = 'sakib2@nilavodev.com viewed delivery '+"'Small file without applet'"
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

        it 'should Secure reply against the delivery '+delivery_name+' without applet' do

          ob=SecureReply::DeliverySecureReply.new
          #ob.secure_reply_html5(@server,@driver,small_file)
          ob.secure_reply_html5_ckeditor(@server,@driver,small_file)

        end

        it 'should Sign out from user account :'+ConstantVariables::USER_NAME[2] do

          ob=SignOut::UserSignOut.new
          ob.sign_out(@server,@driver)
          expected_value = signOutConfirmation(@server,@driver)
          assert_value = Assertion.new
          expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

        end

      end

    end

    describe 'Receive secure reply' do

      context 'user '+ConstantVariables::USER_NAME[1]do

        it 'should Sign in' do

          ob=SignIn::UserSignIn.new
          ob.user_signin(@server,@driver,ConstantVariables::USER_NAME[1],password)#skaib1
          expected_value = signInConfirmation(@server,@driver)
          assert_value = Assertion.new
          expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

        end

        it 'should Check the email of '+ ConstantVariables::USER_NAME[1] +' for the corresponding reply' do

          sleep 5
          user_name="sakib1"
          delivery_name= "Re: "+"Small file without applet"
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

        it 'should Receive secure reply and download corresponding file from user: '+ConstantVariables::USER_NAME[1] do

          delivery_name= "Small file without applet"
          ob=Sent::SentDeliveries.new
          ob.sent_deliver_received_secure_reply(@server,@driver,ConstantVariables::USER_NAME[2],delivery_name,'small_file')

        end




        it 'should Go to home page' do

          ob=Home::GoToHome.new
          ob.home_page(@server,@driver)

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

  describe 'Large file delivery without Applet' do


    describe 'Send delivery' do

      context 'user '+ConstantVariables::USER_NAME[1] do

        it 'should Sign in' do

          ob=SignIn::UserSignIn.new
          ob.user_signin(@server,@driver,ConstantVariables::USER_NAME[1],password)#skaib1
=begin
          expected_value = signInConfirmation(@server,@driver)
          assert_value = Assertion.new
          expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)
=end

        end

        it 'should Send a delivery without applet to: '+ConstantVariables::USER_NAME[2] do

          puts "Large file without applet"
          delivery_name="Large file without applet"
          ob=ExpressDelivery::CreateExpressDelivery.new
          # ob.send_express_delivery_html5_indirect(@server,@driver,ConstantVariables::USER_NAME[2],delivery_name,small_file,browser)
          ob.send_express_delivery_html5_indirect_ckeditor(@server,@driver,ConstantVariables::USER_NAME[2],delivery_name,large_file,@browser)
          sleep 10

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

    describe 'Receive delivery,Download file and Give secure reply' do

      delivery_name= "Large file without applet"
      filename="large_file"
      context 'user '+ConstantVariables::USER_NAME[2] do

        it 'should Sign in' do

          ob=SignIn::UserSignIn.new
          ob.user_signin(@server,@driver,ConstantVariables::USER_NAME[2],password)#skaib2
          expected_value = signInConfirmation(@server,@driver)
          assert_value = Assertion.new
          expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

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

        it 'should Receive delivery: '+delivery_name+' and download file: '+filename+' under that delivery from user: '+ConstantVariables::USER_NAME[1] do

          delivery_name= "Large file without applet"
          ob=Received::ReceivedDeliveries.new
          ob.received_delivery(@server,@driver,delivery_name,'large_file')

        end

        it 'should Check the email of '+ ConstantVariables::USER_NAME[1] +' for viewing the corresponding delivery' do

          sleep 5
          user_name="sakib1"
          expected_email_subject = 'sakib2@nilavodev.com viewed delivery '+"'Large file without applet'"
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

        it 'should Secure reply against the delivery '+delivery_name+' without applet' do

          ob=SecureReply::DeliverySecureReply.new
          #ob.secure_reply_html5(@server,@driver,small_file)
          ob.secure_reply_html5_ckeditor(@server,@driver,large_file)

        end

        it 'should Sign out from user account :'+ConstantVariables::USER_NAME[2] do

          ob=SignOut::UserSignOut.new
          ob.sign_out(@server,@driver)
          expected_value = signOutConfirmation(@server,@driver)
          assert_value = Assertion.new
          expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

        end

      end

    end

    describe 'Receive secure reply' do

      context 'user '+ConstantVariables::USER_NAME[1]do

        it 'should Sign in' do

          ob=SignIn::UserSignIn.new
          ob.user_signin(@server,@driver,ConstantVariables::USER_NAME[1],password)#skaib1
          expected_value = signInConfirmation(@server,@driver)
          assert_value = Assertion.new
          expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

        end



        it 'should Check the email of '+ ConstantVariables::USER_NAME[1] +' for the corresponding reply' do

          sleep 5
          user_name="sakib1"
          delivery_name= "Re: "+"Large file without applet"
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


        it 'should Receive secure reply and download corresponding file from user: '+ConstantVariables::USER_NAME[1] do

          delivery_name= "Large file without applet"
          ob=Sent::SentDeliveries.new
          ob.sent_deliver_received_secure_reply(@server,@driver,ConstantVariables::USER_NAME[2],delivery_name,'large_file')

        end

        it 'should Go to home page' do

          ob=Home::GoToHome.new
          ob.home_page(@server,@driver)

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

  xdescribe 'Package creation and delivery with applet' do

    describe 'Create and Send package' do


      package_name="Package with applet" #attach small_file

      context 'user '+ConstantVariables::USER_NAME[1] do

        it 'should Sign in' do

          ob=SignIn::UserSignIn.new
          ob.user_signin(@server,@driver,ConstantVariables::USER_NAME[1],password)#skaib1
          expected_value = signInConfirmation(@server,@driver)
          assert_value = Assertion.new
          expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

        end

        it 'should Create package' do

          puts "small_file for package"
          package_name="Package with applet" #attach small_file
          ob=Package::CreatePackage.new
          ob.create_package_applet_direct(@server,@driver,package_name)

        end

        it 'should Deliver package to: '+ConstantVariables::USER_NAME[2] do

          ob=Package::DeliverPackage.new
          #ob.package_delivery(@server,@driver,ConstantVariables::USER_NAME[2],"cc","bcc",package_name)#recipient sakib2
          ob.package_delivery_ckeditor(@server,@driver,ConstantVariables::USER_NAME[2],"cc","bcc",package_name)#recipient sakib2

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

    describe 'Receive delivery of package' do

      delivery_name= "Secure delivery of package: Package with applet"
      context 'user '+ConstantVariables::USER_NAME[2] do

        it 'should Sign in' do

          ob=SignIn::UserSignIn.new
          ob.user_signin(@server,@driver,ConstantVariables::USER_NAME[2],password)#skaib2
          expected_value = signInConfirmation(@server,@driver)
          assert_value = Assertion.new
          expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

        end

        it 'should Check the email of '+ ConstantVariables::USER_NAME[2] +' for the corresponding package delivery' do

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

        it 'should Receive the delivery package: '+delivery_name+' and download files corresponding to that package' do

          delivery_name= "Secure delivery of package: Package with applet"
          ob=Received::ReceivedDeliveries.new
          ob.received_delivery(@server,@driver,delivery_name,'small_file')

        end


        it 'should Check the email of '+ ConstantVariables::USER_NAME[1] +' for viewing the corresponding delivery' do

          sleep 5
          user_name="sakib1"
          expected_email_subject = 'sakib2@nilavodev.com viewed delivery '+"'Secure delivery of package: Package with applet'"
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



        it 'should Sign out from user account '+ConstantVariables::USER_NAME[2] do

          ob=SignOut::UserSignOut.new
          ob.sign_out(@server,@driver)
          expected_value = signOutConfirmation(@server,@driver)
          assert_value = Assertion.new
          expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

        end

      end

    end

  end

  describe 'Package creation and delivery without applet' do

    describe 'Create and Send package' do

      context 'user '+ConstantVariables::USER_NAME[1] do

        it 'should Sign in' do

          ob=SignIn::UserSignIn.new
          ob.user_signin(@server,@driver,ConstantVariables::USER_NAME[1],password)#skaib1
          expected_value = signInConfirmation(@server,@driver)
          assert_value = Assertion.new
          expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

        end

        it 'should Create package' do

          puts "small_file for package"
          package_name="Package without applet" #attach small_file
          ob=Package::CreatePackage.new
          ob.create_package_html5_indirect(@server,@driver,package_name,small_file)

        end

        it 'should Deliver package to: '+ConstantVariables::USER_NAME[2] do
          package_name="Package without applet"
          ob=Package::DeliverPackage.new
          #ob.package_delivery(@server,@driver,ConstantVariables::USER_NAME[2],"cc","bcc",package_name)#recipient sakib2
          ob.package_delivery_ckeditor(@server,@driver,ConstantVariables::USER_NAME[2],"cc","bcc",package_name)#recipient sakib2

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

    describe 'Receive delivery of package' do

      delivery_name= "Secure delivery of package: Package without applet"
      context 'user '+ConstantVariables::USER_NAME[2] do

        it 'should Sign in' do

          ob=SignIn::UserSignIn.new
          ob.user_signin(@server,@driver,ConstantVariables::USER_NAME[2],password)#skaib2
          expected_value = signInConfirmation(@server,@driver)
          assert_value = Assertion.new
          expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

        end

        it 'should Check the email of '+ ConstantVariables::USER_NAME[2] +' for the corresponding package delivery' do

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

        it 'should Receive the delivery package: '+delivery_name+' and download files corresponding to that package' do

          delivery_name= "Secure delivery of package: Package without applet"
          ob=Received::ReceivedDeliveries.new
          ob.received_delivery(@server,@driver,delivery_name,'small_file')

        end

        it 'should Check the email of '+ ConstantVariables::USER_NAME[1] +' for viewing the corresponding delivery' do

          sleep 5
          user_name="sakib1"
          expected_email_subject = 'sakib2@nilavodev.com viewed delivery '+"'Secure delivery of package: Package without applet'"
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

        it 'should Sign out from user account '+ConstantVariables::USER_NAME[2] do

          ob=SignOut::UserSignOut.new
          ob.sign_out(@server,@driver)
          expected_value = signOutConfirmation(@server,@driver)
          assert_value = Assertion.new
          expect(expected_value).to be == assert_value.findAssertedValueInDatabase(expected_value)

        end

      end

    end

  end


end