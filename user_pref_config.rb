module UserPreference

  class SetPreferences

    def applet_settings(server,driver)
      driver.find_element(:xpath,"//a[contains(@href, '#menu1')]").click
      driver.find_element(:link, "Set Preferences").click
      sleep 2
      driver.find_element(:xpath,'//input[@name="useApplet"]').click
      sleep 2
      driver.switch_to.alert.accept
      driver.find_element(:xpath, "//button[@type='submit']").click
    end

    def applet_set_no(server, driver)
      driver.find_element(:xpath,"//a[contains(@href, '#menu1')]").click
      driver.find_element(:link, "Set Preferences").click
      sleep 2
      driver.find_element(:xpath,"(//input[@name='useApplet'])[2]").click
      sleep 2
      driver.find_element(:xpath, "//button[@type='submit']").click
      sleep 2
    end

    def enable_secure_reply_to_all(server,driver)
      driver.find_element(:xpath,"//a[contains(@href, '#menu1')]").click
      driver.find_element(:link, "Set Preferences").click
      driver.find_element(:xpath,"(//input[@name='allowSecureReply'])").click
      driver.find_element(:xpath, "//button[@type='submit']").click
      sleep 2
    end

  end
end