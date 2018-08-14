module UserQuotaConfiguration


  class Quota

    def enable_quota(server,driver)

      driver.find_element(:xpath, "//div[@id='layoutLogo']/a/img").click
      sleep(2)
      driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
      driver.find_element(:xpath, "//li[@id='serverConfigLink']/a/span[2]").click
      sleep(2)
      driver.find_element(:css, "#sec6 > div.nlv-settings-row-title").click
      sleep(2)
      driver.find_element(:xpath, "//input[@name='enableUserQuota' and @value='Y']").click
      driver.switch_to.alert.accept
      driver.find_element(:xpath, "//input[@value='Update']").click
      sleep(2)

    end

    def disable_quota(server,driver)

      driver.find_element(:xpath, "//div[@id='layoutLogo']/a/img").click
      sleep(2)
      driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
      driver.find_element(:xpath, "//li[@id='serverConfigLink']/a/span[2]").click
      sleep(2)
      driver.find_element(:css, "#sec6 > div.nlv-settings-row-title").click
      sleep(2)
      driver.find_element(:xpath, "//input[@name='enableUserQuota' and @value='N']").click
      driver.find_element(:xpath, "//input[@value='Update']").click
      sleep(2)

    end

    def set_quota(server,driver,maxquota,minquota)

      driver.find_element(:xpath, "//div[@id='layoutLogo']/a/img").click
      sleep(2)
      driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
      driver.find_element(:xpath, "//li[@id='serverConfigLink']/a/span[2]").click
      sleep(2)
      driver.find_element(:css, "#sec6 > div.nlv-settings-row-title").click
      sleep(2)
      driver.find_element(:name, 'maximumUserQuota').clear
      driver.find_element(:name, 'maximumUserQuota').send_keys("#{maxquota}")
      driver.find_element(:name, 'userQuota').clear
      driver.find_element(:name, 'userQuota').send_keys("#{minquota}")
      driver.find_element(:xpath, "//input[@value='Update']").click

    end

    def set_quota_blank(server,driver)


      driver.find_element(:name, 'userQuota').clear
      driver.find_element(:name, 'maximumUserQuota').clear
      driver.find_element(:xpath, "//input[@value='Update']").click


    end

    def quota_settings_page(server,driver)

      driver.find_element(:xpath, "//div[@id='layoutLogo']/a/img").click
      sleep(2)
      driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
      sleep 2
      driver.find_element(:xpath, "//li[@id='serverConfigLink']/a/span[2]").click
      sleep(2)
      driver.find_element(:css, "#sec6 > div.nlv-settings-row-title").click
      sleep(2)
    end

  end




  class QuotaConfiguration<Quota

    def quota_settings_by_admin (server,driver)

      ob=UserQuotaConfiguration::Quota.new
      ob.quota_settings_page(server,Thread.current[:driver])

      sleep(2)

      ob=UserQuotaConfiguration::Quota.new
      ob.set_quota_blank(server,Thread.current[:driver])

      sleep 5
      driver.switch_to.alert.accept #To handle pop up window

      ob=UserQuotaConfiguration::Quota.new
      ob.set_quota(server,Thread.current[:driver],"5","10")
      sleep 5
      driver.switch_to.alert.accept  #To handle pop up window

      ob=UserQuotaConfiguration::Quota.new
      ob.disable_quota(server,Thread.current[:driver])

      ob=UserQuotaConfiguration::Quota.new
      ob.enable_quota(server,Thread.current[:driver])

      ob=UserQuotaConfiguration::Quota.new
      ob.quota_settings_page(server,Thread.current[:driver])


      ob=UserQuotaConfiguration::Quota.new
      ob.set_quota(server,Thread.current[:driver],"50","10")
      sleep(2)







    end

  end

end