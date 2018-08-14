
require 'all_require'

# noinspection RubyUnusedLocalVariable
def gal(server,driver,tos_value,browser,inbox,version)

  p inbox

  #### For fresh and Upgrade delivery names
  if (version=='fresh')
    delivery1=ConstantVariables::FRESH_DELIVERY1
    delivery2=ConstantVariables::FRESH_DELIVERY2
    delivery3=ConstantVariables::FRESH_DELIVERY3
    delivery4=ConstantVariables::FRESH_DELIVERY4
    delivery5=ConstantVariables::FRESH_DELIVERY5
    delivery6=ConstantVariables::FRESH_DELIVERY6
  else
    delivery1=ConstantVariables::UPGRADE_DELIVERY1
    delivery2=ConstantVariables::UPGRADE_DELIVERY2
    delivery3=ConstantVariables::UPGRADE_DELIVERY3
    delivery4=ConstantVariables::UPGRADE_DELIVERY4
    delivery5=ConstantVariables::UPGRADE_DELIVERY5
    delivery6=ConstantVariables::UPGRADE_DELIVERY6
  end


  #
  domain='qa-server5'
  user_name='user_s'
  password='1234'
  ob=SignIn::ADUserSignIn.new
  ob.ad_user_signin(server,driver,user_name,password,domain)


  sleep 2

  ##Create express delivery

  ob=UserPreference::SetPreferences.new
  ob.applet_set_no(server,driver)

  #####Create express delivery

  recipient='User R<user_r@qa-server5.com>'
  # cc='sakib3@nilavodev.com'
  # bcc='sakib4@nilavodev.com'
  delivery_name="HTML Express Delivery 1"
  filename='C:\Users\Sakib\RubymineProjects\General_SFT_5.0\Files\test.txt'
  ob=ExpressDelivery::CreateExpressDelivery.new
  ob.send_express_delivery_ckeditor_html5(server,driver,recipient,delivery_name,filename,browser)


  user='user_r@qa-server5.com'
  member='user_rsrp@qa-server5.com'
  managed='user_rs@qa-server5.com'
  shared='user_rsrpa@qa-server5.com'
  group_name='TestGroup'

  # ob=Contacts::CreateContact.new
  # ob.create_user_contact(server,driver,user)
  # ob.create_group_contact(server,driver,group_name,member,managed,shared)


  recipient='TestGroup'
  delivery_name="Test Express Delivery Local Group 1"
  filename='C:\Users\Sakib\RubymineProjects\General_SFT_5.0\Files\test.txt'
  ob=ExpressDelivery::CreateExpressDelivery.new
  ob.send_express_delivery_ckeditor_html5(server,driver,recipient,delivery_name,filename,browser)

  recipient='Recipient_Group'
  delivery_name="Test Express Delivery AD Group 1"
  filename='C:\Users\Sakib\RubymineProjects\General_SFT_5.0\Files\test.txt'
  ob=ExpressDelivery::CreateExpressDelivery.new
  ob.send_express_delivery_ckeditor_html5(server,driver,recipient,delivery_name,filename,browser)

  recipient='user_r@qa-server5.com'
  delivery_name='Express Delivery AD user 1'
  ob=ExpressDelivery::CreateExpressDelivery.new
  ob.send_express_delivery_applet_ckeditor(server,driver,recipient,delivery_name)


  package_name='AD Package 1'
  filename='C:\Users\Sakib\RubymineProjects\General_SFT_5.0\Files\test.txt'
  ob=Package::CreatePackage.new
  ob.create_package_html5(server,driver,package_name,filename)

  package_name='Test Package witout Applet 1'
  ob=Package::CreatePackage.new
  ob.create_package_applet(server,driver,package_name)

  ob=SignOut::UserSignOut.new
  ob.sign_out(server,driver)

  user_name='user_r'
  password='1234'
  ob=SignIn::ADUserSignIn.new
  ob.ad_user_signin(server,driver,user_name,password,domain)
=begin
# ob=TermsOfService::TOS.new
# ob.tos_accept(server,driver,tos_value)
=end
  sleep 2


  recipient='TestGroup'
  delivery_name="Test Express Delivery Local Group 1"
  filename='C:\Users\Sakib\RubymineProjects\General_SFT_5.0\Files\test.txt'
  ob=ExpressDelivery::CreateExpressDelivery.new
  ob.send_express_delivery_ckeditor_html5(server,driver,recipient,delivery_name,filename,browser)

  recipient='Recipient_Group'
  delivery_name="Test Express Delivery AD Group 1"
  filename='C:\Users\Sakib\RubymineProjects\General_SFT_5.0\Files\test.txt'
  ob=ExpressDelivery::CreateExpressDelivery.new
  ob.send_express_delivery_ckeditor_html5(server,driver,recipient,delivery_name,filename,browser)

  recipient='user_r@qa-server5.com'
  delivery_name='Express Delivery AD user 1'
  ob=ExpressDelivery::CreateExpressDelivery.new
  ob.send_express_delivery_applet_ckeditor(server,driver,recipient,delivery_name)


  package_name='AD Package 1'
  filename='C:\Users\Sakib\RubymineProjects\General_SFT_5.0\Files\test.txt'
  ob=Package::CreatePackage.new
  ob.create_package_html5(server,driver,package_name,filename)

  package_name='Test Package witout Applet 1'
  ob=Package::CreatePackage.new
  ob.create_package_applet(server,driver,package_name)

  ob=SignOut::UserSignOut.new
  ob.sign_out(server,driver)


  user_name='user_r'
  password='1234'
  ob=SignIn::ADUserSignIn.new
  ob.ad_user_signin(server,driver,user_name,password,domain)
=begin
# ob=TermsOfService::TOS.new
# ob.tos_accept(server,driver,tos_value)
=end
  sleep 2

  delivery_name='Express Delivery AD user 1'
  file_name='appletFile.txt'
  ob=Received::ReceivedDeliveries.new
  ob.received_delivery(server,driver,delivery_name,file_name)

  delivery_name='HTML Express Delivery 1'
  file_name='test.txt'
  ob=Received::ReceivedDeliveries.new
  ob.received_delivery(server,driver,delivery_name,file_name)

  ob=SecureReply::DeliverySecureReply.new
  ob.secure_reply_applet_direct_ckeditor(server,driver)
  #
  ob=UserPreference::SetPreferences.new
  ob.applet_settings(server,driver)

  delivery_name=delivery4
  #delivery_name='Test Express Delivery AD Gro...'#### For Upgrade
  file_name='test.txt'
  ob=Received::ReceivedDeliveries.new
  ob.received_delivery(server,driver,delivery_name,file_name)

  file_name='test.txt'
  ob=SecureReply::DeliverySecureReply.new
  ob.secure_reply_all_ckeditor(server,driver,file_name)

  delivery_name='Test Express Delivery Local Group 1'
  file_name='test.txt'
  ob=Received::ReceivedDeliveries.new
  ob.received_delivery(server,driver,delivery_name,file_name)

  ob=SignOut::UserSignOut.new
  ob.sign_out(server,driver)

  user_name='user_rs'
  password='1234'
  ob=SignIn::ADUserSignIn.new
  ob.ad_user_signin(server,driver,user_name,password,domain)

  ob=UserPreference::SetPreferences.new
  ob.applet_set_no(server,driver)
  delivery_name=delivery4
  #delivery_name='Test Express Delivery AD Gro...' ###For Upgrade




  if inbox=='off'
    ob=UserPreference::SetPreferences.new
    ob.applet_settings(server,driver)

    file_name='test.txt'
    ob=Received::ReceivedDeliveries.new
    ob.received_delivery(server,driver,delivery_name,file_name)
    ob=SecureReply::DeliverySecureReply.new
    ob.secure_reply_all_ckeditor(server,driver,file_name)
  else
    version='fresh'
    file_name='test.txt'
    ob=UserPreference::SetPreferences.new
    ob.applet_set_no(server,driver)
    ob=Received::ReceivedDeliveries.new
    ob.received_delivery(server,driver,delivery_name,file_name)
    ob=SecureReply::DeliverySecureReply.new
    recipients='user_r@qa-server5.com'
    reply_num=1
    ob=SecureReply::DeliverySecureReply.new
    ob.secure_reply_in_inbox(server, driver,delivery_name, version, recipients,reply_num)
    ob.secure_reply_applet_ckeditor(server,driver)
  end

  user_name='user_r'
  password='1234'
  ob=SignIn::ADUserSignIn.new
  ob.ad_user_signin(server,driver,user_name,password,domain)

  delivery_name=delivery4
  #delivery_name='Test Express Delivery AD Gro...' ###For Upgrade
  file_name='test.txt'
  ob=Received::ReceivedDeliveries.new
  ob.received_delivery(server,driver,delivery_name,file_name)
  #
  if inbox=='off'
    file_name='test.txt'
    ob=SecureReply::DeliverySecureReply.new
    ob.secure_reply_all_ckeditor(server,driver,file_name)
  else
    ob=UserPreference::SetPreferences.new
    ob.applet_set_no(server,driver)
    delivery_name=delivery4
    #delivery_name='Test Express Delivery AD Gro...' ###For Upgrade
    version='fresh'
    file_name='test.txt'
    recipients='user_r@qa-server5.com'
    reply_num=2
    ob=SecureReply::DeliverySecureReply.new
    ob.secure_reply_in_inbox(server, driver,delivery_name, version, recipients,reply_num)
    ob.secure_reply_applet_ckeditor(server,driver)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,driver)

    user_name='user_s'
    password='1234'
    #file_name='test.txt'
    ob=SignIn::ADUserSignIn.new
    ob.ad_user_signin(server,Thread.current[:driver],user_name,password,domain)
    delivery_name=delivery4
    #delivery_name='Test Express Delivery AD Gro...' ###For Upgrade
    reply_num=1
    while reply_num<3
      recipients='user_rs@qa-server5.com'
      ob=SecureReply:: DeliverySecureReply.new
      ob.secure_reply_in_inbox(server, Thread.current[:driver],delivery_name, version, recipients,reply_num)
      reply_num+=1
    end
    reply_num=1
    delivery_name='HTML Express Delivery 1'
    recipients='user_r@qa-server5.com'
    ob=SecureReply:: DeliverySecureReply.new
    ob.secure_reply_in_inbox(server, Thread.current[:driver],delivery_name, version, recipients,reply_num)
  end

end