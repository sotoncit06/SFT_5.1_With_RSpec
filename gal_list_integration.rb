require 'all_require'

def gal_list_integration()

  describe 'Sign in as Admin and Create Users' do
    context 'User Admin' do
      it 'should Sign in as Admin User' do
        user_name='admin'
        password='admin'
        admin=SignIn::UserSignIn.new
        admin.user_signin(@server,@driver,user_name,password)

      end

      it 'should Create Users with Send/Receive role' do
        i=1
        while i<5 do
          user="test#{i}@nilavodev.com"
          ob=UserCreation::CreateUser.new
          ob.create_user_sender(@server,@driver,user,ConstantVariables::PASSWORD)
          i+=1
          # role=1= Sender, role=2= Recipient, role=3= Report
          role=2
          ob=EditUser::UserEdit.new
          ob.user_role_edit(@server,@driver,user,role)
          sleep 2
        end
      end
      it 'Admin should Sign Out' do
        ob=SignOut::UserSignOut.new
        ob.sign_out(@server,@driver)
      end
    end
  end

  describe 'Sign in  and Express Delivery as AD User' do

    domain='qa-server5'
    browser='firefox'

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
      it 'should create an Express delivery using Applet' do
        recipient='User R<user_r@qa-server5.com>'
        cc='sakib3@nilavodev.com'
        bcc='sakib4@nilavodev.com'
        delivery_name="HTML Express Delivery 1"
        filename='C:\Users\Sakib\RubymineProjects\General_SFT_5.0\Files\test.txt'
        ob=ExpressDelivery::CreateExpressDelivery.new
        ob.send_express_delivery_ckeditor_html5(@server,@driver,recipient,delivery_name,filename,browser)
      end

      it 'should create Local Group from Contact' do
        user='user_r@qa-server5.com'
        member='user_rsrp@qa-server5.com'
        managed='user_rs@qa-server5.com'
        shared='user_rsrpa@qa-server5.com'
        group_name='TestGroup'

        ob=Contacts::CreateContact.new
        ob.create_user_contact(@server,@driver,user)
        ob.create_group_contact(@server,@driver,group_name,member,managed,shared)
      end
      it 'should send a delivery to a Local Group' do
        recipient='TestGroup'
        delivery_name="Test Express Delivery Local Group 1"
        filename='C:\Users\Sakib\RubymineProjects\General_SFT_5.0\Files\test.txt'
        ob=ExpressDelivery::CreateExpressDelivery.new
        ob.send_express_delivery_ckeditor_html5(@server,@driver,recipient,delivery_name,filename,browser)
      end

      it 'should Express delivery to an AD group'do
        recipient='Recipient_Group'
        delivery_name="Test Express Delivery AD Group 1"
        filename='C:\Users\Sakib\RubymineProjects\General_SFT_5.0\Files\test.txt'
        ob=ExpressDelivery::CreateExpressDelivery.new
        ob.send_express_delivery_ckeditor_html5(@server,@driver,recipient,delivery_name,filename,browser)
      end

      it 'should create a Package using Applet' do
        owner='user_s@qa-server5.com'
        sender='user_rs@qa-server5.com'
        ob=Package::CreatePackage.new
        ob.create_package_all_applet(@server,@driver,owner,sender)
      end
    end
  end

  describe "Sign in and Receive/Reply delivery as AD user" do
    domain='qa-server5'
    browser='firefox'

    context "user_r should sign in and serch for recived delivery" do
      it 'should sign in as user_r' do
        user_name='user_r'
        password='1234'
        ob=SignIn::ADUserSignIn.new
        ob.ad_user_signin(@server,@driver,user_name,password,domain)
      end
      it 'should download "appletFile.txt" from "Express Delivery AD user 1"' do
        sleep 2
        delivery_name='Express Delivery AD user 1'
        file_name='appletFile.txt'
        ob=Received::ReceivedDeliveries.new
        ob.received_delivery(@server,@driver,delivery_name,file_name)
      end
      it 'should download "test.txt" from "HTML Express Delivery 1"' do
        delivery_name='HTML Express Delivery 1'
        file_name='test.txt'
        ob=Received::ReceivedDeliveries.new
        ob.received_delivery(@server,@driver,delivery_name,file_name)
      end
      it 'should reply to sender using Applet' do
        ob=SecureReply::DeliverySecureReply.new
        ob.secure_reply_applet_direct_ckeditor(@server,@driver)
      end
      it 'should download "test.txt" from "Test Express Delivery AD Group 1"' do
        delivery_name='Test Express Delivery AD Group 1'
        file_name='test.txt'
        ob=Received::ReceivedDeliveries.new
        ob.received_delivery(@server,@driver,delivery_name,file_name)
      end
      it 'should download "test.txt" from "Test Express Delivery Local Group 1"' do
        delivery_name='Test Express Delivery Local Group 1'
        file_name='test.txt'
        ob=Received::ReceivedDeliveries.new
        ob.received_delivery(@server,@driver,delivery_name,file_name)
      end
      it 'should sign out as user_r' do
        sleep 2
        ob=SignOut::UserSignOut.new
        ob.sign_out(@server,@driver)
      end
    end
    context 'Sign in as user_rs and serch for group delivery' do
      domain='qa-server5'
      browser='firefox'

      it 'should sign in as user_rs' do
        user_name='user_rs'
        password='1234'
        ob=SignIn::ADUserSignIn.new
        ob.ad_user_signin(@server,@driver,user_name,password,domain)
      end
      it 'should download "test.txt" from "Test Express Delivery AD Group 1"' do
        delivery_name='Test Express Delivery AD Group 1'
        file_name='test.txt'
        ob=Received::ReceivedDeliveries.new
        ob.received_delivery(@server,@driver,delivery_name,file_name)
      end
    end
  end
end
