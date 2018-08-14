module ExchageServer

  class ManageExchageServer

    def create_exchage_server_conn(server,driver)
      #driver.find_element(:link, "Administration").click
      sleep 2
      driver.find_element(:xpath, "//li[@id='serverConfigLink']/a/span[2]").click
      sleep 2
      driver.find_element(:css, "#sec7 > div.nlv-settings-row-title").click
      sleep 2
      driver.find_element(:link, "Manage Exchange Server connections").click
      sleep 2
      driver.find_element(:link, "Action").click
      driver.find_element(:link, "Create Exchange Server connection").click
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

      driver.find_element(:link, "EXCH01").click
      driver.find_element(:xpath, "//button[@type='submit']").click
      a=driver.switch_to.alert
      window_message=a.text
      expected_message='Proceed with refreshing cached Global Address List \(GAL\) data'
      #if expected_message==window_message
      sleep 3
      driver.switch_to.alert.accept
      driver.find_element(:link, "Back to Manage Exchange Server Connections").click
    end
  end
end