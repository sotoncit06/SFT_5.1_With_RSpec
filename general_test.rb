$LOAD_PATH << '.'

require 'all_require'


puts "Please enter the number of the following servers"
puts "1. dahukv1\n2. feniv1\n3. internal\n4. tistav3:8080\n5. dahukv7\n6. atraiv1\n7. dahukv18\n8. rupshav13\n9. rupshav10"
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
  #server="http://192.168.11.47/bds"

elsif i==6
  server="http://192.168.10.181:8080/bds"

elsif i==7
  server="http://dahukv18:8080/bds"

elsif i==8
  server="http://rupshav13/bds"

elsif i==9
  server="http://rupshav10/bds"

end
sleep 5
#server="http://feniv1/bds"
#@driver = Selenium::WebDriver.for :ie
#@driver = Selenium::WebDriver.for :firefox
def setup(browsers,machine)
  Thread.current[:driver] = Selenium::WebDriver.for :remote, :url => "http://#{machine}:4444/wd/hub", :desired_capabilities => :"#{browsers}"
end
BROWSER = {firefox: 'localhost'}#,chrome: '192.168.10.230',internet_explorer: '192.168.10.174'}
threads=[]

BROWSER.each_pair do |browser, machine|
  threads << Thread.new do
    setup(browser,machine)
=begin
    #Thread.current[:driver].get"#{server}"

#     tos_value='This is new Terms Of Service'
#     driver=Thread.current[:driver]
# # ################### Sakib
#
#     user_name='admin'
#     password='admin'
#     ob=SignIn::UserSignIn.new
#     ob.user_signin(server,Thread.current[:driver],user_name,password)
#
#     ob=ServerConfiguration::ServerSetUp.new
#     ob.fresh_config(server,Thread.current[:driver])
#
#     ob=SignIn::UserSignIn.new
#     ob.user_signin(server,Thread.current[:driver],user_name,password)
#
#     mail_server='192.168.10.91'
#
#     ob=ServerConfiguration::ServerSetUp.new
#
#     ob.server_configuration(server,Thread.current[:driver])
#     ob.email_settings(server,Thread.current[:driver],mail_server)
#     ob.delivery_settings(server,Thread.current[:driver])
#     ob.package_settings(server,Thread.current[:driver])
#     ob.workspace_settings(server,Thread.current[:driver])
#     ob.antivirus_settings(server,Thread.current[:driver])
#
#     ob.user_settings(server,Thread.current[:driver])
#     ob.contact_and_group_settings(server,Thread.current[:driver])
#     ob.sign_in_and_password(server,Thread.current[:driver])
#     restricted_email='sakib0@nilavodev.com'
#     tos_value=ob.user_registration(server,Thread.current[:driver],restricted_email)
#     tos_value='This is new Terms Of Service'
#     ob.user_interface(server,Thread.current[:driver])
#
#     ob=SignOut::UserSignOut.new
#     ob.sign_out(server,Thread.current[:driver])
#
# #
#
# # # #####GAL
#      driver=Thread.current[:driver]
#
#     gal(server,driver,tos_value,browser)
# # ######
#      ob=SignOut::UserSignOut.new
#      ob.sign_out(server,Thread.current[:driver])
#
#
# #     ####OpenLDAP
#     open_ldap(server,driver,browser)
# #     #######
#     ob=SignOut::UserSignOut.new
#     ob.sign_out(server,Thread.current[:driver])
#
# ####SunOneLDAP
#     sun_one_ldap(server,driver,browser)
#
#     ob=SignOut::UserSignOut.new
#     ob.sign_out(server,Thread.current[:driver])
# #####
#

####Self Registration
#tos_value='test'
#

#     password='1234'
#     restricted_email='sakib0@nilavodev.com'
#     email=["sakib0@nilavodev.com","sakib1@nilavodev.com"]
#     self_registration(server,driver,email,password,tos_value,restricted_email,browser)
# #####################

=end

###################################### SARJA ######################################

#Admin Approve, Acc check, User settings, Delivery_app, Collaboration

#Admin Approval starts
     admin_approval(server,Thread.current[:driver],browser)
# #Account Check Starts
     account_check(server,Thread.current[:driver],browser)
# #User Settings starts
     user_settings(server,Thread.current[:driver],browser)
# #Delivery app starts
     delivery_app(server,Thread.current[:driver],browser)
# #Collaboration starts
     collaboration(server,Thread.current[:driver],browser)

# #file_download_enhancements(server,Thread.current[:driver],browser)




#
#
# ###################################### SARJA ######################################
#
# ###################################Tanim#########################################
#     sleep 2


    # user_name='admin'
    # password='admin'
    # ob=SignIn::UserSignIn.new
    # ob.user_signin(server,Thread.current[:driver],user_name,password)
    #
    #
    # ob=Compliance::ComplianceSettings.new
    # ob.enable_compliance(server, Thread.current[:driver])
# ####################################Tanim#########################################


    limited_sender_functionality(server, Thread.current[:driver], browser)
    #session(server, Thread.current[:driver], browser)
    #compliance_operations(server, Thread.current[:driver])
    #antivirus_functionality(server,Thread.current[:driver], browser)
    #workspace(server, Thread.current[:driver])


###################################Tanim#########################################
  end
end
threads.each { |thread| thread.join }
