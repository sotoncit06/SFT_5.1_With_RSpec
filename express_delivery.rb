module ExpressDelivery

  class CreateExpressDelivery

    def send_express_delivery_ckeditor_html5(server,driver,recipient,subject,filename,browser)
      begin
        #CKEDITOR BODY
        lmb=lambda { sleep 2
        ckeditor_frame = driver.find_element(:class => 'cke_wysiwyg_frame')
        driver.switch_to.frame(ckeditor_frame)
        sleep 2
        editor_body = driver.find_element(:tag_name => 'body')
        editor_body.send_keys('Secure Message ')
        driver.switch_to.default_content
        sleep 2
        }
        #CKEDITOR BODY ENDS

        sleep 2
        driver.find_element(:xpath,'//div[@id="expressDeliveryLink"]/a/span[2]').click
        sleep 2
        driver.find_element(:id,'token-input-recipientsToInput').send_keys("#{recipient}")
        #driver.find_element(:id,'token-input-recipientsToInput').click
        sleep 2
        driver.action.send_keys(:enter).perform
        #driver.find_element(:id,'token-input-recipientsToInput').send_keys(",")
        sleep 2
        driver.action.send_keys(:enter)
        driver.find_element(:id,'subject').send_keys("#{subject}")
        #CKEDITOR STARTS
        sleep 2
        ckeditor_btn_number_list = driver.find_element(:class => "cke_button__numberedlist")
        ckeditor_btn_number_list.click
        ckeditor_btn_bold = driver.find_element(:class => "cke_button__bold")
        ckeditor_btn_bold.click
        lmb.call
        ckeditor_btn_bold = driver.find_element(:class => "cke_button__bold")
        ckeditor_btn_bold.click
        ckeditor_btn_italic = driver.find_element(:class => "cke_button__italic")
        ckeditor_btn_italic.click
        lmb.call
        ckeditor_btn_italic = driver.find_element(:class => "cke_button__italic")
        ckeditor_btn_italic.click
        # ckeditor_btn_strike = driver.find_element(:class => "cke_button__strike")
        # ckeditor_btn_strike.click
        # lmb.call
        # ckeditor_btn_strike = driver.find_element(:class => "cke_button__strike")
        # ckeditor_btn_strike.click
        ckeditor_btn_number_list = driver.find_element(:class => "cke_button__numberedlist")
        ckeditor_btn_number_list.click
        lmb.call
        ckeditor_btn_number_list = driver.find_element(:class => "cke_button__numberedlist")
        ckeditor_btn_number_list.click
        ckeditor_btn_bullet_list = driver.find_element(:class => "cke_button__bulletedlist")
        ckeditor_btn_bullet_list.click
        lmb.call
=begin
        ckeditor_combo_button = driver.find_element(:class => "cke_combo_open")
        ckeditor_combo_button.click

        sleep 4

        ckeditor_frame_style = driver.find_element(:class => 'cke_panel_frame')
        driver.switch_to.frame(ckeditor_frame_style)
        sleep 4
        driver.find_element(:xpath, "//a[@id='cke_59_text']/span").click
        driver.switch_to.default_content
        lmb.call
=end
        #CKEDITOR ENDS

        browser=browser.to_s
        p browser
        case browser

          when "chrome"
            sleep 2
            driver.find_element(:xpath, "//*[contains(text(),'Attach files')]").click
            sleep 2
            window = RAutomation::Window.new(:title => /Open/i)
            p window.exists? # => true
            window.text_field(:class => "Edit", :index => 0).set "#{filename}"
            button = window.button(:value => "&Open")
            button.click
            sleep 5

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
        driver.find_element(:xpath, '//button[@type="submit"]').click
      end
      #handle file uploader
      sleep 2
        #driver.find_element(:xpath, '//button[@type="submit"]').click




    rescue Exception=> e
      puts e.message
      puts __FILE__
#        driver.find_element(:id, 'email')
      puts caller_locations
      #puts "Rescue"
    end


    def send_express_delivery_all_ckeditor_html5(server,driver,recipient,cc,bcc,subject,filename,browser)
      begin
        #CKEDITOR BODY
        lmb=lambda { sleep 2
        ckeditor_frame = driver.find_element(:class => 'cke_wysiwyg_frame')
        driver.switch_to.frame(ckeditor_frame)
        sleep 2
        editor_body = driver.find_element(:tag_name => 'body')
        editor_body.send_keys('Secure Message ')
        driver.switch_to.default_content
        sleep 2
        }
        #CKEDITOR BODY ENDS

        sleep 2
        driver.find_element(:xpath,'//div[@id="expressDeliveryLink"]/a/span[2]').click
        sleep 2
        driver.find_element(:class,'cc-bcc').click
        driver.find_element(:class,'noti-msg').click
        sleep 2
        driver.find_element(:id,'token-input-recipientsToInput').send_keys("#{recipient}")
        #driver.find_element(:id,'token-input-recipientsToInput').click
        sleep 2
        driver.action.send_keys(:enter)
        driver.find_element(:id,'token-input-recipientsCcInput').send_keys("#{cc}")
        sleep 2
        driver.action.send_keys(:enter).perform
        #driver.find_element(:id,'token-input-recipientsCcInput').send_keys(",")
        sleep 2
        driver.action.send_keys(:enter)
        driver.find_element(:id,'token-input-recipientsBccInput').send_keys("#{bcc}")
        sleep 2
        driver.action.send_keys(:enter).perform
        #driver.find_element(:id,'token-input-recipientsBccInput').send_keys(",")
        sleep 2
        #driver.action.send_keys(:enter).perform
        #driver.find_element(:id,'token-input-recipientsToInput').send_keys(",")
        sleep 2
        driver.action.send_keys(:enter)
        driver.find_element(:id,'subject').send_keys("#{subject}")
        #CKEDITOR STARTS
        sleep 2
        ckeditor_btn_number_list = driver.find_element(:class => "cke_button__numberedlist")
        ckeditor_btn_number_list.click
        ckeditor_btn_bold = driver.find_element(:class => "cke_button__bold")
        ckeditor_btn_bold.click
        lmb.call
        ckeditor_btn_bold = driver.find_element(:class => "cke_button__bold")
        ckeditor_btn_bold.click
        ckeditor_btn_italic = driver.find_element(:class => "cke_button__italic")
        ckeditor_btn_italic.click
        lmb.call
        ckeditor_btn_italic = driver.find_element(:class => "cke_button__italic")
        ckeditor_btn_italic.click
        ckeditor_btn_number_list = driver.find_element(:class => "cke_button__numberedlist")
        ckeditor_btn_number_list.click
        lmb.call
        ckeditor_btn_number_list = driver.find_element(:class => "cke_button__numberedlist")
        ckeditor_btn_number_list.click
        ckeditor_btn_bullet_list = driver.find_element(:class => "cke_button__bulletedlist")
        ckeditor_btn_bullet_list.click
        lmb.call
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

          when "firefox"
            sleep 2
            driver.find_element(:class,"bds-upload-btn").click()
            #driver.find_element(:xpath,"//*[@id='divOptions']/div[2]/div/div/div/div[2]/label").click()
            sleep 2
            window = RAutomation::Window.new(:title => /File Upload/i)
            p window.exists? # => true
            window.text_field(:class => "Edit", :index => 0).set "#{filename}"
            button = window.button(:value => "&Open")
            button.click
            sleep 10

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
        driver.find_element(:xpath, '//button[@type="submit"]').click
      end
      #handle file uploader
      sleep 2





    rescue Exception=> e
      puts e.message
      puts __FILE__
#        driver.find_element(:id, 'email')
      puts caller_locations
      #puts "Rescue"
    end


    def send_express_delivery_html5(server,driver,recipient,subject,filename,browser)
      begin
        sleep 2
        driver.find_element(:xpath,'//div[@id="expressDeliveryLink"]/a/span[2]').click
        sleep 2
        # driver.find_element(:link,'Show options').click
        # sleep 2
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


    def send_express_delivery_all_html5(server,driver,recipient,cc,bcc,subject,filename,browser)
      begin
        sleep 2
        driver.find_element(:xpath,'//div[@id="expressDeliveryLink"]/a/span[2]').click
        driver.find_element(:link,'Show options').click
        sleep 2
        driver.find_element(:id,'token-input-recipientsToInput').send_keys("#{recipient}")
        sleep 2
        driver.action.send_keys(:enter).perform
        #driver.find_element(:id,'token-input-recipientsToInput').send_keys(",")
        sleep 2
        driver.action.send_keys(:enter)
        #driver.find_element(:id,'token-input-recipientsCcInput').send_keys("#{cc}")
        sleep 2
        driver.action.send_keys(:enter).perform
        #driver.find_element(:id,'token-input-recipientsCcInput').send_keys(",")
        sleep 2
        driver.action.send_keys(:enter)
        driver.find_element(:id,'token-input-recipientsBccInput').send_keys("#{bcc}")
        sleep 2
        driver.action.send_keys(:enter).perform
        #driver.find_element(:id,'token-input-recipientsBccInput').send_keys(",")
        sleep 2
        driver.action.send_keys(:enter)
        driver.find_element(:id,'subject').send_keys("#{subject}")
        driver.find_element(:id,'secureMsg').clear
        driver.find_element(:id,'secureMsg').send_keys('Secure Message')
        driver.find_element(:name,'message').clear
        driver.find_element(:name,'message').send_keys('Notification Message')
        #handle file uploader
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
            sleep 2
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
        puts __FILE__
        driver.find_element(:id, 'email')
        puts caller_locations
        #puts "Rescue"
      end
    end

    def send_express_delivery_all_html5_without_attachment(server,driver,recipient,cc,bcc)
      begin
        sleep 2
        driver.find_element(:xpath,'//div[@id="expressDeliveryLink"]/a/span[2]').click
        driver.find_element(:link,'Show options').click
        sleep 2
        driver.action.send_keys(:enter).perform
        #driver.find_element(:id,'token-input-recipientsToInput').send_keys("#{recipient}")
        sleep 2
        driver.action.send_keys(:enter).perform
        #driver.find_element(:id,'token-input-recipientsToInput').send_keys(",")
        sleep 2
        driver.action.send_keys(:enter)
        driver.find_element(:id,'token-input-recipientsCcInput').send_keys("#{cc}")
        sleep 2
        driver.action.send_keys(:enter)
        driver.find_element(:id,'token-input-recipientsBccInput').send_keys("#{bcc}")
        sleep 2
        driver.action.send_keys(:enter)
        driver.find_element(:id,'subject').send_keys('Test Express Delivery 1')
        driver.find_element(:id,'secureMsg').clear
        driver.find_element(:id,'secureMsg').send_keys('Secure Message')
        driver.find_element(:name,'message').clear
        driver.find_element(:name,'message').send_keys('Notification Message')
        sleep 2
        driver.find_element(:xpath, '//button[@type="submit"]').click

      rescue Exception=> e
        puts e.message
        puts __FILE__
        driver.find_element(:id, 'email')
        puts caller_locations
        #puts "Rescue"
      end
    end

    def send_express_delivery_html5_without_attachment(server,driver,recipient,subject)
      begin
        sleep 2
        driver.find_element(:xpath,'//div[@id="expressDeliveryLink"]/a/span[2]').click
        driver.find_element(:link,'Show options').click
        sleep 2
        driver.find_element(:id,'token-input-recipientsToInput').send_keys("#{recipient}")
        sleep 2
        driver.action.send_keys(:enter).perform
        #driver.find_element(:id,'token-input-recipientsToInput').send_keys(",")
        sleep 2
        driver.action.send_keys(:enter)

        driver.action.send_keys(:enter)
        driver.find_element(:id,'subject').send_keys("#{subject}")
        driver.find_element(:id,'secureMsg').clear
        driver.find_element(:id,'secureMsg').send_keys('Secure Message')
        driver.find_element(:name,'message').clear
        driver.find_element(:name,'message').send_keys('Notification Message')
        sleep 2
        driver.find_element(:xpath, '//button[@type="submit"]').click

      rescue Exception=> e
        puts e.message
        puts __FILE__
        driver.find_element(:id, 'email')
        puts caller_locations
        #puts "Rescue"
      end
    end

    def send_express_delivery_html5_without_attachment_ckeditor(server,driver,recipient,subject)
      begin
        #CKEDITOR BODY
        lmb=lambda { sleep 2
        ckeditor_frame = driver.find_element(:class => 'cke_wysiwyg_frame')
        driver.switch_to.frame(ckeditor_frame)
        sleep 2
        editor_body = driver.find_element(:tag_name => 'body')
        editor_body.send_keys('Secure Message ')
        driver.switch_to.default_content
        sleep 2
        }
        #CKEDITOR BODY ENDS

        sleep 2
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
        #CKEDITOR STARTS
        sleep 2
        ckeditor_btn_number_list = driver.find_element(:class => "cke_button__numberedlist")
        ckeditor_btn_number_list.click
        ckeditor_btn_bold = driver.find_element(:class => "cke_button__bold")
        ckeditor_btn_bold.click
        lmb.call
        ckeditor_btn_bold = driver.find_element(:class => "cke_button__bold")
        ckeditor_btn_bold.click
        ckeditor_btn_italic = driver.find_element(:class => "cke_button__italic")
        ckeditor_btn_italic.click
        lmb.call
        ckeditor_btn_italic = driver.find_element(:class => "cke_button__italic")
        ckeditor_btn_italic.click
        # ckeditor_btn_strike = driver.find_element(:class => "cke_button__strike")
        # ckeditor_btn_strike.click
        # lmb.call
        # ckeditor_btn_strike = driver.find_element(:class => "cke_button__strike")
        # ckeditor_btn_strike.click
        ckeditor_btn_number_list = driver.find_element(:class => "cke_button__numberedlist")
        ckeditor_btn_number_list.click
        lmb.call
        ckeditor_btn_number_list = driver.find_element(:class => "cke_button__numberedlist")
        ckeditor_btn_number_list.click
        ckeditor_btn_bullet_list = driver.find_element(:class => "cke_button__bulletedlist")
        ckeditor_btn_bullet_list.click
        lmb.call
        ckeditor_btn_combo_button = driver.find_element(:class => "cke_combo_button")
        # select_list = Selenium::WebDriver::Support::Select.new(ckeditor_btn_bulletedlist_list)
        # select_list.select_by(:text, 'Special Container')
        ckeditor_btn_combo_button.click
        sleep 4
        #driver.find_element(:class => "cke_combo_text")
        #ckeditor_btn_combo_button.select_by(:text, 'Italic Title')
        #driver.execute_script('document.getElementById("cke_62_text").click();')

        #driver.find_element(:xpath, "//a[@class='cke_combo_button']/descendant::span[text()='Italic Title']").click
        #ckeditor_btn_combo_button.send_keys(:arrow_down)
        #ckeditor_btn_combo_button.send_keys(:arrow_down)
        driver.action.send_keys(:enter).perform
        lmb.call
        #driver.find_element(:xpath, '//button[@type="submit"]').click
        #CKEDITOR ENDS
        #name = driver.execute_script('var classname = document.getElementsByClassName("btn bds-upload-btn btn-primary btn-sm");classname[0].click();')

        sleep 2
        driver.find_element(:xpath, '//button[@type="submit"]').click

      rescue Exception=> e
        puts e.message
        puts __FILE__
#        driver.find_element(:id, 'email')
        puts caller_locations
        #puts "Rescue"
      end
    end


    def send_express_delivery_applet(server,driver,recipient,subject)
      begin
        sleep 2
        driver.find_element(:xpath,'//div[@id="expressDeliveryLink"]/a/span[2]').click
        driver.find_element(:css, 'div.navbar-collapse.collapse').click
        sleep 2
        driver.find_element(:xpath, "//button[@type='button']").click
        driver.find_element(:link, 'Use applet for file upload').click
        sleep 3

        a=driver.switch_to.alert
        window_message=a.text
        expected_message='Switching to applet page will discard the changes you made in current page. Are you sure you want to continue?'
        #if expected_message==window_message
        sleep 3
        driver.switch_to.alert.accept
        sleep 2
        driver.find_element(:link,'Show options').click
        driver.find_element(:id,'token-input-recipientsToInput').send_keys("#{recipient}")
        sleep 2
        driver.action.send_keys(:enter).perform
        #driver.find_element(:id,'token-input-recipientsToInput').send_keys(",")
        sleep 2
        driver.action.send_keys(:enter)
        driver.find_element(:id,'subject').send_keys("#{subject}")
        driver.find_element(:id,'secureMsg').clear
        driver.find_element(:id,'secureMsg').send_keys('Secure Message')
        driver.find_element(:name,'message').clear
        driver.find_element(:name,'message').send_keys('Notification Message')
        driver.find_element(:xpath, '//button[@type="submit"]').click

        #Test paused to upload using Applet
        message = "Script is paused until you have completed upload process through Applet. Please press Ok button to resume test."
        title = "Upload confirmation window"
        api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
        api.call(0,message,title,0)
        sleep 2
        driver.find_element(:link,'Go to delivery').click
          #secure reply

      rescue Exception=> e
        # puts e.message
        puts __FILE__
#        driver.find_element(:id, 'email')
        puts caller_locations
        #puts "Rescue"
      end
    end

    def send_express_delivery_applet_ckeditor(server,driver,recipient,subject)
      begin

        sleep 2
        driver.find_element(:xpath,'//div[@id="expressDeliveryLink"]/a/span[2]').click
       # driver.find_element(:css, 'div.navbar-collapse.collapse').click
        sleep 2
        driver.find_element(:xpath, "//button[@type='button']").click
        driver.find_element(:link, 'Use applet for file upload').click
        sleep 3

        a=driver.switch_to.alert
        window_message=a.text
        expected_message='Switching to applet page will discard the changes you made in current page. Are you sure you want to continue?'
        #if expected_message==window_message
        sleep 3
        driver.switch_to.alert.accept
        sleep 2
        driver.find_element(:xpath,'//div[@id="button-premiter"]/div/button').click
        driver.find_element(:xpath,'//div[@id="button-premiter"]/div/button[2]').click
        #driver.find_element(:link,'Show options').click
        driver.find_element(:id,'token-input-recipientsToInput').send_keys("#{recipient}")
        sleep 2
        driver.action.send_keys(:enter).perform
        #driver.find_element(:id,'token-input-recipientsToInput').send_keys(",")
        sleep 2
        driver.action.send_keys(:enter)
        driver.find_element(:id,'subject').send_keys("#{subject}")


        sleep 4
        ckeditor_frame = driver.find_element(:class => 'cke_wysiwyg_frame')
        driver.switch_to.frame(ckeditor_frame)
        sleep 2
        editor_body = driver.find_element(:tag_name => 'body')
        editor_body.send_keys('Secure message')
        driver.switch_to.default_content
        sleep 2

        driver.find_element(:xpath, '//button[@type="submit"]').click

        #Test paused to upload using Applet
        message = "Script is paused until you have completed upload process through Applet. Please press Ok button to resume test."
        title = "Upload confirmation window"
        api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
        api.call(0,message,title,0)
        sleep 2
        driver.find_element(:link,'Go to delivery').click
          #secure reply

      rescue Exception=> e
        # puts e.message
        puts __FILE__
#        driver.find_element(:id, 'email')
        puts caller_locations
        #puts "Rescue"
      end
    end

    def send_express_delivery_html5_indirect(server,driver,recipient,subject,filename,browser)
      begin

        sleep 2
        driver.find_element(:xpath, '//div[@id="expressDeliveryLink"]/a/span[2]').click
        driver.find_element(:css, 'div.navbar-collapse.collapse').click
        sleep 2
        driver.find_element(:xpath, "//button[@type='button']").click
        driver.find_element(:link, 'Upload without applet').click
        sleep 3

        a=driver.switch_to.alert
        window_message=a.text
        expected_message='Switching to applet page will discard the changes you made in current page. Are you sure you want to continue?'
        #if expected_message==window_message
        sleep 3
        driver.switch_to.alert.accept
        sleep 2
        driver.find_element(:link,'Show options').click
        driver.find_element(:id,'token-input-recipientsToInput').send_keys("#{recipient}")
        sleep 2
        driver.action.send_keys(:enter).perform
        #driver.find_element(:id,'token-input-recipientsToInput').send_keys(",")
        sleep 2
        driver.action.send_keys(:enter)
        driver.find_element(:id,'subject').send_keys("#{subject}")
        driver.find_element(:id,'secureMsg').clear
        driver.find_element(:id,'secureMsg').send_keys('Secure Message')
        driver.find_element(:name,'message').clear
        driver.find_element(:name,'message').send_keys('Notification Message')

        #handle file uploader
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
            sleep 2
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
            sleep 5
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


        sleep 2

      rescue Exception=> e
        # puts e.message
        puts __FILE__
#        driver.find_element(:id, 'email')
        puts caller_locations
        #puts "Rescue"
      end
    end

    def send_express_delivery_html5_indirect_ckeditor(server,driver,recipient,subject,filename,browser)
      begin

        sleep 2
        driver.find_element(:xpath, '//div[@id="expressDeliveryLink"]/a/span[2]').click
        driver.find_element(:css, 'div.navbar-collapse.collapse').click
        sleep 2
        driver.find_element(:xpath, "//button[@type='button']").click
        driver.find_element(:link, 'Upload without applet').click
        sleep 3

        a=driver.switch_to.alert
        window_message=a.text
        expected_message='Switching to applet page will discard the changes you made in current page. Are you sure you want to continue?'
        #if expected_message==window_message
        sleep 3
        driver.switch_to.alert.accept
        sleep 2
        driver.find_element(:xpath,'//div[@id="button-premiter"]/div/button').click
        driver.find_element(:xpath,'//div[@id="button-premiter"]/div/button[2]').click
        #driver.find_element(:link,'Show options').click
        driver.find_element(:id,'token-input-recipientsToInput').send_keys("#{recipient}")
        sleep 2
        driver.action.send_keys(:enter).perform
        #driver.find_element(:id,'token-input-recipientsToInput').send_keys(",")
        sleep 2
        driver.action.send_keys(:enter)
        driver.find_element(:id,'subject').send_keys("#{subject}")


        sleep 4
        ckeditor_frame = driver.find_element(:class => 'cke_wysiwyg_frame')
        driver.switch_to.frame(ckeditor_frame)
        sleep 2
        editor_body = driver.find_element(:tag_name => 'body')
        editor_body.send_keys('Secure message')
        driver.switch_to.default_content
        sleep 2


        #handle file uploader
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
            sleep 2
            driver.find_element(:class,"bds-upload-btn").click()
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


        sleep 2

      rescue Exception=> e
        # puts e.message
        puts __FILE__
#        driver.find_element(:id, 'email')
        puts caller_locations
        #puts "Rescue"
      end
    end


    def send_express_delivery_direct_by_applet(server,driver,recipient,subject)

      begin
        sleep 2
        driver.find_element(:xpath, '//div[@id="expressDeliveryLink"]/a/span[2]').click
        sleep 2
        driver.find_element(:link,'Show options').click
        driver.find_element(:id,'token-input-recipientsToInput').send_keys("#{recipient}")
        sleep 2
        driver.action.send_keys(:enter).perform
        #driver.find_element(:id,'token-input-recipientsToInput').send_keys(",")
        sleep 2
        driver.action.send_keys(:enter)
        driver.find_element(:id,'subject').send_keys("#{subject}")
        driver.find_element(:id,'secureMsg').clear
        driver.find_element(:id,'secureMsg').send_keys('Secure Message')
        driver.find_element(:name,'message').clear
        driver.find_element(:name,'message').send_keys('Notification Message')
        driver.find_element(:xpath, '//button[@type="submit"]').click

        #Test paused to upload using Applet
        message = "Script is paused until you have completed upload process through Applet. Please press Ok button to resume test."
        title = "Upload confirmation window"
        api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
        api.call(0,message,title,0)
        sleep 2
        driver.find_element(:link,'Go to delivery').click
          #secure reply

      rescue Exception=> e
        #puts e.message
        puts __FILE__
#        driver.find_element(:id, 'email')
        puts caller_locations
        #puts "Rescue"
      end

    end

    def send_express_delivery_direct_by_applet_ckeditor(server,driver,recipient,subject)

      begin
        sleep 2
        driver.find_element(:xpath, '//div[@id="expressDeliveryLink"]/a/span[2]').click
        sleep 2
        driver.find_element(:xpath,'//div[@id="button-premiter"]/div/button').click
        driver.find_element(:xpath,'//div[@id="button-premiter"]/div/button[2]').click
        #driver.find_element(:link,'Show options').click
        driver.find_element(:id,'token-input-recipientsToInput').send_keys("#{recipient}")
        sleep 2
        driver.action.send_keys(:enter).perform
        #driver.find_element(:id,'token-input-recipientsToInput').send_keys(",")
        sleep 2
        driver.action.send_keys(:enter)
        driver.find_element(:id,'subject').send_keys("#{subject}")
        sleep 4
        ckeditor_frame = driver.find_element(:class => 'cke_wysiwyg_frame')
        driver.switch_to.frame(ckeditor_frame)
        sleep 2
        editor_body = driver.find_element(:tag_name => 'body')
        editor_body.send_keys('Secure message')
        driver.switch_to.default_content
        sleep 2

        driver.find_element(:xpath, '//button[@type="submit"]').click

        #Test paused to upload using Applet
        message = "Script is paused until you have completed upload process through Applet. Please press Ok button to resume test."
        title = "Upload confirmation window"
        api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
        api.call(0,message,title,0)
        sleep 2
        driver.find_element(:link,'Go to delivery').click
          #secure reply

      rescue Exception=> e
        #puts e.message
        puts __FILE__
#        driver.find_element(:id, 'email')
        puts caller_locations
        #puts "Rescue"
      end

    end


    def send_limited_express_delivery(server,driver,recipient,subject,filename, browser)
      begin
        driver.find_element(:xpath,'//div[@id="expressDeliveryLink"]/a/span[2]').click
        sleep 2
        driver.find_element(:xpath, '//input[@name="recipientsTo"]').send_keys("#{recipient}")
        sleep 2
        #driver.action.send_keys(:enter).perform
        driver.find_element(:xpath, '//input[@name="recipientsTo"]').send_keys(",")
        sleep 2
        driver.find_element(:xpath, '//input[@name="name"]').send_keys("#{subject}")
        driver.find_element(:xpath, '//textarea[@name="secureMessage"]').clear
        driver.find_element(:xpath, '//textarea[@name="secureMessage"]').send_keys('Secure Message')
        # pause for image verification
        message = "Script is paused until you have completed image verification."
        title = "image"
        api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
        api.call(0,message,title,0)
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
        #puts "Rescue"
      end
    end

    def send_limited_express_delivery_ckeditor(server,driver,recipient,subject,filename, browser)
      begin
        driver.find_element(:xpath,'//div[@id="expressDeliveryLink"]/a/span[2]').click
        sleep 2
        driver.find_element(:xpath, '//input[@name="recipientsTo"]').send_keys("#{recipient}")
        sleep 2
        #driver.action.send_keys(:enter).perform
        driver.find_element(:xpath, '//input[@name="recipientsTo"]').send_keys(",")
        sleep 2
        driver.find_element(:xpath, '//input[@name="name"]').send_keys("#{subject}")
        sleep 4
        ckeditor_frame = driver.find_element(:class => 'cke_wysiwyg_frame')
        driver.switch_to.frame(ckeditor_frame)
        sleep 2
        editor_body = driver.find_element(:tag_name => 'body')
        editor_body.send_keys('Secure message')
        driver.switch_to.default_content
        sleep 2
        # pause for image verification
        message = "Script is paused until you have completed image verification."
        title = "image"
        api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
        api.call(0,message,title,0)
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
        #puts "Rescue"
      end
    end

    def cancel_dlivery_html5(server,driver)
      begin

        sleep 2
        driver.find_element(:xpath,'//div[@id="expressDeliveryLink"]/a/span[2]').click
        driver.find_element(:link, "Cancel").click
          #driver.find_element(:xpath, '//input[@value="Cancel"]').click
      rescue Exception=> e
        puts e.message
        puts __FILE__
        puts caller_locations

      end
    end

    def cancel_delivery_applet(server,driver)
      begin
        sleep 2
        driver.find_element(:xpath,'//div[@id="expressDeliveryLink"]/a/span[2]').click
        driver.find_element(:css, 'div.navbar-collapse.collapse').click
        sleep 2
        driver.find_element(:xpath, "//button[@type='button']").click
        driver.find_element(:link, 'Use applet for file upload').click
        sleep 3

        a=driver.switch_to.alert
        window_message=a.text
        expected_message='Switching to applet page will discard the changes you made in current page. Are you sure you want to continue?'
        #if expected_message==window_message
        sleep 3
        driver.switch_to.alert.accept
        sleep 2
        #driver.find_element(:xpath, "//div/input[2]").click
        driver.find_element(:xpath, "//input[@value='Cancel']").click
          #driver.find_element(:xpath, '//input[@value="Cancel"]').click
      rescue Exception=> e
        puts e.message
        puts __FILE__
        puts caller_locations

      end
    end

    def express_test(server,driver,recipient,subject,filename,browser)

      #CKEDITOR BODY
      lmb=lambda { sleep 2
      ckeditor_frame = driver.find_element(:class => 'cke_wysiwyg_frame')
      driver.switch_to.frame(ckeditor_frame)
      sleep 2
      editor_body = driver.find_element(:tag_name => 'body')
      editor_body.send_keys('Secure Message ')
      driver.switch_to.default_content
      sleep 2
      }
      #CKEDITOR BODY ENDS

      sleep 2
      driver.find_element(:xpath,'//div[@id="expressDeliveryLink"]/a/span[2]').click
      sleep 2
      #CKEDITOR STARTS
      sleep 2
      ckeditor_combo_button = driver.find_element(:class => "cke_combo_open")
      ckeditor_combo_button.click

      sleep 2
      #driver.element.equals(driver.switchTo().activeElement());
      #driver.find_element(:xpath,"//[@css='#cke_63 > a']").click
      #river.execute_script("document.getElementsById('#{<REF_TO_HIDDEN_DROPDOWN}')[0].style.display = 'cke_136_option'")
      #driver.find_element(:xpath,"//div[@idte_scrip='cke_131']")
      #driver.execute_script("document.getElementById('cke_136_option').focus()")
      #driver.switch_to.active_javascript_framework

      ckeditor_frame_style = driver.find_element(:class => 'cke_panel_frame')
      driver.switch_to.frame(ckeditor_frame_style)

      driver.find_element(:xpath, "//a[@id='cke_136_option']/span").click
      #driver.find_element(:id,'cke_136_option').click
      driver.switch_to.default_content
      ckeditor_frame = driver.find_element(:class => 'cke_wysiwyg_frame')
      driver.switch_to.frame(ckeditor_frame)
      sleep 2
      editor_body = driver.find_element(:tag_name => 'body')
      editor_body.send_keys('Secure Message ')
      driver.switch_to.default_content


    end
  end

  class DeleteExpressDelivery

    def delete_delivery(server,driver,delivery_name)
      sleep 2
      driver.find_element(:link,'Received Deliveries').click
      sleep 4
      #if verify {driver.page_source.include?"#{delivery_name}"}
      result=driver.find_element(:tag_name =>'body').text.include?("#{delivery_name}")
      result=result.to_s
      if result=='true'
        driver.find_element(:link,"#{delivery_name}").click
      else
        puts "Delivery \"#{delivery_name}\" does not exists"
      end
      driver.find_element(:link,'Action').click
      sleep 2
      driver.find_element(:link,'Delete this delivery').click
      sleep 2
      driver.find_element(:xpath, "//input[@value='Delete']").click
      sleep 3




    end


  end
end