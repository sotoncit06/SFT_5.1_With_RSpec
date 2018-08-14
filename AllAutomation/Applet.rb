require 'all_require'

def applet(server, driver, browser)

=begin

      ob=SignIn::UserSignIn.new
      ob.user_signin(server,driver,'tanim1@nilavodev.com', '1234')

      # role=1
      # ob=EditUser::UserEdit.new
      # ob.user_role_edit(server, driver, 'tanim2@nilavodev.com',role)

      # ob=AppletSettings::AppletConfiguration.new
      # ob.applet_enable(server, driver)

      ob=UserPreference::SetPreferences.new
      ob.applet_set_no(server, driver)

      ob=ExpressDelivery::CreateExpressDelivery.new
      ob.send_express_delivery_applet_ckeditor(server,driver,'tanim2@nilavodev.com','Applet1')

      ob=ExpressDelivery::CreateExpressDelivery.new
      ob.send_express_delivery_applet_ckeditor(server,driver,'tanim2@nilavodev.com','Applet2')

      ob=SignOut::UserSignOut.new
      ob.sign_out(server,driver)

      ob=File_restriction::File_restriction.new
      ob.file_restriction(server,driver)

      ob=SignOut::UserSignOut.new
      ob.sign_out(server,driver)

      ob=SignIn::UserSignIn.new
      ob.user_signin(server,driver,'tanim1@nilavodev.com', '1234')

      ob=ExpressDelivery::CreateExpressDelivery.new
      ob.send_express_delivery_applet_ckeditor(server,driver,'tanim2@nilavodev.com','Applet3')

      ob=Package::CreatePackage.new
      ob.create_package_applet(server,driver,browser)

      ob=Package::CreatePackage.new
      ob.create_package_applet(server,driver, browser)

      ob=Package::CreatePackage.new
      ob.create_package_applet(server,driver, browser)

      ob=SignOut::UserSignOut.new
      ob.sign_out(server,driver)
=end

      ob=SignIn::UserSignIn.new
      ob.user_signin(server,driver,'tanim2@nilavodev.com','1234')

      # ob=UserPreference::SetPreferences.new
      # ob.applet_set_no(server, driver)

      delivery_name='Applet1'
      # ob=Received::ReceivedDeliveries.new
      # ob.received_delivery_without_downloading_file(server,driver,delivery_name)

      ob=SecureReply::DeliverySecureReply.new
      ob.secure_reply_from_inbox_ckeditor_with_applet(server,driver, delivery_name)

      delivery_name='Applet2'
      # ob=Received::ReceivedDeliveries.new
      # ob.received_delivery_without_downloading_file(server,driver, delivery_name)

      ob=SecureReply::DeliverySecureReply.new
      ob.secure_reply_from_inbox_ckeditor_with_applet(server,driver,delivery_name)

      delivery_name='Applet3'
      # ob=Received::ReceivedDeliveries.new
      # ob.received_delivery_without_downloading_file(server,driver, delivery_name)

      ob=SecureReply::DeliverySecureReply.new
      ob.secure_reply_from_inbox_ckeditor_with_applet(server,driver, delivery_name)

      ob=SignOut::UserSignOut.new
      ob.sign_out(server, driver)


end
