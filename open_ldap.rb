require 'all_require'


def open_ldap(domain,browser,inbox)

  describe 'Sign in and Express Delivery as Open LDAP User' do

    context 'User user_s' do
      it 'should Sign in as user_s' do
        user_name='user_s'
        password='1234'
        ob=SignIn::ADUserSignIn.new
        ob.ad_user_signin(@server,@driver,user_name,password,domain)
      end
      it 'should set the Applet to No' do
        ob=UserPreference::SetPreferences.new
        ob.applet_set_no(@server,@driver)
      end
      it 'should create an Express delivery using HTML5' do
        recipient='user_r@qa-server2.com'
        delivery_name='Express Delivery without Applet LDAP user1'
        filename='C:\Users\Sakib\RubymineProjects\General_SFT_5.0\Files\test.txt'
        ob=ExpressDelivery::CreateExpressDelivery.new
        ob.send_express_delivery_ckeditor_html5(@server,@driver,recipient,delivery_name,filename,browser)
      end

      it 'should create an Express delivery using Applet' do
        recipient='user_r@qa-server2.com'
        delivery_name='Express Delivery with Applet LDAP user1'
        ob=ExpressDelivery::CreateExpressDelivery.new
        ob.send_express_delivery_applet_ckeditor(@server,@driver,recipient,delivery_name)
      end
      it 'should create a package using HTML5 ' do
        package_name='AD LDAP Package 1'
        file_name='C:\Users\Sakib\RubymineProjects\General_SFT_5.0\Files\test.txt'
        ob=Package::CreatePackage.new
        ob.create_package_html5(@server,@driver,package_name,file_name)
      end
      it 'should create a package named "AD LDAP Package 1" using Applet' do
        package_name='AD LDAP Package 1'
        ob=Package::CreatePackage.new
        ob.create_package_applet(@server,@driver,package_name)
      end
      it 'should sign from user_r' do
        ob=SignOut::UserSignOut.new
        ob.sign_out(@server,@driver)
      end
    end
  end

  describe 'sign in as user_r and check for Package and Delivery' do
    context 'user_r receives delivery from user_s' do

      it 'should sign in as user_r' do
        user_name='user_r'
        password='1234'
        ob=SignIn::ADUserSignIn.new
        ob.ad_user_signin(@server,@driver,user_name,password,domain)

      end
      it 'should set Applet to Yes' do
        ob=UserPreference::SetPreferences.new
        ob.applet_settings(@server,@driver)
      end

      it 'should receive a delivery named "Express Delivery without Applet LDAP user1" and download test.txt' do
        delivery_name='Express Delivery without Applet LDAP user1'
        file_name='test.txt'
        ob=Received::ReceivedDeliveries.new
        ob.received_delivery(@server,@driver,delivery_name,file_name)
      end
    end
    context 'user_r replies the delivery' do
      it 'should reply securely' do
        filename='test.txt'
        ob=SecureReply::DeliverySecureReply.new
        if inbox=='off'
          ob.secure_reply_applet_direct_ckeditor(@server, @driver)
        else
          delivery_name='Express Delivery without Applet LDAP user1'
          ob.secure_reply_from_inbox_ckeditor_with_applet(@server, @driver, delivery_name)
        end
      end
      it 'should change the Applet sttings to No' do
        ob=UserPreference::SetPreferences.new
        ob.applet_set_no(@server,@driver)
      end
      # ob=SecureReply::DeliverySecureReply.new
      # ob.secure_reply_html5(server,driver,filename)
      it 'should receive "Express Delivery with Applet LDAP user1"' do
        delivery_name='Express Delivery with Applet LDAP user1'
        file_name='appletFile.txt'
        ob=Received::ReceivedDeliveries.new
        ob.received_delivery(@server,@driver,delivery_name,file_name)
      end
      it 'should give a reply of "Express Delivery with Applet LDAP user1" ' do
        ob=SecureReply::DeliverySecureReply.new
        if inbox=='off'
          ob.secure_reply_applet(@server,@driver)
        else
          delivery_name='Express Delivery with Applet LDAP user1'
          ob.secure_reply_from_inbox_ckeditor_with_applet(@server,@driver,delivery_name)
        end
      end
    end
  end
end