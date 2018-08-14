

def signInConfirmation (server,driver)

  return driver.find_element(:link, 'Sign out').text

end

def signInFailConfirmation (server,driver)
  return driver.find_element(:class,'text-center').text
end

def signInPageConfirmation (server,driver)

  return driver.find_element(:class,'text-center').text

end

def userLockedForInvalidPasswordConfirmation (server,driver)

  return driver.find_element(:class,'messageError').text

end

def signOutConfirmation (server,driver)

  return driver.find_element(:class,'btn-primary').text

end

def pendingUserApprovedConfirmation (server,driver)


  text = driver.find_element(:xpath,'//html/body/div[3]/div/div[2]/div[6]').text
  #]alert alert-success

  pending_user_approved_confirmation = text.split('(')

  return pending_user_approved_confirmation[0]

end

def userRoleConfirmationBoolean (server,driver,i)

  if i=="Sender"

    check = driver.find_element(:name, "roleSender").selected?


  elsif i == "Recipient"

    check = driver.find_element(:name, "roleRecipient").selected?

  elsif i == "Allow collaboration only"

    check =driver.find_element(:name, "roleReport").selected?

  elsif i == "Report"

    check =driver.find_element(:name, "roleReport").selected?

  elsif i == "Limited sender"

    check =driver.find_element(:name, "roleLimitedSender").selected?

  elsif i== "User administrator"

    #check =driver.find_element(:name, "roleReport").selected?

  elsif i== "System administrator"

    #check =driver.find_element(:name, "roleReport").selected?

  elsif i== "Super user"

    #check =driver.find_element(:name, "roleReport").selected?
  end


  return check
end

def appletEnableConfirmationBoolean (server,driver)

  return driver.find_element(:xpath,'//input[@name="useApplet"]').selected?

end

def appletEnableConfirmationForDownloadBoolean (server,driver)

  return driver.find_element(:xpath,'//input[@name="useAppletForDownload"]').selected?

end

def userCreatedConfirmationBoolean (server,driver,user)

  (driver.find_elements(:class,'email')).each do |user_table|
    if (user_table.text.include?user) == true
      return true
    end
  end
  return false



end

def userAccountLockedConfirmationBoolean (server,driver)

  return driver.find_element(:name, "signInLocked").selected?

end

def ascendingSortOrderForManageUsersConfirmation(server,driver)

  dropdown = driver.find_element(:xpath, "//select[@name='userSortOrder']")
  select_list = Selenium::WebDriver::Support::Select.new(dropdown)
  selected_option = select_list.selected_options[0].text
  if selected_option == 'Ascending'
    return true

  else return false
  end

end

def manageUserPageConfirmation(server,driver)
  return driver.find_element(:class, 'page-title').text
end

def quotaEnableConfirmationBoolean(server,driver)
  return driver.find_element(:name, "enableUserQuota").selected?
end

def quotaValueConfirmation(server,driver)

  max_and_min_quota = Array.new
  max_and_min_quota[0] = driver.find_element(:name, 'maximumUserQuota').attribute('value')
  max_and_min_quota[1] = driver.find_element(:name, 'userQuota').attribute('value')

  return max_and_min_quota

end

def passwordChangeConfirmation(server,driver)

  text = driver.find_element(:xpath,'/html/body/div[3]/div/div[2]/div[5]').text

  password_change_confirmation = text.split('(')

  return password_change_confirmation[0]

end

def sendDeliveryConfirmation(server,driver)
  return driver.find_element(:class, 'panel-heading').text
end

