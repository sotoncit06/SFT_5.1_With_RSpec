module Antivirus

  class Antivirus

    def antivirus_disable(server, driver)
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
      driver.find_element(:xpath, '//div[@id="sec5"]/div[2]').click
      driver.find_element(:xpath, '(//input[@name="antivirusEnable"])[2]').click
      #driver.find_element(:xpath, '//input[@name="logo"]').send_keys('http://image.blingee.com/images16/content/output/000/000/000/55f/441573393_1760587.gif?4')
      driver.find_element(:xpath, '//input[@value="Update"]').click
      sleep 5

    end

    def antivirus_enable(server, driver)
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
      driver.find_element(:xpath, '//div[@id="sec5"]/div[2]').click
      driver.find_element(:name, 'antivirusEnable').click
      #driver.find_element(:xpath, '//input[@name="logo"]').send_keys('http://image.blingee.com/images16/content/output/000/000/000/55f/441573393_1760587.gif?4')
      driver.find_element(:xpath, '//input[@value="Update"]').click
      sleep 5

    end
  end

end