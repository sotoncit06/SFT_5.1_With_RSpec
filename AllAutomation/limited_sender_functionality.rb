require 'all_require'


def ckeditor_limited_sender_functionality(server, driver, browser)

=begin
    ob=SignIn::UserSignIn.new
    ob.user_signin(server,driver,'tanim1@nilavodev.com', '1234')

    ob=LimitedSender::LimitedSenderConfiguration.new
    ob.enable_limited_sender(server,driver)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,driver)

    ob=SignIn::UserSignIn.new
    ob.user_signin(server,driver,'tanim2@nilavodev.com', '1234')

    recipient='tanim3@nilavodev.com'
    subject='Limited_sign_in'
    filename='c:\test.txt'
    #browser='chrome'

    ob=ExpressDelivery::CreateExpressDelivery.new
    ob.ckeditor_send_limited_express_delivery_all_automation(server,driver, recipient, subject,filename, browser)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,driver)

    ob=SignIn::UserSignIn.new
    ob.user_signin(server,driver,'tanim3@nilavodev.com', '1234')

    delivery_name='Limited_sign_in'
    file_name='test.txt'

    ob=LimitedSender::LimitedSenderConfiguration.new
    ob.received_delivery(server,driver,delivery_name,file_name)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,driver)

    ob=SignIn::UserSignIn.new
    ob.user_signin(server,driver, 'tanim1@nilavodev.com', '1234')

    ob=LimitedSender::LimitedSenderConfiguration.new
    ob.require_sender_to_sign_in_uncheck(server,driver)


    ob=SignOut::UserSignOut.new
    ob.sign_out(server,driver)

    ob=LimitedSender::LimitedSenderConfiguration.new
    ob.go_send_do_page(server, driver)


    sender='tanim2@nilavodev.com'
    recipient='tanim3@nilavodev.com'
    subject='Limited_no_sign_in'
    filename='c:\test.txt'
    #browser='chrome'
    ob=LimitedSender::LimitedSenderConfiguration.new
    ob.ckeditor_send_limited_delivery_send_do_all_automation(server,driver,sender,recipient,subject,filename, browser)

    ob=SignIn::UserSignIn.new
    ob.user_signin(server,driver, 'tanim2@nilavodev.com', '1234')

    # subject='Limited_no_sign_in'
    # filename='c:\test.txt'
    # ob=LimitedSender::LimitedSenderConfiguration.new
    # ob.view_delivery(server,driver,subject,filename)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,driver)
=end
=begin
    ob=SignIn::UserSignIn.new
    ob.user_signin(server,driver, 'tanim1@nilavodev.com', '1234')

    ob=LimitedSender::LimitedSenderConfiguration.new
    ob.require_sender_to_sign_in_check(server,driver)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,driver)

    ob=LimitedSender::LimitedSenderConfiguration.new
    ob.go_send_do_page(server, driver)

    ob=Home::GoToHome.new
    ob.home_page(server, driver)


    ob=SignIn::UserSignIn.new
    ob.user_signin(server,driver, 'tanim1@nilavodev.com', '1234')

    ob=LimitedSender::LimitedSenderConfiguration.new
    ob.require_sender_to_sign_in_uncheck(server,driver)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,driver)

    ob=LimitedSender::LimitedSenderConfiguration.new
    ob.go_send_do_page(server, driver)

    sender='tanim3@nilavodev.com'
    recipient='tanim4@nilavodev.com'
    subject='Limited_no_sign_in'
    filename='c:\test.txt'
    #browser='chrome'
    ob=LimitedSender::LimitedSenderConfiguration.new
    ob.ckeditor_send_limited_delivery_send_do_all_automation(server,driver,sender,recipient,subject,filename, browser)

    # ob=Home::GoToHome.new
    # ob.home_page(server, driver)

    ob=SignIn::UserSignIn.new
    ob.user_signin(server,driver, 'tanim1@nilavodev.com', '1234')


    restrict_recipients='*@test.com '
    ob=LimitedSender::LimitedSenderConfiguration.new
    ob.restrict_recipients(server, driver,restrict_recipients)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,driver)

    ob=SignIn::UserSignIn.new
    ob.user_signin(server,driver,'tanim2@nilavodev.com', '1234')

    recipient='tanim3@nilavodev.com'
    subject='Limited2'
    filename='c:\test.txt'
    #browser='chrome'

    ob=ExpressDelivery::CreateExpressDelivery.new
    ob.ckeditor_send_limited_express_delivery_all_automation(server,driver, recipient, subject,filename, browser)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,driver)

    ob=SignIn::UserSignIn.new
    ob.user_signin(server,driver, 'tanim1@nilavodev.com', '1234')

    restrict_recipients='*@nilavodev.com '
    ob=LimitedSender::LimitedSenderConfiguration.new
    ob.restrict_recipients(server, driver,restrict_recipients)

    ob=SignIn::UserSignIn.new
    ob.user_signin(server,driver,'tanim2@nilavodev.com', '1234')

    recipient='tanim3@nilavodev.com'
    subject='Limited3'
    filename='c:\test.txt'
    #browser='chrome'

    ob=ExpressDelivery::CreateExpressDelivery.new
    ob.ckeditor_send_limited_express_delivery_all_automation(server,driver, recipient, subject,filename, browser)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,driver)

    ob=SignIn::UserSignIn.new
    ob.user_signin(server,driver,'tanim1@nilavodev.com', '1234')

    recipient='tanim1@nilavodev.com '
    ob=LimitedSender::LimitedSenderConfiguration.new
    ob.default_recipient(server, driver,recipient)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,driver)

    ob=LimitedSender::LimitedSenderConfiguration.new
    ob.go_send_do_page(server, driver)

    ob=Home::GoToHome.new
    ob.home_page(server, driver)

    ob=SignIn::UserSignIn.new
    ob.user_signin(server,driver,'tanim1@nilavodev.com', '1234')

    user='nilavodev.com'
    ob=LimitedSender::LimitedSenderConfiguration.new
    ob.list_user(server,driver, user)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,driver)


    ob=LimitedSender::LimitedSenderConfiguration.new
    ob.go_send_do_page(server, driver)

    sender='tanim2@nilavodev.com'
    recipient='tanim3@nilavodev.com'
    subject='Select_recipients'
    filename='c:\test.txt'
    #browser='chrome'

    ob=LimitedSender::LimitedSenderConfiguration.new
    ob.ckeditor_select_recipient(server,driver,sender,recipient,subject,filename, browser)


    ob=SignIn::UserSignIn.new
    ob.user_signin(server,driver,'tanim1@nilavodev.com', '1234')

    ob=LimitedSender::LimitedSenderConfiguration.new
    ob.file_size_delivery_expire(server,driver)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,driver)
=end
    ob=LimitedSender::LimitedSenderConfiguration.new
    ob.go_send_do_page(server, driver)

    sender='tanim2@nilavodev.com'
    recipient='tanim3@nilavodev.com'
    subject='Delivery_restrict'
    filename1='c:\Users\Sakib\Desktop\Files for upload applet summery\Quality Attributes.doc'
    filename2='C:\test.txt'
    #browser='chrome'
    ob=LimitedSender::LimitedSenderConfiguration.new
    ob.ckeditor_file_restrict_test(server,driver,sender,recipient,subject,filename1,filename2, browser)

    ob=SignIn::UserSignIn.new
    ob.user_signin(server,driver,'tanim1@nilavodev.com', '1234')

    ob=LimitedSender::LimitedSenderConfiguration.new
    ob.default_setting(server,driver)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,driver)

  end
