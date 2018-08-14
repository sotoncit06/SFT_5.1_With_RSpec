require 'all_require'
def create_user(server, driver, browser)

  ob=SignIn::UserSignIn.new
  ob.user_signin(server,driver,'admin', 'admin')


  ob=LimitedSender::LimitedSenderConfiguration.new
  ob.enable_limited_sender(server,driver)

  ob=Home::GoToHome.new
  ob.home_page(server, driver)

  ob=Compliance::ComplianceSettings.new
  ob.enable_compliance(server, driver)


  ob=UserCreation::CreateUser.new
  ob.create_system_admin(server, driver, 'tanim1@nilavodev.com', '1234')

  ob=Home::GoToHome.new
  ob.home_page(server, driver)

  ob=UserCreation::CreateUser.new
  ob.create_limited_sender(server, driver,'tanim2@nilavodev.com', '1234')

  ob=Home::GoToHome.new
  ob.home_page(server, driver)

  ob=UserCreation::CreateUser.new
  ob.create_user_recipient(server, driver,'tanim3@nilavodev.com', '1234')

  ob=Home::GoToHome.new
  ob.home_page(server, driver)

  ob=UserCreation::CreateUser.new
  ob.create_user_recipient(server, driver,'tanim4@nilavodev.com', '1234')

  ob=Home::GoToHome.new
  ob.home_page(server, driver)


  ob=UserCreation::CreateUser.new
  ob.create_user_compliance(server, driver, 'tanim5@nilavodev.com', '1234')

  ob=Home::GoToHome.new
  ob.home_page(server, driver)

  role=1
  ob=EditUser::UserEdit.new
  ob.user_role_edit(server, driver, 'tanim1@nilavodev.com',role )

  ob=Home::GoToHome.new
  ob.home_page(server, driver)

  role=2
  ob=EditUser::UserEdit.new
  ob.user_role_edit(server, driver, 'tanim2@nilavodev.com',role )


end