$LOAD_PATH << '.'

require 'all_require'

#sleep 5
server="http://dahukv1/bds"
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

    user_name='sakib1@nilavodev.com'
    password='1As!#'
    ob=SignIn::UserSignIn.new
    ob.user_signin(server,Thread.current[:driver],user_name,password)

    ob=UserPreference::SetPreferences.new
    ob.applet_set_no(server,Thread.current[:driver])

    owner='sakib2@nilavodev.com'
    sender='sakib3@nilavodev.com'
    file_name='c:\\test.txt'
    package_name='Package1'
    ob=Package::CreatePackage.new
    ob.create_package_all_html5(server,Thread.current[:driver],owner,sender,package_name,file_name)

    ob=Package::DeliverPackage.new
    recipient='sakib2@nilavodev.com'
    cc='sakib3@nilavodev.com'
    bcc='sakib4@nilavodev.com'
    package_name='Package1'
    ob.package_delivery(server,Thread.current[:driver],recipient,cc,bcc,package_name)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,Thread.current[:driver])

    user_name='sakib2@nilavodev.com'
    password='1As!#'
    ob=SignIn::UserSignIn.new
    ob.user_signin(server,Thread.current[:driver],user_name,password)

    ob=UserPreference::SetPreferences.new
    ob.applet_set_no(server,Thread.current[:driver])

    delivery_name='Secure delivery of package: Package1'
    file_name='test.txt'
    ob=Received::ReceivedDeliveries.new
    ob.received_delivery(server,Thread.current[:driver],delivery_name,file_name)

    ob=UserPreference::SetPreferences.new
    ob.applet_settings(server,Thread.current[:driver])

    ob=Received::ReceivedDeliveries.new
    ob.received_delivery(server,Thread.current[:driver],delivery_name,file_name)

    file_name='c:\\test.txt'
    ob=SecureReply::DeliverySecureReply.new
    ob.secure_reply_html5(server,Thread.current[:driver],file_name)

    recipient='sakib2@nilavodev.com'
    delivery_name='Legal hold test for Express Delivery'
    file_name='c:\\test.txt'

    ob=ExpressDelivery::CreateExpressDelivery.new
    ob.send_express_delivery_html5(server,Thread.current[:driver],recipient,delivery_name,file_name,browser)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,Thread.current[:driver])

    user_name='sakib1@nilavodev.com'
    password='1As!#'
    ob=SignIn::UserSignIn.new
    ob.user_signin(server,Thread.current[:driver],user_name,password)

    delivery_name='Secure delivery of package: Package1'
    file_name='test.txt'
    ob=Sent::SentDeliveries.new
    ob.sent_delivery(server,Thread.current[:driver],delivery_name,file_name)

    ob=SecureReply::DeliverySecureReply.new
    ob.secure_reply_from_sender_applet(server,Thread.current[:driver])

    delivery_name='Secure delivery of package: Package1'
    ob=Reports::CheckReport.new
    ob.sent_deliveries(server,Thread.current[:driver],delivery_name)

    Thread.current[:driver].navigate.to "#{server}/Main.do"
    sleep 5
    delivery_name='Legal hold test for Express Delivery'
    ob=Reports::CheckReport.new
    ob.sent_deliveries(server,Thread.current[:driver],delivery_name)


  end
end
threads.each { |thread| thread.join }