require 'all_require'

def sorting_printing_view(server, driver, browser)


  ob=SignIn::UserSignIn.new
  ob.user_signin(server, driver, 'tanim1@nilavodev.com', '1234')

  ob=UserPreference::SetPreferences.new
  ob.applet_set_no(server, driver)

  recipient='tanim2@nilavodev.com'
  subject='Sorting_printing_view'
  ob=ExpressDelivery::CreateExpressDelivery.new
  ob.send_express_delivery_applet(server,Thread.current[:driver],recipient, subject)

  ob=SignOut::UserSignOut.new
  ob.sign_out(server,Thread.current[:driver])

  ob=SignIn::UserSignIn.new
  ob.user_signin(server, driver, 'tanim2@nilavodev.com', '1234')

  ob=UserPreference::SetPreferences.new
  ob.applet_set_no(server,Thread.current[:driver])

  delivery_name='Sorting_printing_view'
  ob=Received::ReceivedDeliveries.new
  ob.received_delivery_without_downloading_file(server,driver, delivery_name)

  ob=SecureReply::DeliverySecureReply.new
  ob.secure_reply_applet(server,driver)

  ob=SignOut::UserSignOut.new
  ob.sign_out(server,Thread.current[:driver])


  ob=SignIn::UserSignIn.new
  ob.user_signin(server, driver, 'tanim1@nilavodev.com', '1234')

  delivery_name='Sorting_printing_view'
  recipient_link='tanim2@nilavodev.com'
  ob=Sent::SentDeliveries.new
  ob.sent_delivery_access_status(server,driver,delivery_name,recipient_link)

  driver.find_element(:link,'Action').click
  sleep 2
  driver.find_element(:xpath, '//a[contains(text(),"Reply number")]').click
  sleep 2
  driver.find_element(:link,'Action').click
  sleep 2
  driver.find_element(:xpath, '//a[contains(text(),"Print preview")]').click

  ob=SignOut::UserSignOut.new
  ob.sign_out(server,Thread.current[:driver])

  ob=SignIn::UserSignIn.new
  ob.user_signin(server, driver, 'tanim2@nilavodev.com', '1234')

  delivery_name='Sorting_printing_view'
  ob=Received::ReceivedDeliveries.new
  ob.received_delivery_without_downloading_file(server,driver, delivery_name)

  file_path='C:\test.txt'
  ob=SecureReply::DeliverySecureReply.new
  ob.secure_reply_html5_without_clicking_action(server,driver,file_path)

  ob=SignOut::UserSignOut.new
  ob.sign_out(server,Thread.current[:driver])

  ob=SignIn::UserSignIn.new
  ob.user_signin(server, driver, 'tanim1@nilavodev.com', '1234')

  delivery_name='Sorting_printing_view'
  recipient_link='tanim2@nilavodev.com'
  ob=Sent::SentDeliveries.new
  ob.sent_delivery_access_status(server,driver,delivery_name,recipient_link)

  driver.find_element(:link,'Action').click
  sleep 2
  driver.find_element(:xpath, '//a[contains(text(),"Reply number")]').click
  sleep 2
  driver.find_element(:link,'Action').click
  sleep 2
  driver.find_element(:xpath, '//a[contains(text(),"Reply number")]').click

  ob=SignOut::UserSignOut.new
  ob.sign_out(server,Thread.current[:driver])


end