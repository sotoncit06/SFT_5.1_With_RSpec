module UserCreation

  class CreateUser
    def create_user_admin(server,driver,username,password)
      driver.find_element(:xpath, "//div[@id='layoutLogo']/a/img").click
      sleep(2)
      driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
      sleep 2
      driver.find_element(:xpath, "//li[@id='manageUsersLink']/a/span[2]").click
      sleep 2
      driver.find_element(:css, 'a.btn.btn-default').click
      driver.find_element(:id, 'emailAddr').clear
      driver.find_element(:id, 'emailAddr').send_keys "#{username}"
      driver.find_element(:name, 'password1').clear
      driver.find_element(:name, 'password1').send_keys "#{password}"
      driver.find_element(:name, 'password2').clear
      driver.find_element(:name, 'password2').send_keys "#{password}"
      driver.find_element(:name, 'anyAdminRole').click
      sleep 2
      driver.find_element(:xpath, "//input[@value='USR_ADMIN']").click
      driver.find_element(:xpath, "//input[@type='submit']").click
      a=driver.switch_to.alert
      window_message=a.text
      expected_message='Please confirm assignment of User administrator role to user_admin@nilavodev.com'
      #if expected_message==window_message
      sleep 3
      driver.switch_to.alert.accept
    end

    def create_system_admin(server,driver,username,password)
      driver.find_element(:xpath, "//div[@id='layoutLogo']/a/img").click
      sleep(2)
      driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
      driver.find_element(:xpath, "//li[@id='manageUsersLink']/a/span[2]").click
      sleep 2
      driver.find_element(:css, 'a.btn.btn-default').click
      sleep 2
      driver.find_element(:id, 'emailAddr').clear
      driver.find_element(:id, 'emailAddr').send_keys "#{username}"
      driver.find_element(:name, 'password1').clear
      driver.find_element(:name, 'password1').send_keys "#{password}"
      driver.find_element(:name, 'password2').clear
      driver.find_element(:name, 'password2').send_keys "#{password}"
      driver.find_element(:name, 'anyAdminRole').click
      sleep 2
      driver.find_element(:xpath, "//input[@value='SYS_ADMIN']").click
      driver.find_element(:xpath, "//input[@type='submit']").click
      a=driver.switch_to.alert
      window_message=a.text
      expected_message='Please confirm assignment of User administrator role to user_admin@nilavodev.com'
      #if expected_message==window_message
      sleep 3
      driver.switch_to.alert.accept
    end

    def create_super_admin(server,driver,username,password)
      sleep 2
      driver.find_element(:xpath, "//div[@id='layoutLogo']/a/img").click
      sleep(2)
      driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
      driver.find_element(:xpath, "//li[@id='manageUsersLink']/a/span[2]").click
      sleep 2
      driver.find_element(:css, 'a.btn.btn-default').click
      sleep 2
      driver.find_element(:id, 'emailAddr').clear
      driver.find_element(:id, 'emailAddr').send_keys "#{username}"
      driver.find_element(:name, 'password1').clear
      driver.find_element(:name, 'password1').send_keys "#{password}"
      driver.find_element(:name, 'password2').clear
      driver.find_element(:name, 'password2').send_keys "#{password}"
      driver.find_element(:name, 'anyAdminRole').click
      sleep 2
      driver.find_element(:xpath, "//input[@value='ADMIN']").click
      driver.find_element(:xpath, "//input[@type='submit']").click
      a=driver.switch_to.alert
      window_message=a.text
      expected_message='Please confirm assignment of User administrator role to user_admin@nilavodev.com'
      #if expected_message==window_message
      sleep 3
      driver.switch_to.alert.accept
    end

    def create_user_sender(server,driver,username,password)
      driver.find_element(:xpath, "//div[@id='layoutLogo']/a/img").click
      sleep(2)
      driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
      driver.find_element(:xpath, "//li[@id='manageUsersLink']/a/span[2]").click
      sleep 2
      driver.find_element(:css, 'a.btn.btn-default').click
      sleep 2
      driver.find_element(:id, 'emailAddr').clear
      driver.find_element(:id, 'emailAddr').send_keys "#{username}"
      driver.find_element(:name, 'password1').clear
      driver.find_element(:name, 'password1').send_keys "#{password}"
      driver.find_element(:name, 'password2').clear
      driver.find_element(:name, 'password2').send_keys "#{password}"
      driver.find_element(:name, 'roleSender').click
      driver.find_element(:xpath, "//input[@type='submit']").click
    end

    def create_user_recipient(server,driver,username,password)
      driver.find_element(:xpath, "//div[@id='layoutLogo']/a/img").click
      sleep(2)
      driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
      driver.find_element(:xpath, "//li[@id='manageUsersLink']/a/span[2]").click
      driver.find_element(:css, 'a.btn.btn-default').click
      driver.find_element(:id, 'emailAddr').clear
      driver.find_element(:id, 'emailAddr').send_keys "#{username}"
      driver.find_element(:name, 'password1').clear
      driver.find_element(:name, 'password1').send_keys "#{password}"
      driver.find_element(:name, 'password2').clear
      driver.find_element(:name, 'password2').send_keys "#{password}"
      driver.find_element(:name, 'roleRecipient').click
      driver.find_element(:xpath, "//input[@type='submit']").click
    end

    def create_user_report(server,driver,username,password)
      driver.find_element(:xpath, "//div[@id='layoutLogo']/a/img").click
      sleep(2)
      driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
      driver.find_element(:xpath, "//li[@id='manageUsersLink']/a/span[2]").click
      driver.find_element(:css, 'a.btn.btn-default').click
      driver.find_element(:id, 'emailAddr').clear
      driver.find_element(:id, 'emailAddr').send_keys "#{username}"
      driver.find_element(:name, 'password1').clear
      driver.find_element(:name, 'password1').send_keys "#{password}"
      driver.find_element(:name, 'password2').clear
      driver.find_element(:name, 'password2').send_keys "#{password}"
      driver.find_element(:name, 'roleReport').click
      driver.find_element(:xpath, "//input[@type='submit']").click
    end

    def create_user_compliance(server,driver,username,password)
      driver.find_element(:xpath, "//div[@id='layoutLogo']/a/img").click
      sleep(2)
      driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
      driver.find_element(:xpath, "//li[@id='manageUsersLink']/a/span[2]").click
      driver.find_element(:css, 'a.btn.btn-default').click
      driver.find_element(:id, 'emailAddr').clear
      driver.find_element(:id, 'emailAddr').send_keys "#{username}"
      driver.find_element(:name, 'password1').clear
      driver.find_element(:name, 'password1').send_keys "#{password}"
      driver.find_element(:name, 'password2').clear
      driver.find_element(:name, 'password2').send_keys "#{password}"
      driver.find_element(:name, 'roleCompliance').click
      driver.switch_to.alert.accept
      sleep 2
      driver.find_element(:xpath, "//input[@type='submit']").click
    end

    def create_limited_sender(server,driver,username,password)
      driver.find_element(:xpath, "//div[@id='layoutLogo']/a/img").click
      sleep(2)
      driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
      driver.find_element(:xpath, "//li[@id='manageUsersLink']/a/span[2]").click
      driver.find_element(:css, 'a.btn.btn-default').click
      driver.find_element(:id, 'emailAddr').clear
      driver.find_element(:id, 'emailAddr').send_keys "#{username}"
      driver.find_element(:name, 'password1').clear
      driver.find_element(:name, 'password1').send_keys "#{password}"
      driver.find_element(:name, 'password2').clear
      driver.find_element(:name, 'password2').send_keys "#{password}"
      driver.find_element(:name, 'roleLimitedSender').click
      driver.find_element(:xpath, "//input[@type='submit']").click
    end

  end
end