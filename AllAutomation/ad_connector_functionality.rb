$LOAD_PATH << 'C:\Users\Sakib\RubymineProjects\General_SFT_5.1'

require 'all_require'


#sleep 5
server="http://dahukv18/bds"
#@driver = Selenium::WebDriver.for :ie
#@driver = Selenium::WebDriver.for :firefox
def setup(browsers,machine)
  Thread.current[:driver] = Selenium::WebDriver.for :remote, :url => "http://#{machine}:4444/wd/hub", :desired_capabilities => :"#{browsers}"
end
BROWSER = {firefox: 'localhost'}#,chrome: '192.168.10.230',internet_explorer: '192.168.10.174'}
threads=[]

BROWSER.each_pair do |browser, machine|
  threads << Thread.new do
    setup(browser,machine)
    domain='qa-server5'

    user_name='admin'
    password='admin'
    ob=SignIn::UserSignIn.new
    ob.user_signin(server,Thread.current[:driver],user_name,password)

    ob=ExternalAuthenticationSource::AuthenticationSourceConf.new
    ob.AD_authentication_source(server,Thread.current[:driver])

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,Thread.current[:driver])
# =begin
#      ob=SignIn::ADUserSignIn.new TODO:AD user signin
#      ob.ad_admin(server,Thread.current[:driver],domain)
#          ob=SignOut::UserSignOut.new
#     ob.sign_out(server,Thread.current[:driver])
# =end
#
    user_name='user_s'
    password='1234'
    ob=SignIn::ADUserSignIn.new
    ob.ad_user_signin(server,Thread.current[:driver],user_name,password,domain)


    ob=UserPreference::SetPreferences.new
    ob.applet_set_no(server,Thread.current[:driver])
    ob.enable_secure_reply_to_all(server,Thread.current[:driver])

#Create express delivery

    recipient='User R<user_r@qa-server5.com>'
    delivery_name="Test Express Delivery 1"
    filename='c:\\test.txt'
    ob=ExpressDelivery::CreateExpressDelivery.new
    ob.send_express_delivery_ckeditor_html5(server,Thread.current[:driver],recipient,delivery_name,filename,browser)

    user='test1@nilavodev.com'
    member='user_rsrp@qa-server5.com'
    managed='user_rsa@qa-server5.com'
    shared='user_rsrpa@qa-server5.com'
    group_name='TestGroup'
    ob=Contacts::CreateContact.new
    ob.create_user_contact(server,Thread.current[:driver],user)
    ob.create_group_contact(server,Thread.current[:driver],group_name,member,managed,shared)


    recipient='TestGroup'
    delivery_name="Test Express Delivery Local Group 1"
    filename='c:\\test.txt'
    ob=ExpressDelivery::CreateExpressDelivery.new
    ob.send_express_delivery_ckeditor_html5(server,Thread.current[:driver],recipient,delivery_name,filename,browser)

    recipient='Recipient_Group'
    delivery_name="Test Express Delivery AD Group 1"
    filename='c:\\test.txt'
    ob=ExpressDelivery::CreateExpressDelivery.new
    ob.send_express_delivery_ckeditor_html5(server,Thread.current[:driver],recipient,delivery_name,filename,browser)
ob.send_express_delivery_html5(server,Thread.current[:driver],recipient,delivery_name,filename,browser)

    recipient='user_r@qa-server5.com'
    delivery_name='Express Delivery AD user 1'
    ob=ExpressDelivery::CreateExpressDelivery.new
    ob.send_express_delivery_applet_ckeditor(server,Thread.current[:driver],recipient,delivery_name)

    package_name='AD Package 1'
    filename='c:\\test.txt'
     ob=Package::CreatePackage.new
#     ob.create_package_html5(server,Thread.current[:driver],package_name,filename)

    package_name='Package to All HTML5'
    owner='user_rs@qa-server5.com'
    sender='user_rsrp@qa-server5.com'
    filename='test.txt'
    ob.create_package_all_html5(server,Thread.current[:driver],owner,sender,package_name,filename)

    package_name='AD Package 1 Applet'
    ob=Package::CreatePackage.new
    ob.create_package_applet(server,Thread.current[:driver],package_name)

#WORKSPACE STARTS
    workspace_name='Workspace Applet'
    manager='user_rs@qa-server5.com'
    collaborator='user_srp@qa-server5.com'
    viewer='user_r@qa-server5.com'
    ob=Workspace::WorkspaceConfiguration.new
    ob.workspace_creation_applet(server,Thread.current[:driver],workspace_name, manager, collaborator, viewer)

    filename='test.txt'
    workspace_name='Workspace HTML5'
    ob.workspace_creation_html5(server, Thread.current[:driver],workspace_name, manager, collaborator, viewer, filename)


#WORKSPACE ENDS


    ob=SignOut::UserSignOut.new
    ob.sign_out(server,Thread.current[:driver])

    user_name='user_r'
    password='1234'
    ob=SignIn::ADUserSignIn.new
    ob.ad_user_signin(server,Thread.current[:driver],user_name,password,domain)

    ob=UserPreference::SetPreferences.new
    ob.applet_settings(server,Thread.current[:driver])

    delivery_name='Test Express Delivery 1'
    file_name='test.txt'
    ob=Received::ReceivedDeliveries.new
    ob.received_delivery(server,Thread.current[:driver],delivery_name,file_name)

#Download applet delivery
    delivery_name='Express Delivery AD user 1'
    file_name='appletFile.txt'
    ob=Received::ReceivedDeliveries.new
    ob.received_delivery(server,Thread.current[:driver],delivery_name,file_name)

    filename='c:\\test.txt'
    ob=SecureReply::DeliverySecureReply.new
    ob.secure_reply_html5_ckeditor(server,Thread.current[:driver],filename)

    ob=UserPreference::SetPreferences.new
    ob.applet_settings(server,Thread.current[:driver])

    delivery_name='Test Express Delivery AD Group 1'
    file_name='test.txt'
    ob=Received::ReceivedDeliveries.new
    ob.received_delivery(server,Thread.current[:driver],delivery_name,file_name)
    ob=SecureReply::DeliverySecureReply.new
    ob.secure_reply_all_html5_ckeditor(server,Thread.current[:driver],file_name)

    delivery_name='Test Express Delivery Local Group 1'
    file_name='test.txt'
    ob=Received::ReceivedDeliveries.new
    ob.received_delivery(server,Thread.current[:driver],delivery_name,file_name)

    workspace_name='Workspace Applet'
    ob=Workspace::WorkspaceConfiguration.new
    ob.go_to_workspace(server,Thread.current[:driver],workspace_name)
    name='appletFile.txt'
    ob.file_folder_download(server,Thread.current[:driver], name)
    workspace_name='Workspace HTML5'
    ob.go_to_workspace(server,Thread.current[:driver],workspace_name)
    name='test.txt'
    ob.file_folder_download(server,Thread.current[:driver], name)
    ob=SignOut::UserSignOut.new
    ob.sign_out(server,Thread.current[:driver])


    user_name='user_rs'
    password='1234'
    ob=SignIn::ADUserSignIn.new
    ob.ad_user_signin(server,Thread.current[:driver],user_name,password,domain)
#This delivery will not be revceived as "user_rs" is not a member of Recipient_Group
    delivery_name='Test Express Delivery AD Group 1'
    file_name='test.txt'
    ob=Received::ReceivedDeliveries.new
    ob.received_delivery(server,Thread.current[:driver],delivery_name,file_name)

    ob=UserPreference::SetPreferences.new
    ob.applet_set_no(server,Thread.current[:driver])

    package_name='Package to All HTML5'
    owner1='user_rsrp@qa-server5.com'
    owner2='user_rsa@qa-server5.com'
    sender1='user_srp@qa-server5.com'
    ob=Package::EditPackage.new
    ob.edit_package_applet(server,Thread.current[:driver],package_name)
    #ob.add_multiple_owner(server,Thread.current[:driver],package_name,owner1,owner2,sender1)
    owner2='user_rsrp@qa-server5.com'
    ob.remove_package_ownership(server,Thread.current[:driver],package_name,owner2)


    ob=UserPreference::SetPreferences.new
    ob.applet_settings(server,Thread.current[:driver])

    ob=Workspace::WorkspaceConfiguration.new
    workspace_name='Workspace HTML5'
    ob.go_to_workspace(server,Thread.current[:driver],workspace_name)
    filename='test.txt'
    folder_name="Folder by RS"
    ob.create_new_folder(server, Thread.current[:driver], folder_name)
    ob.file_folder_download(server,Thread.current[:driver], filename)
    ob.file_upload_html5(server, Thread.current[:driver], filename, browser)
    ob.file_folder_create_zip_file(server,Thread.current[:driver], filename)
    ob=SignOut::UserSignOut.new
    ob.sign_out(server,Thread.current[:driver])

#     #AD user sign in through email address
    ob=SignIn::ADUserSignIn.new
    ob.ad_gc_sender_signin(server,Thread.current[:driver],domain)
#
    ob=UserPreference::SetPreferences.new
    ob.applet_set_no(server,Thread.current[:driver])

#    Create express delivery
    recipient='user_r@qa-server5.com'
    delivery_name="Test Express Delivery 2"
    filename='c:\\test.txt'
    ob=ExpressDelivery::CreateExpressDelivery.new
    ob.send_express_delivery_html5(server,Thread.current[:driver],recipient,delivery_name,filename,browser)


    ob=ExpressDelivery::CreateExpressDelivery.new
    ob.send_express_delivery_applet(server,Thread.current[:driver],recipient,delivery_name)

    sleep 2
    package_name='Package HTML5'
    filename='c:\\test.txt'
    ob=Package::CreatePackage.new
    ob.create_package_html5(server,Thread.current[:driver],package_name,filename)

    package_name='Package Applet'
    ob=Package::CreatePackage.new
    ob.create_package_applet(server,Thread.current[:driver],package_name)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,Thread.current[:driver])
#AD sign in using default domain
    ob=SignIn::ADUserSignIn.new
    ob.ad_default_domain_sender_signin(server,Thread.current[:driver],domain)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,Thread.current[:driver])

#AD sign in using UPN
    ob=SignIn::ADUserSignIn.new
    ob.ad_upn_sender_signin(server,Thread.current[:driver],domain)

  end
end
threads.each { |thread| thread.join }

