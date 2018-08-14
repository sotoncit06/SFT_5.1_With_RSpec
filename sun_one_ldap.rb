require 'all_require'


def sun_one_ldap(domain,browser,inbox)
  describe 'Sign in and Express delivery as SunOne LDAP user' do
    context 'User user_s' do
      it 'should sign in' do
        user_name='user_s'
        password='1234'
        ob=SignIn::ADUserSignIn.new
        ob.ad_user_signin(@server,@driver,user_name,password,domain) #get recipient before express delivery
      end
      it 'should set the Applet to No' do
        ob=UserPreference::SetPreferences.new
        ob.applet_set_no(@server,@driver)
      end
      it 'should send "Express Delivry HTML5 LDAP user 1" to user_r useing HTML5' do
        recipient='user_r@qa-server3.com'
        delivery_name='Express Delivry HTML5 LDAP user 1'
        filename='C:\Users\Sakib\RubymineProjects\General_SFT_5.0\Files\test.txt'
        ob=ExpressDelivery::CreateExpressDelivery.new
        ob.send_express_delivery_ckeditor_html5(@server,@driver,recipient,delivery_name,filename,browser)
      end
      it 'should send"Express Delivry Applet LDAP user 1" to user_r using Applet' do
        delivery_name='Express Delivry Applet LDAP user 1'
        recipient='user_r@qa-server3.com'
        ob=ExpressDelivery::CreateExpressDelivery.new
        ob.send_express_delivery_applet_ckeditor(@server,@driver,recipient,delivery_name)
      end
      it 'should create a package "LDAP package Applet 1" using Applet' do
        package_name='LDAP package Applet 1'
        ob=Package::CreatePackage.new
        ob.create_package_applet(@server,@driver,package_name)
      end
      it 'should sign out' do
        ob=SignOut::UserSignOut.new
        ob.sign_out(@server,@driver)
      end
    end
  end

  describe 'Sign in and Receive Express delivery as SunOne LDAP user' do
    context 'User user_r' do
      it 'should sign in' do
        user_name='user_r'
        password='1234'
        ob=SignIn::ADUserSignIn.new
        ob.ad_user_signin(@server,@driver,user_name,password,domain)
      end
      it 'should set Applet to Yes' do
        ob=UserPreference::SetPreferences.new
        ob.applet_settings(@server,@driver)
      end
      it 'should receive delivery "Express Delivery HTML5 LDAP user 1" ' do
        delivery_name='Express Delivry HTML5 LDAP user 1'
        file_name='test.txt'
        ob=Received::ReceivedDeliveries.new
        ob.received_delivery(@server,@driver,delivery_name,file_name)
      end
      it 'should reply "Express Delivery HTML5 LDAP user 1"' do
        filename='test.txt'
        delivery_name='Express Delivery HTML5 LDAP user 1'
        ob=SecureReply::DeliverySecureReply.new
        if inbox=='off'
          ob.secure_reply_applet_direct_ckeditor(@server,@driver)
        else
          ob.secure_reply_from_inbox_ckeditor_with_applet(@server,@driver,delivery_name)
        end
      end
      it 'should set Applet to No' do
        ob=UserPreference::SetPreferences.new
        ob.applet_set_no(@server,@driver)
      end
      it 'should receive "Express Delivry Applet LDAP user 1"' do
        delivery_name='Express Delivry Applet LDAP user 1'
        file_name='appletFile.txt'
        ob=Received::ReceivedDeliveries.new
        ob.received_delivery(@server,@driver,delivery_name,file_name)
      end
      it 'should receive "Express Delivry Applet LDAP user 1"' do
        filename='test.txt'
        delivery_name='Express Delivry Applet LDAP user 1'
        ob=SecureReply::DeliverySecureReply.new
        if inbox=='off'
          ob.secure_reply_applet_direct_ckeditor(@server,@driver)
        else
          ob.secure_reply_from_inbox_ckeditor_with_applet(@server,@driver,delivery_name)
        end
      end
    end
  end
end