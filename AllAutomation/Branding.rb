module Branding
  class Branding_Int
    def Branding_Interface(server, driver)

      driver.get "#{server}"
      driver.manage.window.maximize
      driver.find_element(:id, 'username').clear
      driver.find_element(:id, 'username').send_keys('admin')
      driver.find_element(:id, 'password').clear
      driver.find_element(:id, 'password').send_keys('admin')
      driver.find_element(:xpath, '//button[@type="submit"]').click

      driver.find_element(:xpath, '//li[@id="adminSidemenu"]/a/span[2]').click
      sleep 2
      driver.find_element(:xpath, '//li[@id="serverConfigLink"]/a/span[2]').click
      sleep 2
      driver.find_element(:xpath, '//div[@id="sec10"]/div[2]').click
      driver.find_element(:xpath, '//input[@name="logo"]').clear
      driver.find_element(:xpath, '//input[@name="logo"]').send_keys('http://image.blingee.com/images16/content/output/000/000/000/55f/441573393_1760587.gif?4')
      driver.find_element(:xpath, '//input[@value="Update"]').click
      sleep 5

      #driver.find_element(:css, 'b.caret').click
      driver.find_element(:link, 'Sign out').click

      driver.find_element(:id, 'username').clear
      driver.find_element(:id, 'username').send_keys('tanim1@nilavodev.com')
      driver.find_element(:id, 'password').clear
      driver.find_element(:id, 'password').send_keys('1234')
      driver.find_element(:xpath, '//button[@type="submit"]').click
      sleep 2

      #driver.find_element(:xpath, '//li[@id="expressDeliveryLink"]/a/span[2]').click
      driver.find_element(:xpath, '//div[@id="expressDeliveryLink"]/a/span[2]').click
      sleep 2
      driver.find_element(:xpath, '//li[@id="packagesLink"]/a/span[2]').click
      sleep 2
      driver.find_element(:xpath, '//li[@id="workspacesLink"]/a/span[2]').click
      sleep 2
      driver.find_element(:link, 'Contacts').click
      sleep 2
      driver.find_element(:link, 'Reports').click
      sleep 2


      #driver.find_element(:css, 'b.caret').click
      driver.find_element(:link, 'Sign out').click

      driver.find_element(:id, 'username').clear
      driver.find_element(:id, 'username').send_keys('admin')
      driver.find_element(:id, 'password').clear
      driver.find_element(:id, 'password').send_keys('admin')
      driver.find_element(:xpath, '//button[@type="submit"]').click

      driver.find_element(:xpath, '//li[@id="adminSidemenu"]/a/span[2]').click
      sleep 2
      driver.find_element(:xpath, '//li[@id="serverConfigLink"]/a/span[2]').click
      sleep 2
      driver.find_element(:xpath, '//div[@id="sec10"]/div[2]').click
      driver.find_element(:name, 'css').send_keys('/Test.css')
      driver.find_element(:xpath, '//input[@value="Update"]').click
      sleep 5

      #driver.find_element(:css, 'b.caret').click
      driver.find_element(:link, 'Sign out').click
      driver.find_element(:id, 'username').clear
      driver.find_element(:id, 'username').send_keys('tanim1@nilavodev.com')
      driver.find_element(:id, 'password').clear
      driver.find_element(:id, 'password').send_keys('1234')
      driver.find_element(:xpath, '//button[@type="submit"]').click
      sleep 2

      #driver.find_element(:xpath, '//li[@id="expressDeliveryLink"]/a/span[2]').click
      sleep 2
      driver.find_element(:xpath, '//li[@id="packagesLink"]/a/span[2]').click
      sleep 2
      driver.find_element(:xpath, '//li[@id="workspacesLink"]/a/span[2]').click
      sleep 2
      driver.find_element(:link, 'Contacts').click
      sleep 2
      driver.find_element(:link, 'Reports').click
      sleep 2


      #driver.find_element(:css, 'b.caret').click
      driver.find_element(:link, 'Sign out').click

    end
  end
end