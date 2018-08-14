module UserProfile

  class EditProfile

    def view_profile(server,driver)

      driver.find_element(:xpath,"//a[contains(@href, '#menu1')]").click
      driver.find_element(:link, "Edit Profile").click
      sleep(7)

    end

    def set_preferences_delivery_sort_order_Descending(server,driver)

      sleep 2
      driver.find_element(:xpath,"//a[contains(@href, '#menu1')]").click
      sleep 2
      driver.find_element(:link, "Set Preferences").click
      sleep 2
      Selenium::WebDriver::Support::Select.new(driver.find_element(:xpath, "//select[@name='userSortOrder']")).select_by(:text, "Descending")
      driver.action.send_keys(:enter)
      sleep 2
      driver.find_element(:xpath, "//button[@type='submit']").click
      sleep 2



    end

    def set_preferences_delivery_sort_order_Ascending(server,driver)

      sleep 2
      driver.find_element(:xpath,"//a[contains(@href, '#menu1')]").click
      sleep 2
      driver.find_element(:link, "Set Preferences").click
      sleep 2
      Selenium::WebDriver::Support::Select.new(driver.find_element(:xpath, "//select[@name='userSortOrder']")).select_by(:text, "Ascending")
      driver.action.send_keys(:enter)
      sleep 2
      driver.find_element(:xpath, "//button[@type='submit']").click
      sleep 2


    end

    def change_password(server,driver,old_password,new_password)
      sleep 2
      driver.find_element(:xpath,"//a[contains(@href, '#menu1')]").click
      driver.find_element(:link, "Edit Profile").click
      sleep(2)
      driver.find_element(:link, "Change password").click
      sleep 2
      driver.find_element(:name, 'oldpasswd').clear
      driver.find_element(:name, 'oldpasswd').send_keys("#{old_password}")
      driver.find_element(:name, 'password1').clear
      driver.find_element(:name, 'password1').send_keys("#{new_password}")
      driver.find_element(:name, 'password2').clear
      driver.find_element(:name, 'password2').send_keys("#{new_password}")
      driver.find_element(:xpath, '//input[@value="Update"]').click
      sleep 2




    end

  end
end