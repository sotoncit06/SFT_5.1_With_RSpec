module Workspace
  class WorkspaceConfiguration

    def enable_workspace(server, driver)
      driver.find_element(:xpath, '//li[@id="adminSidemenu"]/a/span[2]').click
      sleep 2
      driver.find_element(:xpath, '//li[@id="serverConfigLink"]/a/span[2]').click
      driver.find_element(:css, '#sec4 > div.nlv-settings-row-title').click
      sleep 2
      driver.find_element(:xpath, '//input[@name="workspaceEnable"]').click
      sleep 2
      driver.find_element(:xpath, "//input[@value='Update']").click
    end
    def workspace_creation_applet(server,driver,workspace_name, manager, collaborator, viewer)

      driver.find_element(:css, 'b.caret').click
      driver.find_element(:link, "Set Preferences").click
      sleep 2
      driver.find_element(:xpath,'//input[@name="useApplet"]').click
      sleep 2
      driver.switch_to.alert.accept
      driver.find_element(:xpath, "//button[@type='submit']").click

      driver.find_element(:xpath, '//li[@id="workspacesLink"]/a/span[2]').click
      sleep 2
      driver.find_element(:xpath,'//button[@type="button"]').click
      sleep 2
      driver.find_element(:link, 'Create Workspace').click
      sleep 2
      driver.find_element(:xpath,'//input[@name="workspaceName"]').send_keys("#{workspace_name}")
      driver.find_element(:xpath,'//input[@name="tags"]').send_keys('test1')
      driver.find_element(:xpath,'//textarea[@name="description"]').send_keys('test2')
      driver.find_element(:id,'token-input-managersInput').send_keys("#{manager}")
      sleep 2
      driver.find_element(:id,'token-input-managersInput').send_keys(",")
      sleep 2
      driver.find_element(:id,'token-input-collaboratorsInput').send_keys("#{collaborator}")
      sleep 2
      driver.find_element(:id,'token-input-collaboratorsInput').send_keys(",")
      sleep 2
      driver.find_element(:id,'token-input-viewersInput').send_keys("#{viewer}")
      sleep 2
      driver.find_element(:id,'token-input-viewersInput').send_keys(",")
      driver.find_element(:xpath,'//input[@value="Add files and create workspace..."]').click

      message = "Script is paused until you have completed upload process through Applet. Please press Ok button to resume test."
      title = "Upload confirmation window"
      api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
      api.call(0,message,title,0)
      sleep 2

      driver.find_element(:link,'Go to workspace').click
      sleep 5

    end
    def workspace_creation_html5(server, driver,workspace_name, manager, collaborator, viewer, filename)
      driver.find_element(:xpath,"//a[contains(@href, '#menu1')]").click
      driver.find_element(:link, "Set Preferences").click
      driver.find_element(:xpath,"(//input[@name='useApplet'])[2]").click
      driver.find_element(:xpath, "//button[@type='submit']").click
      sleep 2
      driver.find_element(:link, 'Workspaces').click
      driver.find_element(:xpath,'//button[@type="button"]').click
      sleep 2
      driver.find_element(:link, 'Create Workspace').click
      sleep 2
      driver.find_element(:xpath,'//input[@name="workspaceName"]').send_keys("#{workspace_name}")
      driver.find_element(:xpath,'//input[@name="tags"]').send_keys('test1')
      driver.find_element(:xpath,'//textarea[@name="description"]').send_keys('test2')
      driver.find_element(:id,'token-input-managersInput').send_keys("#{manager}")
      sleep 2
      driver.find_element(:id,'token-input-managersInput').send_keys(",")
      driver.find_element(:id,'token-input-collaboratorsInput').send_keys("#{collaborator}")
      sleep 2
      driver.find_element(:id,'token-input-collaboratorsInput').send_keys(",")
      driver.find_element(:id,'token-input-viewersInput').send_keys("#{viewer}")
      sleep 2
      driver.find_element(:id,'token-input-viewersInput').send_keys(",")

      name = driver.execute_script('var classname = document.getElementsByClassName("btn bds-upload-btn btn-primary btn-sm");classname[0].click();')
      window = RAutomation::Window.new(:title => /File Upload/i)
      window.exists? # => true
      window.text_field(:class => "Edit", :index => 0).set "#{filename}"
      button = window.button(:value => "&Open")
      button.click
      sleep 2
      driver.find_element(:xpath, "//input[@value='Save']").click
      sleep 2
    end
    def add_comment(server, driver, comment)
      driver.find_element(:id,'commentTextField').send_keys("#{comment}")
      driver.find_element(:id,'addCommentButton').click
    end
    def workspace_lock(server, driver)
      driver.find_element(:xpath,'//button[@type="button"]').click
      sleep 2
      driver.find_element(:link,'Lock').click
      sleep 2
      driver.find_element(:xpath,'//input[@value="Lock"]').click
      sleep 2
    end
    def workspace_unlock(server, driver)
      driver.find_element(:xpath,'//button[@type="button"]').click
      sleep 2
      driver.find_element(:link,'Unlock').click
      sleep 2
      driver.find_element(:xpath,'//input[@value="Unlock"]').click
      sleep 2
    end
    def go_to_workspace(server, driver, workspace_name)
      driver.find_element(:xpath,'//li[@id="workspacesLink"]/a/span[2]').click
      sleep 2
      driver.find_element(:link, "#{workspace_name}").click
      sleep 2
    end
    def create_new_folder(server, driver, folder_name)
      sleep 2
      driver.find_element(:xpath, "(//button[@type='button'])[3]").click
      sleep 2
      driver.find_element(:id, 'newFolderNameInput').clear
      driver.find_element(:id, 'newFolderNameInput').send_keys("#{folder_name}")
      driver.find_element(:css, "input[type=\"button\"]").click
      sleep 5
    end
    def folder_open_upload_file(server, driver, folder_name)
      menu_area=driver.find_element(:xpath, "//ul[@id='explorer']/li/span[contains(..,'#{folder_name}')]") .click
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link,'Open').click
      sleep 5
      driver.find_element(:id, 'applet-upload-submit').click
      message = "Script is paused until you have completed upload process through Applet. Please press Ok button to resume test."
      title = "Upload confirmation window"
      api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
      api.call(0,message,title,0)
      sleep 2
      driver.find_element(:link,'Go to workspace').click
      sleep 5
    end
    def file_folder_download(server, driver, name)
      menu_area=driver.find_element(:xpath, "//ul[@id='explorer']/li/span[contains(..,'#{name}')]") .click
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link,'Download').click
      sleep 2
      message = "Script is paused until you have completed Download process through Applet. Please press Ok button to resume test."
      title = "Upload confirmation window"
      api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
      api.call(0,message,title,0)
      sleep 2
      driver.find_element(:link,'Go to workspace').click
      sleep 5
    end
    def file_folder_create_zip_file(server, driver, name)
      menu_area=driver.find_element(:xpath, "//ul[@id='explorer']/li/span[contains(..,'#{name}')]") .click
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link,'Create zip file').click
      sleep 5
    end
    def file_folder_rename(server, driver, name, renamed_name)
      menu_area=driver.find_element(:xpath, "//ul[@id='explorer']/li/span[contains(..,'#{name}')]") .click
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link,'Rename').click
      sleep 2
      driver.find_element(:id, 'renameFolderNameInput').send_keys("#{renamed_name}")
      sleep 2
      driver.find_element(:xpath, '//input[@value="Rename"]').click
      sleep 2
    end
    def file_folder_edit_description(server, driver, name, description)
      menu_area=driver.find_element(:xpath, "//ul[@id='explorer']/li/span[contains(..,'#{name}')]") .click
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link,'Edit description').click
      sleep 2
      driver.find_element(:id, 'description').send_keys("#{description}")
      driver.find_element(:xpath, '//input[@value="Save"]').click
      sleep 2
    end
    def file_folder_delete(server, driver, name)
      menu_area=driver.find_element(:xpath, "//ul[@id='explorer']/li/span[contains(..,'#{name}')]") .click
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:xpath, '(//a[contains(text(),"Delete")])[2]').click
      sleep 2
      driver.find_element(:name, 'name').click
      sleep 5
    end

    def file_folder_delete_collaborator(server, driver, name)
      menu_area=driver.find_element(:xpath, "//ul[@id='explorer']/li/span[contains(..,'#{name}')]") .click
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link,'Delete').click
      sleep 2
      driver.find_element(:name, 'name').click
      sleep 5
    end

    def file_extract(server, driver, file_name)
      menu_area=driver.find_element(:xpath, "//ul[@id='explorer']/li/span[contains(..,'#{file_name}')]") .click
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link,'Extract here').click
      if(driver.find_element(:tag_name => "body").text.include?"Selected file might be corrupted or not .zip formatted file.")
        driver.find_element(:xpath, "(//input[@name='name'])[5]").click
        driver.break()
      end
      sleep 5
    end
    def file_extract_folder(server, driver, file_name)
      menu_area=driver.find_element(:xpath, "//ul[@id='explorer']/li/span[contains(..,'#{file_name}')]") .click
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link,'Extract to folder').click
      sleep 5
      if(driver.find_element(:tag_name => "body").text.include?"Selected file might be corrupted or not .zip formatted file.")
        driver.find_element(:xpath, '(//input[@name="name"])[5]').click
      end
    end

    def click_on_up_button(server, driver)
      driver.find_element(:xpath, '(//button[@type="button"])[2]').click
      sleep 2
    end

    def folder_open(server, driver, folder_name)
      menu_area=driver.find_element(:xpath, "//ul[@id='explorer']/li/span[contains(..,'#{folder_name}')]") .click
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link,'Open').click
      sleep 5
    end

    def file_upload_html5(server, driver, filename, browser)
      #handle file uploader
      browser=browser.to_s
      p browser
      case browser

        when "chrome"
          sleep 2
      driver.execute_script('var classname = document.getElementsByClassName("btn bds-upload-btn btn-primary btn-sm");classname[0].click();')
          sleep 2
          window = RAutomation::Window.new(:title => /Open/i)
          p window.exists? # => true
          window.text_field(:class => "Edit", :index => 0).set "#{filename}"
          button = window.button(:value => "&Open")
          button.click
          sleep 2
          driver.find_element(:xpath, '//button[@type="submit"]').click
        when "firefox"
          sleep 2
          driver.execute_script('var classname = document.getElementsByClassName("btn bds-upload-btn btn-primary btn-sm");classname[0].click();')
          sleep 2
          window = RAutomation::Window.new(:title => /File Upload/i)
          p window.exists? # => true
          window.text_field(:class => "Edit", :index => 0).set "#{filename}"
          button = window.button(:value => "&Open")
          button.click
          sleep 2
          driver.find_element(:xpath, '//button[@type="submit"]').click
        when "internet_explorer"
          #Test paused to upload using Applet
          message = "Please perfrom upload operation and then click Ok."
          title = "Upload confirmation window"
          api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
          api.call(0,message,title,0)
          sleep 2
          driver.find_element(:link,'Go to delivery').click

        else
          p 'Invalid Browser'
      end

    rescue Exception=> e
      puts e.message
      puts __FILE__

      puts caller_locations
      #puts "Rescue"

    end

    def self_remove(server, driver)
      driver.find_element(:xpath, '//a[@onclick="return confirmRemove()"]').click
      sleep 2
      driver.switch_to.alert.accept
    end

    def set_quota(server, driver)
      driver.find_element(:id, 'username').clear
      driver.find_element(:id, 'username').send_keys('admin')
      driver.find_element(:id, 'password').clear
      driver.find_element(:id, 'password').send_keys('admin')
      driver.find_element(:xpath, '//button[@type="submit"]').click

      driver.find_element(:xpath, '//li[@id="adminSidemenu"]/a/span[2]').click
      sleep 2
      driver.find_element(:xpath, '//li[@id="serverConfigLink"]/a/span[2]').click
      sleep 2
      driver.find_element(:xpath, '//div[@id="sec6"]/div[2]').click
      sleep 2
      driver.find_element(:name, 'enableUserQuota').click
      sleep 2
      driver.switch_to.alert.accept
      driver.find_element(:name, 'userQuota').clear
      driver.find_element(:name, 'userQuota').send_keys('10')
      driver.find_element(:xpath, '//input[@value="Update"]').click
      sleep 5
      driver.find_element(:css, 'b.caret').click
      driver.find_element(:link, 'Sign out').click
      sleep 5
    end

    def click_on_ok(server, driver)
      driver.find_element(:xpath,'//div[@id="dialog-compress-failure"]/p[2]/input').click
      sleep 2
    end

  end
end