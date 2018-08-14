$LOAD_PATH << '.'
require 'all_require_Cosmetic'

driver = Selenium::WebDriver.for :firefox
driver.manage.window.maximize
driver.get "http://intern/bds/Main.do"

#sign_in as Admin
puts "Logged In as admin"
$log_found.puts "Logged In as admin"
$log_not_found.puts "Logged In as admin"
$log_error_occured.puts "Logged In as admin"


obj=Sign_in::User_sign_in.new
obj.admin(driver)

obj = Menu_test::Side_Menu.new
obj.admin_side_menu(driver)


puts "Clicked on Reports"
$log_found.puts "Clicked on Reports"
$log_not_found.puts "Clicked on Reports"
$log_error_occured.puts "Clicked on Reports"

driver.find_element(:link, "Reports").click

obj.admin_reports(driver)

puts "Clicked on Administration"
$log_found.puts "Clicked on Administration"
$log_not_found.puts "Clicked on Administration"
$log_error_occured.puts "Clicked on Administration"

driver.find_element(:link, "Administration").click

obj.admin_administration(driver)

obj = Profile_settings::Profile.new
obj.user_profile(driver, "Admin", "Admin")

puts "Clicked on Server Configuration"
$log_found.puts "Clicked on Server Configuration"
$log_not_found.puts "Clicked on Server Configuration"
$log_error_occured.puts "Clicked on Server Configuration"

driver.find_element(:css, "img").click
driver.find_element(:css, "img").click

driver.find_element(:link, "Administration").click
driver.find_element(:link, "Server Configuration").click

obj = Text_finder::Find_text.new
obj.find_title_text(driver, "Server Configuration")
obj.find_title_text(driver, "View and update server and application settings")
sleep 2
#driver.find_element(:xpath, "//input[@value='Update']").click

obj = Button_check::Check_button.new
sleep 2
obj.is_button_present_using_xpath(driver, "//div[@id='e']/div[2]/form/div[3]/input", "Update")
#obj.is_button_present_using_xpath(driver, "container", "Update")
obj.is_button_present_using_link(driver, "Cancel", "Cancel")

obj = Server_config::Config_server.new
obj.check_all_options(driver)
sleep 2

obj.check_all_edit(driver)
sleep 2

obj.check_server_configuration(driver)
sleep 1
obj.check_email_and_notification_settings(driver)
sleep 1
obj.check_delivery_settings(driver)
sleep 1
obj.check_package_settings(driver)
sleep 1
obj.check_workspace_settings(driver)
sleep 1
obj.check_antivirus_settings(driver)
sleep 1
obj.check_user_settings(driver)
sleep 1
obj.check_contact_and_group_settings(driver)
sleep 1
obj.check_sign_in_and_password(driver)
sleep 1
obj.check_user_registration(driver)
sleep 1
obj.check_user_interface(driver)
sleep 1
obj.check_reCAPTCHA_image_verification_settings(driver)
sleep 1
obj.check_microsoft_outlook_settings(driver)
sleep 1
obj.check_SMTP_API_settings(driver)
sleep 1
obj.check_proxy_server_settings(driver)
sleep 1
obj.check_intranet_and_extranet_settings(driver)
sleep 1
obj.check_mobile_settings(driver)
sleep 1







