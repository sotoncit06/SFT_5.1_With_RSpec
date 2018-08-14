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
    domain='qa-server3'
    user_name='admin'
    password='admin'
    ob=SignIn::UserSignIn.new
    ob.user_signin(server,Thread.current[:driver],user_name,password)

    ob=ExternalAuthenticationSource::AuthenticationSourceConf.new
    ob.sun_one_ldap(server,Thread.current[:driver])

    # TODO: Need to create AD admin
    # ob=SignIn::ADUserSignIn.new
    # ob.ad_admin(server,Thread.current[:driver],domain)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,Thread.current[:driver])

    user_name='user_s'
    password='1234'
    ob=SignIn::ADUserSignIn.new
    ob.ad_user_signin(server,Thread.current[:driver],user_name,password,domain)


    ob=UserPreference::SetPreferences.new
    ob.applet_set_no(server,Thread.current[:driver])
    ob.enable_secure_reply_to_all(server,Thread.current[:driver])

    #Create express delivery

    recipient='User R<user_r@qa-server3.com>'
    delivery_name="Test Express Delivery 1"
    filename='c:\\test.txt'
    ob=ExpressDelivery::CreateExpressDelivery.new
    ob.send_express_delivery_ckeditor_html5(server,Thread.current[:driver],recipient,delivery_name,filename,browser)

    user='test1@nilavodev.com'
    member='user_rsrp@qa-server3.com'
    managed='user_rsa@qa-server3.com'
    shared='user_rsrpa@qa-server3.com'
    group_name='TestGroup'
    ob=Contacts::CreateContact.new
    ob.create_user_contact(server,Thread.current[:driver],user)
    ob.create_group_contact(server,Thread.current[:driver],group_name,member,managed,shared)


    recipient='TestGroup'
    delivery_name="Test Express Delivery Local Group 1"
    filename='c:\\test.txt'
    ob=ExpressDelivery::CreateExpressDelivery.new
    ob.send_express_delivery_ckeditor_html5(server,Thread.current[:driver],recipient,delivery_name,filename,browser)

    #recipient='Biscom SR Group' # TODO: Can not delivery to a LDAP group.
    recipient='user_rs@qa-server3.com'
    cc='user_r@qa-server3.com'
    bcc='user_rsrp@qa-server3.com'
    delivery_name="Test Express Delivery AD Group 1"
    filename='c:\\test.txt'
    ob=ExpressDelivery::CreateExpressDelivery.new
    ob.send_express_delivery_all_ckeditor_html5(server,Thread.current[:driver],recipient,cc,bcc,delivery_name,filename,browser)
    #ob.send_express_delivery_ckeditor_html5(server,Thread.current[:driver],recipient,delivery_name,filename,browser)
    #ob.send_express_delivery_html5(server,Thread.current[:driver],recipient,delivery_name,filename,browser)

    recipient='user_r@qa-server3.com'
    delivery_name='Express Delivery AD user 1'
    ob=ExpressDelivery::CreateExpressDelivery.new
    ob.send_express_delivery_applet_ckeditor(server,Thread.current[:driver],recipient,delivery_name)

    package_name='AD Package 1'
    filename='c:\\test.txt'
    ob=Package::CreatePackage.new
    ob.create_package_html5(server,Thread.current[:driver],package_name,filename)

    package_name='AD Package 1 Applet'
    ob=Package::CreatePackage.new
    ob.create_package_applet(server,Thread.current[:driver],package_name)

    #WORKSPACE STARTS
    workspace_name='Workspace Applet'
    manager='user_rs@qa-server3.com'
    collaborator='user_srp@qa-server3.com'
    viewer='user_r@qa-server3.com'
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

    #recipient='Biscom SR Group' # TODO: Can not delivery to a LDAP group.
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
    delivery_name='Test Express Delivery AD Group 1'
    file_name='test.txt'
    ob=Received::ReceivedDeliveries.new
    ob.received_delivery(server,Thread.current[:driver],delivery_name,file_name)
    ob=SecureReply::DeliverySecureReply.new
    ob.secure_reply_applet_direct_ckeditor(server,Thread.current[:driver])

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
  end
end
threads.each { |thread| thread.join }





