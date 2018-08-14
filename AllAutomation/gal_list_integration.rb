$LOAD_PATH <<  '../'

require 'all_require'

#sleep 5
server="http://dahukv22/bds"
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
    sender='test1@nilavodev.com'

    # user='sakib1@nilavodev.com'
    # member='user_s@qa-server5.com'
    # managed='user_rsa@qa-server5.com'
    # shared='user_rsrpa@qa-server5.com'

    user_name='admin'
    password='admin'
    ob=SignIn::UserSignIn.new
    ob.user_signin(server,Thread.current[:driver],user_name,password)
=begin
    # ob=ServerConfiguration::ServerSetUp.new
    # ob.fresh_config(server,Thread.current[:driver])
=end
    i=1
    while i<5 do
      user="sakib#{i}@nilavodev.com"
      password='1234'
      ob=UserCreation::CreateUser.new
      ob.create_user_sender(server,Thread.current[:driver],user,password)

      # role=1= Sender, role=2= Recipient, role=3= Report
      role=2
      ob=EditUser::UserEdit.new
      ob.user_role_edit(server,Thread.current[:driver],user,role)
      i+=1
      sleep 2
    end
    home=Home::GoToHome.new
    home.home_page(server,Thread.current[:driver])

    ob=ExternalAuthenticationSource::AuthenticationSourceConf.new
    ob.AD_authentication_source(server,Thread.current[:driver])

    ob=ExchageServer::ManageExchageServer.new
    ob.create_exchage_server_conn(server,Thread.current[:driver])

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,Thread.current[:driver])

    user_name='sakib1@nilavodev.com'
    password='1234'
    ob=SignIn::UserSignIn.new
    ob.user_signin(server,Thread.current[:driver],user_name,password)

    ob=UserPreference::SetPreferences.new
    ob.applet_set_no(server,Thread.current[:driver])

    sleep 2
    recipient='sakib2@nilavodev.com'
    cc='sakib3@nilavodev.com'
    bcc='sakib4@nilavodev.com'
    delivery_name='Express Delivery to Local users 1'
    filename="c:\\test.txt"
    ob=ExpressDelivery::CreateExpressDelivery.new
    ob.send_express_delivery_all_html5(server,Thread.current[:driver],recipient,cc,bcc,delivery_name,filename,browser)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,Thread.current[:driver])


    ob=SignIn::ADUserSignIn.new
    ob.ad_user_sender_signin(server,Thread.current[:driver],domain)

    ob=UserPreference::SetPreferences.new
    ob.applet_set_no(server,Thread.current[:driver])

    # Create Contacts

    user='sakib1@nilavodev.com'
    group_name='TestGroup'
    member='user_rsrp@qa-server5.com'
    managed='user_rsa@qa-server5.com'
    shared='user_rsrpa@qa-server5.com'
    ob=Contacts::CreateContact.new
    ob.create_user_contact(server,Thread.current[:driver],user)
    ob.create_group_contact(server,Thread.current[:driver],group_name,member,managed,shared)


    #Create express delivery

    recipient='user_r@qa-server5.com'
    cc='user_rs@qa-server5.com'
    bcc='user_srp@qa-server5.com'
    delivery_name='Express Delivery to AD users 1'
    filename="c:\\test.txt"
    ob=ExpressDelivery::CreateExpressDelivery.new
    ob.send_express_delivery_all_html5(server,Thread.current[:driver],recipient,cc,bcc,delivery_name,filename,browser)


    group='TestGroup'
    delivery_name='Express Delivery to local group 1'
    filename="c:\\test.txt"
    ob=ExpressDelivery::CreateExpressDelivery.new
    ob.send_express_delivery_all_html5(server,Thread.current[:driver],group,cc,bcc,delivery_name,filename,browser)

    group='Recipient_Group'
    delivery_name='Express Delivery to AD group 1'
    filename="c:\\test.txt"
    ob=ExpressDelivery::CreateExpressDelivery.new
    ob.send_express_delivery_all_html5(server,Thread.current[:driver],group,cc,bcc,delivery_name,filename,browser)


    owner='user_s@qa-server5.com'
    sender='user_rs@qa-server5.com'
    ob=Package::CreatePackage.new
    ob.create_package_all_applet(server,Thread.current[:driver],owner,sender)
    #
    package_name='Package Applet'
    ob=Package::EditPackage.new
    ob.edit_package_applet(server,Thread.current[:driver],package_name)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,Thread.current[:driver])

    recipient='user_r'
    ob=SignIn::ADUserSignIn.new
    ob.ad_user_recipient_signin(server,Thread.current[:driver],recipient,domain)

    file_name='test.txt'
    delivery_name='Express Delivery to AD group 1'
    ob=Received::ReceivedDeliveries.new
    ob.received_delivery(server,Thread.current[:driver],delivery_name,file_name)

    file_name='test.txt'
    delivery_name='Express Delivery to AD users 1'
    ob=Received::ReceivedDeliveries.new
    ob.received_delivery(server,Thread.current[:driver],delivery_name,file_name)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,Thread.current[:driver])

    recipient='user_rs'
    ob=SignIn::ADUserSignIn.new
    ob.ad_user_recipient_signin(server,Thread.current[:driver],recipient,domain)

    file_name='test.txt'
    delivery_name='Express Delivery to AD users 1'
    ob=Received::ReceivedDeliveries.new
    ob.received_delivery(server,Thread.current[:driver],delivery_name,file_name)

    file_name='test.txt'
    delivery_name='Express Delivery to local group 1'
    ob=Received::ReceivedDeliveries.new
    ob.received_delivery(server,Thread.current[:driver],delivery_name,file_name)
  end
end
threads.each { |thread| thread.join }