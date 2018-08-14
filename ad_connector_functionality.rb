$LOAD_PATH << '.'

require 'all_require'

def ad_connector_fuctionality

    domain='qa-server5'
    browser='firefox'

=begin
    describe 'Sign in as Admin and Create Users' do
        context 'User Admin' do
            it 'should Sign in as Admin User' do
                user_name='admin'
                password='admin'
                admin=SignIn::UserSignIn.new
                admin.user_signin(@server,@driver,user_name,password)
                ob=ExternalAuthenticationSource::AuthenticationSourceConf.new
                ob.AD_authentication_source(@server,@driver)

                ob=SignIn::ADUserSignIn.new
                ob.ad_admin(@server,@driver,domain)

                ob=SignOut::UserSignOut.new
                ob.sign_out(@server,@driver)


            end
        end
    end
=end

    describe 'Sign in  and Express Deliveray as AD User user_s' do

        context 'User user_s' do
            it 'should Sign in as user_s' do
                user_name='user_s'
                password='1234'
                ob=SignIn::ADUserSignIn.new
                ob.ad_user_signin(@server,@driver,user_name,password,domain)
            end
            it 'should set Applte to "No"' do
                ob=UserPreference::SetPreferences.new
                ob.applet_set_no(@server,@driver)
            end

            #Create express delivery
            it 'should create an Express delivery using HTML5' do
                recipient='User R<user_r@qa-server5.com>'
                delivery_name="Test Express Delivery 1"
                filename='C:\Users\Sakib\RubymineProjects\General_SFT_5.0\Files\test.txt'
                ob=ExpressDelivery::CreateExpressDelivery.new
                ob.send_express_delivery_ckeditor_html5(@server,@driver,recipient,delivery_name,filename,browser)
            end
            it 'should create Local Group' do
                user='test1@nilavodev.com'
                member='user_rsrp@qa-server5.com'
                managed='user_rsa@qa-server5.com'
                shared='user_rsrpa@qa-server5.com'
                group_name='TestGroup'
                ob=Contacts::CreateContact.new
                ob.create_user_contact(@server,@driver,user)
                ob.create_group_contact(@server,@driver,group_name,member,managed,shared)
            end

            it 'should deliver to a Local Group' do
                recipient='TestGroup'
                delivery_name="Test Express Delivery Local Group 1"
                filename='C:\Users\Sakib\RubymineProjects\General_SFT_5.0\Files\test.txt'
                ob=ExpressDelivery::CreateExpressDelivery.new
                ob.send_express_delivery_ckeditor_html5(@server,@driver,recipient,delivery_name,filename,browser)
            end

            it 'should deliver to an AD group using HTML5' do
                recipient='Recipient_Group'
                delivery_name="Test Express Delivery AD Group 1"
                filename='C:\Users\Sakib\RubymineProjects\General_SFT_5.0\Files\test.txt'
                ob=ExpressDelivery::CreateExpressDelivery.new
                ob.send_express_delivery_ckeditor_html5(@server,@driver,recipient,delivery_name,filename,browser)
            end
            it 'should set Applte to "Yes"' do
                ob=UserPreference::SetPreferences.new
                ob.applet_settings(@server,@driver)
            end

            it 'should express delivery to user_r using Applet' do
                recipient='user_r@qa-server5.com'
                delivery_name='Express Delivery AD user 1'
                ob=ExpressDelivery::CreateExpressDelivery.new
                ob.send_express_delivery_applet_ckeditor(@server,@driver,recipient,delivery_name)
            end
            it 'should set Applte to "No"' do
                ob=UserPreference::SetPreferences.new
                ob.applet_set_no(@server,@driver)
            end
            it 'should create a Package using HTML5' do
                package_name='AD Package 1 HTML5'
                filename='C:\Users\Sakib\RubymineProjects\General_SFT_5.0\Files\test.txt'
                ob=Package::CreatePackage.new
                ob.create_package_html5(@server,@driver,package_name,filename)
            end
            it 'should create a Package using Applet' do
                package_name='AD Package 1 Applet'
                ob=Package::CreatePackage.new
                ob.create_package_applet(@server,@driver,package_name)
            end
            it 'user_s should sign out' do
                ob=SignOut::UserSignOut.new
                ob.sign_out(@server,@driver)
            end
        end
    end

    describe 'Sign in  and receive deliveray as AD User user_r' do
        context 'User user_r' do
            it 'should sign in as user_r' do
                user_name='user_r'
                password='1234'
                ob=SignIn::ADUserSignIn.new
                ob.ad_user_signin(@server,@driver,user_name,password,domain)
            end
            it 'should check for "Test Express Delivery 1"' do
                delivery_name='Test Express Delivery 1'
                file_name='test.txt'
                ob=Received::ReceivedDeliveries.new
                ob.received_delivery(@server,@driver,delivery_name,file_name)
            end
            it 'should secure reply using HTML5' do
                file_name='test.txt'
                ob=SecureReply::DeliverySecureReply.new
                ob.secure_reply_html5_without_using_action_menu_ckeditor(@server,@driver,file_name)
            end
            it 'should secure reply using Applet' do
                ob=SecureReply::DeliverySecureReply.new
                ob.secure_reply_applet_ckeditor(@server,@driver)
            end
            it 'should check for "Test Express Delivery AD Group 1"' do
                delivery_name='Test Express Delivery AD Group 1'
                file_name='test.txt'
                ob=Received::ReceivedDeliveries.new
                ob.received_delivery(@server,@driver,delivery_name,file_name)
            end
            it 'should check for "Test Express Delivery Local Group 1"' do
                delivery_name='Test Express Delivery Local Group 1'
                file_name='test.txt'
                ob=Received::ReceivedDeliveries.new
                ob.received_delivery(@server,@driver,delivery_name,file_name)
            end
        end

            #AD user sign in through email address
            # ob=SignIn::ADUserSignIn.new
            # ob.ad_gc_sender_signin(@server,@driver,domain)
            #
            # ob=UserPreference::SetPreferences.new
            # ob.applet_settings(@server,@driver)
            #
            # #Create express delivery
            # recipient='user_r@qa-server5.com'
            # delivery_name="Test Express Delivery 2"
            # filename='C:\Users\Sakib\RubymineProjects\General_SFT_5.0\Files\test.txt'
            # ob=ExpressDelivery::CreateExpressDelivery.new
            # ob.send_express_delivery_html5(@server,@driver,recipient,delivery_name,filename,browser)
            #
            #
            # ob=ExpressDelivery::CreateExpressDelivery.new
            # ob.send_express_delivery_applet(@server,@driver,recipient,delivery_name)
            # ob.send_express_delivery_applet(@server,@driver,recipient,delivery_name)
            # sleep 2
            # package_name='Package1'
            # filename='C:\Users\Sakib\RubymineProjects\General_SFT_5.0\Files\test.txt'
            # ob=Package::CreatePackage.new
            # ob.create_package_html5(@server,@driver,package_name,filename)
            #
            # ob=Package::CreatePackage.new
            # ob.create_package_applet(@server,@driver,package_name)
            #
            # ob=SignOut::UserSignOut.new
            # ob.sign_out(@server,@driver)
            # #AD sign in using default domain
            # ob=SignIn::ADUserSignIn.new
            # ob.ad_default_domain_sender_signin(@server,@driver,domain)
            #
            # ob=SignOut::UserSignOut.new
            # ob.sign_out(@server,@driver)
            #
            # #AD sign in using UPN
            # ob=SignIn::ADUserSignIn.new
            # ob.ad_upn_sender_signin(@server,@driver,domain)
        end
    end





