require 'all_require'

def ckeditor_limited_sender_role(server, driver, browser)

    ob=LimitedSender::LimitedSenderConfiguration.new
    ob.go_send_do_page(server,driver)

    sleep 2

    ob=SignIn::UserSignIn.new
    ob.user_signin(server,driver,'tanim1@nilavodev.com', '1234')

    ob=LimitedSender::LimitedSenderConfiguration.new
    ob.enable_limited_sender(server,driver)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,driver)

    ob=SignIn::UserSignIn.new
    ob.user_signin(server,driver,'tanim2@nilavodev.com', '1234')


    #sender='tanim2@nilavodev.com'
    recipient='tanim3@nilavodev.com'
    subject='Limited_sign_in'
    filename='c:\test.txt'
    #browser='chrome'
    ob=ExpressDelivery::CreateExpressDelivery.new
    ob.ckeditor_send_limited_express_delivery_all_automation(server,driver,recipient,subject,filename, browser)

    ob=Home::GoToHome.new
    ob.home_page(server,driver)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,driver)

    ob=SignIn::UserSignIn.new
    ob.user_signin(server,driver,'tanim3@nilavodev.com', '1234')

    delivery_name='Limited_sign_in'
    file_name='test.txt'
    ob=LimitedSender::LimitedSenderConfiguration.new
    ob.received_delivery(server,driver,delivery_name, file_name)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,driver)

    ob=SignIn::UserSignIn.new
    ob.user_signin(server,driver,'tanim1@nilavodev.com', '1234')

    ob=LimitedSender::LimitedSenderConfiguration.new
    ob.require_sender_to_sign_in_uncheck(server,driver)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,driver)

    ob=LimitedSender::LimitedSenderConfiguration.new
    ob.go_send_do_page(server,driver)

    sender='tanim2@nilavodev.com'
    recipient='tanim3@nilavodev.com'
    subject='Limited_no_sign_in'
    filename='c:\test.txt'
    #browser='chrome'
    ob=LimitedSender::LimitedSenderConfiguration.new
    ob.ckeditor_send_limited_delivery_send_do_all_automation(server,driver,sender,recipient,subject,filename, browser)

    # ob=Home::GoToHome.new
    # ob.home_page(server,driver)

    ob=SignIn::UserSignIn.new
    ob.user_signin(server,driver,'tanim3@nilavodev.com', '1234')
    filename='test.txt'
    ob=LimitedSender::LimitedSenderConfiguration.new
    ob.received_delivery(server,driver,subject, filename)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,driver)

end
