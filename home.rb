module Home

  class GoToHome

    def home_page(server,driver)

      driver.find_element(:xpath, "//div[@id='layoutLogo']/a/img").click
      sleep(4)

    end

    def manage_user_page(server,driver)
      sleep 2
      driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
      sleep 2
      driver.find_element(:xpath, "//li[@id='manageUsersLink']/a/span[2]").click
      sleep 4

    end

  end

end