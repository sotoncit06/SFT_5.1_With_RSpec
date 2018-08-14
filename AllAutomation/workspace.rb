module Workspaces
  class Create_workspace

    def Create_workspace(server, driver)
      driver.get "#{server}"
      driver.manage.window.maximize


      driver.find_element(:id, 'username').clear
      driver.find_element(:id, 'username').send_keys('tanim1@nilavodev.com')
      driver.find_element(:id, 'password').clear
      driver.find_element(:id, 'password').send_keys('1')
      driver.find_element(:xpath, '//button[@type="submit"]').click

      driver.find_element(:xpath, '//li[@id="adminSidemenu"]/a/span[2]').click
      sleep 2
      driver.find_element(:xpath, '//li[@id="serverConfigLink"]/a/span[2]').click
      sleep 2
      driver.find_element(:xpath, '//div[@id="sec4"]/div[2]').click
      sleep 2
      driver.find_element(:xpath, '//input[@name="workspaceEnable"]').click
      sleep 2
      driver.find_element(:xpath, "//input[@value='Update']").click

      driver.find_element(:link, 'Secure Workspaces').click
      #driver.find_element(:link,'ws5').click
      sleep 5

      driver.find_element(:xpath,'//button[@type="button"]').click
      driver.find_element(:link, 'Create Workspace').click
      sleep 2
      driver.find_element(:xpath, "//button[@type='button']").click
      driver.find_element(:link, 'Use applet for upload').click
      sleep 3

      a=driver.switch_to.alert
      window_message=a.text
      expected_message='Switching to applet page will discard the changes you made in current page. Are you sure you want to continue?'
      driver.switch_to.alert.accept

      driver.find_element(:xpath,'//input[@name="workspaceName"]').send_keys('ws5')
      driver.find_element(:xpath,'//input[@name="tags"]').send_keys('test1')
      driver.find_element(:xpath,'//textarea[@name="description"]').send_keys('test2')
      driver.find_element(:id,'token-input-managersInput').send_keys('tanim2@nilavodev.com')
      sleep 2
      driver.find_element(:id,'token-input-collaboratorsInput').send_keys('tanim3@nilavodev.com')
      sleep 2
      driver.find_element(:id,'token-input-viewersInput').send_keys('tanim4@nilavodev.com')
      sleep 2
      driver.find_element(:xpath,'//input[@value="Add Files and Create Workspace..."]').click

      message = "Script is paused until you have completed upload process through Applet. Please press Ok button to resume test."
      title = "Upload confirmation window"
      api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
      api.call(0,message,title,0)
      sleep 2

      driver.find_element(:link,'Go to workspace').click
      sleep 5

      driver.find_element(:id,'commentTextField').send_keys('Comment from manager')
      driver.find_element(:id,'addCommentButton').click
      sleep 2

      driver.find_element(:xpath,'//button[@type="button"]').click
      sleep 2
      driver.find_element(:link,'Lock').click
      sleep 2
      driver.find_element(:xpath,'//input[@value="Lock"]').click
      sleep 2

      #driver.find_element(:xpath, '//div[@id="explorer-container"]').click
      #sleep 2
      #driver.find_element(:link,'Download').click
      #sleep 2
      #driver.find_element(:xpath, '//button[@type="button"])[2]').click
      #sleep 2
      #driver.find_element(:xpath,'//body[@id="ng-app"]/div[3]/div/div[2]/div[2]/div/div[2]/div[2]/div/div/div/div[2]/ul/li/a/span').click
      #driver.find_element(:link, 'View users').click
      #driver.find_element.this.navigate(:back)

      driver.find_element(:xpath,'//button[@type="button"]').click
      sleep 2
      driver.find_element(:link,'Unlock').click
      sleep 2
      driver.find_element(:xpath,'//input[@value="Unlock"]').click
      sleep 2

      #new folder creation
      #driver.find_element(:xpath, "(//button[@type='button'])[3]").click
      #sleep 2
      #driver.find_element(:css, "input[type=\"button\"]").click
      #sleep 5

      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 5
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 5
      driver.find_element(:link,"Open").click
      sleep 5
      driver.find_element(:xpath, '(//button[@type="button"])[2]').click
      sleep 2
      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link,"Download").click
      sleep 2
      message = "Script is paused until you have completed Download process through Applet. Please press Ok button to resume test."
      title = "Upload confirmation window"
      api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
      api.call(0,message,title,0)
      sleep 2
      driver.find_element(:link,'Go to workspace').click
      sleep 5
      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link,"Create zip file").click
      sleep 5

      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link,"Rename").click
      sleep 2
      driver.find_element(:id, 'renameFolderNameInput').send_keys("Renamed_folder")
      sleep 2
      driver.find_element(:xpath, '//input[@value="Rename"]').click
      sleep 2
      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link, 'Edit description').click
      sleep 2
      driver.find_element(:id, 'description').send_keys("Test1")
      driver.find_element(:xpath, '//input[@value="Save"]').click
      sleep 2


      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:xpath, '(//a[contains(text(),"Delete")])[2]').click
      sleep 2
      driver.find_element(:name, 'name').click
      sleep 5

      #file testing


      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link,"Download").click
      sleep 2

      message = "Script is paused until you have completed Download process through Applet. Please press Ok button to resume test."
      title = "Upload confirmation window"
      api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
      api.call(0,message,title,0)
      sleep 5

      driver.find_element(:link,'Go to workspace').click
      sleep 5
      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link,"Create zip file").click
      sleep 5

      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link,"Rename").click
      sleep 2
      driver.find_element(:id, 'renameFolderNameInput').send_keys("Renamed_folder.txt")
      sleep 2
      driver.find_element(:xpath, '//input[@value="Rename"]').click
      sleep 2
      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2

      driver.find_element(:link, 'Edit description').click
      sleep 2
      driver.find_element(:id, 'description').send_keys("Test1")
      driver.find_element(:xpath, '//input[@value="Save"]').click
      sleep 2


      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:xpath, '(//a[contains(text(),"Delete")])[2]').click
      sleep 2
      driver.find_element(:name, 'name').click
      sleep 5



      menu_area=driver.find_element(:xpath, "//ul[@id='explorer']/li/span")
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link, 'Extract here').click
      sleep 2

      menu_area=driver.find_element(:xpath, "//ul[@id='explorer']/li/span")
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link, 'Extract to folder').click
      sleep 2

      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:xpath, '(//a[contains(text(),"Delete")])[2]').click
      sleep 2
      driver.find_element(:name, 'name').click
      sleep 5

      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:xpath, '(//a[contains(text(),"Delete")])[2]').click
      sleep 2
      driver.find_element(:name, 'name').click
      sleep 5

      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:xpath, '(//a[contains(text(),"Delete")])[2]').click
      sleep 2
      driver.find_element(:name, 'name').click
      sleep 5

      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:xpath, '(//a[contains(text(),"Delete")])[2]').click
      sleep 2
      driver.find_element(:name, 'name').click
      sleep 5

      driver.find_element(:css, 'b.caret').click
      driver.find_element(:link, 'Sign out').click





collaborators
      driver.find_element(:id, 'username').clear
      driver.find_element(:id, 'username').send_keys('tanim3@nilavodev.com')
      driver.find_element(:id, 'password').clear
      driver.find_element(:id, 'password').send_keys('1')
      driver.find_element(:xpath, '//button[@type="submit"]').click
      sleep 5

      driver.find_element(:xpath,"//a[contains(@href, '#menu1')]").click
      driver.find_element(:link, "Set Preferences").click
      sleep 2
      driver.find_element(:xpath,'//input[@name="useApplet"]').click
      sleep 2
      driver.switch_to.alert.accept
      driver.find_element(:xpath, "//button[@type='submit']").click

      driver.find_element(:link, 'Secure Workspaces').click
      driver.find_element(:link,'ws5').click
      sleep 5

      driver.find_element(:id,'commentTextField').send_keys('Comment from collaborator')
      driver.find_element(:id,'addCommentButton').click
      sleep 2

      #new folder creation
      driver.find_element(:xpath, "(//button[@type='button'])[3]").click
      sleep 2
      driver.find_element(:css, "input[type=\"button\"]").click
      sleep 5
      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 5
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 5
      driver.find_element(:link,"Open").click
      sleep 5
      driver.find_element(:id, 'applet-upload-submit').click

      message = "Script is paused until you have completed Upload process through Applet. Please press Ok button to resume test."
      title = "Upload confirmation window"
      api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
      api.call(0,message,title,0)
      sleep 2
      driver.find_element(:link,'Go to workspace').click
      sleep 5
      driver.find_element(:xpath, '(//button[@type="button"])[2]').click
      sleep 2
      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 5
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 5
      driver.find_element(:link,"Open").click
      sleep 5
      driver.find_element(:xpath, '(//button[@type="button"])[2]').click
      sleep 2
      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link,"Download").click
      sleep 2
      message = "Script is paused until you have completed Upload process through Applet. Please press Ok button to resume test."
      title = "Upload confirmation window"
      api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
      api.call(0,message,title,0)
      sleep 2
      driver.find_element(:link,'Go to workspace').click
      sleep 5
      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link,"Create zip file").click
      sleep 5

      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link,"Rename").click
      sleep 2
      driver.find_element(:id, 'renameFolderNameInput').send_keys("Renamed_folder")
      sleep 2
      driver.find_element(:xpath, '//input[@value="Rename"]').click
      sleep 2
      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link, 'Edit description').click
      sleep 2
      driver.find_element(:id, 'description').send_keys("Test1")
      driver.find_element(:xpath, '//input[@value="Save"]').click
      sleep 2


      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link, 'Delete').click
      sleep 2
      driver.find_element(:name, 'name').click
      sleep 5

      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link,"Download").click
      sleep 2

      message = "Script is paused until you have completed Download process through Applet. Please press Ok button to resume test."
      title = "Upload confirmation window"
      api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
      api.call(0,message,title,0)
      sleep 2

      driver.find_element(:link,'Go to workspace').click
      sleep 5
      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link,"Create zip file").click
      sleep 5

      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link,"Rename").click
      sleep 2
      driver.find_element(:id, 'renameFolderNameInput').send_keys("Renamed_folder.txt")
      sleep 2
      driver.find_element(:xpath, '//input[@value="Rename"]').click
      sleep 2
      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2

      driver.find_element(:link, 'Edit description').click
      sleep 2
      driver.find_element(:id, 'description').send_keys("Test1")
      driver.find_element(:xpath, '//input[@value="Save"]').click
      sleep 2


      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link,'Delete').click
      sleep 2
      driver.find_element(:name, 'name').click
      sleep 5



      menu_area=driver.find_element(:xpath, "//ul[@id='explorer']/li/span")
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link, 'Extract here').click
      sleep 2

      menu_area=driver.find_element(:xpath, "//ul[@id='explorer']/li/span")
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link, 'Extract to folder').click
      sleep 2

      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link,'Delete').click
      sleep 2
      driver.find_element(:name, 'name').click
      sleep 5

      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link,'Delete').click
      sleep 2
      driver.find_element(:name, 'name').click
      sleep 5

      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link,'Delete').click
      sleep 2
      driver.find_element(:name, 'name').click
      sleep 5

      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 2
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 2
      driver.find_element(:link,'Delete').click
      sleep 2
      driver.find_element(:name, 'name').click
      sleep 5

      driver.find_element(:id, 'applet-upload-submit').click
      message = "Script is paused until you have completed Upload process through Applet. Please press Ok button to resume test."
      title = "Upload confirmation window"
      api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
      api.call(0,message,title,0)
      sleep 5
      driver.find_element(:link,'Go to workspace').click
      sleep 5

      driver.find_element(:css, 'b.caret').click
      driver.find_element(:link, 'Sign out').click


      #Viewers
      driver.find_element(:id, 'username').clear
      driver.find_element(:id, 'username').send_keys('tanim4@nilavodev.com')
      driver.find_element(:id, 'password').clear
      driver.find_element(:id, 'password').send_keys('1')
      driver.find_element(:xpath, '//button[@type="submit"]').click
      sleep 5
      driver.find_element(:xpath,"//a[contains(@href, '#menu1')]").click
      driver.find_element(:link, "Set Preferences").click
      sleep 2
      driver.find_element(:xpath,'//input[@name="useApplet"]').click
      sleep 2
      driver.switch_to.alert.accept
      driver.find_element(:xpath, "//button[@type='submit']").click

      driver.find_element(:link, 'Secure Workspaces').click
      driver.find_element(:link,'ws5').click
      sleep 5
      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 5
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 5
      driver.find_element(:link,"Open").click
      sleep 5

      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 5
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 5
      driver.find_element(:link,"Download").click
      sleep 5

      message = "Script is paused until you have completed Download process through Applet. Please press Ok button to resume test."
      title = "Upload confirmation window"
      api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
      api.call(0,message,title,0)
      sleep 5
      driver.find_element(:link,'Go to workspace').click
      sleep 5

      driver.find_element(:xpath, '(//button[@type="button"])[2]').click
      sleep 2
      menu_area=driver.find_element(:xpath,"//ul[@id='explorer']/li/span")
      sleep 5
      driver.action.context_click(menu_area).send_keys(:arrow_down).send_keys(:enter).perform
      sleep 5
      driver.find_element(:link,"Download").click
      message = "Script is paused until you have completed Download process through Applet. Please press Ok button to resume test."
      title = "Upload confirmation window"
      api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
      api.call(0,message,title,0)
      sleep 2
      driver.find_element(:link,'Go to workspace').click
      sleep 5


      driver.find_element(:css, 'b.caret').click
      driver.find_element(:link, 'Sign out').click
    end

  end

end