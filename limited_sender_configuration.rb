module LimitedSender
  class LimitedSenderConfiguration


    def limited_sender_require_to_sign_in_uncheck(server, driver)
      begin
        driver.find_element(:xpath, "//div[@id='layoutLogo']/a/img").click
        sleep(2)
        driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
        driver.find_element(:xpath, "//li[@id='serverConfigLink']/a/span[2]").click
        sleep(2)
        driver.find_element(:css, "#sec2 > div.nlv-settings-row-title").click
        sleep(2)
        driver.find_element(:link, "Configure limited sender settings").click
        sleep 2
        driver.find_element(:xpath, "//body[@id='ng-app']/div[3]/div/div[2]/form/div/div[2]/input").click
        sleep 2
        driver.find_element(:xpath, '//input[@name="requireSenderSignIn"]').click
        sleep 2
        driver.switch_to.alert.accept
        sleep 2
        driver.find_element(:xpath, "//input[@value='Update']").click
        sleep 2
      end
    end
    def enable_limited_sender(server,driver)

      driver.find_element(:xpath, "//div[@id='layoutLogo']/a/img").click
      sleep(2)
      driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
      driver.find_element(:xpath, "//li[@id='serverConfigLink']/a/span[2]").click
      sleep(2)
      driver.find_element(:css, "#sec2 > div.nlv-settings-row-title").click
      sleep(2)
      driver.find_element(:link, "Configure limited sender settings").click
      sleep 2
      driver.find_element(:xpath, "//body[@id='ng-app']/div[3]/div/div[2]/form/div/div[2]/input").click
      sleep 2
      driver.find_element(:xpath, "//input[@value='Update']").click
      sleep 2

    end

    def disable_limited_sender(server,driver)

      driver.find_element(:xpath, "//div[@id='layoutLogo']/a/img").click
      sleep(2)
      driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
      driver.find_element(:xpath, "//li[@id='serverConfigLink']/a/span[2]").click
      sleep(2)
      driver.find_element(:css, "#sec2 > div.nlv-settings-row-title").click
      sleep(2)
      driver.find_element(:link, "Configure limited sender settings").click
      driver.find_element(:xpath, "//body[@id='ng-app']/div[3]/div/div[2]/form/div/div[2]/input[2]").click
      driver.find_element(:xpath, "//input[@value='Update']").click
      sleep 2
    end

    def require_sender_to_sign_in_uncheck(server, driver)
      begin
        driver.find_element(:xpath, "//div[@id='layoutLogo']/a/img").click
        sleep(2)
        driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
        driver.find_element(:xpath, "//li[@id='serverConfigLink']/a/span[2]").click
        sleep(2)
        driver.find_element(:css, "#sec2 > div.nlv-settings-row-title").click
        sleep(2)
        driver.find_element(:link, "Configure limited sender settings").click
        sleep 2
        driver.find_element(:xpath, '//input[@name="requireSenderSignIn"]').click
        sleep 2
        driver.switch_to.alert.accept
        sleep 2
        driver.find_element(:xpath, "//input[@value='Update']").click
        sleep 2
      end
    end

    def require_sender_to_sign_in_check(server, driver)
      begin
        driver.find_element(:xpath, "//div[@id='layoutLogo']/a/img").click
        sleep(2)
        driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
        driver.find_element(:xpath, "//li[@id='serverConfigLink']/a/span[2]").click
        sleep(2)
        driver.find_element(:css, "#sec2 > div.nlv-settings-row-title").click
        sleep(2)
        driver.find_element(:link, "Configure limited sender settings").click
        sleep 2
        driver.find_element(:xpath, '//input[@name="requireSenderSignIn"]').click
        sleep 2
        driver.find_element(:xpath, "//input[@value='Update']").click
        sleep 2
      end
    end

    def go_send_do_page(server, driver)
      begin
        driver.get"#{server}/Send.do"
        sleep 2
      end
    end

    def send_limited_delivery_send_do(server,driver,sender,recipient,subject,filename, browser)
      begin
        driver.find_element(:xpath, '//input[@name="from"]').send_keys("#{sender}")
        sleep 2
        driver.find_element(:xpath, '//input[@name="recipientsTo"]').send_keys("#{recipient}")
        sleep 2
        driver.find_element(:xpath, '//input[@name="name"]').send_keys("#{subject}")
        driver.find_element(:xpath, '//textarea[@name="secureMessage"]').clear
        driver.find_element(:xpath, '//textarea[@name="secureMessage"]').send_keys('Secure Message')
        sleep 2
        driver.find_element(:xpath, '//input[@name="tosAccepted"]').click
        #handle file uploader
        sleep 10
        browser=browser.to_s
        p browser
        case browser
          when "chrome"
            sleep 2
            driver.find_element(:xpath,"//*[@id='upload']/div/div/label").click()
            sleep 2
            window = RAutomation::Window.new(:title => /Open/i)
            p window.exists? # => true
            window.text_field(:class => "Edit", :index => 0).set "#{filename}"
            button = window.button(:value => "&Open")
            button.click
            sleep 5
            driver.find_element(:xpath, '//input[@name="send"]').click
          when "firefox"
            sleep 2
            driver.find_element(:xpath,"//*[@id='upload']/div/div/label").click()
            sleep 2
            window = RAutomation::Window.new(:title => /File Upload/i)
            p window.exists? # => true
            window.text_field(:class => "Edit", :index => 0).set "#{filename}"
            button = window.button(:value => "&Open")
            button.click
            sleep 5
            driver.find_element(:xpath, '//input[@name="send"]').click
          when "internet_explorer"
            #Test paused to upload using Applet
            message = "Please perfrom upload operation and then click Ok."
            title = "Upload confirmation window"
            api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
            api.call(0,message,title,0)
            sleep 5
            driver.find_element(:link,'Go to delivery').click

          else
            p 'Invalid Browser'
        end
          #handle file uploader
          # driver.find_element(:xpath, '//button[@type="submit"]').click

      rescue Exception=> e
        puts e.message
        puts __FILE__
#        driver.find_element(:id, 'email')
        puts caller_locations
      end
    end

    def ckeditor_send_limited_delivery_send_do(server,driver,sender,recipient,subject,filename, browser)
      driver.find_element(:name, 'from').send_keys("#{sender}")
      sleep 2
      driver.find_element(:name, 'recipientsTo').send_keys("#{recipient}")
      sleep 2
      # driver.action.send_keys(:enter).perform
      # sleep 2
      # driver.action.send_keys(:enter)
      # sleep 2
      driver.find_element(:name, 'name').send_keys("#{subject}")
      sleep 4
      ckeditor_frame = driver.find_element(:class => 'cke_wysiwyg_frame')
      driver.switch_to.frame(ckeditor_frame)
      sleep 2
      editor_body = driver.find_element(:tag_name => 'body')
      editor_body.send_keys('Secure message')
      driver.switch_to.default_content
      sleep 2
      driver.find_element(:xpath, '//input[@name="tosAccepted"]').click
      sleep 2
      message = "Please enter reCaptcha."
      title = "Upload confirmation window"
      api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
      api.call(0,message,title,0)
      sleep 2
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

    def ckeditor_send_limited_delivery_send_do_all_automation(server,driver,sender,recipient,subject,filename, browser)
      driver.find_element(:name, 'from').send_keys("#{sender}")
      sleep 2
      driver.find_element(:name, 'recipientsTo').send_keys("#{recipient}")
      sleep 2
      # driver.action.send_keys(:enter).perform
      # sleep 2
      # driver.action.send_keys(:enter)
      # sleep 2
      driver.find_element(:name, 'name').send_keys("#{subject}")
      sleep 4
      ckeditor_frame = driver.find_element(:class => 'cke_wysiwyg_frame')
      driver.switch_to.frame(ckeditor_frame)
      sleep 2
      editor_body = driver.find_element(:tag_name => 'body')
      editor_body.send_keys('Secure message')
      driver.switch_to.default_content
      sleep 2
      # driver.find_element(:xpath, '//input[@name="tosAccepted"]').click
      sleep 2
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

    def ckeditor_select_recipient(server, driver, sender,recipient,subject,filename, browser)
      driver.find_element(:name, 'from').send_keys("#{sender}")
      sleep 2
      Selenium::WebDriver::Support::Select.new(driver.find_element(:name, "recipientsTo")).select_by(:text, "#{recipient}")
      driver.action.send_keys(:enter)
      sleep 2
      # driver.action.send_keys(:enter).perform
      # sleep 2
      # driver.action.send_keys(:enter)
      # sleep 2
      driver.find_element(:name, 'name').send_keys("#{subject}")
      sleep 4
      ckeditor_frame = driver.find_element(:class => 'cke_wysiwyg_frame')
      driver.switch_to.frame(ckeditor_frame)
      sleep 2
      editor_body = driver.find_element(:tag_name => 'body')
      editor_body.send_keys('Secure message')
      driver.switch_to.default_content
      sleep 2
      # driver.find_element(:xpath, '//input[@name="tosAccepted"]').click
      sleep 2
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

    def view_delivery(server, driver, subject)
      driver.find_element(:xpath, '//li[@id="sentDeliveriesLink"]/a/span[2]').click
      sleep 2
      #if verify {driver.page_source.include?"#{delivery_name}"}
      driver.find_element(:link,"#{subject}").click
      sleep 5
    end

    def restrict_recipients(server,driver, restrict_recipients)
      driver.find_element(:xpath, "//div[@id='layoutLogo']/a/img").click
      sleep(2)
      driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
      driver.find_element(:xpath, "//li[@id='serverConfigLink']/a/span[2]").click
      sleep(2)
      driver.find_element(:css, "#sec2 > div.nlv-settings-row-title").click
      sleep(2)
      driver.find_element(:link, "Configure limited sender settings").click
      sleep 2
      driver.find_element(:xpath, '//input[@name="recipientRestrictionList"]').clear
      driver.find_element(:xpath, '//input[@name="recipientRestrictionList"]').send_keys("#{restrict_recipients}")
      sleep 2
      driver.find_element(:xpath, "//input[@value='Update']").click
      sleep 2
    end

    def default_recipient(server,driver, recipient)
      driver.find_element(:xpath, "//div[@id='layoutLogo']/a/img").click
      sleep(2)
      driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
      driver.find_element(:xpath, "//li[@id='serverConfigLink']/a/span[2]").click
      sleep(2)
      driver.find_element(:css, "#sec2 > div.nlv-settings-row-title").click
      sleep(2)
      driver.find_element(:link, "Configure limited sender settings").click
      sleep 2
      driver.find_element(:xpath, '//input[@name="allowDefaultRecipient"]').click
      sleep 2
      driver.find_element(:xpath, '//input[@name="defaultRecipient"]').clear
      driver.find_element(:xpath, '//input[@name="defaultRecipient"]').send_keys("#{recipient}")
      sleep 2
      driver.find_element(:xpath, '//input[@name="isDefaultRecipientVisible"]').click
      sleep 2
      driver.find_element(:xpath, "//input[@value='Update']").click
      sleep 2
    end

    def list_user(server,driver, user)
      driver.find_element(:xpath, "//div[@id='layoutLogo']/a/img").click
      sleep(2)
      driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
      driver.find_element(:xpath, "//li[@id='serverConfigLink']/a/span[2]").click
      sleep(2)
      driver.find_element(:css, "#sec2 > div.nlv-settings-row-title").click
      sleep(2)
      driver.find_element(:link, "Configure limited sender settings").click
      sleep 2
      driver.find_element(:xpath, '//input[@name="allowListUsersWithEmail"]').click
      sleep 2
      driver.find_element(:xpath, '//input[@name="usersWithEmail"]').clear
      driver.find_element(:xpath, '//input[@name="usersWithEmail"]').send_keys("#{user}")
      driver.find_element(:xpath, "//input[@value='Update']").click
      driver.switch_to.alert.accept
      sleep 2
    end

    def select_recipient(server, driver, sender,recipient,subject,filename, browser)
      driver.find_element(:xpath, '//input[@name="from"]').send_keys("#{sender}")
      sleep 2
      driver.find_element(:xpath, '//div[@id="to"]/div/div/select').click
      sleep 2
      driver.action.send_keys(:enter)
      sleep 2
      Selenium::WebDriver::Support::Select.new(driver.find_element(:name, "recipientsTo")).select_by(:text, "#{recipient}")
      driver.action.send_keys(:enter)
      sleep 2
      driver.find_element(:xpath, '//input[@name="name"]').send_keys("#{subject}")
      sleep 2
      sleep 2
      driver.find_element(:xpath, '//input[@name="tosAccepted"]').click
      #handle file uploader
      browser=browser.to_s
      p browser
      case browser
        when "chrome"
          sleep 2
          driver.find_element(:xpath,"//*[@id='upload']/div/div/label").click()
          sleep 2
          window = RAutomation::Window.new(:title => /Open/i)
          p window.exists? # => true
          window.text_field(:class => "Edit", :index => 0).set "#{filename}"
          button = window.button(:value => "&Open")
          button.click
          sleep 5
          driver.find_element(:xpath, '//input[@name="send"]').click
        when "firefox"
          sleep 2
          driver.find_element(:xpath,"//*[@id='upload']/div/div/label").click()
          sleep 2
          window = RAutomation::Window.new(:title => /File Upload/i)
          p window.exists? # => true
          window.text_field(:class => "Edit", :index => 0).set "#{filename}"
          button = window.button(:value => "&Open")
          button.click
          sleep 5
          driver.find_element(:xpath, '//input[@name="send"]').click
        when "internet_explorer"
          #Test paused to upload using Applet
          message = "Please perfrom upload operation and then click Ok."
          title = "Upload confirmation window"
          api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
          api.call(0,message,title,0)
          sleep 5
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

    def uncheck_message_settings(server, driver)
      driver.find_element(:xpath, "//div[@id='layoutLogo']/a/img").click
      sleep(2)
      driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
      driver.find_element(:xpath, "//li[@id='serverConfigLink']/a/span[2]").click
      sleep(2)
      driver.find_element(:css, "#sec2 > div.nlv-settings-row-title").click
      sleep(2)
      driver.find_element(:link, "Configure limited sender settings").click
      sleep 2
      driver.find_element(:xpath, '//input[@name="showSubjectField"]').click
      sleep 2
      driver.find_element(:xpath, '//input[@name="showMessageField"]').click
      sleep 2
      driver.find_element(:xpath, "//input[@value='Update']").click
      sleep 5
    end

    def file_size_delivery_expire(server, driver)
      driver.find_element(:xpath, "//div[@id='layoutLogo']/a/img").click
      sleep(2)
      driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
      driver.find_element(:xpath, "//li[@id='serverConfigLink']/a/span[2]").click
      sleep(2)
      driver.find_element(:css, "#sec2 > div.nlv-settings-row-title").click
      sleep(2)
      driver.find_element(:link, "Configure limited sender settings").click
      sleep 2
      driver.find_element(:xpath, '//input[@name="maxSizePerFile"]').clear
      driver.find_element(:xpath, '//input[@name="maxSizePerFile"]').send_keys("100")
      sleep 2
      driver.find_element(:xpath, ' //input[@name="autoDeletionDays"]').send_keys("30")
      driver.find_element(:xpath, "//input[@value='Update']").click
      sleep 5
    end

    def default_setting(server, driver)
      driver.find_element(:xpath, "//div[@id='layoutLogo']/a/img").click
      sleep(2)
      driver.find_element(:xpath, "//li[@id='adminSidemenu']/a/span[2]").click
      driver.find_element(:xpath, "//li[@id='serverConfigLink']/a/span[2]").click
      sleep(2)
      driver.find_element(:css, "#sec2 > div.nlv-settings-row-title").click
      sleep(2)
      driver.find_element(:link, "Configure limited sender settings").click
      sleep 2
      driver.find_element(:xpath, "//body[@id='ng-app']/div[3]/div/div[2]/form/div/div[2]/input[2]").click
      sleep 2
      driver.find_element(:xpath, '//input[@name="requireSenderSignIn"]').click
      sleep 2
      driver.find_element(:xpath, '//input[@name="allowInputRecipientAddress"]').click
      sleep 2
      # driver.find_element(:xpath, '//input[@name="showSubjectField"]').click
      # sleep 2
      # driver.find_element(:xpath, '//input[@name="showMessageField"]').click
      # sleep 2
      driver.find_element(:xpath, '//input[@name="maxSizePerFile"]').clear
      sleep 2
      driver.find_element(:xpath, ' //input[@name="autoDeletionDays"]').clear
      driver.find_element(:xpath, "//input[@value='Update']").click
      sleep 5
    end

    def file_restrict_test(server, driver, sender,recipient,subject,filename1,filename2, browser)
      driver.find_element(:xpath, '//input[@name="from"]').send_keys("#{sender}")
      sleep 2
      driver.find_element(:xpath, '//div[@id="to"]/div/div/select').click
      sleep 2
      driver.action.send_keys(:enter)
      sleep 2
      Selenium::WebDriver::Support::Select.new(driver.find_element(:name, "recipientsTo")).select_by(:text, "#{recipient}")
      driver.action.send_keys(:enter)
      sleep 2
      driver.find_element(:xpath, '//input[@name="name"]').send_keys("#{subject}")
      sleep 2
      #handle file uploader
      case browser

        when "chrome"
          sleep 2
          driver.find_element(:xpath,'//*[@id="upload"]/div/div/label').click()
          sleep 2
          window = RAutomation::Window.new(:title => /Open/i)
          p window.exists? # => true
          window.text_field(:class => "Edit", :index => 0).set "#{filename1}"
          button = window.button(:value => "&Open")
          button.click
          sleep 2
          driver.switch_to.alert.accept
          sleep 2
          driver.find_element(:xpath,'//*[@id="upload"]/div/div/label').click()
          sleep 2
          window = RAutomation::Window.new(:title => /Open/i)
          p window.exists? # => true
          window.text_field(:class => "Edit", :index => 0).set "#{filename2}"
          button = window.button(:value => "&Open")
          button.click
          sleep 2
          driver.find_element(:xpath, '//input[@name="send"]').click
          sleep 5
          driver.find_element(:xpath, '//div[@id="layoutLogo"]/a/img').click
          sleep 2
        when "firefox"
          driver.find_element(:xpath,'//*[@id="upload"]/div/div/label').click()
          sleep 2
          window = RAutomation::Window.new(:title => /File Upload/i)
          p window.exists? # => true
          window.text_field(:class => "Edit", :index => 0).set "#{filename1}"
          button = window.button(:value => "&Open")
          button.click
          sleep 2
          driver.switch_to.alert.accept
          sleep 2
          driver.find_element(:xpath,'//*[@id="upload"]/div/div/label').click()
          sleep 2
          window = RAutomation::Window.new(:title => /File Upload/i)
          p window.exists? # => true
          window.text_field(:class => "Edit", :index => 0).set "#{filename2}"
          button = window.button(:value => "&Open")
          button.click
          sleep 2
          driver.find_element(:xpath, '//input[@name="send"]').click
          sleep 5
          driver.find_element(:xpath, '//div[@id="layoutLogo"]/a/img').click
          sleep 2
        when "internet_explorer"
          #Test paused to upload using Applet
          message = "Please perfrom upload operation and then click Ok."
          title = "Upload confirmation window"
          api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
          api.call(0,message,title,0)
          sleep 2
          driver.find_element(:xpath, '//div[@id="layoutLogo"]/a/img').click
          sleep 2

        else
          p 'Invalid Browser'
      end

    rescue Exception=> e
      puts e.message
      puts __FILE__

      puts caller_locations
      #puts "Rescue"

    end

    def ckeditor_file_restrict_test(server, driver, sender,recipient,subject,filename1,filename2, browser)
      driver.find_element(:name, 'from').send_keys("#{sender}")
      sleep 2
      Selenium::WebDriver::Support::Select.new(driver.find_element(:name, "recipientsTo")).select_by(:text, "#{recipient}")
      driver.action.send_keys(:enter)
      sleep 2
      # driver.action.send_keys(:enter).perform
      # sleep 2
      # driver.action.send_keys(:enter)
      # sleep 2
      driver.find_element(:name, 'name').send_keys("#{subject}")
      sleep 4
      ckeditor_frame = driver.find_element(:class => 'cke_wysiwyg_frame')
      driver.switch_to.frame(ckeditor_frame)
      sleep 2
      editor_body = driver.find_element(:tag_name => 'body')
      editor_body.send_keys('Secure message')
      driver.switch_to.default_content
      sleep 2
      # driver.find_element(:xpath, '//input[@name="tosAccepted"]').click
      sleep 2
      browser=browser.to_s
      p browser
      case browser

        when "chrome"
          sleep 2
          driver.find_element(:xpath,"//*[@id='divOptions']/div[2]/div/div/div/div[2]/label").click()
          sleep 2
          window = RAutomation::Window.new(:title => /Open/i)
          p window.exists? # => true
          window.text_field(:class => "Edit", :index => 0).set "#{filename1}"
          button = window.button(:value => "&Open")
          button.click
          sleep 2
          driver.switch_to.alert.accept
          sleep 2
          driver.find_element(:xpath,"//*[@id='divOptions']/div[2]/div/div/div/div[2]/label").click()
          sleep 2
          window.text_field(:class => "Edit", :index => 0).set "#{filename2}"
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
          window.text_field(:class => "Edit", :index => 0).set "#{filename1}"
          button = window.button(:value => "&Open")
          button.click
          sleep 2
          driver.switch_to.alert.accept
          sleep 10
          driver.find_element(:xpath, "//*[contains(text(),'Attach files')]").click
          #driver.find_element(:xpath,"//*[@id='divOptions']/div[2]/div/div/div/div[2]/label").click()
          sleep 2
          window = RAutomation::Window.new(:title => /File Upload/i)
          p window.exists? # => true
          window.text_field(:class => "Edit", :index => 0).set "#{filename2}"
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
    end

    def received_delivery(server,driver,delivery_name,file_name)
      sleep 2
      driver.find_element(:link,'Inbox').click
      sleep 4
      #if verify {driver.page_source.include?"#{delivery_name}"}
      result=driver.find_element(:tag_name =>'body').text.include?("#{delivery_name}")
      result=result.to_s
      if result=='true'
        driver.find_element(:link,"#{delivery_name}").click
        sleep 2
        driver.find_element(:link,"#{file_name}").click
        window = RAutomation::Window.new(:title => /Opening #{file_name}/i)
        window.activate
        sleep 2
        p window.exists? # => true
        sleep 2
        #window.send_keys(:down)
        window.send_keys(:enter)
      else
        puts "Delivery \"#{delivery_name}\" does not exists"
        return
      end
      end
  end
end