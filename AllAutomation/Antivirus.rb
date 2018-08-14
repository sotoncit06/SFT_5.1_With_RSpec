module Antivirus

  class AntivirusSettings

    def antivirus_disable(server, driver)
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
      sleep 2
      driver.find_element(:xpath, '//li[@id="adminSidemenu"]/a/span[2]').click
      sleep 2
      driver.find_element(:xpath, '//li[@id="serverConfigLink"]/a/span[2]').click
      sleep 2
      driver.find_element(:xpath, '//div[@id="sec5"]/div[2]').click
      driver.find_element(:name, 'antivirusEnable').click
      sleep 2
      driver.find_element(:xpath,"(//input[@name='metascanRemoteServerUsage'])[2]").click
      sleep 2
      driver.find_element(:name, 'metascanRemoteServerUrl').clear
      sleep 2
      driver.find_element(:name, 'metascanRemoteServerUrl').send_keys('http://192.168.11.53:8008/metascan_rest')
      sleep 2
      driver.find_element(:xpath, '//input[@value="Update"]').click
      sleep 5
    end
  end

end