module ExternalAuthenticationSource

  class AuthenticationSourceConf

    def AD_authentication_source(server,driver)
      #test
      driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
      driver.find_element(:xpath, "//li[@id='serverConfigLink']/a/span[2]").click
      sleep 2
      driver.find_element(:css, "#sec8 > div.nlv-settings-row-title").click
      sleep 2
      driver.find_element(:name, "externalAuthSource").click
      driver.find_element(:xpath, "//input[@value='Update']").click
      driver.find_element(:css, "#sec8 > div.nlv-settings-row-title").click
      sleep 2
      driver.find_element(:link, "External authentication source configuration").click
      sleep 2
      driver.find_element(:link, "Action").click
      driver.find_element(:link, "Create AD Authentication Source").click

      sleep 4
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
      driver.find_element(:xpath, "//button[@type='submit']").click

      driver.find_element(:link, "Action").click
      sleep 2
      driver.find_element(:link, "Edit").click
      sleep 2
      driver.find_element(:name, "adConnectorHost").clear
      sleep 2
      driver.find_element(:name, "adConnectorHost").send_keys ""
      driver.find_element(:xpath, "//button[@type='submit']").click

      a=driver.switch_to.alert
      window_message=a.text
      expected_message='The following problems occurred: \n - Connector host must be entered.'
      #if expected_message==window_message
      sleep 3
      driver.switch_to.alert.accept


      driver.find_element(:name, "adConnectorHost").clear
      driver.find_element(:name, "adConnectorHost").send_keys "192.168.10.46"
      driver.find_element(:name, "adConnectorPort").clear
      driver.find_element(:name, "adConnectorPort").send_keys ""
      driver.find_element(:xpath, "//button[@type='submit']").click
      a=driver.switch_to.alert
      window_message=a.text
      expected_message='The following problems occurred: \n - Connector port must be entered.'
      #if expected_message==window_message
      sleep 3
      driver.switch_to.alert.accept

      driver.find_element(:name, "adConnectorPort").clear
      driver.find_element(:name, "adConnectorPort").send_keys "65330"
      driver.find_element(:xpath, "//button[@type='submit']").click
    end

  def open_ldap(server,driver)
    driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
    driver.find_element(:xpath, "//li[@id='serverConfigLink']/a/span[2]").click
    driver.find_element(:css, "#sec8 > div.nlv-settings-row-title").click
    sleep 2
    driver.find_element(:name, "externalAuthSource").click
    driver.find_element(:xpath, "//input[@value='Update']").click
    driver.find_element(:css, "#sec8 > div.nlv-settings-row-title").click
    sleep 2
    driver.find_element(:link, "External authentication source configuration").click
    sleep 2
    driver.find_element(:link, 'Action').click
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
  end

    def sun_one_ldap(server,driver)
      driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
      driver.find_element(:xpath, "//li[@id='serverConfigLink']/a/span[2]").click
      driver.find_element(:css, "#sec8 > div.nlv-settings-row-title").click
      sleep 2
      driver.find_element(:name, "externalAuthSource").click
      driver.find_element(:xpath, "//input[@value='Update']").click
      driver.find_element(:css, "#sec8 > div.nlv-settings-row-title").click
      sleep 2
      driver.find_element(:link, "External authentication source configuration").click
      sleep 2
      driver.find_element(:link, 'Action').click
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
  end



end