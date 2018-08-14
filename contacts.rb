module Contacts
  class CreateContact
    def create_user_contact(server,driver,user)
      sleep 2
      #driver.find_element(:link,'Contacts').click
      driver.find_element(:xpath, "//li[@id='contactsLink']/a/span[2]").click
      driver.find_element(:css, "span.glyphicon.glyphicon-plus").click
      sleep 2
      driver.find_element(:name, "email").clear
      driver.find_element(:name, "email").send_keys "#{user}"
      driver.find_element(:name, "firstname").clear
      driver.find_element(:name, "firstname").send_keys "Test"
      driver.find_element(:name, "lastname").clear
      driver.find_element(:name, "lastname").send_keys "2"
      driver.find_element(:name, "homephone").clear
      driver.find_element(:name, "homephone").send_keys "1234"
      driver.find_element(:name, "workphone").clear
      driver.find_element(:name, "workphone").send_keys "2345"
      driver.find_element(:name, "company").clear
      driver.find_element(:name, "company").send_keys "Test"
      driver.find_element(:name, "homeStreet").clear
      driver.find_element(:name, "homeStreet").send_keys "Street 1"
      driver.find_element(:id, "inputNote").clear
      driver.find_element(:id, "inputNote").send_keys "This is test contact"
      driver.find_element(:xpath, "//input[@value='Add']").click
    end

    def create_group_contact(server,driver,group_name,member,managed,shared)
      driver.find_element(:xpath, "//li[@id='contactsLink']/a/span[2]").click
      sleep 2
      driver.find_element(:xpath, "//button[@type='button']").click
      driver.find_element(:link, "Add group").click
      sleep 2
      driver.find_element(:id, "input1").clear
      driver.find_element(:id, "input1").send_keys "#{group_name}"
      driver.find_element(:id, "input2").clear
      driver.find_element(:id, "input2").send_keys "Test Description"
      sleep 2
      driver.find_element(:id,'token-input-membersInput').clear
      driver.find_element(:id,'token-input-membersInput').send_keys "#{member}"
      sleep 2
      driver.action.send_keys(:enter).perform
      #driver.find_element(:id,'token-input-membersInput').send_keys ","
      sleep 2
      driver.action.send_keys(:enter)
      driver.find_element(:id,'token-input-managedByInput').clear
      driver.find_element(:id,'token-input-managedByInput').send_keys "#{managed}"
      sleep 2
      driver.find_element(:id,'token-input-managedByInput').send_keys ","
      sleep 2
      driver.action.send_keys(:enter)
      driver.find_element(:id,'token-input-sharedWithInput').clear
      driver.find_element(:id,'token-input-sharedWithInput').send_keys "#{shared}"
      sleep 2
      driver.find_element(:id,'token-input-sharedWithInput').send_keys ","
      sleep 2
      driver.action.send_keys(:enter)
      driver.find_element(:xpath, "//input[@value='Save']").click
      #driver.find_element(:link,'Back to Contacts').click
    end
  end

  class EditContact

  end

end