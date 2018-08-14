module Server_config


  class Config_server

    found = "server_config_found_log.txt"
    not_found = "server_config_not_found_log.txt"
    error_occured = "server_config_error_occured_log.txt"
    checkbox_checked = "checkbox_check_log.txt"
    checkbox_unchecked = "checkbox_uncheck_log.txt"
    radio_checked = "radiobutton_check_log.txt"
    radio_unchecked = "radiobutton_uncheck_log.txt"
    content_match = "field_content_match.txt"
    content_does_not_match = "field_content_does_not_match.txt"
    $log_found = File.open(found, "w")
    $log_not_found = File.open(not_found, "w")
    $log_error_occured = File.open(error_occured, "w")
    $log_checkbox_checked = File.open(checkbox_checked, "w")
    $log_checkbox_unchecked = File.open(checkbox_unchecked, "w")
    $log_radio_checked = File.open(radio_checked, "w")
    $log_radio_unchecked = File.open(radio_unchecked, "w")
    $log_content_match = File.open(content_match, "w")
    $log_content_does_not_match = File.open(content_does_not_match, "w")
    #$log_file.puts "Hello file!"





    def check_all_options(driver)

      check_options_by_css(driver, "div.nlv-settings-row-title", "Server Configuration")
      check_options_by_css(driver, "#sec1 > div.nlv-settings-row-title", "Email and Notification Settings")
      check_options_by_css(driver, "#sec2 > div.nlv-settings-row-title", "Delivery Settings")
      check_options_by_css(driver, "#sec3 > div.nlv-settings-row-title", "Package Settings")
      check_options_by_css(driver, "#sec4 > div.nlv-settings-row-title", "Workspace Settings")
      check_options_by_css(driver, "#sec5 > div.nlv-settings-row-title", "Antivirus Settings")
      check_options_by_css(driver, "#sec6 > div.nlv-settings-row-title", "User Settings")
      check_options_by_css(driver, "#sec7 > div.nlv-settings-row-title", "Contact and Group Settings")
      check_options_by_css(driver, "#sec8 > div.nlv-settings-row-title", "Sign in and Password")
      check_options_by_css(driver, "#sec9 > div.nlv-settings-row-title", "User Registration")
      check_options_by_css(driver, "#sec10 > div.nlv-settings-row-title", "User Interface")
      check_options_by_css(driver, "#sec11 > div.nlv-settings-row-title", "reCAPTCHA Image Verification Settings")
      check_options_by_css(driver, "#sec12 > div.nlv-settings-row-title", "Microsoft Outlook Add-in Settings")
      check_options_by_css(driver, "#sec13 > div.nlv-settings-row-title", "SMTP API Settings")
      check_options_by_css(driver, "#sec14 > div.nlv-settings-row-title", "Proxy Server Settings")
      check_options_by_css(driver, "#sec15 > div.nlv-settings-row-title", "Intranet And Extranet Settings")
      check_options_by_css(driver, "#sec16 > div.nlv-settings-row-title", "Mobile Settings")

    end




    def check_all_edit(driver)

      check_options_by_css_for_edit(driver, "a.edit-link", "Edit", "Server Configuration")
      check_options_by_css_for_edit(driver, "#sec1 > div.pull-right.edit > a.edit-link", "Edit", "Email and Notification Settings")
      check_options_by_css_for_edit(driver, "#sec2 > div.pull-right.edit > a.edit-link", "Edit", "Delivery Settings")
      check_options_by_css_for_edit(driver, "#sec3 > div.pull-right.edit > a.edit-link", "Edit", "Package Settings")
      check_options_by_css_for_edit(driver, "#sec4 > div.pull-right.edit > a.edit-link", "Edit", "Workspace Settings")
      check_options_by_css_for_edit(driver, "#sec5 > div.pull-right.edit > a.edit-link", "Edit", "Antivirus Settings")
      check_options_by_css_for_edit(driver, "#sec6 > div.pull-right.edit > a.edit-link", "Edit", "User Settings")
      check_options_by_css_for_edit(driver, "#sec7 > div.pull-right.edit > a.edit-link", "Edit", "Contact and Group Settings")
      check_options_by_css_for_edit(driver, "#sec8 > div.pull-right.edit > a.edit-link", "Edit", "Sign in and Password")
      check_options_by_css_for_edit(driver, "#sec9 > div.pull-right.edit > a.edit-link", "Edit", "User Registration")
      check_options_by_css_for_edit(driver, "#sec10 > div.pull-right.edit > a.edit-link", "Edit", "User Interface")
      check_options_by_css_for_edit(driver, "#sec11 > div.pull-right.edit > a.edit-link", "Edit", "reCAPTCHA Image Verification Settings")
      check_options_by_css_for_edit(driver, "#sec12 > div.pull-right.edit > a.edit-link", "Edit", "Microsoft Outlook Add-in Settings")
      check_options_by_css_for_edit(driver, "#sec13 > div.pull-right.edit > a.edit-link", "Edit", "SMTP API Settings")
      check_options_by_css_for_edit(driver, "#sec14 > div.pull-right.edit > a.edit-link", "Edit", "Proxy Server Settings")
      check_options_by_css_for_edit(driver, "#sec15 > div.pull-right.edit > a.edit-link", "Edit", "Intranet And Extranet Settings")
      check_options_by_css_for_edit(driver, "#sec16 > div.pull-right.edit > a.edit-link", "Edit", "Mobile Settings")

    end





    def check_server_configuration (driver)

      driver.find_element(:css, "div.nlv-settings-row-title").click
      puts ""
      $log_found.puts ""
      $log_not_found.puts ""
      $log_error_occured.puts ""
      puts "Server Configuration"
      $log_found.puts "Server Configuration"
      $log_not_found.puts "Server Configuration"
      $log_error_occured.puts "Server Configuration"

      sleep 2

      check_text_by_copy_xpath(driver, "Company name", "//html/body/div[3]/div/div[2]/form/div[1]/div[1]/div[3]/div[1]/label/span")
      check_field_contents(driver, "", "companyName", "Company name")
      check_text_by_copy_xpath(driver, "System name", "//html/body/div[3]/div/div[2]/form/div[1]/div[1]/div[3]/div[2]/label/span")
      check_field_contents(driver, "Biscom SFT", "systemName", "System name")

      sleep 2

      check_text_by_copy_xpath(driver, "Administrator email", "//html/body/div[3]/div/div[2]/form/div[1]/div[1]/div[3]/div[3]/label")
      check_field_contents(driver, "admin@domain.com", "administratorEmail", "Administrator email")
      check_text_by_copy_xpath(driver, "Time zone", "//html/body/div[3]/div/div[2]/form/div[1]/div[1]/div[3]/div[4]/label")
      check_dropdown_list_content(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[1]/div[3]/div[4]/div/select", "Asia/Dhaka", "Time zone")

      sleep 2

      check_text_by_copy_xpath(driver, "Locale language", "//html/body/div[3]/div/div[2]/form/div[1]/div[1]/div[3]/div[5]/label/span")
      check_field_contents(driver, "en", "localeLanguage", "Locale language")
      check_text_by_copy_xpath(driver, "Locale country", "//html/body/div[3]/div/div[2]/form/div[1]/div[1]/div[3]/div[6]/label/span")
      check_field_contents(driver, "US", "localeCountry", "Locale country")



    end





    def check_email_and_notification_settings(driver)

      driver.find_element(:css, "#sec1 > div.nlv-settings-row-title").click
      puts ""
      $log_found.puts ""
      $log_not_found.puts ""
      $log_error_occured.puts ""
      puts "Email & Notification Settings"
      $log_found.puts "Email & Notification Settings"
      $log_not_found.puts "Email & Notification Settings"
      $log_error_occured.puts "Email & Notification Settings"

      sleep 2

      check_options_by_span_title(driver, "Notification mail server", "Enter the SMTP server to use for sending out delivery and access notifications.")
      check_field_contents(driver, "192.168.10.91", "mailServer", "Notification mail server")
      check_options_by_span_title(driver, "Notification mail server username", "If the mail server used to deliver notifications requires authentication, enter the username for authentication - otherwise, leave this property blank.")
      check_field_contents(driver, "", "mailServerUsername", "Notification mail server username")
      check_options_by_span_title(driver, "Notification mail server password", "If mail server authentication is required, use this property to enter the password for authentication - otherwise, leave this property blank.")
      check_field_contents(driver, "", "mailServerPassword1", "Notification mail server password")
      check_options_by_css(driver, "button.btn.btn-default", "Set")

      sleep 2

      check_text_by_copy_xpath(driver, "Clear", "//html/body/div[3]/div/div[2]/form/div[1]/div[2]/div[3]/div[3]/div[2]/div/button[2]")
      sleep 2
      check_text_by_copy_xpath(driver, "Notification mail server port", "//html/body/div[3]/div/div[2]/form/div[1]/div[2]/div[3]/div[4]/label/span")
      check_field_contents(driver, "25", "mailServerPortNo", "Notification mail server port")
      sleep 2

      check_options_by_span_title(driver, "Encrypted connection", "Outgoing mail should be encrypted by the selected type.")
      check_dropdown_list_content(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[2]/div[3]/div[5]/div/select", "None", "Encrypted connection")
      check_options_by_span_title(driver, "Notification sender", "Sets the notification email address that sends the notification. Set this property to SENDER to use the email address of the user who has sent the delivery.")
      check_field_contents(driver, "SENDER", "notificationSender", "Notification sender")
      check_options_by_span_title(driver, "Notification link protocol", "This specifies the protocol used for the delivery URL.")


      sleep 2

      check_text_by_copy_xpath(driver, "HTTP", "//html/body/div[3]/div/div[2]/form/div[1]/div[2]/div[3]/div[8]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "/html/body/div[3]/div/div[2]/form/div[1]/div[2]/div[3]/div[8]/div/label[1]/input", "HTTP", "Notification link protocol")
      check_text_by_copy_xpath(driver, "HTTPS", "//html/body/div[3]/div/div[2]/form/div[1]/div[2]/div[3]/div[8]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[2]/div[3]/div[8]/div/label[2]/input", "HTTPS", "Notification link protocol")


      check_options_by_span_title(driver, "Notify user when password reset by an administrator", "Whether to send an email to the user when an administrator resets the user password.")

      sleep 2


      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[2]/div[3]/div[9]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[2]/div[3]/div[9]/div/label[1]/input", "Yes", "Notify user when password reset by an administrator")
      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[2]/div[3]/div[9]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[2]/div[3]/div[9]/div/label[2]/input", "No", "Notify user when password reset by an administrator")

      check_options_by_span_title(driver, "Notify user when password reset by user", "Whether to send a confirmation email to the user when the user resets his or her own password.")

      sleep 2

      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[2]/div[3]/div[10]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[2]/div[3]/div[10]/div/label[1]/input", "Yes", "Notify user when password reset by user")
      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[2]/div[3]/div[10]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[2]/div[3]/div[10]/div/label[2]/input", "No", "Notify user when password reset by user")

      sleep 2

      check_options_by_span_title(driver, "System notification sender", "This sets the email address from which system notifications are delivered. If no value is entered for this property, the email address will be notify@<domain name>.")
      check_field_contents(driver, "", "systemNotificationSender", "System notification sender")
      check_options_by_span_title(driver, "Populate username for delivery notification links", "If set to Yes, the application will populate the username field automatically when recipients click on the delivery link.")

      sleep 2

      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[2]/div[3]/div[12]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[2]/div[3]/div[12]/div/label[1]/input", "Yes", "Populate username for delivery notification links")
      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[2]/div[3]/div[12]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[2]/div[3]/div[12]/div/label[2]/input", "No", "Populate username for delivery notification links")


    end





    def check_delivery_settings(driver)


      driver.find_element(:css, "#sec2 > div.nlv-settings-row-title").click
      puts ""
      $log_found.puts ""
      $log_not_found.puts ""
      $log_error_occured.puts ""
      puts "Delivery Settings"
      $log_found.puts "Delivery Settings"
      $log_not_found.puts "Delivery Settings"
      $log_error_occured.puts "Delivery Settings"

      sleep 2
      check_options_by_span_title(driver, "Default secure message", "Default secure message, used when creating deliveries.")

      check_field_contents_using_text_area(driver, "", "deliverySecureMessage", "Default secure message")
      check_options_by_span_title(driver, "Default delivery notification message", "Default message, used for delivery notifications.")

      check_field_contents_using_text_area(driver, "", "deliveryNotificationMessage", "Default delivery notification message")
      check_options_by_span_title(driver, "Delivery notification footer (uneditable by sender)", "If text is entered for this property, it will be appended to the bottom of all notification messages.")

      check_field_contents_using_text_area(driver, "", "deliveryNotificationFooter", "Delivery notification footer (uneditable by sender)")
      check_options_by_span_title(driver, "Default delivery notification message", "Default message, used for delivery notifications.")


      sleep 2

      check_text_by_copy_xpath(driver, "List files in delivery notification message", "//html/body/div[3]/div/div[2]/form/div[1]/div[3]/div[3]/div[3]/div[2]/label")
      is_checkbox_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[3]/div[3]/div[3]/div[2]/label/input", "List files in delivery notification message", "Default delivery notification message")

      check_options_by_span_title(driver, "Delivery expires after (in days)", "It is used to calculate and enter a default delivery expiration date when a delivery or express delivery is created.")
      check_field_contents(driver, "0", "deliveryExpirationDays", "Delivery expires after (in days)")

      check_text_by_copy_xpath(driver, "Apply to all users", "//html/body/div[3]/div/div[2]/form/div[1]/div[3]/div[3]/div[5]/div[2]/label")
      is_checkbox_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[3]/div[3]/div[5]/div[2]/label/input", "Apply to all users", "Delivery expires after (in days)")

      sleep 2

      check_options_by_span_title(driver, "Always require recipients to sign in", "This setting allows administrators to remove the Require recipients to sign in checkbox as one of the delivery parameters.")
      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[3]/div[3]/div[6]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[3]/div[3]/div[6]/div/label[1]/input", "Yes", "Always require recipients to sign in")
      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[3]/div[3]/div[6]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[3]/div[3]/div[6]/div/label[2]/input", "No", "Always require recipients to sign in")

      sleep 2

      check_options_by_span_title(driver, "Require recipients to sign in by default", "This is the value used in checkboxes for deliveries. For Outlook add-in deliveries, because the sender does not have the option to choose the sign in requirement, this value will be used.")
      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[3]/div[3]/div[7]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[3]/div[3]/div[7]/div/label[1]/input", "Yes", "Require recipients to sign in by default")
      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[3]/div[3]/div[7]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[3]/div[3]/div[7]/div/label[2]/input", "No", "Require recipients to sign in by default")

      sleep 2

      check_options_by_span_title(driver, "Enable secure reply", "If you want to enable secure reply feature please select yes.")
      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[3]/div[3]/div[9]/div[1]/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[3]/div[3]/div[9]/div/label[1]/input", "Yes", "Enable secure reply")
      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[3]/div[3]/div[9]/div[1]/label[2]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[3]/div[3]/div[9]/div/label[2]/input", "No", "Enable secure reply")


      sleep 2

      check_text_by_copy_xpath(driver, "Show secure reply section by default", "//html/body/div[3]/div/div[2]/form/div[1]/div[3]/div[3]/div[9]/div[2]/div/label")
      is_checkbox_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[3]/div[3]/div[9]/div[2]/div/label/input", "Show secure reply section by default", "Enable secure reply")

      check_options_by_span_title(driver, "Delimiter character for auto-complete", "Select delimiter character to separate email addresses")
      check_dropdown_list_content(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[3]/div[3]/div[10]/div/select", ";", "Delimiter character for auto-complete")

      check_title_text_by_class(driver, "PayPal Payment: Configuration", "panel-heading")

      sleep 2

      check_text_by_copy_xpath(driver, "Enable PayPal", "/html/body/div[3]/div/div[2]/form/div[1]/div[3]/div[3]/div[12]/div/div[1]/div[2]/div[1]/label/span")
      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[3]/div[3]/div[12]/div/div[1]/div[2]/div[1]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[3]/div[3]/div[12]/div/div[1]/div[2]/div[1]/div/label[1]/input", "Yes", "Enable PayPal")
      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[3]/div[3]/div[12]/div/div[1]/div[2]/div[1]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[3]/div[3]/div[12]/div/div[1]/div[2]/div[1]/div/label[2]/input", "No", "Enable PayPal")

      sleep 2
      check_options_by_span_title(driver, "PayPal payment account", "The PayPal business account email address")
      check_field_contents(driver, "", "paypalPaymentAccount", "PayPal payment account")
      check_options_by_span_title(driver, "PayPal API username", "The PayPal API username")
      check_field_contents(driver, "", "paypalApiUsername", "PayPal API username")
      check_options_by_span_title(driver, "PayPal API password", "The PayPal API password")
      check_field_contents(driver, "", "paypalApiPassword", "PayPal API password")
      check_options_by_span_title(driver, "PayPal signature", "The PayPal signature")
      check_field_contents(driver, "", "paypalApiSignature", "PayPal signature")

      sleep 2

      check_options_by_span_title(driver, "List of users who can charge for delivery", "Enter a specific user or user pattern (using wildcards like ? and *) who can charge for delivery")
      check_field_contents(driver, "", "paypalUsersList", "List of users who can charge for delivery")
      check_options_by_span_title(driver, "Payment privacy policy URL", "Enter the URL for the payment privacy policy")
      check_field_contents(driver, "", "paymentPrivacyPolicyUrl", "Payment privacy policy URL")
      check_options_by_span_title(driver, "Payment refund policy URL", "Enter the URL for the payment refund policy")
      check_field_contents(driver, "", "paymentRefundPolicyUrl", "Payment refund policy URL")
      check_option_using_link(driver, "Verify PayPal configuration settings", "Verify PayPal configuration settings")

      sleep 2

      check_title_text_by_title(driver, "Express Delivery: Show options/Hide options", "Section for show or hide options in express delivery.")
      check_options_by_span_title(driver, "Default mode", "Select default criteria for express delivery.")
      check_text_by_copy_xpath(driver, "Show options", "//html/body/div[3]/div/div[2]/form/div[1]/div[3]/div[3]/div[12]/div/div[2]/div[2]/div[1]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[3]/div[3]/div[12]/div/div[2]/div[2]/div[1]/div/label[1]/input", "Show options", "Default mode")
      check_text_by_copy_xpath(driver, "Hide options", "//html/body/div[3]/div/div[2]/form/div[1]/div[3]/div[3]/div[12]/div/div[2]/div[2]/div[1]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[3]/div[3]/div[12]/div/div[2]/div[2]/div[1]/div/label[2]/input", "Hide options", "Default mode")

      sleep 2

      check_text_by_copy_xpath(driver, "Show secure message when options are hidden", "//html/body/div[3]/div/div[2]/form/div[1]/div[3]/div[3]/div[12]/div/div[2]/div[2]/div[3]/div[1]/label")
      is_checkbox_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[3]/div[3]/div[12]/div/div[2]/div[2]/div[3]/div[1]/label/input", "Show secure message when options are hidden", "Default mode")
      check_text_by_copy_xpath(driver, "Show notification message when options are hidden", "//html/body/div[3]/div/div[2]/form/div[1]/div[3]/div[3]/div[12]/div/div[2]/div[2]/div[3]/div[2]/label")
      is_checkbox_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[3]/div[3]/div[12]/div/div[2]/div[2]/div[3]/div[2]/label/input", "Show notification message when options are hidden", "Default mode")


      check_option_using_link(driver, "Configure limited sender settings", "Configure limited sender settings")

    end





    def check_package_settings(driver)

      driver.find_element(:css, "#sec3 > div.nlv-settings-row-title").click
      puts ""
      $log_found.puts ""
      $log_not_found.puts ""
      $log_error_occured.puts ""
      puts "Package Settings"
      $log_found.puts "Package Settings"
      $log_not_found.puts "Package Settings"
      $log_error_occured.puts "Package Settings"

      sleep 2

      check_options_by_span_title(driver, "Notify user when added as a package owner or sender", "If set to yes, a notification email will be sent to users who are added as an owner or a sender of a package.")
      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[4]/div[3]/div[1]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[4]/div[3]/div[1]/div/label[1]/input", "Yes", "Notify user when added as a package owner or sender")
      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[4]/div[3]/div[1]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[4]/div[3]/div[1]/div/label[2]/input", "No", "Notify user when added as a package owner or sender")

      sleep 2

      check_options_by_span_title(driver, "Allow users to delete multiple packages", "If set to yes, Senders can select and delete multiple packages from the Manage Package list.")
      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[4]/div[3]/div[2]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[4]/div[3]/div[2]/div/label[1]/input", "Yes", "Allow users to delete multiple packages")
      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[4]/div[3]/div[2]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[4]/div[3]/div[2]/div/label[2]/input", "No", "Allow users to delete multiple packages")

      sleep 2

      check_options_by_span_title(driver, "Package deletes after (in days)", "Define the number of days newly created packages will be valid before being deleted by the system.")
      check_field_contents(driver, "0", "autoPackageDeletionDays", "Package deletes after (in days)")
      check_text_by_copy_xpath(driver, "Apply to existing packages", "//html/body/div[3]/div/div[2]/form/div[1]/div[4]/div[3]/div[3]/div[2]/label")
      is_checkbox_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[4]/div[3]/div[3]/div[2]/label/input", "Apply to existing packages", "Package deletes after (in days)")

      check_options_by_span_title(driver, "Reminder before package deletion (in days)", "System sends an email reminder to all package owners and senders whose packages will be deleted shortly.")
      check_field_contents(driver, "0", "autoPackageDelReminderDays", "Reminder before package deletion (in days)")

      sleep 2

      check_options_by_span_title(driver, "Hide auto-deletion fields if not editable", "For users who cannot override the auto-deletion values, the auto-delete fields are displayed but grayed out and uneditable.")
      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[4]/div[3]/div[5]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[4]/div[3]/div[5]/div/label[1]/input", "Yes", "Hide auto-deletion fields if not editable")
      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[4]/div[3]/div[5]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[4]/div[3]/div[5]/div/label[2]/input", "No", "Hide auto-deletion fields if not editable")

      sleep 2

      check_options_by_span_title(driver, "List of owners who can override package deletion", "Enter a specific user or user pattern (using wildcards like ? and *) who can override the deletion dates.")
      check_field_contents(driver, "", "autoPackageDelOverrideList", "List of owners who can override package deletion")
      check_options_by_span_title(driver, "Unrestricted senders", "If defined, this is the list of Senders that are not subject to the inclusion and exclusion lists.")
      check_field_contents(driver, "", "unrestrictedSendersList", "Unrestricted senders")
      check_options_by_span_title(driver ,"Default recipient inclusion list", "If defined, this is a list of recipients or recipient patterns that are acceptable recipients for all Senders.")
      check_field_contents(driver, "", "recipientInclusionList", "Default recipient inclusion list")


      sleep 2

      check_options_by_span_title(driver ,"Default recipient exclusion list", "If defined, this is a list of recipients emails or email patterns that are not acceptable recipients for all Senders.")
      check_field_contents(driver, "", "recipientExclusionList", "Default recipient exclusion list")
      check_options_by_span_title(driver, "File type restrictions", "If defined, this comma-separated list defines the list of files that are restricted from being uploaded to the system.")
      check_field_contents(driver, "", "blockExtUploadingList", "File type restrictions")
      check_text_by_copy_xpath(driver, "Allow unrestricted senders to bypass file type restrictions", "//html/body/div[3]/div/div[2]/form/div[1]/div[4]/div[3]/div[10]/div[2]/div/label")
      is_checkbox_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[4]/div[3]/div[10]/div[2]/div/label/input", "Allow unrestricted senders to bypass file type restrictions", "File type restrictions")

      sleep 2

      check_options_by_span_title(driver, "Allow applet for upload and download", "A Java applet is available for users to upload and download files.")
      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[4]/div[3]/div[11]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[4]/div[3]/div[11]/div/label[1]/input", "Yes", "Allow applet for upload and download")
      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[4]/div[3]/div[11]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[4]/div[3]/div[11]/div/label[2]/input", "No", "Allow applet for upload and download")

      sleep 2

      check_options_by_span_title(driver, "File upload and download with applet allowed for", "If you do enable the applet, you can still restrict the users who can use the applet functionality. Enter a list of users or wildcard pattern who can use the applet.")
      check_field_contents(driver, "", "appletUserList", "File upload and download with applet allowed for")

      check_options_by_span_title(driver, "Default value for overwrite files checkbox", "Sets the default value for the Overwrite existing files checkbox in the download applet")
      check_text_by_copy_xpath(driver, "Checked", "//html/body/div[3]/div/div[2]/form/div[1]/div[4]/div[3]/div[13]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[4]/div[3]/div[13]/div/label[1]/input", "Checked", "Default value for overwrite files checkbox")
      check_text_by_copy_xpath(driver, "Unchecked", "//html/body/div[3]/div/div[2]/form/div[1]/div[4]/div[3]/div[13]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[4]/div[3]/div[13]/div/label[2]/input", "Unchecked", "Default value for overwrite files checkbox")

      sleep 2

      check_options_by_span_title(driver, "Enable secure reply to all", "Enable this to allow senders to add the files uploaded through secure replies to the package so that all recipients are able to access these files.")
      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[4]/div[3]/div[14]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[4]/div[3]/div[14]/div/label[1]/input", "Yes", "Enable secure reply to all")
      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[4]/div[3]/div[14]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[4]/div[3]/div[14]/div/label[2]/input", "No", "Enable secure reply to all")



    end





    def check_workspace_settings(driver)

      driver.find_element(:css, "#sec4 > div.nlv-settings-row-title").click
      puts ""
      $log_found.puts ""
      $log_not_found.puts ""
      $log_error_occured.puts ""
      puts "Workspace Settings"
      $log_found.puts "Workspace Settings"
      $log_not_found.puts "Workspace Settings"
      $log_error_occured.puts "Workspace Settings"

      sleep 2
      check_options_by_span_title(driver, "Enable workspaces", "When enabled selected users can share files and messages with others.")
      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[5]/div[3]/div[1]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[5]/div[3]/div[1]/div/label[1]/input", "Yes", "Enable workspaces")
      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[5]/div[3]/div[1]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[5]/div[3]/div[1]/div/label[2]/input", "No", "Enable workspaces")

      check_options_by_span_title(driver, "Allowed sender licenses for collaboration", "Since each collaboration role takes one sender license, administrator can specify the number of sender licenses to be used for collaboration. Maximum number of sender licenses will be used if left blank.")
      check_field_contents(driver, "", "numOfAllowedSenderlicenses", "Allowed sender licenses for collaboration")

      sleep 2

      check_text_by_copy_xpath(driver, "(Maximum sender licenses: 100)", "//html/body/div[3]/div/div[2]/form/div[1]/div[5]/div[3]/div[2]/span")

      check_options_by_span_title(driver, "Allowed collaborators per user", "Specify maximum number of collaborators that a user can create.")
      check_field_contents(driver, "", "collaboratorPerUser", "Allowed collaborators per user")

      sleep 2
      check_options_by_span_title(driver, "Workspace deletes after (in days)", "Define the number of days newly created workspaces will be valid before being deleted by the system.")
      check_field_contents(driver, "0", "autoWorkspaceDeletionDays", "Workspace deletes after (in days)")
      check_text_by_copy_xpath(driver, "Apply to existing workspaces", "//html/body/div[3]/div/div[2]/form/div[1]/div[5]/div[3]/div[4]/div[2]/label")
      is_checkbox_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[5]/div[3]/div[4]/div[2]/label/input", "Apply to existing workspaces", "Workspace deletes after (in days)")

      check_options_by_span_title(driver, "Reminder before workspace deletion (in days)", "System sends an email reminder to all workspace owners and senders whose workspaces will be deleted shortly.")
      check_field_contents(driver, "0", "autoWorkspaceDelReminderDays", "Reminder before workspace deletion (in days)")

      sleep 2
      check_text_by_copy_xpath(driver, "Hide auto-deletion fields if not editable", "//html/body/div[3]/div/div[2]/form/div[1]/div[5]/div[3]/div[6]/label/span")
      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[5]/div[3]/div[6]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[5]/div[3]/div[6]/div/label[1]/input", "Yes", "Hide auto-deletion fields if not editable")
      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[5]/div[3]/div[6]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[5]/div[3]/div[6]/div/label[2]/input", "No", "Hide auto-deletion fields if not editable")

      check_text_by_copy_xpath(driver, "List of managers who can override workspace deletion", "//html/body/div[3]/div/div[2]/form/div[1]/div[5]/div[3]/div[7]/label/span")
      check_field_contents(driver, "", "autoWorkspaceDelOverrideList", "List of managers who can override workspace deletion")

      sleep 2

      check_options_by_span_title(driver, "Default notification settings", "Set the default notification settings for new workspaces")
      check_options_by_span_title(driver, "Notification type", "Notification type")
      is_checkbox_clicked_using_xpath(driver, "/html/body/div[3]/div/div[2]/form/div[1]/div[5]/div[3]/div[8]/div/table/thead/tr/th[1]/input", "Notification type", "Default notification settings")
      check_options_by_span_title(driver, "New file or folder uploaded", "New file or folder uploaded")
      is_checkbox_clicked_using_xpath(driver, "/html/body/div[3]/div/div[2]/form/div[1]/div[5]/div[3]/div[8]/div/table/tbody/tr[1]/td[1]/input", "New file or folder uploaded", "Default notification settings")

      sleep 2

      check_options_by_span_title(driver, "File or folder updated", "File or folder updated")
      is_checkbox_clicked_using_xpath(driver, "/html/body/div[3]/div/div[2]/form/div[1]/div[5]/div[3]/div[8]/div/table/tbody/tr[2]/td[1]/input", "File or folder updated", "Default notification settings")
      check_options_by_span_title(driver, "New workspace comment added", "New workspace comment added")
      is_checkbox_clicked_using_xpath(driver, "/html/body/div[3]/div/div[2]/form/div[1]/div[5]/div[3]/div[8]/div/table/tbody/tr[3]/td[1]/input", "FNew workspace comment added", "Default notification settings")
      check_options_by_span_title(driver, "Workspace deleted", "Workspace deleted")
      is_checkbox_clicked_using_xpath(driver, "/html/body/div[3]/div/div[2]/form/div[1]/div[5]/div[3]/div[8]/div/table/tbody/tr[4]/td[1]/input", "Workspace deleted", "Default notification settings")

      sleep 2

      check_options_by_span_title(driver, "File or folder downloaded", "File or folder downloaded")
      is_checkbox_clicked_using_xpath(driver, "/html/body/div[3]/div/div[2]/form/div[1]/div[5]/div[3]/div[8]/div/table/tbody/tr[5]/td[1]/input", "File or folder downloaded", "Default notification settings")
      check_options_by_span_title(driver, "File or folder deleted", "File or folder deleted")
      is_checkbox_clicked_using_xpath(driver, "/html/body/div[3]/div/div[2]/form/div[1]/div[5]/div[3]/div[8]/div/table/tbody/tr[6]/td[1]/input", "File or folder deleted", "Default notification settings")
      check_options_by_span_title(driver, "Workspace details updated", "Workspace details updated")
      is_checkbox_clicked_using_xpath(driver, "/html/body/div[3]/div/div[2]/form/div[1]/div[5]/div[3]/div[8]/div/table/tbody/tr[7]/td[1]/input", "Workspace details updated", "Default notification settings")
      check_options_by_span_title(driver, "User added", "User added")
      is_checkbox_clicked_using_xpath(driver, "/html/body/div[3]/div/div[2]/form/div[1]/div[5]/div[3]/div[8]/div/table/tbody/tr[8]/td[1]/input", "User added", "Default notification settings")

      sleep 2

      check_options_by_span_title(driver, "User deleted", "User deleted")
      is_checkbox_clicked_using_xpath(driver, "/html/body/div[3]/div/div[2]/form/div[1]/div[5]/div[3]/div[8]/div/table/tbody/tr[9]/td[1]/input", "User deleted", "Default notification settings")
      check_options_by_span_title(driver, "User removes self from workspace", "User removes self from workspace")
      is_checkbox_clicked_using_xpath(driver, "/html/body/div[3]/div/div[2]/form/div[1]/div[5]/div[3]/div[8]/div/table/tbody/tr[10]/td[1]/input", "User removes self from workspace", "Default notification settings")

    end





    def check_antivirus_settings(driver)

      driver.find_element(:css, "#sec5 > div.nlv-settings-row-title").click
      puts ""
      $log_found.puts ""
      $log_not_found.puts ""
      $log_error_occured.puts ""
      puts "Antivirus Settings"
      $log_found.puts "Antivirus Settings"
      $log_not_found.puts "Antivirus Settings"
      $log_error_occured.puts "Antivirus Settings"

      sleep 2

      check_options_by_span_title(driver, "Protect against viruses", "When checked, enables protection against viruses when files are uploaded as package or reply documents.")
      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[6]/div[3]/div[1]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[6]/div[3]/div[1]/div/label[1]/input", "Yes", "Protect against viruses")
      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[6]/div[3]/div[1]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[6]/div[3]/div[1]/div/label[2]/input", "No", "Protect against viruses")

      check_options_by_span_title(driver, "Trusted user-file patterns", "If defined, each line will specify a comma separated list of wildcard supported filenames that a particular user can upload bypassing the mandatory virus scanning process. Each of these new line entries must follw the pattern: [username] >> [filename]")
      check_field_contents_using_text_area(driver, "", "antivirusTrustedFilePatternList", "Trusted user-file patterns")

      sleep 2
      check_text_by_copy_xpath(driver, "Allow maximum file size", "//html/body/div[3]/div/div[2]/form/div[1]/div[6]/div[3]/div[3]/label/span")
      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[6]/div[3]/div[3]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[6]/div[3]/div[3]/div/label[1]/input", "Yes", "Allow maximum file size")
      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[6]/div[3]/div[3]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[6]/div[3]/div[3]/div/label[2]/input", "No", "Allow maximum file size")

      check_options_by_span_title(driver, "Maximum file size (MB)", "Set the maximum file size that will be used for virus scanning")
      check_field_contents(driver, "250", "antivirusMaxFileSize", "Maximum file size (MB)")

      sleep 2

      check_text_by_copy_xpath(driver, 'Metascan server', "//html/body/div[3]/div/div[2]/form/div[1]/div[6]/div[3]/div[5]/label/span")
      check_text_by_copy_xpath(driver, "Local", "//html/body/div[3]/div/div[2]/form/div[1]/div[6]/div[3]/div[5]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[6]/div[3]/div[5]/div/label[1]/input", "Local", "Metascan server")
      check_text_by_copy_xpath(driver, "Remote", "//html/body/div[3]/div/div[2]/form/div[1]/div[6]/div[3]/div[5]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[6]/div[3]/div[5]/div/label[2]/input", "Remote", "Metascan server")

      check_options_by_span_title(driver, "Metascan server URL", "URL of remote Metascan server")
      check_field_contents(driver, "", "metascanRemoteServerUrl", "Metascan server URL")


    end





    def check_user_settings(driver)

      driver.find_element(:css, "#sec6 > div.nlv-settings-row-title").click
      puts ""
      $log_found.puts ""
      $log_not_found.puts ""
      $log_error_occured.puts ""
      puts "User Settings"
      $log_found.puts "User Settings"
      $log_not_found.puts "User Settings"
      $log_error_occured.puts "User Settings"

      sleep 2

      check_options_by_span_title(driver, "Enable compliance role", "If set to Yes, compliance role can be applied to user.")
      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[7]/div[3]/div[1]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[7]/div[3]/div[1]/div/label[1]/input", "Yes", "Enable compliance role")
      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[7]/div[3]/div[1]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[7]/div[3]/div[1]/div/label[2]/input", "No", "Enable compliance role")
      sleep 2

      check_options_by_span_title(driver, "Enforce user quota", "If set to Yes, user can be allocated and restricted to a defined storage.")
      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[7]/div[3]/div[3]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[7]/div[3]/div[3]/div/label[1]/input", "Yes", "Enforce user quota")
      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[7]/div[3]/div[3]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[7]/div[3]/div[3]/div/label[2]/input", "No", "Enforce user quota")
      sleep 2

      check_options_by_span_title(driver, "Quota per user (MB)", "Set the storage size (in mega bytes) that will be allocated to all users.")
      check_field_contents(driver, "50", "userQuota", "Quota per user (MB)")
      check_options_by_span_title(driver, "Maximum quota allowed (MB)", "Set the maximum storage size (in mega bytes) can be allocated to a user.")
      check_field_contents(driver, "50", "maximumUserQuota", "Maximum quota allowed (MB)")

      sleep 2

      check_options_by_span_title(driver, "Enable user expiration", "If set to Yes, user can be expired automatically.")
      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[7]/div[3]/div[7]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[7]/div[3]/div[7]/div/label[1]/input", "Yes", "Enable user expiration")
      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[7]/div[3]/div[7]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[7]/div[3]/div[7]/div/label[2]/input", "No", "Enable user expiration")

      check_options_by_span_title(driver, "Inactivity period (in days)", "User will be expired (or lose sender role) if inactive for the defined number of days.")
      check_field_contents(driver, "", "inactivityPeriod", "Inactivity period (in days)")

      sleep 2

      check_text_by_copy_xpath(driver, "Action to perform if inactive", "//html/body/div[3]/div/div[2]/form/div[1]/div[7]/div[3]/div[9]/label/span")
      check_text_by_copy_xpath(driver, "Expire user", "//html/body/div[3]/div/div[2]/form/div[1]/div[7]/div[3]/div[9]/div[1]/label")
      is_checkbox_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[7]/div[3]/div[9]/div[1]/label/input", "Expire user", "Action to perform if inactive")
      check_text_by_copy_xpath(driver, "Do not expire user, only remove Sender role", "//html/body/div[3]/div/div[2]/form/div[1]/div[7]/div[3]/div[9]/div[2]/label")
      is_checkbox_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[7]/div[3]/div[9]/div[2]/label/input", "Do not expire user", "Action to perform if inactive")


      sleep 2

      check_options_by_span_title(driver, "Send first warning message before (in days)", "Send first user expiration warning message before the defined number of days.")
      check_field_contents(driver, "", "daysBeforeFirstWarning", "Send first warning message before (in days)")
      check_options_by_span_title(driver, "Send final warning message before (in days)", "Send final user expiration warning message before the defined number of days.")
      check_field_contents(driver, "", "daysBeforeFinalWarning", "Send final warning message before (in days)")
      check_options_by_span_title(driver, "Expiration exclusion list", "This ensures that these users will never expire. The field accepts a comma separated wildcard string.")
      check_field_contents(driver, "", "expirationExclusionList", "Expiration exclusion list")
      check_options_by_span_title(driver, "Delete expired users after (in days)", "Specify a period in days after which an expired user should be deleted. If the field is left empty, then expired users should not be deleted. Setting a value of 0 in the field will delete users immediately after expiration.")
      check_field_contents(driver, "", "daysToDeleteExpiredUsers", "Delete expired users after (in days)")


    end





    def check_contact_and_group_settings(driver)

      driver.find_element(:css, "#sec7 > div.nlv-settings-row-title").click
      puts ""
      $log_found.puts ""
      $log_not_found.puts ""
      $log_error_occured.puts ""
      puts "Contact and Group Settings"
      $log_found.puts "Contact and Group Settings"
      $log_not_found.puts "Contact and Group Settings"
      $log_error_occured.puts "Contact and Group Settings"

      sleep 2

      check_option_using_link(driver, "Manage Exchange Server connections", "Manage Exchange Server connections")

    end





    def check_sign_in_and_password(driver)

      driver.find_element(:css, "#sec8 > div.nlv-settings-row-title").click
      puts ""
      $log_found.puts ""
      $log_not_found.puts ""
      $log_error_occured.puts ""
      puts "Sign in and password Settings"
      $log_found.puts "Sign in and password Settings"
      $log_not_found.puts "Sign in and password Settings"
      $log_error_occured.puts "Sign in and password Settings"

      sleep 2

      check_options_by_span_title(driver, "Session timeout (in minutes)", "The timeout in minutes for all users who log on. If not set, the default timeout is 15 minutes.")
      check_field_contents(driver, "20", "sessionTimeout", "Session timeout (in minutes)")

      check_options_by_span_title(driver, "Show domain field on sign in page (for LDAP/AD only)", "If you have configured your server to use LDAP/AD to authenticate users, you have the option to show a domain field below the username and password fields.")
      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[2]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[2]/div/label[1]/input", "Yes", "Show domain field on sign in page (for LDAP/AD only)")
      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[2]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[2]/div/label[2]/input", "No", "Show domain field on sign in page (for LDAP/AD only)")

      sleep 2

      check_options_by_span_title(driver, "Show remember username field in sign in page", "Show or hide remember username field.")
      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[3]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[3]/div/label[1]/input", "Yes", "Show remember username field in sign in page")

      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[3]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[3]/div/label[2]/input", "No", "Show remember username field in sign in page")
      sleep 2

      check_options_by_span_title(driver, "Turn auto-complete on", "Enables or disables the auto-complete attribute in the sign in page.")
      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[4]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[4]/div/label[1]/input", "Yes", "Turn auto-complete on")

      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[4]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[4]/div/label[2]/input", "No", "Turn auto-complete on")
      sleep 2

      check_options_by_span_title(driver, "Require re-authentication for viewing each delivery", "If set to yes, recipients who click on notification links will always need to re-authenticate to view a delivery.")
      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[5]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[5]/div/label[1]/input", "Yes", "Require re-authentication for viewing each delivery")
      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[5]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[5]/div/label[2]/input", "No", "Require re-authentication for viewing each delivery")

      sleep 2

      check_options_by_span_title(driver, "Maximum sign in attempts before locking user account", "This determines the number of attempts a user may try logging on before having their account locked.")
      check_field_contents(driver, "10", "logonAttemptsMax", "Maximum sign in attempts before locking user account")
      check_options_by_span_title(driver, "Auto-unlock after (in minutes)", "User auto-unlock will be disabled if left blank.")
      check_field_contents(driver, "", "userAutoUnlockPeriod", "Auto-unlock after (in minutes)")
      check_options_by_span_title(driver, "User auto-unlock limit", "There will be no auto-unlock limit if left blank.")
      check_field_contents(driver, "10", "userAutoUnlockLimit", "User auto-unlock limit")

      sleep 2

      check_options_by_span_title(driver, "Automatically expire user password", "Set to yes to enable password expiration.")
      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[11]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[11]/div/label[1]/input", "Yes", "Automatically expire user password")
      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[11]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[11]/div/label[2]/input", "No", "Automatically expire user password")
      sleep 2

      check_options_by_span_title(driver, "Password remains valid for (in days)", "Enter the number of days that the password remains valid (if set to 0, passwords never expire).")
      check_field_contents(driver, "0", "passwordExpirationDays", "Password remains valid for (in days)")
      check_text_by_copy_xpath(driver, "Warn before expiration (in days)", "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[13]/label/span")
      check_field_contents(driver, "0", "passwordExpirationWarningDays", "Warn before expiration (in days)")

      sleep 2

      check_text_by_copy_xpath(driver, "Require users to change password after admin update", "/html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[14]/label/span")
      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[14]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[14]/div/label[1]/input", "Yes", "Require users to change password after admin update")
      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[14]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[14]/div/label[2]/input", "No", "Require users to change password after admin update")

      sleep 2

      check_options_by_span_title(driver, "Allow old user password to be reused as new password", "If set to Yes, users are allowed to use the same password after their current password expires.")
      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[15]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[15]/div/label[1]/input", "Yes", "Allow old user password to be reused as new password")
      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[15]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[15]/div/label[2]/input", "No", "Allow old user password to be reused as new password")

      check_options_by_span_title(driver, "Password length", "Enter a minimum and maximum length for user passwords. By default, this is between 1 and 50. You cannot set the maximum above 50.")
      check_field_contents(driver, "1", "passwordLengthMin", "Password length(Min)")
      check_field_contents(driver, "50", "passwordLengthMax", "Password length(Max)")

      sleep 2

      check_text_by_copy_xpath(driver, "Min", "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[17]/div/div[1]/span")
      check_text_by_copy_xpath(driver, "Max", "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[17]/div/div[2]/span")

      sleep 2

      check_options_by_span_title(driver, "Required characters for password", "Select those which should be included in the password.")
      check_field_contents(driver, "", "allowedNonAlphaList", "Required characters for password")
      check_text_by_copy_xpath(driver, "Uppercase letters [A-Z]", "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[18]/div/div[1]/label")
      is_checkbox_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[18]/div/div[1]/label/input", "Uppercase letters [A-Z]", "Required characters for password")
      check_text_by_copy_xpath(driver, "Lowercase letters [a-z]", "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[18]/div/div[2]/label")
      is_checkbox_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[18]/div/div[2]/label/input", "Lowercase letters [A-Z]", "Required characters for password")

      sleep 2

      check_text_by_copy_xpath(driver, "Digits [0-9]", "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[18]/div/div[3]/label")
      is_checkbox_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[18]/div/div[3]/label/input", "Digits [0-9]", "Required characters for password")

      check_text_by_copy_xpath(driver, "Non-alphanumeric characters [~,<,{,+,etc.]", "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[18]/div/div[4]/label")
      is_checkbox_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[18]/div/div[4]/label/input", "Non-alphanumeric characters [~,<,{,+,etc.]", "Required characters for password")
      check_text_by_copy_xpath(driver, "Any", "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[18]/div/div[5]/div/div[1]/label")
      is_checkbox_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[18]/div/div[5]/div/div[1]/label/input", "Any", "Non-alphanumeric characters [~,<,{,+,etc.]")

      check_text_by_copy_xpath(driver, "Specify", "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[18]/div/div[5]/div/div[2]/label")
      is_checkbox_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[18]/div/div[5]/div/div[2]/label/input", "Specify", "Non-alphanumeric characters [~,<,{,+,etc.]")
      sleep 2


      check_options_by_span_title(driver, "Enable external authentication source", "Set to Yes to integrate with an external authentication source such as LDAP or Active Directory. When set to Yes, Biscom SFT will scan through all configured and active authentication sources.")
      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[20]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[20]/div/label[1]/input", "Yes", "Enable external authentication source")

      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[20]/div/label[2]")

      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[9]/div[3]/div[20]/div/label[2]/input", "No", "Enable external authentication source")
    end





    def check_user_registration(driver)

      driver.find_element(:css, "#sec9 > div.nlv-settings-row-title").click
      puts ""
      $log_found.puts ""
      $log_not_found.puts ""
      $log_error_occured.puts ""
      puts "User Registration Settings"
      $log_found.puts "User Registration Settings"
      $log_not_found.puts "User Registration Settings"
      $log_error_occured.puts "User Registration Settings"

      sleep 2

      check_text_by_copy_xpath(driver, "Allow self-registration", "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[1]/label/span")
      check_text_by_copy_xpath(driver, "Yes, for everyone", "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[1]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[1]/div/label[1]/input", "Yes, for everyone", "Allow self-registration")
      check_text_by_copy_xpath(driver, "Yes, for delivery recipients only", "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[1]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[1]/div/label[2]/input", "Yes, for delivery recipients only", "Allow self-registration")
      sleep 2

      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[1]/div/label[3]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[1]/div/label[3]", "No", "Allow self-registration")

      sleep 2

      check_options_by_span_title(driver, "Require administrator approval", "Check this checkbox to require administrator approval for self-registrations.")
      is_checkbox_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[1]/div/label[4]/input", "Require administrator approval", "Allow self-registration")
      check_options_by_span_title(driver, "Require activation", "If checked, new registrants will automatically receive an email with an embedded link. Clicking the embedded link is a required stop to complete and activate the registration. If this is not checked, a user can register and immediately sign into the application.")
      is_checkbox_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[1]/div/label[5]/input", "Require activation", "Allow self-registration")

      sleep 2

      check_options_by_span_title(driver, "Self-registration not allowed for", "If self-registration is allowed, you can still restrict registration by not allowing registration for certain user email addresses, or address patterns.")
      check_field_contents(driver, "mamun1@nilavodev.com, mamun2@nilavodev.com, mamun3@nilavodev.com, mamun4@nilavodev.com", "selfRegistrationEmailsNotAllowed", "Self-registration not allowed for")
      check_options_by_span_title(driver, "Send registration request alerts to", "Comma separated list of email addresses. A notification email will be sent to the specified list when a registration request is generated.")
      check_field_contents(driver, "", "selfRegistrationAlertRecipients", "Send registration request alerts to")
      check_options_by_span_title(driver, "Registration not allowed message", "If registration is disabled, you can display a message informing users that they are not allowed to register.")
      check_field_contents_using_text_area(driver, "   This site does not allow self-registration. Please contact a system administrator for further assistance.   ", "selfRegistrationNotAllowedMessage", "Registration not allowed message")

      sleep 2

      check_options_by_span_title(driver, "Confirmation email for self-registration", "If set to Yes, users who register themselves and complete activation (if required), will receive a confirmation email verifying the registration.")
      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[6]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[6]/div/label[1]/input", "Yes", "Confirmation email for self-registration")

      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[6]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[6]/div/label[2]/input", "No", "Confirmation email for self-registration")
      sleep 2

      check_options_by_span_title(driver, "Assign roles for self-registered users", "Select the roles to assign to users who self-register. The Recipient role is on by default, but some administrators may want to let users register and automatically assign additional roles.")
      check_text_by_copy_xpath(driver, "Recipient", "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[7]/div/label[1]")
      is_checkbox_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[7]/div/label[1]/input", "Recipient", "Assign roles for self-registered users")
      check_text_by_copy_xpath(driver, "Limited sender", "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[7]/div/label[2]")
      is_checkbox_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[7]/div/label[2]/input", "Limited sender", "Assign roles for self-registered users")
      check_text_by_copy_xpath(driver, "Sender", "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[7]/div/label[3]")
      is_checkbox_clicked_using_xpath(driver, "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[7]/div/label[3]/input", "Sender", "Assign roles for self-registered users")
      sleep 2



      check_options_by_span_title(driver, "Allow Outlook add-in for new registrations", "When set to Yes, self-registered users will be able to use the Outlook add-in client. If set to No, users can still install the Outlook add-in, but any deliveries created using the add-in will fail. This setting does not apply to LDAP or AD users.")
      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[8]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver,"//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[8]/div/label[1]/input","Yes","Allow Outlook add-in for new registrations")
      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[8]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver,"//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[8]/div/label[2]/input","No","Allow Outlook add-in for new registrations")
      sleep 2

      check_options_by_span_title(driver, "Require terms of service", "Require terms of service")
      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[10]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver,"//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[10]/div/label[1]/input","Yes","Require terms of service")
      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[10]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver,"//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[10]/div/label[2]/input","No","Require terms of service")
      check_options_by_span_title(driver, "Terms of service", "Terms of service")
      check_field_contents_using_text_area(driver, "", "termsOfService", "Terms of service")

      sleep 2

      check_options_by_span_title(driver, "Require password reset question", "You may want users to select (or enter) a password reset question. If set to Yes, users must fill out the password reset question and answer.")
      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[13]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver,"//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[13]/div/label[1]/input","Yes","Require password reset question")
      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[13]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver,"//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[13]/div/label[2]/input","No","Require password reset question")
      sleep 2

      check_text_by_copy_xpath(driver, "Maximum password reset attempts", "/html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[14]/label/span")
      check_field_contents(driver, "10", "passwordResetAttemptsMax", "Maximum password reset attempts")

      check_title_text_by_title(driver, "Password reset questions (leave all blank to allow users to enter their own question)", "If at least one question is defined, then users can select one of these questions to answer. For each defined question, specify a unique code for the question. If predefined questions are not used, then users can enter their own freeform question.")

      sleep 2

      check_text_by_copy_xpath(driver, "Question 1:", "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[16]/div/div/div[2]/div[1]/label[1]")
      check_field_contents(driver, "", "predefinedPasswordQuestion1", "Question 1:")
      check_text_by_copy_xpath(driver, "Question 2:", "/html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[16]/div/div/div[2]/div[2]/label[1]")
      check_field_contents(driver, "", "predefinedPasswordQuestion2", "Question 2:")
      check_text_by_copy_xpath(driver, "Question 3:", "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[16]/div/div/div[2]/div[3]/label[1]")
      check_field_contents(driver, "", "predefinedPasswordQuestion3", "Question 3:")

      sleep 2

      check_text_by_copy_xpath(driver, "Question 4:", "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[16]/div/div/div[2]/div[4]/label[1]")
      check_field_contents(driver, "", "predefinedPasswordQuestion4", "Question 4:")
      check_text_by_copy_xpath(driver, "Question 5:", "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[16]/div/div/div[2]/div[5]/label[1]")
      check_field_contents(driver, "", "predefinedPasswordQuestion5", "Question 5:")

      check_text_by_copy_xpath(driver, "Code:", "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[16]/div/div/div[2]/div[1]/label[2]")
      check_field_contents(driver, "", "predefinedQuestionCode1", "Code:")
      check_text_by_copy_xpath(driver, "Code:", "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[16]/div/div/div[2]/div[2]/label[2]")
      check_field_contents(driver, "", "predefinedQuestionCode2", "Code:")

      sleep 2

      check_text_by_copy_xpath(driver, "Code:", "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[16]/div/div/div[2]/div[3]/label[2]")
      check_field_contents(driver, "", "predefinedQuestionCode3", "Code:")
      check_text_by_copy_xpath(driver, "Code:", "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[16]/div/div/div[2]/div[4]/label[2]")
      check_field_contents(driver, "", "predefinedQuestionCode4", "Code:")
      check_text_by_copy_xpath(driver, "Code:", "//html/body/div[3]/div/div[2]/form/div[1]/div[10]/div[3]/div[16]/div/div/div[2]/div[5]/label[2]")
      check_field_contents(driver, "", "predefinedQuestionCode5", "Code:")

    end





    def check_user_interface(driver)

      driver.find_element(:css, "#sec10 > div.nlv-settings-row-title").click
      puts ""
      $log_found.puts ""
      $log_not_found.puts ""
      $log_error_occured.puts ""
      puts "User Interface Settings"
      $log_found.puts "User Interface Settings"
      $log_not_found.puts "User Interface Settings"
      $log_error_occured.puts "User Interface Settings"


      sleep 2

      check_options_by_span_title(driver, "Browser window title tag", "If this field contains a value, then all title tags will be changed to use the text entered. If this is left blank, then the title tags defined in the text resource file are used.")
      check_field_contents(driver, "Biscom SFT", "browserWindowTitle", "Browser window title tag")
      check_options_by_span_title(driver, "CSS stylesheet location", "Specifies the location on the file system of the custom style sheet. This can also be a valid URL.")
      check_field_contents(driver, "", "css", "CSS stylesheet location")
      check_options_by_span_title(driver, "Logo location", "Specifies the location on the file system of the logo. This can also be a valid URL.")
      check_field_contents(driver, "", "logo", "Logo location")

      sleep 2

      check_options_by_span_title(driver, "Logo links to (optional)", "This is the URL to link to when the logo is clicked. If this property is not set, the logo will link to the Logon page (if a user is not currently logged on), or the main application page (if a user is currently logged on)")
      check_field_contents(driver, "", "logoLink", "Logo links to (optional)")
      check_options_by_span_title(driver, "Logo width (pixels)", "The width of the logo in pixels.")
      check_field_contents(driver, "", "logoWidth", "Logo width (pixels)")
      check_options_by_span_title(driver, "Logo height (pixels)", "The height of the logo in pixels.")
      check_field_contents(driver, "", "logoHeight", "Logo height (pixels)")

      sleep 2

      check_options_by_span_title(driver, "Custom sign in text (top)", "This field enables administrators to modify or customize the area above the sign in text box (username/password fields). Administrators can use HTML and styles from the internal CSS style sheet or from an externally defined style sheet.")
      check_field_contents_using_text_area(driver, "                                                            Please enter your username and password to sign in                                                            ", "signInTextTop", "Custom sign in text (top)")
      check_option_using_link(driver, "Reset to original value", "Reset to original value")

      check_options_by_span_title(driver, "Custom sign in text (right)", "This field enables administrators to modify or customize the area to the right of the sign in text box (username/password fields). Administrators can use HTML and styles from the internal CSS style sheet or from an externally defined style sheet.")
      check_field_contents_using_text_area(driver, "                                                            <div><b>Register</b></br>If you don't have a username, register <a href='/bds/UserRegister.do'>here</a>.</div></br><div><b>Learn More</b></br>Tell me more about <a href='http://www.biscomdeliveryserver.com'>Biscom SFT</a>.</div>                                                            ", "signInTextRight", "Custom sign in text (right)")
      check_option_using_link(driver, "Reset to original value", "Reset to original value")

      sleep 2

      check_options_by_span_title(driver, "Custom web page footer", "This field enables administrators to modify or customize the bottom (footer) of every page in the web application. Administrators can use HTML and styles from the internal CSS style sheet or from an externally defined style sheet.")
      check_field_contents_using_text_area(driver, "                                                            <div id='layoutFooter'><a href='http://www.biscomdeliveryserver.com' target='_blank'><img src='/bds/images/logos/powered_by_biscom.gif' border='0' alt='Powered by Biscom' /></a></div>                                                            ", "customWebPageFooter", "Custom web page footer")
      check_option_using_link(driver, "Reset to original value", "Reset to original value")

      check_options_by_span_title(driver, "Custom help URL", "The help icon in the main menu will link to the internal help page (an abbreviated help section for users). You can define and link to your own help file by entering the URL for a customized help file in this field.")
      check_field_contents(driver, "", "customHelpUrl", "Custom help URL")

    end





    def check_reCAPTCHA_image_verification_settings(driver)

      driver.find_element(:css, "#sec11 > div.nlv-settings-row-title").click
      puts ""
      $log_found.puts ""
      $log_not_found.puts ""
      $log_error_occured.puts ""
      puts "reCAPTCHA image verification Settings"
      $log_found.puts "reCAPTCHA image verification Settings"
      $log_not_found.puts "reCAPTCHA image verification Settings"
      $log_error_occured.puts "reCAPTCHA image verification Settings"


      sleep 2

      check_options_by_span_title(driver, "Enable reCAPTCHA", "If set to Yes, image verification with reCAPTCHA will be enabled.")
      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[12]/div[3]/div[1]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver,"//html/body/div[3]/div/div[2]/form/div[1]/div[12]/div[3]/div[1]/div/label[1]/input","Yes","Enable reCAPTCHA")
      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[12]/div[3]/div[1]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver,"//html/body/div[3]/div/div[2]/form/div[1]/div[12]/div[3]/div[1]/div/label[2]/input","No","Enable reCAPTCHA")
      sleep 2

      check_options_by_span_title(driver, "reCAPTCHA public key", "The reCAPTCHA public key. Create an account with http://www.google.com/recaptcha for the public key.")
      check_field_contents(driver, "", "recaptchaPublicKey", "reCAPTCHA public key")
      check_options_by_span_title(driver, "reCAPTCHA private key", "The reCAPTCHA public key. Create an account with http://www.google.com/recaptcha for the private key.")
      check_field_contents(driver, "", "recaptchaPrivateKey", "reCAPTCHA private key")

      check_option_using_link(driver, "Solve a reCAPTCHA to test image verification settings", "Solve a reCAPTCHA to test image verification settings")

    end





    def check_microsoft_outlook_settings(driver)

      driver.find_element(:css, "#sec12 > div.nlv-settings-row-title").click
      puts ""
      $log_found.puts ""
      $log_not_found.puts ""
      $log_error_occured.puts ""
      puts "Microsoft Outlook Add-in Settings"
      $log_found.puts "Microsoft Outlook Add-in Settings"
      $log_not_found.puts "Microsoft Outlook Add-in Settings"
      $log_error_occured.puts "Microsoft Outlook Add-in Settings"

      sleep 2
      check_option_using_link(driver, "Configure Outlook add-in policies", "Configure Outlook add-in policies")

    end





    def check_SMTP_API_settings(driver)

      driver.find_element(:css, "#sec13 > div.nlv-settings-row-title").click
      puts ""
      $log_found.puts ""
      $log_not_found.puts ""
      $log_error_occured.puts ""
      puts "SMTP API Settings"
      $log_found.puts "SMTP API Settings"
      $log_not_found.puts "SMTP API Settings"
      $log_error_occured.puts "SMTP API Settings"

      sleep 2

      check_options_by_span_title(driver, "Allow SMTP Input (API)", "Set this to Yes if your server supports the SMTP API.")
      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[14]/div[3]/div[1]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver,"//html/body/div[3]/div/div[2]/form/div[1]/div[14]/div[3]/div[1]/div/label[1]/input","Yes","Allow SMTP Input (API)")
      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[14]/div[3]/div[1]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver,"//html/body/div[3]/div/div[2]/form/div[1]/div[14]/div[3]/div[1]/div/label[2]/input","No","Allow SMTP Input (API)")
      sleep 2

      check_options_by_span_title(driver, "Mail server name", "The IP address or host name of your mail server used with the Outlook Add-in.")
      check_field_contents(driver, "", "outlookAddinMailServer", "Mail server name")
      check_options_by_span_title(driver, "Mail server username", "The username to log onto the mail server to retrieve messages sent from the Outlook Add-in.")
      check_field_contents(driver, "", "outlookAddinMailServerUsername", "Mail server username")
      check_options_by_span_title(driver, "Mail server password", "The password to log onto the mail server to retrieve messages sent from the Outlook Add-in.")
      check_field_contents(driver, "", "outlookAddinMailServerPassword1", "Mail server password")

      sleep 2

      check_text_by_copy_xpath(driver, "Set", "//html/body/div[3]/div/div[2]/form/div[1]/div[14]/div[3]/div[4]/div[2]/div")
      check_text_by_copy_xpath(driver, "Clear", "//html/body/div[3]/div/div[2]/form/div[1]/div[14]/div[3]/div[4]/div[2]/div")

    end





    def check_proxy_server_settings(driver)

      driver.find_element(:css, "#sec14 > div.nlv-settings-row-title").click
      puts ""
      $log_found.puts ""
      $log_not_found.puts ""
      $log_error_occured.puts ""
      puts "Proxy server Settings"
      $log_found.puts "Proxy server Settings"
      $log_not_found.puts "Proxy server Settings"
      $log_error_occured.puts "Proxy server Settings"

      sleep 2

      check_options_by_span_title(driver, "Use proxy server", "Set this to Yes if your server users proxy server.")
      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[15]/div[3]/div[1]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver,"//html/body/div[3]/div/div[2]/form/div[1]/div[15]/div[3]/div[1]/div/label[1]/input","Yes","Use proxy server")
      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[15]/div[3]/div[1]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver,"//html/body/div[3]/div/div[2]/form/div[1]/div[15]/div[3]/div[1]/div/label[2]/input","No","Use proxy server")
      sleep 2

      check_options_by_span_title(driver, "Proxy host", "The host name or the IP address of the proxy server.")
      check_field_contents(driver, "", "proxyHost", "Proxy host")
      check_options_by_span_title(driver, "Proxy port", "The port number of the proxy server.")
      check_field_contents(driver, "", "proxyPort", "Proxy port")
      check_options_by_span_title(driver, "Username", "The proxy server username.")
      check_field_contents(driver, "", "proxyUsername", "Username")
      check_options_by_span_title(driver, "Password", "The proxy server password.")
      check_field_contents(driver, "", "proxyPassword", "Password")

    end





    def check_intranet_and_extranet_settings(driver)

      driver.find_element(:css, "#sec15 > div.nlv-settings-row-title").click
      puts ""
      $log_found.puts ""
      $log_not_found.puts ""
      $log_error_occured.puts ""
      puts "Intranet & Extranet Settings"
      $log_found.puts "Intranet & Extranet Settings"
      $log_not_found.puts "Intranet & Extranet Settings"
      $log_error_occured.puts "Intranet & Extranet Settings"

      sleep 2
      check_text_by_copy_xpath(driver, "Intranet", "//html/body/div[3]/div/div[2]/form/div[1]/div[16]/div[3]/div[1]/label/span")
      check_field_contents(driver, "", "intranet", "Intranet")
      check_text_by_copy_xpath(driver, "Intranet And Extranet: Setting", "//html/body/div[3]/div/div[2]/form/div[1]/div[16]/div[3]/div[3]/div/div/div[1]")

      sleep 2

      check_text_by_copy_xpath(driver, "Setting", "//html/body/div[3]/div/div[2]/form/div[1]/div[16]/div[3]/div[3]/div/div/table/thead/tr/th[1]")
      check_text_by_copy_xpath(driver, "For intranet", "//html/body/div[3]/div/div[2]/form/div[1]/div[16]/div[3]/div[3]/div/div/table/thead/tr/th[2]")
      check_text_by_copy_xpath(driver, "For extranet", "//html/body/div[3]/div/div[2]/form/div[1]/div[16]/div[3]/div[3]/div/div/table/thead/tr/th[3]")

      sleep 2

      check_options_by_span_title(driver, "Allow AD authentication", "Allow AD authentication for intranet or extranet.")
      is_checkbox_clicked_using_xpath(driver,"//html/body/div[3]/div/div[2]/form/div[1]/div[16]/div[3]/div[3]/div/div/table/tbody/tr[1]/td[2]/input","For intranet","Allow AD authentication")
      is_checkbox_clicked_using_xpath(driver,"//html/body/div[3]/div/div[2]/form/div[1]/div[16]/div[3]/div[3]/div/div/table/tbody/tr[1]/td[3]/input","For extranet","Allow AD authentication")
      check_options_by_span_title(driver, "Allow LDAP authentication", "Allow LDAP authentication for intranet or extranet.")
      is_checkbox_clicked_using_xpath(driver,"//html/body/div[3]/div/div[2]/form/div[1]/div[16]/div[3]/div[3]/div/div/table/tbody/tr[2]/td[2]/input","For intranet","Allow LDAP authentication")
      is_checkbox_clicked_using_xpath(driver,"//html/body/div[3]/div/div[2]/form/div[1]/div[16]/div[3]/div[3]/div/div/table/tbody/tr[2]/td[3]/input","For extranet","Allow LDAP authentication")


    end





    def check_mobile_settings(driver)

      driver.find_element(:css, "#sec16 > div.nlv-settings-row-title").click
      puts ""
      $log_found.puts ""
      $log_not_found.puts ""
      $log_error_occured.puts ""
      puts "Mobile Settings"
      $log_found.puts "Mobile Settings"
      $log_not_found.puts "Mobile Settings"
      $log_error_occured.puts "Mobile Settings"

      sleep 2

      check_text_by_copy_xpath(driver, "MobileIron app is required", "//html/body/div[3]/div/div[2]/form/div[1]/div[17]/div[3]/div[1]/label/span")

      sleep 2

      check_text_by_copy_xpath(driver, "Yes", "//html/body/div[3]/div/div[2]/form/div[1]/div[17]/div[3]/div[1]/div/label[1]")
      is_radiobutton_clicked_using_xpath(driver,"//html/body/div[3]/div/div[2]/form/div[1]/div[17]/div[3]/div[1]/div/label[1]/input","Yes","MobileIron app is required")
      check_text_by_copy_xpath(driver, "No", "//html/body/div[3]/div/div[2]/form/div[1]/div[17]/div[3]/div[1]/div/label[2]")
      is_radiobutton_clicked_using_xpath(driver,"//html/body/div[3]/div/div[2]/form/div[1]/div[17]/div[3]/div[1]/div/label[2]/input","No","MobileIron app is required")
    end






    def check_options_by_span_title(driver, text, span_title)

      begin
        if driver.find_element(:xpath, "//span[@title='#{span_title}']").text.include? "#{text}"
          puts " '#{text}' field found"
          $log_found.puts " '#{text}' field found"
        else
          puts " '#{text}' field not found"
          $log_not_found.puts " '#{text}' field not found"
        end
      rescue
        puts "Error occured in  '#{text}' field"
        $log_error_occured.puts "Error occured in  '#{text}' field"
      end

    end

    def check_title_text_by_class(driver, text, title)

      begin
        if driver.find_element(:class, "#{title}").text.include? "#{text}"
          puts "'#{text}' found"
          $log_found.puts "'#{text}' found"
        else
          puts "'#{text}' not found"
          $log_not_found.puts "'#{text}' not found"
        end
      rescue
        puts "Error occured in '#{text}' "
        $log_error_occured.puts "Error occured in '#{text}' "
      end

    end

    def check_title_text_by_title(driver, text, title)

      begin
        if driver.find_element(:xpath, "//div[@title='#{title}']").text.include? "#{text}"
          puts "'#{text}' found: Panel-Title"
          $log_found.puts "'#{text}' found: Panel-Title"
        else
          puts "'#{text}' not found: Panel-Title"
          $log_not_found.puts "'#{text}' not found: Panel-Title"
        end
      rescue
        puts "Error occured in '#{text}' "
        $log_error_occured.puts "Error occured in '#{text}' "
      end

    end

    def check_option_using_link(driver, text, link)

      begin
        if driver.find_element(:link, "#{link}").text.include? "#{text}"
          puts "'#{text}' found"
          $log_found.puts "'#{text}' found"
        else
          puts "'#{text}' not found"
          $log_not_found.puts "'#{text}' not found"
        end
      rescue
        puts "Error Occured in '#{text}'"
        $log_error_occured.puts "Error Occured in '#{text}'"
      end

    end

    # def check_options_using_class_title(driver, text, title)
    #
    #   begin
    #     if driver.find_element(:class, "#{title}").text.include? "#{text}"
    #       puts "'#{text}' found"
    #       $log_file.puts "'#{text}' found"
    #     else
    #       puts "'#{text}' not found"
    #       $log_file.puts "'#{text}' not found"
    #     end
    #   rescue
    #     puts "Error occured in '#{text}' "
    #     $log_file.puts "Error occured in '#{text}' "
    #   end
    #
    # end

    def check_options_by_css(driver, css, name)

      begin
        if driver.find_element(:css, "#{css}").text.include? "#{name}"
          puts "'#{name}' option found"
          $log_found.puts "'#{name}' option found"
        else
          puts "'#{name}' option not found"
          $log_not_found.puts "'#{name}' option not found"
        end
      rescue
        puts "Error occured in '#{name}' Menu"
        $log_error_occured.puts "Error occured in '#{name}' Menu"
      end

    end

    def check_text_by_descendant(driver, value1, class_name, value2, text)

      begin
        if driver.find_element(:xpath,"//'#{value1}'[@class='#{class_name}']/descendant::'#{value2}'[text()='#{text}']")
          puts "'#{text}' found"
          $log_found.puts "'#{text}' found"
        else
          puts "'#{text}' not found"
          $log_not_found.puts "'#{text}' not found"
        end
      rescue
        puts "Error occured in '#{text}' "
        $log_error_occured.puts "Error occured in '#{text}' "
      end

    end

    def check_text_by_copy_xpath(driver, text, path)

      begin
        if driver.find_element(:xpath, "#{path}").text.include? "#{text}"
          puts "'#{text}' found"
          $log_found.puts "'#{text}' found"
        else
          puts "'#{text}' not found"
          $log_not_found.puts "'#{text}' not found"
        end
      rescue
        puts "Error occured in '#{text}' "
        $log_error_occured.puts "Error occured in '#{text}' "
      end

    end

    def is_checkbox_clicked_using_xpath(driver,path,text, field)

      begin
        if driver.find_element(:xpath, "#{path}").attribute("checked")==nil
          puts("'#{text}' CheckBox Clicked in '#{field}' ")
          $log_checkbox_checked.puts("'#{text}' CheckBox Clicked in '#{field}' ")
        else
          puts("'#{text}' CheckBox Not Clicked in '#{field}' ")
          $log_checkbox_unchecked.puts("'#{text}' CheckBox Not Clicked in '#{field}' ")
        end
      rescue
        puts("'#{text}' CheckBox Error occured in '#{field}' ")
        $log_error_occured.puts("'#{text}' CheckBox Error occured in '#{field}' ")
      end

    end

    def is_radiobutton_clicked_using_xpath(driver,path,text, field)

      begin
        if driver.find_element(:xpath, "#{path}").attribute("checked")==nil
          puts("'#{text}' RadioButton Clicked in '#{field}' ")
          $log_radio_checked.puts("'#{text}' RadioButton Clicked in '#{field}' ")
        else
          puts("'#{text}' RadioButton Not Clicked in '#{field}' ")
          $log_radio_unchecked.puts("'#{text}' RadioButton Not Clicked in '#{field}' ")
        end
      rescue
        puts("'#{text}' RadioButton Error occured in '#{field}' ")
        $log_error_occured.puts("'#{text}' RadioButton Error occured in '#{field}' ")
      end

    end

    def check_field_contents(driver, expected_content, text_box_name, field_name)

      existing_content = driver.find_element(:xpath, "//input[@name='#{text_box_name}']")['value']

      begin
        if existing_content == expected_content
          puts " '#{field_name}' field's contents match"
          $log_content_match.puts " '#{field_name}' field's contents match"
        else
          puts "'#{field_name}' field's contents do not match"
          $log_content_does_not_match.puts "'#{field_name}' field's contents do not match"
        end
      rescue
        puts "Error occured in '#{field_name}' field"
        $log_error_occured.puts "Error occured in '#{field_name}' field"
      end

    end

    def check_field_contents_using_text_area(driver, expected_content, text_box_name, field_name)

      existing_content = driver.find_element(:xpath, "//textarea[@name='#{text_box_name}']")['value']

      begin
        if existing_content == expected_content
          puts " '#{field_name}' field's contents match"
          $log_content_match.puts " '#{field_name}' field's contents match"
        else
          puts "'#{field_name}' field's contents do not match"
          $log_content_does_not_match.puts "'#{field_name}' field's contents do not match"
        end
      rescue
        puts "Error occured in '#{field_name}' field"
        $log_error_occured.puts "Error occured in '#{field_name}' field"
      end

    end

    def check_dropdown_list_content(driver, path, expected_content, field_name)

      begin
        if driver.find_element(:xpath, "#{path}").attribute("value") == "#{expected_content}"
          puts("Dropdown list content matches in '#{field_name}' field")
          $log_found.puts("Dropdown list content matches in '#{field_name}' field")
        else
          puts("Dropdown list content does not match in '#{field_name}' field")
          $log_not_found.puts("Dropdown list content does not match in '#{field_name}' field")
        end
      rescue
        puts ("Error occured in Dropdown list in '#{field_name}' field")
        $log_error_occured.puts ("Error occured in Dropdown list in '#{field_name}' field")
      end

    end

    def check_options_by_css_for_edit(driver, css, name, field)

      begin
        if driver.find_element(:css, "#{css}").text.include? "#{name}"
          puts "'#{name}' option found in '#{field}' field"
          $log_found.puts "'#{name}' option found in '#{field}' field"
        else
          puts "'#{name}' option not found in '#{field}' field"
          $log_not_found.puts "'#{name}' option not found in '#{field}' field"
        end
      rescue
        puts "Error occured in '#{name}' Menu"
        $log_error_occured.puts "Error occured in '#{name}' in '#{field}' field"
      end

    end




  end
end