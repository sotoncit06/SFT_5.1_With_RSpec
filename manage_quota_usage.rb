module ManageQuotaUsage
  class ManageQuota
    def select_manage_quota(server,driver)
      sleep 2
      driver.find_element(:css, "img[title='Manage quota usage']").click
      sleep 2
    end
    def delete_ownership(server,driver,name_id)
      sleep 2
     driver.find_element(:xpath, "(//input[@name='packageIds'])[#{name_id}]").click
      sleep 3
      #driver.find_element(:xpath, "(//button[@type='submit'])[2])").click
      #driver.find_element(:xpath, "//body[@id='ng-app']/div[4]/div/div[2]/form/div/div/button").click
      sleep 2
      driver.find_element(:name, "deletePackageWithOneOwner").click
      sleep 2
      driver.find_element(:xpath, "//input[@value='Remove ownership']").click

      sleep 2
    end
  end

end