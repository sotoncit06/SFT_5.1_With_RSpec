require 'all_require'

def session(server, driver, browser)


  password= '1234'
=begin
  username='admin'
  pass='admin'
  ob=SignIn::UserSignIn.new
  ob.user_signin(server, driver,username, pass)

  ob=UserQuotaConfiguration::Quota.new
  ob.disable_quota(server,driver)

  # ob=UserCreation::CreateUser.new
  # ob.create_user_sender(server, driver, 'tanim1@nilavodev.com', password)

  ob=Home::GoToHome.new
  ob.home_page(server, driver)

  timeout='1'
  ob=Session::SessionConfiguration.new
  ob.session_configuration(server, driver, timeout)

  ob=SignOut::UserSignOut.new
  ob.sign_out(server, driver)
=end

  ob=SignIn::UserSignIn.new
  ob.user_signin(server, driver,'tanim1@nilavodev.com', password)

  ob=UserPreference::SetPreferences.new
  ob.applet_set_no(server, driver)

  subject='Session_testing'
  filename='C:\Users\Sakib\RubymineProjects\General_SFT_5.0\Files\1gb.txt'
  #browser='firefox'
  recipient='tanim2@nilavodev.com'
  ob=Session::SessionConfiguration.new
  ob.ckeditor_session_send_express_delivery_html5(server,driver,recipient,subject,filename,browser)

  ob=SignOut::UserSignOut.new
  ob.sign_out(server, driver)

  ob=SignIn::UserSignIn.new
  ob.user_signin(server, driver,'admin', 'admin')

  timeout='20'
  ob=Session::SessionConfiguration.new
  ob.session_configuration(server, driver, timeout)

  ob=SignOut::UserSignOut.new
  ob.sign_out(server, driver)

end