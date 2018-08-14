module SecureReply

  class DeliverySecureReply

    def secure_reply_html5(server,driver,file_path)
      sleep 2
      driver.find_element(:xpath,"//input[@value='Reply securely']").click

      sleep 2
      driver.find_element(:xpath, "(//a[contains(text(),'Action')])[2]").click
      driver.find_element(:link, "Upload without applet").click
      a=driver.switch_to.alert
      window_message=a.text
      expected_message='Switching to non-applet page will discard the changes you made in current page. Are you sure you want to continue?'
      driver.switch_to.alert.accept
      sleep 2
      driver.find_element(:xpath, '//textarea[@id="secureMessageId"]').send_keys('This is secure reply notification message')
      name = driver.execute_script('var classname = document.getElementsByClassName("btn bds-upload-btn btn-primary btn-sm");classname[0].click();')
      sleep 3
      window = RAutomation::Window.new(:title => /File Upload/i)
      window.exists? # => true
      window.text_field(:class => 'Edit', :index => 0).set "#{file_path}"
      button = window.button(:value => '&Open')
      button.click
      sleep 2
      driver.find_element(:xpath,"//input[@value='Send reply']").click
    end

    def secure_reply_html5_ckeditor(server,driver,file_path)
      sleep 2
      #driver.find_element(:xpath,"//input[@value='Reply securely']").click
      driver.find_element(:xpath,"//input[@value='Reply']").click
      sleep 2
      #driver.find_element(:xpath,"//button[@type='button']").click
      driver.find_element(:xpath, "(//button[@type='button'])[2]").click
      sleep 2

      driver.find_element(:link, "Upload without applet").click
      sleep 2
      a=driver.switch_to.alert
      window_message=a.text
      expected_message='Switching to non-applet page will discard the changes you made in current page. Are you sure you want to continue?'
      driver.switch_to.alert.accept
      sleep 4
      ckeditor_frame = driver.find_element(:class => 'cke_wysiwyg_frame')
      driver.switch_to.frame(ckeditor_frame)
      sleep 2
      editor_body = driver.find_element(:tag_name => 'body')
      editor_body.send_keys('Secure message')
      driver.switch_to.default_content
      sleep 2
      driver.find_element(:xpath, "//*[contains(text(),'Attach files')]").click
      #driver.find_element(:xpath,"//*[@id='divOptions']/div[2]/div/div/div/div[2]/label").click()
      sleep 2
      window = RAutomation::Window.new(:title => /File Upload/i)
      p window.exists? # => true
      window.text_field(:class => "Edit", :index => 0).set "#{file_path}"
      button = window.button(:value => "&Open")
      button.click
      sleep 5
      driver.find_element(:xpath, "(//button[@type='submit'])[2]").click

    end

    def secure_reply_html5_without_using_action_menu(server,driver,file_path)#This function is needed only for my set up (sarja)
      sleep 2
      driver.find_element(:xpath,"//input[@value='Reply securely']").click
      sleep 2
      driver.find_element(:xpath, '//textarea[@id="secureMessageId"]').send_keys('This is secure reply notification message')
      name = driver.execute_script('var classname = document.getElementsByClassName("btn bds-upload-btn btn-primary btn-sm");classname[0].click();')
      sleep 3
      window = RAutomation::Window.new(:title => /File Upload/i)
      window.exists? # => true
      window.text_field(:class => 'Edit', :index => 0).set "#{file_path}"
      button = window.button(:value => '&Open')
      button.click
      sleep 15
      driver.find_element(:xpath,"//input[@value='Send reply']").click
    end

    def secure_reply_html5_without_using_action_menu_ckeditor(server,driver,file_path)#This function is needed only for my set up (sarja)
      sleep 2
      #driver.find_element(:xpath,"//input[@value='Reply securely']").click
      driver.find_element(:xpath,"//input[@value='Reply']").click
      sleep 4
      ckeditor_frame = driver.find_element(:class => 'cke_wysiwyg_frame')
      driver.switch_to.frame(ckeditor_frame)
      sleep 2
      editor_body = driver.find_element(:tag_name => 'body')
      editor_body.send_keys('Secure message')
      driver.switch_to.default_content
      sleep 2
      driver.find_element(:xpath, "//*[contains(text(),'Attach files')]").click
      #driver.find_element(:xpath,"//*[@id='divOptions']/div[2]/div/div/div/div[2]/label").click()
      sleep 2
      window = RAutomation::Window.new(:title => /File Upload/i)
      p window.exists? # => true
      window.text_field(:class => "Edit", :index => 0).set "#{file_path}"
      button = window.button(:value => "&Open")
      button.click
      sleep 5
      driver.find_element(:xpath, "(//button[@type='submit'])[2]").click
    end

    def secure_reply_applet(server,driver)
      sleep 2
      driver.find_element(:xpath,"//input[@value='Reply securely']").click
      sleep 2
      driver.find_element(:xpath, "(//a[contains(text(),'Action')])[2]").click
      driver.find_element(:link, "Use applet for file upload").click
      a=driver.switch_to.alert
      window_message=a.text
      expected_message='Switching to applet page will discard the changes you made in current page. Are you sure you want to continue?'
      driver.switch_to.alert.accept
      sleep 4
      driver.find_element(:xpath, '//textarea[@id="appletSecureMessageId"]').send_keys('This is secure reply notification message')
      driver.find_element(:xpath, "//input[@value='Add files and Send reply']").click
      sleep 2
      message = "Script is paused until you have completed upload process through Applet. Please press Ok button to resume test."
      title = "Upload confirmation window"
      api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
      api.call(0,message,title,0)
      sleep 2
      driver.find_element(:link,'Back to Your Delivery').click
    end

    def secure_reply_applet_ckeditor(server,driver)
      sleep 2
      driver.find_element(:xpath,"//input[@value='Reply']").click
      sleep 2
      #driver.find_element(:xpath, "(//a[contains(text(),'Action')])[2]").click
      driver.find_element(:xpath,"(//button[@type='button'])[2]").click
      driver.find_element(:link, "Use applet for file upload").click
      a=driver.switch_to.alert
      window_message=a.text
      expected_message='Switching to applet page will discard the changes you made in current page. Are you sure you want to continue?'
      driver.switch_to.alert.accept
      sleep 4
      ckeditor_frame = driver.find_element(:class => 'cke_wysiwyg_frame')
      driver.switch_to.frame(ckeditor_frame)
      sleep 2
      editor_body = driver.find_element(:tag_name => 'body')
      editor_body.send_keys('Secure message')
      driver.switch_to.default_content
      #driver.find_element(:xpath, '//textarea[@id="appletSecureMessageId"]').send_keys('This is secure reply notification message')
      #driver.find_element(:xpath, "//input[@value='Add files and Send reply']").click
      driver.find_element(:xpath,"(//button[@type='submit'])[2]").click
      sleep 2
      message = "Script is paused until you have completed upload process through Applet. Please press Ok button to resume test."
      title = "Upload confirmation window"
      api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
      api.call(0,message,title,0)
      sleep 2
      driver.find_element(:link,'Back to Your Delivery').click
    end

    def secure_reply_applet_direct(server,driver)
      sleep 2
      driver.find_element(:xpath,"//input[@value='Reply securely']").click
      sleep 2
      driver.find_element(:xpath, '//textarea[@id="appletSecureMessageId"]').send_keys('This is secure reply notification message')
      driver.find_element(:xpath, "//input[@value='Add files and Send reply']").click
      sleep 2
      message = "Script is paused until you have completed upload process through Applet. Please press Ok button to resume test."
      title = "Upload confirmation window"
      api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
      api.call(0,message,title,0)
      sleep 2
      driver.find_element(:link,'Back to Your Delivery').click
    end

    def secure_reply_applet_direct_ckeditor(server,driver)
      sleep 2
      driver.find_element(:xpath,"//input[@value='Reply']").click
      sleep 2
      #driver.find_element(:xpath, '//textarea[@id="appletSecureMessageId"]').send_keys('This is secure reply notification message')
      ckeditor_frame = driver.find_element(:class => 'cke_wysiwyg_frame')
      driver.switch_to.frame(ckeditor_frame)
      sleep 2
      editor_body = driver.find_element(:tag_name => 'body')
      editor_body.send_keys('Secure message')
      driver.switch_to.default_content
      #driver.find_element(:xpath, "//input[@value='Add files and Send reply']").click
      driver.find_element(:xpath,"(//button[@type='submit'])[2]").click
      sleep 2
      message = "Script is paused until you have completed upload process through Applet. Please press Ok button to resume test."
      title = "Upload confirmation window"
      api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
      api.call(0,message,title,0)
      sleep 2
#      driver.find_element(:link,'Back to Your Delivery').click
    end

    def secure_reply_from_sender_applet(server,driver)
      sleep 2
      driver.find_element(:xpath,"//input[@value='Reply']").click
      sleep 2
      driver.find_element(:xpath, "(//a[contains(text(),'Action')])[2]").click
      driver.find_element(:link, "Use applet for file upload").click
      a=driver.switch_to.alert
      window_message=a.text
      expected_message='Switching to applet page will discard the changes you made in current page. Are you sure you want to continue?'
      driver.switch_to.alert.accept
      sleep 4
      driver.find_element(:xpath, '//textarea[@name="message"]').send_keys('This is secure reply notification message')
      driver.find_element(:xpath, "//input[@value='Add files and Send reply']").click
      sleep 2
      message = "Script is paused until you have completed upload process through Applet. Please press Ok button to resume test."
      title = "Upload confirmation window"
      api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
      api.call(0,message,title,0)
      sleep 2
      driver.find_element(:link,'Back to Delivery Details').click
    end

    def secure_reply_from_sender_applet_ckeditor(server,driver)
      sleep 2
      driver.find_element(:xpath,"//input[@value='Reply securely']").click
      sleep 2
      #driver.find_element(:xpath, "(//a[contains(text(),'Action')])[2]").click
      driver.find_element(:xpath,"//button[@type='button']").click
      driver.find_element(:link, "Use applet for file upload").click
      a=driver.switch_to.alert #this alert currently not working for sft 5.1
      window_message=a.text
      expected_message='Switching to applet page will discard the changes you made in current page. Are you sure you want to continue?'
      driver.switch_to.alert.accept
      sleep 4
      ckeditor_frame = driver.find_element(:class => 'cke_wysiwyg_frame')
      driver.switch_to.frame(ckeditor_frame)
      sleep 2
      editor_body = driver.find_element(:tag_name => 'body')
      editor_body.send_keys('Secure message')
      driver.switch_to.default_content
      driver.find_element(:xpath,"(//button[@type='submit'])[2]").click
      #driver.find_element(:xpath, '//textarea[@name="message"]').send_keys('This is secure reply notification message')
      #driver.find_element(:xpath, "//input[@value='Add files and Send reply']").click
      sleep 2
      message = "Script is paused until you have completed upload process through Applet. Please press Ok button to resume test."
      title = "Upload confirmation window"
      api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
      api.call(0,message,title,0)
      sleep 2
      driver.find_element(:link,'Back to Delivery Details').click
    end

    def secure_reply_all_html5_ckeditor(server,driver,file_path)
      sleep 2
      driver.find_element(:xpath,"//input[@name='showReplyToAllButton']").click
      sleep 2
      #driver.find_element(:xpath, "(//a[contains(text(),'Action')])[2]").click
      driver.find_element(:xpath, "(//button[@type='button'])[2]").click
      driver.find_element(:link, "Upload without applet").click
      a=driver.switch_to.alert
      window_message=a.text
      expected_message='Switching to non-applet page will discard the changes you made in current page. Are you sure you want to continue?'
      driver.switch_to.alert.accept
      sleep 5
      ckeditor_frame = driver.find_element(:class => 'cke_wysiwyg_frame')
      driver.switch_to.frame(ckeditor_frame)
      sleep 2
      editor_body = driver.find_element(:tag_name => 'body')
      editor_body.send_keys('Secure message')
      driver.switch_to.default_content
      driver.find_element(:class,"bds-upload-btn").click()
      sleep 3
      window = RAutomation::Window.new(:title => /File Upload/i)
      window.exists? # => true
      window.text_field(:class => 'Edit', :index => 0).set "#{file_path}"
      button = window.button(:value => '&Open')
      button.click
      sleep 7
      driver.find_element(:xpath,"//button[@type='submit']").click

    end

    def secure_reply_all(server,driver,file_path)


      sleep 2
      driver.find_element(:xpath,"//input[@name='showReplyToAllButton']").click
      sleep 2
      driver.find_element(:xpath, "(//button[@type='button'])[2]").click
      driver.find_element(:link, "Upload without applet").click
      a=driver.switch_to.alert
      window_message=a.text
      expected_message='Switching to non-applet page will discard the changes you made in current page. Are you sure you want to continue?'
      driver.switch_to.alert.accept
      sleep 2
      driver.find_element(:xpath, '//textarea[@id="secureMessageId"]').send_keys('This is secure reply notification message')
      name = driver.execute_script('var classname = document.getElementsByClassName("btn bds-upload-btn btn-primary btn-sm");classname[0].click();')
      sleep 3
      window = RAutomation::Window.new(:title => /File Upload/i)
      window.exists? # => true
      window.text_field(:class => 'Edit', :index => 0).set "#{file_path}"
      button = window.button(:value => '&Open')
      button.click
      sleep 7
      driver.find_element(:xpath,"//input[@value='Send reply']").click

    end

    def secure_reply_all_ckeditor(server,driver,file_path)


      sleep 2
      driver.find_element(:xpath,"//input[@name='showReplyToAllButton']").click
      sleep 2
      driver.find_element(:xpath, "(//button[@type='button'])[2]").click
      driver.find_element(:link, "Upload without applet").click
      a=driver.switch_to.alert
      window_message=a.text
      expected_message='Switching to non-applet page will discard the changes you made in current page. Are you sure you want to continue?'
      driver.switch_to.alert.accept
      sleep 2
      sleep 4
      ckeditor_frame = driver.find_element(:class => 'cke_wysiwyg_frame')
      driver.switch_to.frame(ckeditor_frame)
      sleep 2
      editor_body = driver.find_element(:tag_name => 'body')
      editor_body.send_keys('Secure message')
      driver.switch_to.default_content
     # name = driver.execute_script('var classname = document.getElementsByClassName("btn bds-upload-btn btn-primary btn-sm");classname[0].click();')
      driver.find_element(:xpath, "//*[contains(text(),'Attach files')]").click
      sleep 3
      window = RAutomation::Window.new(:title => /File Upload/i)
      window.exists? # => true
      window.text_field(:class => 'Edit', :index => 0).set "#{file_path}"
      button = window.button(:value => '&Open')
      button.click
      sleep 4
      driver.find_element(:xpath, "(//button[@type='submit'])[2]").click
      sleep 4

    end

    def show_secure_reply_section_by_default(server, driver, browser)
      driver.find_element(:link, 'Administration').click
      driver.find_element(:xpath, '//li[@id="serverConfigLink"]/a/span[2]').click
      driver.find_element(:css, '#sec2 > div.nlv-settings-row-title').click
      driver.find_element(:name, 'showSecureReplySectionByDefault').click
      driver.find_element(:xpath,'//input[@value="Update"]').click
    end

    def secure_reply_without_using_action_menu(server, driver)
      sleep 2
      driver.find_element(:xpath,"//input[@value='Reply']").click
      driver.find_element(:xpath, '//textarea[@id="appletSecureMessageId"]').send_keys('This is secure reply notification message')
      sleep 2
      driver.find_element(:xpath, "//input[@value='Add files and Send reply']").click
      sleep 2
      message = "Script is paused until you have completed upload process through Applet. Please press Ok button to resume test."
      title = "Upload confirmation window"
      api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
      api.call(0,message,title,0)
      sleep 2
      driver.find_element(:link,'Back to Your Delivery').click
    end

    def secure_reply_from_inbox_ckeditor_with_applet(server, driver, delivery_name)

      driver.find_element(:xpath,"//a[contains(@href, '#menu1')]").click
      sleep 2
      driver.find_element(:link, "Set Preferences").click
      sleep 2
      driver.find_element(:xpath,'//input[@name="useApplet"]').click
      sleep 2
      driver.switch_to.alert.accept
      driver.find_element(:xpath, "//button[@type='submit']").click
      sleep 2
      driver.find_element(:xpath,'//li[@id="receivedDeliveriesLink"]/a/span[2]').click
      sleep 2
      driver.find_element(:link,"#{delivery_name}").click
      sleep 2
      driver.find_element(:xpath,"//input[@value='Reply']").click
      ckeditor_frame = driver.find_element(:class => 'cke_wysiwyg_frame')
      driver.switch_to.frame(ckeditor_frame)
      sleep 2
      editor_body = driver.find_element(:tag_name => 'body')
      editor_body.send_keys('Secure message')
      driver.switch_to.default_content
      driver.find_element(:xpath, '(//button[@type="submit"])[2]').click
      sleep 2
      message = "Script is paused until you have completed upload process through Applet. Please press Ok button to resume test."
      title = "Upload confirmation window"
      api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
      api.call(0,message,title,0)
      sleep 2
      driver.find_element(:link,'Back to Your Delivery').click

    end

    def secure_reply_from_inbox_ckeditor_without_applet(server, driver, delivery_name, browser, filename)
      driver.find_element(:xpath,"//a[contains(@href, '#menu1')]").click
      driver.find_element(:link, "Set Preferences").click
      driver.find_element(:xpath,"(//input[@name='useApplet'])[2]").click
      driver.find_element(:xpath, "//button[@type='submit']").click
      sleep 2
      driver.find_element(:xpath,'//li[@id="receivedDeliveriesLink"]/a/span[2]').click
      sleep 2
      driver.find_element(:link,"#{delivery_name}").click
      sleep 2
      driver.find_element(:xpath,"//input[@value='Reply']").click
      ckeditor_frame = driver.find_element(:class => 'cke_wysiwyg_frame')
      driver.switch_to.frame(ckeditor_frame)
      sleep 2
      editor_body = driver.find_element(:tag_name => 'body')
      editor_body.send_keys('Secure message')
      driver.switch_to.default_content

      browser=browser.to_s
      p browser
      case browser

        when "chrome"
          sleep 2
          driver.find_element(:xpath,"//*[@id='divOptions']/div[2]/div/div/div/div[2]/label").click()
          sleep 2
          window = RAutomation::Window.new(:title => /Open/i)
          p window.exists? # => true
          window.text_field(:class => "Edit", :index => 0).set "#{filename}"
          button = window.button(:value => "&Open")
          button.click
          sleep 5
          driver.find_element(:xpath, '//button[@type="submit"]').click
        when "firefox"
          sleep 5
          driver.find_element(:xpath, "//*[contains(text(),'Attach files')]").click
          #driver.find_element(:xpath,"//*[@id='divOptions']/div[2]/div/div/div/div[2]/label").click()
          sleep 2
          window = RAutomation::Window.new(:title => /File Upload/i)
          p window.exists? # => true
          window.text_field(:class => "Edit", :index => 0).set "#{filename}"
          button = window.button(:value => "&Open")
          button.click
          sleep 10
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

    end

    def ckeditor_default_secure_reply_with_applet(server, driver, delivery_name)
      ckeditor_frame = driver.find_element(:class => 'cke_wysiwyg_frame')
      driver.switch_to.frame(ckeditor_frame)
      sleep 2
      editor_body = driver.find_element(:tag_name => 'body')
      editor_body.send_keys('Secure message')
      driver.switch_to.default_content
      driver.find_element(:xpath, '(//button[@type="submit"])[2]').click
      sleep 2
      message = "Script is paused until you have completed upload process through Applet. Please press Ok button to resume test."
      title = "Upload confirmation window"
      api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
      api.call(0,message,title,0)
      sleep 2
      sleep 2
      driver.find_element(:link,'Back to Your Delivery').click

    end

    def secure_reply_in_inbox(server, driver,delivery_name, version, recipients,reply_num)
      if version=='fresh'
        delivery_name= "Re: #{delivery_name} (##{reply_num})"
        driver.find_element(:link,'Inbox').click
        sleep 4
        result=driver.find_element(:tag_name =>'body').text.include?("#{delivery_name}")
        result=result.to_s
        if result=='true'
          driver.find_element(:link,"#{delivery_name}").click
          sleep 4
        else
          puts "Delivery \"#{delivery_name}\" does not exists"
          return
        end
      else
        driver.find_element(:xpath, '//li[@id="sentDeliveriesLink"]/a/span[2]').click
        sleep 2
        driver.find_element(:link,"#{delivery_name}").click
        sleep 2
        driver.find_element(:link, "#{recipients}").click
      end
    end

  end
end

