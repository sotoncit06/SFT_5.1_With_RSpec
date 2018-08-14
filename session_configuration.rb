module Session
  class SessionConfiguration

    def session_configuration(server, driver, time)
      driver.find_element(:xpath, '//li[@id="adminSidemenu"]/a').click
      sleep 2
      driver.find_element(:xpath, '//li[@id="serverConfigLink"]/a/span[2]').click
      sleep 2
      driver.find_element(:css, '#sec8 > div.nlv-settings-row-title').click
      sleep 2
      driver.find_element(:xpath, '//input[@name="sessionTimeout"]').clear
      sleep 2
      driver.find_element(:xpath, '//input[@name="sessionTimeout"]').send_keys"#{time}"
      driver.find_element(:xpath, '//input[@value="Update"]').click
      sleep 5
    end

    def create_package_session_html5(server,driver,package_name,filename, browser)

      driver.find_element(:link, "Packages").click
      driver.find_element(:css, "span.glyphicon.glyphicon-plus").click
      sleep 2
      driver.find_element(:name, "packageName").clear
      driver.find_element(:name, "packageName").send_keys "#{package_name}"
      driver.find_element(:name, "label").clear
      driver.find_element(:name, "label").send_keys "This is a tag"
      driver.find_element(:css, "textarea[name=\"description\"]").clear
      driver.find_element(:css, "textarea[name=\"description\"]").send_keys "Description goes here"

      browser=browser.to_s
      p browser
      case browser

        when "chrome"
          sleep 2
          driver.find_element(:xpath,"//*[@id='divOptions']/div[2]/div/div/div/div[2]/label").click
          sleep 2
          window = RAutomation::Window.new(:title => /Open/i)
          p window.exists? # => true
          window.text_field(:class => "Edit", :index => 0).set "#{filename}"
          button = window.button(:value => "&Open")
          button.click
          sleep 5
          driver.find_element(:xpath, '//button[@type="submit"]').click
        when "firefox"
          sleep 2
          driver.find_element(:xpath,"//*[@id='divOptions']/div[2]/div/div/div/div[2]/label").click
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
        #handle file uploader
        # driver.find_element(:xpath, '//button[@type="submit"]').click

    rescue Exception=> e
      puts e.message
      puts __FILE__
#        driver.find_element(:id, 'email')
      puts caller_locations
      #puts "Rescue"

    end

    def session_send_express_delivery_html5(server,driver,recipient,subject,filename,browser)
      begin
        sleep 2
        driver.find_element(:xpath,'//div[@id="expressDeliveryLink"]/a/span[2]').click
        driver.find_element(:link,'Show options').click
        sleep 2
        driver.find_element(:id,'token-input-recipientsToInput').send_keys("#{recipient}")
        #driver.find_element(:id,'token-input-recipientsToInput').click
        sleep 2
        driver.find_element(:id,'token-input-recipientsToInput').send_keys(",")
        sleep 2
        driver.action.send_keys(:enter)
        driver.find_element(:id,'subject').send_keys("#{subject}")
        driver.find_element(:id,'secureMsg').clear
        driver.find_element(:id,'secureMsg').send_keys('Secure Message')
        driver.find_element(:name,'message').clear
        driver.find_element(:name,'message').send_keys('Notification Message')
        #p browser

        #name = driver.execute_script('var classname = document.getElementsByClassName("btn bds-upload-btn btn-primary btn-sm");classname[0].click();')
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
            result=driver.find_element(:tag_name => "body").text.include?'Uploaded'
            p result
            while result==FALSE
              p 'Not uploaded'
              result=driver.find_element(:tag_name => "body").text.include?'Uploaded'

              sleep 2
            end
            #sleep 90
            driver.find_element(:xpath, '//button[@type="submit"]').click
          when "firefox"
            sleep 2
            driver.find_element(:xpath,"//*[@id='divOptions']/div[2]/div/div/div/div[2]/label").click()
            sleep 2
            window = RAutomation::Window.new(:title => /File Upload/i)
            p window.exists? # => true
            window.text_field(:class => "Edit", :index => 0).set "#{filename}"
            button = window.button(:value => "&Open")
            button.click
            result=driver.find_element(:tag_name => "body").text.include?'Uploaded'
            p result=result.to_s
            while result=='false'
              p 'Not uploaded'
              result=driver.find_element(:tag_name => "body").text.include?'Uploaded'
              result=result.to_s
              sleep 2
            end

            #sleep 90
            driver.find_element(:xpath, '//button[@type="submit"]').click
          when "internet_explorer"
            #Test paused to upload using Applet
            message = "Please perfrom upload operation and then click Ok."
            title = "Upload confirmation window"
            api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
            api.call(0,message,title,0)
            sleep 90
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
        #puts "Rescue"
      end
    end

    def ckeditor_session_send_express_delivery_html5(server,driver,recipient,subject,filename,browser)
      begin
        driver.find_element(:xpath,'//div[@id="expressDeliveryLink"]/a/span[2]').click
        sleep 2
        driver.find_element(:id,'token-input-recipientsToInput').send_keys("#{recipient}")
        #driver.find_element(:id,'token-input-recipientsToInput').click
        sleep 2
        #driver.action.send_keys(:enter).perform
        driver.find_element(:id,'token-input-recipientsToInput').send_keys(",")
        sleep 2
        driver.action.send_keys(:enter)
        driver.find_element(:id,'subject').send_keys("#{subject}")

        ckeditor_frame = driver.find_element(:class => 'cke_wysiwyg_frame')
        driver.switch_to.frame(ckeditor_frame)
        sleep 2
        editor_body = driver.find_element(:tag_name => 'body')
        editor_body.send_keys('Secure Message ')
        driver.switch_to.default_content
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
            result=driver.find_element(:tag_name => "body").text.include?'Uploaded'
            p result=result.to_s
            while result=='false'
              p 'Not uploaded'
              result=driver.find_element(:tag_name => "body").text.include?'Uploaded'
              result=result.to_s
              sleep 2
            end
            driver.find_element(:xpath, '//button[@type="submit"]').click
          when "firefox"
            sleep 2
            driver.find_element(:xpath, "//*[contains(text(),'Attach files')]").click
            #driver.find_element(:xpath,"//*[@id='divOptions']/div[2]/div/div/div/div[2]/label").click()
            sleep 2
            window = RAutomation::Window.new(:title => /File Upload/i)
            p window.exists? # => true
            window.text_field(:class => "Edit", :index => 0).set "#{filename}"
            button = window.button(:value => "&Open")
            button.click
            sleep 10
            result=driver.find_element(:tag_name => "body").text.include?'Uploaded'
            p result=result.to_s
            while result=='false'
              p 'Not uploaded'
              result=driver.find_element(:tag_name => "body").text.include?'Uploaded'
              result=result.to_s
              sleep 2
            end
            driver.find_element(:xpath, '//button[@type="submit"]').click
          when "internet_explorer"
            #Test paused to upload using Applet
            message = "Please perfrom upload operation and then click Ok."
            title = "Upload confirmation window"
            api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
            api.call(0,message,title,0)
            sleep 2
            result=driver.find_element(:tag_name => "body").text.include?'Uploaded'
            p result=result.to_s
            while result=='false'
              p 'Not uploaded'
              result=driver.find_element(:tag_name => "body").text.include?'Uploaded'
              result=result.to_s
              sleep 2
            end
            driver.find_element(:link,'Go to delivery').click

          else
            p 'Invalid Browser'
        end
    end
  end
  end
end