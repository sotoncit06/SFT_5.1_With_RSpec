require 'all_require'

def file_download_enhancements(server,driver,browser)

  password= ConstantVariables::PASSWORD
  small_file=ConstantVariables::SMALL_FILE
  large_file=ConstantVariables::LARGE_FILE


#------------------------------------File download enhancement testing-------------------------------------------------#

  ob=SignIn::UserSignIn.new
  ob.user_signin(server,Thread.current[:driver],ConstantVariables::USER_NAME[1],password)#skaib1

  delivery_name= "Small file without applet"
  file_name= "small_file"

  ob= Sent::SentDeliveries.new
  file_link = ob.sent_delivery_file_link_copy(server,Thread.current[:driver],delivery_name,file_name)

  ob=SignOut::UserSignOut.new
  ob.sign_out(server,Thread.current[:driver])

  ob=Link::LinkOpen.new
  ob.link_open_in_browser(server,Thread.current[:driver],file_link)

  ob=SignIn::UserSignIn.new
  ob.sign_in_with_password_only(server,Thread.current[:driver],password)

  ob=Received::ReceivedDeliveries.new
  ob.download_window_handle_only(server,Thread.current[:driver],file_name)

  ob=SignIn::UserSignIn.new
  ob.sign_in_with_password_only(server,Thread.current[:driver],password)

  ob=Received::ReceivedDeliveries.new
  ob.download_window_handle_only(server,Thread.current[:driver],file_name)

  ob=Link::LinkOpen.new
  ob.link_open_in_browser(server,Thread.current[:driver],file_link)

  ob=SignIn::UserSignIn.new
  ob.user_signin(server,Thread.current[:driver],ConstantVariables::USER_NAME[2],password)














#------------------------------------File download enhancement testing end---------------------------------------------#






end