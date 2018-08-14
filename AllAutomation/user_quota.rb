$LOAD_PATH << '.'
$LOAD_PATH << 'C:\Users\Sakib\RubymineProjects\General_SFT_5.1'

require 'all_require'


puts "Please enter the number of the following servers"
puts "1. dahukv1\n2. feniv1\n3. internal\n4. tistav3:8080\n5. dahukv7\n6. atraiv1\n7. dahukv18\n8. rupshav13\n"
i= Integer(gets.chomp)
if i==1
        server="http://dahukv1:8080/bds"
        ip = "DAHUKV1"
elsif i==2
        server="http://feniv1/bds"
elsif i==3
        server="http://internal/bds"
elsif i==4
        server="http://tistav3:8080/bds"
elsif i==5
        #server="http://dahukv7:8080/bds"
        server="http://dahukv7/bds"



elsif i==6
        server="http://192.168.10.181:8080/bds"

elsif i==7
        server="http://dahukv18:8080/bds"
elsif i==8
        server="http://rupshav13/bds"
end
sleep 5
def setup(browsers,machine)
        Thread.current[:driver] = Selenium::WebDriver.for :remote, :url => "http://#{machine}:4444/wd/hub", :desired_capabilities => :"#{browsers}"
end
BROWSER = {firefox: 'localhost'}#,chrome: '192.168.10.230',internet_explorer: '192.168.10.174'}
threads=[]

BROWSER.each_pair do |browser, machine|
        # noinspection RubyScope,RubyScope
        threads << Thread.new do
                setup(browser,machine)
                domain='qa-server5'

=begin
                ob=SignIn::UserSignIn.new
                ob.admin(server,Thread.current[:driver])


                ob=AppletSettings::AppletConfiguration.new
                ob.applet_enable(server,Thread.current[:driver])

                ob=UserQuotaConfiguration::Quota.new
                ob.enable_quota(server,Thread.current[:driver])


                ob=LimitedSender::LimitedSenderConfiguration.new
                ob.enable_limited_sender(server,Thread.current[:driver])



                for i in 1..6
                        role=2
                        username= "sarja#{i}@nilavodev.com"
                        password="1As!#"
                        ob=UserCreation::CreateUser.new
                        ob.create_user_sender(server,Thread.current[:driver],username,password)

                        ob=EditUser::UserEdit.new
                        ob.user_role_edit(server,Thread.current[:driver],username,role)

                end

                ob=SignOut::UserSignOut.new
                ob.sign_out(server,Thread.current[:driver])



#user preference settings for html5#

                for i in 1..6

                        username="sarja#{i}@nilavodev.com"
                        password="1As!#"
                        ob=SignIn::UserSignIn.new
                        ob.user_signin(server,Thread.current[:driver],username,password)

                        ob=UserPreference::SetPreferences.new
                        ob.applet_set_no(server,Thread.current[:driver])


                        ob=SignOut::UserSignOut.new
                        ob.sign_out(server,Thread.current[:driver])


                end



#user preference settings for html5#




                username="sarja1@nilavodev.com"
                password="1As!#"
                ob=SignIn::UserSignIn.new
                ob.user_signin(server,Thread.current[:driver],username,password)

                ob=UserProfile::EditProfile.new
                ob.view_profile(server,Thread.current[:driver])

                ob=SignOut::UserSignOut.new
                ob.sign_out(server,Thread.current[:driver])




                ob=SignIn::UserSignIn.new
                ob.admin(server,Thread.current[:driver])




                ob=UserQuotaConfiguration::Quota.new
                ob.enable_quota(server,Thread.current[:driver])

                ob=UserQuotaConfiguration::QuotaConfiguration.new
                ob.quota_settings_by_admin(server,Thread.current[:driver])





                username="user_admin@nilavodev.com"
                user_edit = "user_admin@nilavodev.co..."
                password="1As!#"
                role=4

                ob=UserCreation::CreateUser.new
                ob.create_user_admin(server,Thread.current[:driver],username,password)
                sleep 4



                ob=EditUser::UserEdit.new
                ob.user_role_edit(server,Thread.current[:driver],username,role)






                sleep 5

                username="system_admin@nilavodev.com"
                password="1As!#"
                ob=UserCreation::CreateUser.new
                ob.create_system_admin(server,Thread.current[:driver],username,password)

                username="super_admin@nilavodev.com"
                password="1As!#"
                ob=UserCreation::CreateUser.new
                ob.create_super_admin(server,Thread.current[:driver],username,password)

                ob=SignOut::UserSignOut.new
                ob.sign_out(server,Thread.current[:driver])





                for i in 1..3

                        if i==1
                                name="user"
                        elsif i==2
                                name="system"
                        elsif i==3
                                name="super"
                        end

                        username="#{name}_admin@nilavodev.com"
                        password="1As!#"
                        ob=SignIn::UserSignIn.new
                        ob.user_signin(server,Thread.current[:driver],username,password)

                        quota=60                #The quota value will be set
                        option = "quota"        #Case is being selected
                        username= "sarja2@nilavodev.com"
                        ob=EditUser::UserEdit.new
                        ob.user_other_options_edit_two(server,Thread.current[:driver],username,option,quota)

                end

                ob=SignOut::UserSignOut.new
                ob.sign_out(server,Thread.current[:driver])
#1.1.14 ends

=end


                username="sarja1@nilavodev.com"
                password="1As!#"
                ob=SignIn::UserSignIn.new
                ob.user_signin(server,Thread.current[:driver],username,password)




=begin

                ob=UserProfile::EditProfile.new
                ob.view_profile(server,Thread.current[:driver])

                recipient="sarja2@nilavodev.com"
                subject="5MB file for sarja2 from sarja1 with html5 uploader"
                filename="5MB"
                ob=ExpressDelivery::CreateExpressDelivery.new
                ob.send_express_delivery_ckeditor_html5(server,Thread.current[:driver],recipient,subject,filename,browser)





                ob=UserProfile::EditProfile.new
                ob.view_profile(server,Thread.current[:driver])







                filename="4.5MB"
                subject="4.5 MB package"
                ob=Package::CreatePackage.new
                ob.create_package_html5(server,Thread.current[:driver],subject,filename)

                ob=Home::GoToHome.new
                ob.home_page(server,Thread.current[:driver])




# TODO: click home page and add alert accept urgent



                ob=UserProfile::EditProfile.new
                ob.view_profile(server,Thread.current[:driver])

                ob=Home::GoToHome.new
                ob.home_page(server,Thread.current[:driver])





                recipient="sarja2@nilavodev.com"
                subject="5MB file for sarja2 from sarja1 with html5 uploader"
                filename="5MB"
                ob=ExpressDelivery::CreateExpressDelivery.new
                ob.send_express_delivery_ckeditor_html5(server,Thread.current[:driver],recipient,subject,filename,browser)

                ob=Home::GoToHome.new
                ob.home_page(server,Thread.current[:driver])
#needed sure
                ob=AcceptAlert::AcceptAlertWindow.new
                ob.accept_alert_window(server,Thread.current[:driver])

# TODO: click home page and add alert accept urgent
                sleep(5)

=end

#2.1.8
                recipient="sarja2@nilavodev.com"
                subject=".5MB file for sarja2 from sarja1 with html5 uploader"
                filename="500KB"
                ob=ExpressDelivery::CreateExpressDelivery.new
                ob.send_express_delivery_ckeditor_html5(server,Thread.current[:driver],recipient,subject,filename,browser)


                ob=Home::GoToHome.new
                ob.home_page(server,Thread.current[:driver])

                sleep(5)



                recipient="sarja2@nilavodev.com"
                subject="No file (without attachment) for sarja2 from sarja1 with html5 uploader"
                ob=ExpressDelivery::CreateExpressDelivery.new
                ob.send_express_delivery_html5_without_attachment_ckeditor(server,Thread.current[:driver],recipient,subject)
                sleep 5




                filename="4.5MB"
                packagename="New package"
                ob=Package::CreatePackage.new
                ob.create_package_html5(server,Thread.current[:driver],packagename,filename)
                sleep 5

                ob=Home::GoToHome.new
                ob.home_page(server,Thread.current[:driver])
#sure needed
                ob=AcceptAlert::AcceptAlertWindow.new
                ob.accept_alert_window(server,Thread.current[:driver])

# TODO: click home page and add alert accept urgent

                ob=SignOut::UserSignOut.new
                ob.sign_out(server,Thread.current[:driver])


                username="sarja2@nilavodev.com"
                password="1As!#"
                ob=SignIn::UserSignIn.new
                ob.user_signin(server,Thread.current[:driver],username,password)





#2.1.13
                delivery_name="5MB file for sarja2 from sarja1 with html5 uploade..."
#delivery_name_2="5MB file for sarja2 from sar..."
                file_name="5MB"
                ob=Received::ReceivedDeliveries.new
                ob.received_delivery(server,Thread.current[:driver],delivery_name,file_name)



                file_path="C:\\User quota sample files\\5MB"
                ob=SecureReply::DeliverySecureReply.new
                ob.secure_reply_html5_without_using_action_menu_ckeditor(server,Thread.current[:driver],file_path)



                ob=Home::GoToHome.new
                ob.home_page(server,Thread.current[:driver])

#not needed

# ob=AcceptAlert::AcceptAlertWindow.new
# ob.accept_alert_window(server,Thread.current[:driver])


# TODO: click home page and add alert accept urgent
                sleep 5

                recipient="sarja1@nilavodev.com"
                subject="5MB for sarja1 from sarja2 with html5 uploader"
                filename="5MB"
                ob=ExpressDelivery::CreateExpressDelivery.new
                ob.send_express_delivery_ckeditor_html5(server,Thread.current[:driver],recipient,subject,filename,browser)


                ob=Home::GoToHome.new
                ob.home_page(server,Thread.current[:driver])
# not needed
# ob=AcceptAlert::AcceptAlertWindow.new
# ob.accept_alert_window(server,Thread.current[:driver])


# TODO: click home page and add alert accept urgent

                filename="4.5MB"
                packagename="New package"
                ob=Package::CreatePackage.new
                ob.create_package_html5(server,Thread.current[:driver],packagename,filename)

                ob=Home::GoToHome.new
                ob.home_page(server,Thread.current[:driver])


#sure needed
                ob=AcceptAlert::AcceptAlertWindow.new
                ob.accept_alert_window(server,Thread.current[:driver])

# TODO: click home page and add alert accept urgent
                sleep 5


                recipient="sarja1@nilavodev.com"
                subject="5MB for sarja1 from sarja2 with html5 uploader"
                file_name="5MB"
                ob=ExpressDelivery::CreateExpressDelivery.new
                ob.send_express_delivery_ckeditor_html5(server,Thread.current[:driver],recipient,subject,file_name,browser)

                sleep 5

                ob=Home::GoToHome.new
                ob.home_page(server,Thread.current[:driver])
#sure needed
                ob=AcceptAlert::AcceptAlertWindow.new
                ob.accept_alert_window(server,Thread.current[:driver])


# TODO: click home page and add alert accept urgent
                ob=Home::GoToHome.new
                ob.home_page(server,Thread.current[:driver])

#2.1.18

                packagename="5MB for sarja1 from sarja2 with html5 uploader"
                packagename2="5MB for sarja1 from sarja2 wit..."
                filename="5MB"
                ob=Package::EditPackage.new
                ob.edit_package_html5(server,Thread.current[:driver],packagename2,filename)
                sleep 5

# packagename= "5MB for sarja1 from sarja2 with html5 uploader" TODO: This block is not applicable. will be fixed in future
# ob=Package::DeletePackage.new
# ob.delete_package(server,Thread.current[:driver],packagename)
# sleep 2


                ob=SignOut::UserSignOut.new
                ob.sign_out(server,Thread.current[:driver])



#2.1.20
                username="user_admin@nilavodev.com"
                password="1As!#"
                ob=SignIn::UserSignIn.new
                ob.user_signin(server,Thread.current[:driver],username,password)

                quota=5
                option = "quota"
                username= "sarja2@nilavodev.com"
                ob=EditUser::UserEdit.new
                ob.user_other_options_edit(server,Thread.current[:driver],username,option,quota)
                sleep 2

                ob=SignOut::UserSignOut.new
                ob.sign_out(server,Thread.current[:driver])

#2.1.22
                username="sarja2@nilavodev.com"
                password="1As!#"
                ob=SignIn::UserSignIn.new
                ob.user_signin(server,Thread.current[:driver],username,password)







                recipient="sarja1@nilavodev.com"
                subject="5MB file for sarja1 from sarja2 with html5 uploader"
                filename="5MB"
                ob=ExpressDelivery::CreateExpressDelivery.new
                ob.send_express_delivery_ckeditor_html5(server,Thread.current[:driver],recipient,subject,filename,browser)

                ob=Home::GoToHome.new
                ob.home_page(server,Thread.current[:driver])
#sure needed
                ob=AcceptAlert::AcceptAlertWindow.new
                ob.accept_alert_window(server,Thread.current[:driver])





# TODO: click home page and add alert accept urgent
                sleep 3

                deliveryname="5MB file for sarja2 from sarja1 with html5 uploade..."
                file_name="5MB"
                ob=Received::ReceivedDeliveries.new
                ob.received_delivery(server,Thread.current[:driver],deliveryname,file_name)

#2.1.24
                filepath="C:\\User quota sample files\\5MB"
                ob=SecureReply::DeliverySecureReply.new
                ob.secure_reply_html5_without_using_action_menu_ckeditor(server,Thread.current[:driver],filepath)

                ob=Home::GoToHome.new
                ob.home_page(server,Thread.current[:driver])
#sure needed
                ob=AcceptAlert::AcceptAlertWindow.new
                ob.accept_alert_window(server,Thread.current[:driver])

# TODO: click home page and add alert accept urgent

                ob=SignOut::UserSignOut.new
                ob.sign_out(server,Thread.current[:driver])


                ob=SignIn::UserSignIn.new
                ob.admin(server,Thread.current[:driver])


                ob=UserQuotaConfiguration::Quota.new
                ob.quota_settings_page(server,Thread.current[:driver])
                ob.set_quota(server,Thread.current[:driver],"50","30")


                ob=SignOut::UserSignOut.new
                ob.sign_out(server,Thread.current[:driver])



#2.1.26
                username="sarja2@nilavodev.com"
                password="1As!#"
                ob=SignIn::UserSignIn.new
                ob.user_signin(server,Thread.current[:driver],username,password)

                deliveryname="5MB file for sarja2 from sarja1 with html5 uploade..."
                file_name="5MB"
                ob=Received::ReceivedDeliveries.new
                ob.received_delivery(server,Thread.current[:driver],deliveryname,file_name)

                filepath="C:\\User quota sample files\\5MB"
                ob=SecureReply::DeliverySecureReply.new
                ob.secure_reply_html5_without_using_action_menu_ckeditor(server,Thread.current[:driver],filepath)
                sleep 3

                ob=Home::GoToHome.new
                ob.home_page(server,Thread.current[:driver])
#sure needed
                ob=AcceptAlert::AcceptAlertWindow.new
                ob.accept_alert_window(server,Thread.current[:driver])

#2.1.27
# TODO: click home page and add alert accept urgent

                ob=SignOut::UserSignOut.new
                ob.sign_out(server,Thread.current[:driver])





#2.1.27
                username="user_admin@nilavodev.com"
                password="1As!#"
                ob=SignIn::UserSignIn.new
                ob.user_signin(server,Thread.current[:driver],username,password)





                recipient="sarja2@nilavodev.com"
                subject="10MB file for sarja1 from sarja2 with html5 uploader limited"
                filename="10MB"
                ob=ExpressDelivery::CreateExpressDelivery.new
                ob.send_limited_express_delivery_ckeditor(server,Thread.current[:driver],recipient,subject,filename,browser)

                ob=Home::GoToHome.new
                ob.home_page(server,Thread.current[:driver])
                sleep 4

                recipient="sarja2@nilavodev.com"
                subject="10MB file for sarja1 from sarja2 with html5 uploader limited 2"
                filename="10MB"
                ob=ExpressDelivery::CreateExpressDelivery.new
                ob.send_limited_express_delivery_ckeditor(server,Thread.current[:driver],recipient,subject,filename,browser)

                ob=Home::GoToHome.new
                ob.home_page(server,Thread.current[:driver])
                sleep 4

                ob=UserProfile::EditProfile.new
                ob.view_profile(server,Thread.current[:driver])




                name_id="1"
                ob=ManageQuotaUsage::ManageQuota.new
                ob.select_manage_quota(server,Thread.current[:driver])
                ob.delete_ownership(server,Thread.current[:driver],name_id)
                sleep 5
                ob=SignOut::UserSignOut.new
                ob.sign_out(server,Thread.current[:driver])



#3.1 starts


                username="user_admin@nilavodev.com"
                password="1As!#"
                ob=SignIn::UserSignIn.new
                ob.user_signin(server,Thread.current[:driver],username,password)


                quota=30                #The quota value will be set
                option = "quota"        #Case is being selected
                username= "sarja2@nilavodev.com"
                ob=EditUser::UserEdit.new
                ob.user_other_options_edit(server,Thread.current[:driver],username,option,quota)

                ob=SignOut::UserSignOut.new
                ob.sign_out(server,Thread.current[:driver])

                username="sarja2@nilavodev.com"
                password="1As!#"
                ob=SignIn::UserSignIn.new
                ob.user_signin(server,Thread.current[:driver],username,password)


                owner_one="sarja1@nilavodev.com"
                owner_two="sarja3@nilavodev.com"
                sender="sarja2@nilavodev.com"
                packagename="Owner Test2"
                filename="5MB"

                ob=Package::CreatePackage.new
                ob.create_package_all_html5_multiple_owner(server,Thread.current[:driver],owner_one,owner_two,sender,packagename,filename)


                ob=UserProfile::EditProfile.new
                ob.view_profile(server,Thread.current[:driver])

                name_id="2"
                ob=ManageQuotaUsage::ManageQuota.new
                ob.select_manage_quota(server,Thread.current[:driver])
                ob.delete_ownership(server,Thread.current[:driver],name_id)


                ob=SignOut::UserSignOut.new
                ob.sign_out(server,Thread.current[:driver])






                username="sarja1@nilavodev.com"
                password="1As!#"
                ob=SignIn::UserSignIn.new
                ob.user_signin(server,Thread.current[:driver],username,password)

                ob=UserProfile::EditProfile.new
                ob.view_profile(server,Thread.current[:driver])

                name_id="5"
                ob=ManageQuotaUsage::ManageQuota.new
                ob.select_manage_quota(server,Thread.current[:driver])
                ob.delete_ownership(server,Thread.current[:driver],name_id)

                sleep 2
                ob=SignOut::UserSignOut.new
                ob.sign_out(server,Thread.current[:driver])

                username="sarja3@nilavodev.com"
                password="1As!#"
                ob=SignIn::UserSignIn.new
                ob.user_signin(server,Thread.current[:driver],username,password)

                ob=UserProfile::EditProfile.new
                ob.view_profile(server,Thread.current[:driver])

                name_id="1"
                ob=ManageQuotaUsage::ManageQuota.new
                ob.select_manage_quota(server,Thread.current[:driver])
                ob.delete_ownership(server,Thread.current[:driver],name_id)

                sleep 5
                ob=SignOut::UserSignOut.new
                ob.sign_out(server,Thread.current[:driver])


#3.1.16 ends here




#---AD user quota---#



                ob=SignIn::UserSignIn.new
                ob.admin(server,Thread.current[:driver])

                ob=UserQuotaConfiguration::Quota.new
                ob.set_quota(server,Thread.current[:driver],"50","10")

                ob=SignOut::UserSignOut.new
                ob.sign_out(server,Thread.current[:driver])


                ob=SignIn::UserSignIn.new
                ob.admin(server,Thread.current[:driver])

                #Temporary
                # ob=ExternalAuthenticationSource::AuthenticationSourceConf.new
                # ob.AD_authentication_source(server,Thread.current[:driver])


                ob=SignOut::UserSignOut.new
                ob.sign_out(server,Thread.current[:driver])

                username="user_s"
                password="1234"
                domain="qa-server5"
                ob=SignIn::ADUserSignIn.new
                ob.ad_user_signin(server,Thread.current[:driver],username,password,domain)

                ob=UserPreference::SetPreferences.new
                ob.applet_set_no(server,Thread.current[:driver])

                ob=UserProfile::EditProfile.new
                ob.view_profile(server,Thread.current[:driver])

                ob=SignOut::UserSignOut.new
                ob.sign_out(server,Thread.current[:driver])

                username="user_rs"
                password="1234"
                domain="qa-server5"
                ob=SignIn::ADUserSignIn.new
                ob.ad_user_signin(server,Thread.current[:driver],username,password,domain)

                ob=SignOut::UserSignOut.new
                ob.sign_out(server,Thread.current[:driver])
                username="user_s"
                password="1234"
                domain="qa-server5"

                ob=SignIn::ADUserSignIn.new
                ob.ad_user_signin(server,Thread.current[:driver],username,password,domain)



                recipient="user_rs@qa-server5.com"
                subject="5MB file for user_rs from user_s with html5 uploader"
                filename="5MB"
                ob=ExpressDelivery::CreateExpressDelivery.new
                ob.send_express_delivery_ckeditor_html5(server,Thread.current[:driver],recipient,subject,filename,browser)

                ob=UserProfile::EditProfile.new
                ob.view_profile(server,Thread.current[:driver])


                recipient="user_rs@qa-server5.com"
                subject="4.5MB file for user_rs from user_s with html5 uploader"
                filename="4.5MB"
                ob=ExpressDelivery::CreateExpressDelivery.new
                ob.send_express_delivery_ckeditor_html5(server,Thread.current[:driver],recipient,subject,filename,browser)

                ob=UserProfile::EditProfile.new
                ob.view_profile(server,Thread.current[:driver])


                recipient="user_rs@qa-server5.com"
                subject="5MB file for user_rs from user_s with html5 uploader"
                filename="5MB"
                ob=ExpressDelivery::CreateExpressDelivery.new
                ob.send_express_delivery_ckeditor_html5(server,Thread.current[:driver],recipient,subject,filename,browser)

                ob=Home::GoToHome.new
                ob.home_page(server,Thread.current[:driver])
#sure needed
                ob=AcceptAlert::AcceptAlertWindow.new
                ob.accept_alert_window(server,Thread.current[:driver])

                ob=SignOut::UserSignOut.new
                ob.sign_out(server,Thread.current[:driver])
#---AD user quota---#
#--- with applet quota testing----#

                username="sarja5@nilavodev.com"
                password="1As!#"
                ob=SignIn::UserSignIn.new
                ob.user_signin(server,Thread.current[:driver],username,password)#skaib1

                puts "5 MB file"
                subject="5 MB file with applet"
                recipient="sarja6@nilavodev.com"
                ob=ExpressDelivery::CreateExpressDelivery.new
                ob.send_express_delivery_applet_ckeditor(server,Thread.current[:driver],recipient,subject) #recipient

                ob=UserProfile::EditProfile.new
                ob.view_profile(server,Thread.current[:driver])


                ob=Home::GoToHome.new
                ob.home_page(server,Thread.current[:driver])

                puts "4.5 MB file"
                subject="4.5 MB file with applet"
                recipient="sarja6@nilavodev.com"
                ob=ExpressDelivery::CreateExpressDelivery.new
                ob.send_express_delivery_applet_ckeditor(server,Thread.current[:driver],recipient,subject) #recipient
                ob=UserProfile::EditProfile.new
                ob.view_profile(server,Thread.current[:driver])

                ob=Home::GoToHome.new
                ob.home_page(server,Thread.current[:driver])

                puts "5 MB file"
                subject="5 MB file with applet"
                recipient="sarja6@nilavodev.com"
                ob=ExpressDelivery::CreateExpressDelivery.new
                ob.send_express_delivery_applet_ckeditor(server,Thread.current[:driver],recipient,subject) #recipient


                ob=SignOut::UserSignOut.new
                ob.sign_out(server,Thread.current[:driver])


#--- with applet quota testing----#





        end
end
threads.each { |thread| thread.join }
