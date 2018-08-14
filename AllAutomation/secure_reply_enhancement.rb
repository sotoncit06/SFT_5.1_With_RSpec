require 'all_require'

def secure_reply_enhancement(server, driver,browser)



  ob=SignIn::UserSignIn.new
  ob.user_signin(server, driver, 'tanim1@nilavodev.com', '1234')

  delivery_name='Test1'
  version='fresh'
  recipients='tanim2@nilavodev.com'
  ob=SecureReply::DeliverySecureReply.new
  ob.secure_reply_in_inbox(server, driver,delivery_name,version, recipients)

  recipient='tanim2@nilavodev.com'
  subject='Test1'
  ob=ExpressDelivery::CreateExpressDelivery.new
  ob.send_express_delivery_applet_ckeditor(server,Thread.current[:driver],recipient, subject)

  ob=SignOut::UserSignOut.new
  ob.sign_out(server,Thread.current[:driver])

  ob=SignIn::UserSignIn.new
  ob.user_signin(server, driver, 'tanim2@nilavodev.com', '1234')

  delivery_name='Test1'
  ob=SecureReply::DeliverySecureReply.new
  ob.secure_reply_from_inbox_ckeditor_with_applet(server,driver, delivery_name)

  subject='delivery_name'
  ob=Sent::SentDeliveries.new
  ob.view_sent_items(server, driver, subject)


  ob=SignOut::UserSignOut.new
  ob.sign_out(server,Thread.current[:driver])

  ob=SignIn::UserSignIn.new
  ob.user_signin(server, driver, 'tanim1@nilavodev.com', '1234')

  delivery_name='Re: Test1 (#1)'
  filename='C:\test.txt'
  ob=SecureReply::DeliverySecureReply.new
  ob.secure_reply_from_inbox_ckeditor_without_applet(server, driver, delivery_name, browser, filename)

  subject='Re: Test1 (#2)'
  ob=Sent::SentDeliveries.new
  ob.view_sent_items(server, driver, subject)

  ob=SignOut::UserSignOut.new
  ob.sign_out(server,Thread.current[:driver])

  ob=SignIn::UserSignIn.new
  ob.user_signin(server, driver, 'tanim2@nilavodev.com', '1234')

  delivery_name='Re: Test1 (#2)'
  filename='C:\test.txt'
  ob=SecureReply::DeliverySecureReply.new
  ob.secure_reply_from_inbox_ckeditor_without_applet(server, driver, delivery_name, browser, filename)

  subject='Re: Test1 (#3)'
  ob=Sent::SentDeliveries.new
  ob.view_sent_items(server, driver, subject)

  ob=SignOut::UserSignOut.new
  ob.sign_out(server,Thread.current[:driver])


  ob=SignIn::UserSignIn.new
  ob.user_signin(server, driver, 'tanim1@nilavodev.com', '1234')

  delivery_name='Re: Test1 (#3)'
  filename='C:\test.txt'
  ob=SecureReply::DeliverySecureReply.new
  ob.secure_reply_from_inbox_ckeditor_without_applet(server, driver, delivery_name, browser, filename)

  subject='Re: Test1 (#4)'
  ob=Sent::SentDeliveries.new
  ob.view_sent_items(server, driver, subject)

  ob=SignOut::UserSignOut.new
  ob.sign_out(server,Thread.current[:driver])


  ob=SignIn::UserSignIn.new
  ob.user_signin(server, driver, 'admin', 'admin')

  ob=SecureReply::DeliverySecureReply.new
  ob.show_secure_reply_section_by_default(server, driver, browser)

  ob=SignOut::UserSignOut.new
  ob.sign_out(server,Thread.current[:driver])

  ob=SignIn::UserSignIn.new
  ob.user_signin(server, driver, 'tanim1@nilavodev.com', '1234')

  # ob=UserPreference::SetPreferences.new
  # ob.applet_set_no(server, driver)

  recipient='tanim2@nilavodev.com'
  subject='Test_reply2'
  ob=ExpressDelivery::CreateExpressDelivery.new
  ob.send_express_delivery_applet_ckeditor(server,Thread.current[:driver],recipient, subject)

  ob=SignOut::UserSignOut.new
  ob.sign_out(server,Thread.current[:driver])

  ob=SignIn::UserSignIn.new
  ob.user_signin(server, driver, 'tanim2@nilavodev.com', '1234')

  ob=UserPreference::SetPreferences.new
  ob.applet_settings(server,Thread.current[:driver])

  delivery_name='Test_reply2'
  ob=Received::ReceivedDeliveries.new
  ob.received_delivery_without_downloading_file(server,driver, delivery_name)

  # file_path='C:\test.txt'
  ob=SecureReply::DeliverySecureReply.new
  ob.ckeditor_default_secure_reply_with_applet(server,driver, delivery_name)

  ob=SignOut::UserSignOut.new
  ob.sign_out(server,Thread.current[:driver])

  ob=SignIn::UserSignIn.new
  ob.user_signin(server, driver, 'admin', 'admin')

  ob=SecureReply::DeliverySecureReply.new
  ob.show_secure_reply_section_by_default(server, driver, browser)

  ob=SignOut::UserSignOut.new
  ob.sign_out(server,Thread.current[:driver])


end