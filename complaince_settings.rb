module Compliance
  class ComplianceSettings

    def enable_compliance(server, driver)
      driver.find_element(:xpath, '//li[@id="adminSidemenu"]/a').click
      sleep 2
      driver.find_element(:xpath, '//li[@id="serverConfigLink"]/a/span[2]').click
      sleep 2
      driver.find_element(:css, '#sec6 > div.nlv-settings-row-title').click
      sleep 2
      driver.find_element(:xpath,'//input[@name="enableComplianceRole"]').click
      driver.find_element(:xpath,'//input[@value="Update"]').click
      sleep 2
    end

    def compliance_operations(server, driver)
      # driver.find_element(:xpath, '//li[@id="complianceSidemenu"]/a/span[2]').click
      sleep 2
      driver.find_element(:xpath, '//li[@id="compliancePackagesLink"]/a/span[2]').click
      sleep 5
      driver.find_element(:xpath, '//li[@id="complianceWorkspacesLink"]/a/span[2]').click
      sleep 5
      driver.find_element(:xpath, '//li[@id="complianceDeliveriesLink"]/a/span[2]').click
      sleep 5
      driver.find_element(:xpath, '//li[@id="complianceUsersLink"]/a/span[2]').click
      sleep 5
      driver.find_element(:xpath, '//li[@id="complianceSystemActivityLink"]/a/span[2]').click
      sleep 5
    end
  end
end