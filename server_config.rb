module ServerConfiguration

  class ServerSetUp

    def fresh_config(server,driver)
      sleep 2
      # driver.find_element(:name, 'username').clear
      # driver.find_element(:name, 'username').send_keys("admin")
      # driver.find_element(:name, 'oldpasswd').clear
      # driver.find_element(:name, 'oldpasswd').send_keys("admin")
      # driver.find_element(:name, 'password1').clear
      # driver.find_element(:name, 'password1').send_keys("admin")
      # driver.find_element(:name, 'password2').clear
      # driver.find_element(:name, 'password2').send_keys("admin")
      #
      # driver.find_element(:xpath, "//input[@value='Update']").click
      # sleep 2
    end

    def server_configuration(server,driver)
      driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
      driver.find_element(:xpath, "//li[@id='serverConfigLink']/a/span[2]").click
      sleep 2
      driver.find_element(:css, "div.nlv-settings-row-title").click
      sleep 2
      driver.find_element(:name, 'companyName').clear
      driver.find_element(:name, 'companyName').send_keys("Nilavo")
      Selenium::WebDriver::Support::Select.new(driver.find_element(:name, "timezone")).select_by(:text, "GMT +06:00 Bangladesh")
      driver.find_element(:xpath, "//input[@value='Update']").click
    end

    def email_settings(server,driver,mail_server)
      sleep 2
      driver.find_element(:css, "#sec1 > div.nlv-settings-row-title").click
      sleep 2
      driver.find_element(:name, 'mailServer').clear
      driver.find_element(:name, 'mailServer').send_keys(mail_server)
      driver.find_element(:name, 'mailServerUsername').clear
      driver.find_element(:name, 'mailServerUsername').send_keys("sakib1")
      driver.find_element(:xpath, "//button[@type='button']").click
      sleep 1
      driver.find_element(:id, "password").clear
      driver.find_element(:id, "password").send_keys "1234"
      driver.find_element(:id, "confirmPassword").clear
      driver.find_element(:id, "confirmPassword").send_keys "1234"
      driver.find_element(:class, "btn-sm").click
      #driver.find_element(:xpath, "(//button[@type='button'])[10]").click
      #driver.find_element(:xpath, "//button[@type='button']").click
      driver.find_element(:xpath, "//input[@value='Update']").click
    end

    def delivery_settings(server,driver)
      #Configure limited sender
       sleep 2
      driver.find_element(:css, "#sec2 > div.nlv-settings-row-title").click
      sleep 2
      driver.find_element(:link, "Configure limited sender settings").click
      driver.find_element(:xpath, "//body[@id='ng-app']/div[3]/div/div[2]/form/div/div[2]/input").click
      driver.find_element(:xpath, "//input[@value='Update']").click
      driver.find_element(:link, "Server Configuration").click
       sleep 2
       driver.find_element(:css, "#sec2 > div.nlv-settings-row-title").click
       driver.find_element(:name,"enableSecureReply").click
       driver.find_element(:name, "enableCollaboration").click
       driver.find_element(:xpath, "//input[@value='Update']").click
    end

    def package_settings(server,driver)
      driver.find_element(:css, "#sec3 > div.nlv-settings-row-title").click
      sleep 2
      driver.find_element(:name, "allowAppletUsage").click
      alert=driver.switch_to.alert();
      alert.accept()
      driver.find_element(:name,'allowAppletUsageForDownload').click
      driver.find_element(:xpath, "//input[@value='Update']").click
    end

    def workspace_settings(server,driver)
      driver.find_element(:css, "#sec4 > div.nlv-settings-row-title").click
      sleep 2
      driver.find_element(:name, "workspaceEnable").click
      driver.find_element(:xpath, "//input[@value='Update']").click

    end

    def antivirus_settings(server,driver)
      sleep 2
      driver.find_element(:css, "#sec5 > div.nlv-settings-row-title").click
      sleep 2
      driver.find_element(:name, 'antivirusEnable').click
      #driver.find_element(:xpath, '//input[@name="logo"]').send_keys('http://image.blingee.com/images16/content/output/000/000/000/55f/441573393_1760587.gif?4')
      driver.find_element(:xpath, '//input[@value="Update"]').click
      sleep 5
    end

    def user_settings(server,driver)
      sleep 2
      driver.find_element(:css, "#sec6 > div.nlv-settings-row-title").click
      sleep 2
      driver.find_element(:name,'enableComplianceRole').click
      driver.find_element(:xpath, '//input[@value="Update"]').click
      sleep 2
    end

    def contact_and_group_settings(server,driver)
      #Exchange settings
      sleep 2
      driver.find_element(:css, "#sec7 > div.nlv-settings-row-title").click
      sleep 2
      driver.find_element(:link, "Manage Exchange Server connections").click
      sleep 4
      #driver.find_element(:xpath, "//button[@class='btn-default']")
      driver.find_element(:xpath, "//button").click

      #driver.find_element(:link, "Action").click
      sleep 2
      driver.find_element(:link, "Create Exchange Server connection").click
      sleep 2
      driver.find_element(:name, "serverName").clear
      driver.find_element(:name, "serverName").send_keys "EXCH01"
      driver.find_element(:name, "domainName").clear
      driver.find_element(:name, "domainName").send_keys "qa-server5"
      driver.find_element(:name, "fqdn").clear
      driver.find_element(:name, "fqdn").send_keys "qa-server5.com"
      driver.find_element(:name, "userName").clear
      driver.find_element(:name, "userName").send_keys "user_s"
      driver.find_element(:name, "password").clear
      driver.find_element(:name, "password").send_keys "1234"
      driver.find_element(:name, "confirmPassword").clear
      driver.find_element(:name, "confirmPassword").send_keys "1234"
      driver.find_element(:name, "adConnectorHost").clear
      driver.find_element(:name, "adConnectorHost").send_keys "192.168.10.46"
      driver.find_element(:xpath, "//button[@type='submit']").click
      driver.find_element(:link, "Manage Exchange Server Connections").click
      accept_next_alert = false
      driver.find_element(:link, "Enable").click
      a=driver.switch_to.alert
      window_message=a.text
      expected_message='Enable Exchange Server connections.'
      #if expected_message==window_message
      sleep 3
      driver.switch_to.alert.dismiss

      driver.find_element(:link, "Enable").click
      a=driver.switch_to.alert
      window_message=a.text
      expected_message='Enable Exchange Server connections.'
      #if expected_message==window_message
      sleep 3
      driver.switch_to.alert.accept
      sleep 2
      driver.find_element(:link, "EXCH01").click
      sleep 2
      driver.find_element(:xpath, "//button[@type='submit']").click
      a=driver.switch_to.alert
      window_message=a.text
      expected_message='Proceed with refreshing cached Global Address List \(GAL\) data'
      #if expected_message==window_message
      sleep 3
      driver.switch_to.alert.accept
      sleep 2
      driver.find_element(:link, "Back to Manage Exchange Server Connections").click
      sleep 2
      driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
      driver.find_element(:xpath, "//li[@id='serverConfigLink']/a/span[2]").click
    end

    def sign_in_and_password(server,driver)

      sleep 2
      driver.find_element(:css, "#sec8 > div.nlv-settings-row-title").click
      driver.find_element(:name, "logonAttemptsMax").clear
      driver.find_element(:name, "logonAttemptsMax").send_keys "3"
      driver.find_element(:name, "passwordLengthMin").clear
      driver.find_element(:name, "passwordLengthMin").send_keys "4"
      driver.find_element(:name, "forceUppercase").click
      driver.find_element(:name, "forceLowercase").click
      driver.find_element(:name, "forceDigit").click
      driver.find_element(:name, "forceNonAlpha").click
      driver.find_element(:css, "div.col-xs-4 > label.radio-inline > input[name=\"allowNonAlphaType\"]").click
      sleep 2
      driver.find_element(:name, "allowedNonAlphaList").clear
      driver.find_element(:name, "allowedNonAlphaList").send_keys "!@#*"
      driver.find_element(:xpath, "//input[@value='Update']").click
      #External authentication source configuration (AD)
      sleep 2
      driver.find_element(:css, "#sec8 > div.nlv-settings-row-title").click
      sleep 2
      driver.find_element(:name, "externalAuthSource").click
      driver.find_element(:xpath, "//input[@value='Update']").click
      sleep 2
      driver.find_element(:css, "#sec8 > div.nlv-settings-row-title").click
      sleep 2
      driver.find_element(:link, "External authentication source configuration").click
      sleep 2
      driver.find_element(:xpath, "//button").click
      sleep 2
      #driver.find_element(:link, "Action").click
      driver.find_element(:link, "Create AD Authentication Source").click
      sleep 2
      driver.find_element(:name, "sourceName").clear
      driver.find_element(:name, "sourceName").send_keys "Test QA"
      driver.find_element(:name, "realm").clear
      driver.find_element(:name, "realm").send_keys "qa-server5.com"
      driver.find_element(:name, "systemUsername").clear
      driver.find_element(:name, "systemUsername").send_keys "user_s"
      driver.find_element(:name, "systemUserPassword").clear
      driver.find_element(:name, "systemUserPassword").send_keys "1234"
      driver.find_element(:name, "confirmSystemUserPassword").clear
      driver.find_element(:name, "confirmSystemUserPassword").send_keys "1234"
      driver.find_element(:name, "adConnectorHost").clear
      driver.find_element(:name, "adConnectorHost").send_keys "192.168.10.46"
      driver.find_element(:name, "sender").clear
      driver.find_element(:name, "sender").send_keys "Senders"
      driver.find_element(:name, "recepient").clear
      driver.find_element(:name, "recepient").send_keys "Recipients"
      driver.find_element(:name, "collaborator").clear
      driver.find_element(:name, "collaborator").send_keys "Collaborators"
      driver.find_element(:name, "admin").clear
      driver.find_element(:name, "admin").send_keys "Super Admin"
      #driver.find_element(:xpath, "//button[@type='submit']").click
      driver.find_element(:name, "adConnectorPort").clear
      driver.find_element(:name, "adConnectorPort").send_keys "65330"
      driver.find_element(:xpath, "//button[@type='submit']").click
      driver.find_element(:link,"Manage External Authentication Sources").click

      #OpenLDAP
      sleep 2
      sleep 2
      driver.find_element(:xpath, "//button").click
      sleep 2
      driver.find_element(:link, "Create LDAP Authentication Source").click
      driver.find_element(:name, "sourceName").clear
      driver.find_element(:name, "sourceName").send_keys "QA-SERVER2"
      driver.find_element(:name, "server").clear
      driver.find_element(:name, "server").send_keys "qa-server2.com"
      driver.find_element(:name, "usernameAttribute").clear
      driver.find_element(:name, "usernameAttribute").send_keys "cn"
      driver.find_element(:name, "groupMembershipAttribute").clear
      driver.find_element(:name, "groupMembershipAttribute").send_keys "uniqueMember"
      driver.find_element(:name, "emailAddress").clear
      driver.find_element(:name, "emailAddress").send_keys "mail"
      driver.find_element(:name, "firstName").clear
      driver.find_element(:name, "firstName").send_keys "givenName"
      driver.find_element(:name, "lastName").clear
      driver.find_element(:name, "lastName").send_keys "sn"
      driver.find_element(:name, "displayAs").clear
      driver.find_element(:name, "displayAs").send_keys "displayName"
      driver.find_element(:name, "company").clear
      driver.find_element(:name, "company").send_keys "Company"
      driver.find_element(:name, "baseDNs").clear
      driver.find_element(:name, "baseDNs").send_keys "ou=users,dc=qa-server2,dc=com"
      driver.find_element(:name, "recepient").clear
      driver.find_element(:name, "recepient").send_keys "Domain users"
      driver.find_element(:name, "limitedSender").clear
      driver.find_element(:name, "limitedSender").send_keys "Biscom Limited Sender Group"
      driver.find_element(:name, "sender").clear
      driver.find_element(:name, "sender").send_keys "Biscom Sender Group\nBiscom SR Group\nBiscom SRRP Group\nBiscom SRP Group"
      driver.find_element(:name, "report").clear
      driver.find_element(:name, "report").send_keys "Biscom Report Group"
      driver.find_element(:name, "compliance").clear
      driver.find_element(:name, "compliance").send_keys "Biscom Compliance Group"
      driver.find_element(:name, "usrAdmin").clear
      driver.find_element(:name, "usrAdmin").send_keys "Biscom User administrator Group"
      driver.find_element(:name, "sysAdmin").clear
      driver.find_element(:name, "sysAdmin").send_keys "System Admin Group\nBiscom SRA Group"
      driver.find_element(:name, "admin").clear
      driver.find_element(:name, "admin").send_keys "Biscom Super user Group"
      driver.find_element(:name, "outlookAddIn").clear
      driver.find_element(:name, "outlookAddIn").send_keys "Biscom Sender Group\nBiscom SR Group\nBiscom SRRP Group\nBiscom SRP Group"
      driver.find_element(:xpath, "//button[@type='submit']").click
      driver.find_element(:link, "Manage External Authentication Sources").click

      #SunOne
      sleep 2
      driver.find_element(:xpath, "//button").click
      sleep 2
      driver.find_element(:link, "Create LDAP Authentication Source").click
      sleep 2
      Selenium::WebDriver::Support::Select.new(driver.find_element(:name, "sourceType")).select_by(:text, "Sun One Directory Server")
      driver.find_element(:name, "sourceName").clear
      driver.find_element(:name, "sourceName").send_keys "QA-SERVER3"
      driver.find_element(:name, "server").clear
      driver.find_element(:name, "server").send_keys "qa-server3.com"
      driver.find_element(:id,'portId').clear
      driver.find_element(:id,'portId').send_keys'54727'
      driver.find_element(:name, "usernameAttribute").clear
      driver.find_element(:name, "usernameAttribute").send_keys "uid"
      driver.find_element(:name, "groupMembershipAttribute").clear
      driver.find_element(:name, "groupMembershipAttribute").send_keys "uniqueMember"
      driver.find_element(:name, "emailAddress").clear
      driver.find_element(:name, "emailAddress").send_keys "mail"
      driver.find_element(:name, "firstName").clear
      driver.find_element(:name, "firstName").send_keys "givenName"
      driver.find_element(:name, "lastName").clear
      driver.find_element(:name, "lastName").send_keys "sn"
      driver.find_element(:name, "displayAs").clear
      driver.find_element(:name, "displayAs").send_keys "displayName"
      driver.find_element(:name, "company").clear
      driver.find_element(:name, "company").send_keys "o"
      driver.find_element(:name, "baseDNs").clear
      driver.find_element(:name, "baseDNs").send_keys "ou=people,dc=qa-server3,dc=com"
      driver.find_element(:name, "recepient").clear
      driver.find_element(:name, "recepient").send_keys "Domain users"
      driver.find_element(:name, "limitedSender").clear
      driver.find_element(:name, "limitedSender").send_keys "Biscom Limited Sender Group"
      driver.find_element(:name, "sender").clear
      driver.find_element(:name, "sender").send_keys "Biscom Sender Group\nBiscom SR Group\nBiscom SRRP Group\nBiscom SRP Group"
      driver.find_element(:name, "report").clear
      driver.find_element(:name, "report").send_keys "Biscom Report Group"
      driver.find_element(:name, "compliance").clear
      driver.find_element(:name, "compliance").send_keys "Biscom Compliance Group"
      driver.find_element(:name, "usrAdmin").clear
      driver.find_element(:name, "usrAdmin").send_keys "Biscom User administrator Group"
      driver.find_element(:name, "sysAdmin").clear
      driver.find_element(:name, "sysAdmin").send_keys "System Admin Group\nBiscom SRA Group"
      driver.find_element(:name, "admin").clear
      driver.find_element(:name, "admin").send_keys "Biscom Super user Group"
      driver.find_element(:name, "outlookAddIn").clear
      driver.find_element(:name, "outlookAddIn").send_keys "Biscom Sender Group\nBiscom SR Group\nBiscom SRRP Group\nBiscom SRP Group"
      driver.find_element(:xpath, "//button[@type='submit']").click
      driver.find_element(:link, "Manage External Authentication Sources").click
      driver.find_element(:xpath,"//input[@value='Cancel']").click
    end

    def user_registration(server,driver,restricted_email)
      sleep 2
      tos_value='This is new Terms Of Service'
      driver.find_element(:css, "#sec9 > div.nlv-settings-row-title").click
      sleep 2
      driver.find_element(:name,'requireAdministratorApproval').click
      driver.find_element(:name, "selfRegistrationEmailsNotAllowed").clear
      driver.find_element(:name, "selfRegistrationEmailsNotAllowed").send_keys (restricted_email)

      driver.find_element(:name, "requireTermsOfService").click
      driver.find_element(:xpath,"//textarea[@name='termsOfService']").clear
      driver.find_element(:xpath,"//textarea[@name='termsOfService']").send_keys('This is new Terms Of Service')
      driver.find_element(:xpath, "//input[@value='Update']").click
      if(driver.find_element(:tag_name => "body").text.include?"This is new Terms Of Service")
        driver.find_element(:xpath, "//input[@value='I accept the terms of service']").click
      end
      return tos_value
    end

    def user_interface(server,driver)
      sleep 2
      driver.find_element(:css, "#sec10 > div.nlv-settings-row-title").click
      sleep 2
      driver.find_element(:name, "css").clear
      #driver.find_element(:name, "css").send_keys "http://dahukv1/test.css"
      driver.find_element(:xpath,"//textarea[@name='signInTextTop']").clear
      driver.find_element(:xpath,"//textarea[@name='signInTextTop']").send_keys('New Top Value')
      driver.find_element(:xpath, "//input[@value='Update']").click

    end

    def reCAPTCHA(server,driver)
      sleep 2
      driver.find_element(:css, "#sec11 > div.nlv-settings-row-title").click
      driver.find_element(:name, "enableRecaptcha").click
      driver.find_element(:name, "recaptchaPublicKey").clear
      driver.find_element(:name, "recaptchaPublicKey").send_keys "6LcqGAkAAAAAAGXAdB0NUaIgbAlGMz1OxDebrdkP"
      driver.find_element(:name, "recaptchaPrivateKey").clear
      driver.find_element(:name, "recaptchaPrivateKey").send_keys "6LcqGAkAAAAAAEfcRwgu9zrHlOOuqPLfT0nK8PHJ"
      driver.find_element(:xpath, "//input[@value='Update']").click
    end

    def outlook_addin(server,driver)
      sleep 2
      driver.find_element(:css, "#sec12 > div.nlv-settings-row-title").click
    end

    def SMTP_API_settings(server,driver)
      sleep 2
      driver.find_element(:css, "#sec13 > div.nlv-settings-row-title").click
    end

    def proxy_server_settings(server,driver)
      sleep 2
      driver.find_element(:css, "#sec14 > div.nlv-settings-row-title").click
    end

    def intranet_and_extranet_settings(server,driver)
      sleep 2
      driver.find_element(:css, "#sec15 > div.nlv-settings-row-title").click
    end

    def mobile_settings(server,driver)
      sleep 2
      driver.find_element(:css, "#sec16 > div.nlv-settings-row-title").click
    end
  end
end