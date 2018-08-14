module EditUser

  class UserEdit
    def user_role_edit(server,driver,user,role)
      sleep 2
      driver.find_element(:xpath, "//div[@id='layoutLogo']/a/img").click
      sleep 2
      driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
      sleep 2
      driver.find_element(:xpath, "//li[@id='manageUsersLink']/a/span[2]").click
      sleep 2
      driver.find_element(:name, "searchString").clear
      driver.find_element(:name, "searchString").send_keys "#{user}"
      #driver.find_element(:xpath, "//button[@type='submit']").click
      driver.find_element(:xpath, "//input[@value='Search']").click
      sleep 2
      driver.find_element(:link, "#{user}").click
      sleep 2
      case role
        when 1
          driver.find_element(:name, "roleSender").click
        when 2
          driver.find_element(:name, "roleRecipient").click
        when 3
          driver.find_element(:name, "roleReport").click
        when 4
          driver.find_element(:name, "roleLimitedSender").click
        else
          puts "You gave me #{a} -- I have no idea what to do with that."
      end
      driver.find_element(:css, "button.btn.btn-primary").click
      #driver.find_element(:link, "Back").click
    end

    def user_other_options_edit(server,driver,user,option,quota)
      driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
      sleep 2
      driver.find_element(:xpath, "//li[@id='manageUsersLink']/a/span[2]").click
      sleep 2

      driver.find_element(:name, "searchString").clear
      driver.find_element(:name, "searchString").send_keys "#{user}"
      #driver.find_element(:xpath, "//button[@type='submit']").click
      driver.find_element(:xpath, "//input[@value='Search']").click
      sleep 2
      driver.find_element(:link, "#{user}").click
      sleep 2
     case option
        when "outlook"      # to select outlook option pass quota = 0 while calling this function
          driver.find_element(:name, "outlook").click

        when "quota"
          driver.find_element(:name, 'quota').clear
          driver.find_element(:name, 'quota').send_keys("#{quota}")

        else
          puts "You gave me #{a} -- I have no idea what to do with that."
      end
      driver.find_element(:css, "button.btn.btn-primary").click
      #driver.find_element(:link, "Back").click
    end

    def pending_user_approval(server,driver,user_name)

      sleep 2
      driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
      sleep 2
      driver.find_element(:xpath, "//li[@id='manageUsersLink']/a/span[2]").click
      sleep 2

      driver.find_element(:name, "searchString").clear
      driver.find_element(:name, "searchString").send_keys "#{user_name}"
      sleep 4
      #driver.find_element(:xpath, "//button[@type='submit']").click
      driver.find_element(:xpath, "//input[@value='Search']").click
      sleep 2
      driver.find_element(:link, "#{user_name}").click
      sleep 2

      driver.find_element(:link,'Activate user account').click
      #sleep 2
      driver.find_element(:link, "Approve user account").click
      sleep 5

    end

    def unlock_user(server,driver,user_name)

      sleep 2
      driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
      sleep 2
      driver.find_element(:xpath, "//li[@id='manageUsersLink']/a/span[2]").click
      sleep 2

      driver.find_element(:name, "searchString").clear
      driver.find_element(:name, "searchString").send_keys "#{user_name}"
      #driver.find_element(:xpath, "//button[@type='submit']").click
      driver.find_element(:xpath, "//input[@value='Search']").click
      sleep 2
      driver.find_element(:link, "#{user_name}").click
      sleep 2
      driver.find_element(:name, "signInLocked").click
      sleep 2
      driver.find_element(:css, "button.btn.btn-primary").click
      sleep 2

    end

    def user_other_options_edit_two(server,driver,user,option,quota)
      driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
      sleep 2
      driver.find_element(:xpath, "//li[@id='manageUsersLink']/a/span[2]").click

      sleep 2

      driver.find_element(:name, "searchString").clear
      driver.find_element(:name, "searchString").send_keys "#{user}"
      #driver.find_element(:xpath, "//button[@type='submit']").click
      driver.find_element(:xpath, "//input[@value='Search']").click
      sleep 2
      driver.find_element(:link, "#{user}").click
      sleep 2
      case option
        when "outlook"      # to select outlook option pass quota = 0 while calling this function
          driver.find_element(:name, "outlook").click

        when "quota"
          driver.find_element(:name, 'quota').clear
          driver.find_element(:name, 'quota').send_keys("#{quota}")

        else
          puts "You gave me #{a} -- I have no idea what to do with that."
      end
      #driver.find_element(:css, "button.btn.btn-primary").click
      driver.find_element(:id, "buttonUpdate").click
      driver.switch_to.alert.accept

      # driver.find_element(:class, "btn btn-primary").click

      #driver.find_element(:link, "Back").click
    end

  end
end