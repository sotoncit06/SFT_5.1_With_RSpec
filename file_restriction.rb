module File_restriction
  class File_restriction
    def file_restriction(server, driver)
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
      driver.find_element(:xpath, '//div[@id="sec3"]/div[2]').click
      sleep 2
      driver.find_element(:name, 'blockExtUploadingList').send_keys('*.pps')
      driver.find_element(:xpath, '//input[@value="Update"]').click
      sleep 5
    end
  end
end