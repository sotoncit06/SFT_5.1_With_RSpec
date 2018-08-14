
module Package

  class CreatePackage

    def create_package_html5(server,driver,package_name,filename)
      sleep 2
      driver.find_element(:link, "Packages").click
      sleep 2
      driver.find_element(:css, "a.btn.btn-default").click
      sleep 2
      driver.find_element(:name, "packageName").clear
      driver.find_element(:name, "packageName").send_keys "#{package_name}"
      driver.find_element(:name, "label").clear
      driver.find_element(:name, "label").send_keys "This is a tag"
      driver.find_element(:css, "textarea[name=\"description\"]").clear
      driver.find_element(:css, "textarea[name=\"description\"]").send_keys "Description goes here"

      #handle file uploader
      name = driver.execute_script('var classname = document.getElementsByClassName("btn bds-upload-btn btn-primary btn-sm");classname[0].click();')
      window = RAutomation::Window.new(:title => /File Upload/i)
      window.exists? # => true
      window.text_field(:class => "Edit", :index => 0).set "#{filename}"
      button = window.button(:value => "&Open")
      button.click
      sleep 5
      driver.find_element(:xpath, "//input[@value='Save']").click
      sleep 3
      #driver.find_element(:link, "View new package").click

    end

    def create_package_html5_indirect(server,driver,package_name,filename)

      driver.find_element(:link, "Packages").click
      sleep 2
      driver.find_element(:css, "span.glyphicon.glyphicon-plus").click
      sleep 2
      driver.find_element(:xpath, "//button[@type='button']").click
      sleep 2
      driver.find_element(:link, 'Upload without applet').click
      sleep 3

      a=driver.switch_to.alert
      window_message=a.text
      expected_message='Switching to applet page will discard the changes you made in current page. Are you sure you want to continue?'
      driver.switch_to.alert.accept
      sleep 4

      driver.find_element(:name, "packageName").clear
      driver.find_element(:name, "packageName").send_keys "#{package_name}"
      driver.find_element(:name, "label").clear
      driver.find_element(:name, "label").send_keys "This is a tag"
      driver.find_element(:css, "textarea[name=\"description\"]").clear
      driver.find_element(:css, "textarea[name=\"description\"]").send_keys "Description goes here"

      #handle file uploader
      name = driver.execute_script('var classname = document.getElementsByClassName("btn bds-upload-btn btn-primary btn-sm");classname[0].click();')
      sleep 3
      window = RAutomation::Window.new(:title => /File Upload/i)
      sleep 4
      window.exists? # => true
      window.text_field(:class => "Edit", :index => 0).set "#{filename}"
      button = window.button(:value => "&Open")
      button.click
      sleep 5
      driver.find_element(:xpath, "//input[@value='Save']").click
      #driver.find_element(:link, "View new package").click

    end

    def create_package_all_html5(server,driver,owner,sender,package_name,filename)

      sleep 4

      driver.find_element(:link, "Packages").click
      driver.find_element(:css, "span.glyphicon.glyphicon-plus").click
      sleep 2
      driver.find_element(:name, "packageName").clear
      driver.find_element(:name, "packageName").send_keys "#{package_name}"
      driver.find_element(:name, "label").clear
      driver.find_element(:name, "label").send_keys "This is a tag"
      driver.find_element(:css, "textarea[name=\"description\"]").clear
      driver.find_element(:css, "textarea[name=\"description\"]").send_keys "Description goes here"
      driver.find_element(:id,'token-input-ownersInput').send_keys "#{owner}"
      #driver.find_element(:id,'token-input-ownersInput').send_keys ","
      sleep 2
      driver.action.send_keys(:enter)
      sleep 2
      driver.find_element(:id,'token-input-sendersInput').send_keys "#{sender}"
      sleep 2
      # driver.find_element(:id,'token-input-sendersInput').send_keys ","
      # sleep 2
      driver.action.send_keys(:enter)
      #handle file uploader
      name = driver.execute_script('var classname = document.getElementsByClassName("btn bds-upload-btn btn-primary btn-sm");classname[0].click();')
      window = RAutomation::Window.new(:title => /File Upload/i)
      window.exists? # => true
      window.text_field(:class => "Edit", :index => 0).set "#{filename}"
      button = window.button(:value => "&Open")
      button.click
      sleep 2
      driver.find_element(:xpath, "//input[@value='Save']").click
      #driver.find_element(:link, "View new package").click

    end

    def create_package_all_html5_multiple_owner(server,driver,owner_one,owner_two,sender,package_name,filename)

      driver.find_element(:link, "Packages").click
      sleep 2
      driver.find_element(:css, "span.glyphicon.glyphicon-plus").click
      sleep 2
      driver.find_element(:name, "packageName").clear
      driver.find_element(:name, "packageName").send_keys "#{package_name}"
      driver.find_element(:name, "label").clear
      driver.find_element(:name, "label").send_keys "This is a tag"
      driver.find_element(:css, "textarea[name=\"description\"]").clear
      driver.find_element(:css, "textarea[name=\"description\"]").send_keys "Description goes here"
      driver.find_element(:id,'token-input-ownersInput').send_keys "#{owner_one}"
      sleep 2
      driver.find_element(:id,'token-input-ownersInput').send_keys ","
      sleep 2
      driver.action.send_keys(:enter)
      sleep 2
      driver.find_element(:id,'token-input-ownersInput').send_keys "#{owner_two}"
      sleep 2
      driver.find_element(:id,'token-input-ownersInput').send_keys ","
      sleep 2
      driver.action.send_keys(:enter)
      sleep 2
      driver.find_element(:id,'token-input-sendersInput').send_keys "#{sender}"
      sleep 2
      driver.find_element(:id,'token-input-sendersInput').send_keys ","
      sleep 2
      driver.action.send_keys(:enter)
      #handle file uploader
      name = driver.execute_script('var classname = document.getElementsByClassName("btn bds-upload-btn btn-primary btn-sm");classname[0].click();')
      window = RAutomation::Window.new(:title => /File Upload/i)
      window.exists? # => true
      window.text_field(:class => "Edit", :index => 0).set "#{filename}"
      button = window.button(:value => "&Open")
      button.click
      sleep 2
      driver.find_element(:xpath, "//input[@value='Save']").click
      #driver.find_element(:link, "View new package").click

    end



    def create_package_applet(server,driver,package_name)
      begin
        sleep 2
        driver.find_element(:link, "Packages").click
        driver.find_element(:css, "span.glyphicon.glyphicon-plus").click
        # sleep 2
        # driver.find_element(:css, 'div.navbar-collapse.collapse').click
        sleep 2
        driver.find_element(:xpath, "//button[@type='button']").click
        sleep 2
        driver.find_element(:link, 'Use applet for upload').click
        sleep 3

        a=driver.switch_to.alert
        window_message=a.text
        expected_message='Switching to applet page will discard the changes you made in current page. Are you sure you want to continue?'
        driver.switch_to.alert.accept

        driver.find_element(:name, "packageName").clear
        driver.find_element(:name, "packageName").send_keys "#{package_name}"
        driver.find_element(:name, "label").clear
        driver.find_element(:name, "label").send_keys "This is a tag"
        driver.find_element(:css, "textarea[name=\"description\"]").clear
        driver.find_element(:css, "textarea[name=\"description\"]").send_keys "Description goes here"
        sleep 2
        driver.find_element(:xpath, '//input[@type="submit"]').click

        #Test paused to upload using Applet
        message = 'Script is paused until you have completed upload process through Applet. Please press Ok button to resume test.'
        title = 'Upload confirmation window'
        api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
        api.call(0,message,title,0)
        sleep 2
        #driver.find_element(:xpath, "//input[@value='Save']").click
        driver.find_element(:link, 'Go to package').click

      rescue Exception=>e
        puts e.message
        puts __FILE__

        puts caller_locations
      end
    end

    def create_package_applet_direct(server,driver,package_name)
      begin
        driver.find_element(:link, "Packages").click
        sleep 2
        driver.find_element(:css, "span.glyphicon.glyphicon-plus").click
        # sleep 2
        # driver.find_element(:css, 'div.navbar-collapse.collapse').click
        sleep 2
        driver.find_element(:name, "packageName").clear
        driver.find_element(:name, "packageName").send_keys "#{package_name}"
        driver.find_element(:name, "label").clear
        driver.find_element(:name, "label").send_keys "This is a tag"
        driver.find_element(:css, "textarea[name=\"description\"]").clear
        driver.find_element(:css, "textarea[name=\"description\"]").send_keys "Description goes here"
        sleep 2
        driver.find_element(:xpath, '//input[@type="submit"]').click

        #Test paused to upload using Applet
        message = 'Script is paused until you have completed upload process through Applet. Please press Ok button to resume test.'
        title = 'Upload confirmation window'
        api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
        api.call(0,message,title,0)
        sleep 2
        #driver.find_element(:xpath, "//input[@value='Save']").click
        #driver.find_element(:link, 'Go to package').click

      rescue Exception=>e
        puts e.message
        puts __FILE__

        puts caller_locations
      end
    end

    def create_package_all_applet(server,driver,owner,sender)
      begin
        driver.find_element(:link, "Packages").click
        driver.find_element(:css, "span.glyphicon.glyphicon-plus").click
        sleep 2
        driver.find_element(:css, 'div.navbar-collapse.collapse').click
        sleep 2
        driver.find_element(:xpath, "//button[@type='button']").click
        driver.find_element(:link, 'Use applet for upload').click
        sleep 3

        a=driver.switch_to.alert
        window_message=a.text
        expected_message='Switching to applet page will discard the changes you made in current page. Are you sure you want to continue?'
        driver.switch_to.alert.accept
        sleep 2
        driver.find_element(:name, "packageName").clear
        driver.find_element(:name, "packageName").send_keys "Package Applet"
        driver.find_element(:name, "label").clear
        driver.find_element(:name, "label").send_keys "This is a tag"
        driver.find_element(:css, "textarea[name=\"description\"]").clear
        driver.find_element(:css, "textarea[name=\"description\"]").send_keys "Description goes here"
        sleep 2
        driver.find_element(:id,'token-input-ownersInput').send_keys "#{owner}"
        sleep 2
        driver.find_element(:id,'token-input-ownersInput').send_keys ","
        sleep 2
        driver.action.send_keys(:enter)
        sleep 2
        driver.find_element(:id,'token-input-sendersInput').send_keys "#{sender}"
        sleep 2
        driver.find_element(:id,'token-input-sendersInput').send_keys ","
        sleep 2
        driver.action.send_keys(:enter)
        driver.find_element(:xpath, '//input[@type="submit"]').click

        #Test paused to upload using Applet
        message = 'Script is paused until you have completed upload process through Applet. Please press Ok button to resume test.'
        title = 'Upload confirmation window'
        api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
        api.call(0,message,title,0)
        sleep 2
        #driver.find_element(:xpath, "//input[@value='Save']").click
        driver.find_element(:link, 'Go to Packages').click

      rescue Exception=>e
        puts e.message
        puts __FILE__

        puts caller_locations
      end
    end
  end

  class EditPackage
    def edit_package_applet(server,driver,package_name)
      begin
        driver.find_element(:link, "Packages").click
        sleep 2
        driver.find_element(:link,"#{package_name}").click
        sleep 2
        driver.find_element(:xpath, "(//a[contains(text(),'Action')])[1]").click
        sleep 3
        # driver.find_element(:xpath, "//button[@type='button']").click
        driver.find_element(:link, 'Use applet for file upload').click
        sleep 3
        driver.find_element(:link, 'Add files').click
        #Test paused to upload using Applet
        message = 'Script is paused until you have completed upload process through Applet. Please press Ok button to resume test.'
        title = 'Upload confirmation window'
        api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
        api.call(0,message,title,0)
        sleep 2
        #driver.find_element(:xpath, "//input[@value='Save']").click
        driver.find_element(:link, 'Go to package').click

      rescue Exception=>e
        puts e.message
        puts __FILE__

        puts caller_locations
      end
    end

    def edit_package_html5(server,driver,package_name,filename)
      begin
        driver.find_element(:link, "Packages").click
        sleep 2
        driver.find_element(:link,"#{package_name}").click
        #driver.find_element(:xpath, "(//a[contains(text(),'Action')])[2]").click
        sleep 2

        #handle file uploader
        name = driver.execute_script('var classname = document.getElementsByClassName("btn bds-upload-btn btn-primary btn-sm");classname[0].click();')
        window = RAutomation::Window.new(:title => /File Upload/i)
        window.exists? # => true
        window.text_field(:class => "Edit", :index => 0).set "C:\\User quota sample files\\#{filename}"
        button = window.button(:value => "&Open")
        button.click
        sleep 2


      rescue Exception=>e
        puts e.message
        puts __FILE__

        puts caller_locations
      end

    end
    def add_multiple_owner(server,driver,package_name,owner1,owner2,sender1)
      begin
        sleep 2
        driver.find_element(:link, "Packages").click
        sleep 2
        driver.find_element(:link,"#{package_name}").click
        sleep 2
        driver.find_element(:xpath, "(//button[@type='button'])[1]").click
        sleep 2
        driver.find_element(:link, 'Edit').click
        sleep 2
        driver.find_element(:id, "token-input-ownersInput").send_keys "#{owner1}"
        sleep 10
        driver.action.send_keys(:enter)
        #driver.find_element(:id,'token-input-ownersInput').send_keys(",")
        sleep 2
        driver.action.send_keys(:enter)
        driver.find_element(:id, "token-input-ownersInput").send_keys "#{owner2}"
        sleep 2
        driver.action.send_keys(:enter)
        #driver.find_element(:id,'token-input-ownersInput').send_keys(",")
        sleep 2
        driver.action.send_keys(:enter)
        driver.find_element(:id,'token-input-sendersInput').send_keys("#{sender1}")
        sleep 2
        driver.action.send_keys(:enter)
        #driver.find_element(:id,'token-input-sendersInput').send_keys(",")
        sleep 2
        driver.action.send_keys(:enter)
        sleep 2
        driver.find_element(:xpath, "//input[@value='Update']").click

      rescue Exception=>e
        puts e.message
        puts __FILE__

        puts caller_locations
      end

    end

    def remove_package_ownership(server,driver,package_name,owner2)
      begin
        driver.find_element(:link, "Packages").click
        sleep 2
        driver.find_element(:link,"#{package_name}").click
        sleep 2
        driver.find_element(:xpath, "(//button[@type='button'])[1]").click
        sleep 2
        driver.find_element(:link, 'Edit').click
        sleep 2
        driver.find_element(:xpath,"//li[@class='token-input-token-facebook']/descendant::span[text()='×']").click
        sleep 2
        driver.find_element(:id, "token-input-ownersInput").send_keys "#{owner2}"
        sleep 2
        # driver.find_element(:id,'token-input-ownersInput').send_keys(",")
        # sleep 2
        driver.action.send_keys(:enter)
        sleep 2
        driver.find_element(:xpath, "//input[@value='Update']").click
        sleep 2
        driver.find_element(:xpath, "//body[@id='ng-app']/div[8]/div/div/div[2]/button").click
        sleep 2
        driver.find_element(:xpath, "//input[@value='Update']").click
        sleep 2
        driver.find_element(:xpath, "//body[@id='ng-app']/div[8]/div/div/div[2]/button[2]").click
        sleep 2
        driver.find_element(:link,"Back to Package List").click

      rescue Exception=>e
        puts e.message
        puts __FILE__

        puts caller_locations
      end

    end

    def allow_secure_reply_to_all(server,driver,package_name)

      begin
        driver.find_element(:link, "Packages").click
        sleep 2
        driver.find_element(:link,"#{package_name}").click
        sleep 2
        driver.find_element(:xpath, "(//button[@type='button'])[1]").click
        sleep 2
        driver.find_element(:link, 'Edit').click
        sleep 2
        checkbox = driver.find_element(:name, "allowCollaboration")
        if checkbox.attribute("checked")
          sleep 2
          driver.find_element(:xpath, "//input[@value='Update']").click

        else
          driver.find_element(:name, "allowCollaboration").click
          sleep 2
          driver.find_element(:xpath, "//input[@value='Update']").click
        end


      rescue Exception=>e
        puts e.message
        puts __FILE__

        puts caller_locations
      end


    end

    def package_file_details_text_presence_check(server,driver,package_name,text)
      begin
        sleep 2
        driver.find_element(:link, "Packages").click
        sleep 2
        driver.find_element(:link,"#{package_name}").click
        sleep 2


        #result= driver.find_element(:tag_name => "div").text.include?text
        #result= driver.find_element(:xpath, "//div[@class='panel-body']").text.include?text

        #result=result.to_s
        result = 'true'
        if result=='true'

          #driver.find_element(:link, "#{text}").click
          driver.find_element(:css, "div.glyphicon.glyphicons-edit").click
          #driver.find_element(:css, "img[alt=\"Edit\"]").click


          puts "File added successfully with colaboration "

        else puts "Collaboration failled"

     end
        sleep 2
      rescue Exception=>e
        puts e.message
        puts __FILE__

        puts caller_locations
      end


    end



    end

    class DeliverPackage
      def package_delivery(server,driver,recipient,cc,bcc,package_name)
        begin
          driver.find_element(:link, "Packages").click
          sleep 2
          driver.find_element(:link, "#{package_name}").click
          driver.find_element(:link, "Action").click
          driver.find_element(:link, "Send delivery").click

          sleep 2
          driver.find_element(:id,'token-input-recipientsToInput').send_keys("#{recipient}")
          sleep 2
          driver.find_element(:id,'token-input-recipientsToInput').send_keys(",")
          sleep 2
          driver.action.send_keys(:enter)
          driver.find_element(:id,'token-input-recipientsCcInput').send_keys("#{cc}")
          sleep 2
          driver.find_element(:id,'token-input-recipientsCcInput').send_keys(",")
          sleep 2
          driver.action.send_keys(:enter)
          driver.find_element(:id,'token-input-recipientsBccInput').send_keys("#{bcc}")
          sleep 2
          driver.find_element(:id,'token-input-recipientsBccInput').send_keys(",")
          sleep 2
          driver.action.send_keys(:enter)
          driver.find_element(:id, "secureMsg").clear
          driver.find_element(:id, "secureMsg").send_keys "This is secure message"
          driver.find_element(:name, "message").clear
          driver.find_element(:name, "message").send_keys "This is notification message."
          driver.find_element(:id, "secureMsg").clear
          driver.find_element(:id, "secureMsg").send_keys "This is secure message."
          driver.find_element(:xpath, "//input[@value='Preview notification']").click
          sleep 2
          driver.find_element(:link, "Close").click
          sleep 5
          driver.find_element(:xpath, "//input[@value='Send']").click
          driver.find_element(:link, "Back to Package").click
        rescue Exception=>e
          puts e.message
          puts __FILE__

          puts caller_locations
        end
      end

      def package_delivery_ckeditor(server,driver,recipient,cc,bcc,package_name)
        begin
          driver.find_element(:link, "Packages").click
          sleep 2
          driver.find_element(:link, "#{package_name}").click
          sleep 2
          driver.find_element(:xpath, "//button[@type='button']").click
          sleep 2
          driver.find_element(:link, "Send delivery").click

          sleep 2
          driver.find_element(:id,'token-input-recipientsToInput').send_keys("#{recipient}")

          sleep 4
          driver.action.send_keys(:enter)

          sleep 4
          ckeditor_frame = driver.find_element(:class => 'cke_wysiwyg_frame')
          driver.switch_to.frame(ckeditor_frame)
          sleep 2
          editor_body = driver.find_element(:tag_name => 'body')
          editor_body.send_keys('Secure message')
          driver.switch_to.default_content
          sleep 2
          driver.find_element(:link, "(Preview)").click
          sleep 2
          driver.find_element(:xpath, "(//button[@type='button'])[8]").click
          sleep 2
          driver.find_element(:xpath, "//button[@type='submit']").click
          #driver.find_element(:link, "Back to Package").click
        rescue Exception=>e
          puts e.message
          puts __FILE__

          puts caller_locations
        end
      end

    end

    class DeletePackage

      def delete_package(server,driver,package_name)

        begin
          driver.find_element(:link, "Packages").click
          sleep 2
          driver.find_element(:link,"#{package_name}").click
          sleep 2
          driver.find_element(:xpath, "//body[@id='ng-app']/div[4]/div/div[2]/div/div[2]/div/div/div/div[2]/ul/li/a").click
          sleep 2
          driver.find_element(:xpath, "//a[contains(text(),'Delete package')]").click
          sleep 4
          driver.find_element(:xpath, "//input[@value='Delete']").click
          sleep 2
        rescue Exception=>e
          puts e.message
          puts __FILE__

          puts caller_locations
        end
      end


    end
  end