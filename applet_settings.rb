module AppletSettings

  class AppletConfiguration

    def applet_enable(server,driver)

      driver.find_element(:xpath, "//div[@id='layoutLogo']/a/img").click
      sleep(2)
      driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
      driver.find_element(:xpath, "//li[@id='serverConfigLink']/a/span[2]").click
      sleep(2)
      driver.find_element(:css, "#sec3 > div.nlv-settings-row-title").click
      sleep(2)
      driver.find_element(:xpath, "//input[@name='allowAppletUsage' and @value='Y']").click
      driver.switch_to.alert.accept
      driver.find_element(:xpath, "//input[@value='Update']").click

    end

    def applet_disable(server,driver)

      driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
      driver.find_element(:xpath, "//li[@id='serverConfigLink']/a/span[2]").click
      sleep(2)
      driver.find_element(:css, "#sec3 > div.nlv-settings-row-title").click
      sleep(2)
      driver.find_element(:xpath, "//input[@name='allowAppletUsage' and @value='N']").click
      driver.find_element(:xpath, "//input[@value='Update']").click

    end
  end

end