module SignIn

  class UserSignIn

    def user_signin(server,driver,user_name,password)
      begin
        driver.get "#{server}"
        driver.find_element(:id, 'username').clear
        driver.find_element(:id, 'username').send_keys("#{user_name}")
        driver.find_element(:id, 'password').clear
        driver.find_element(:id, 'password').send_keys("#{password}")
        driver.find_element(:xpath, '//button[@type="submit"]').click
        if(driver.find_element(:tag_name => "body").text.include?"This is new Terms Of Service")
          driver.find_element(:xpath, "//input[@value='I accept the terms of service']").click
        end
        sleep 4
      end

      rescue Exception=>e
        puts e.message
        #puts e.backtrace.inspect
        puts __FILE__

        puts caller_locations
        #puts "Rescue"
    end

    def admin(server,driver)
      begin
        #Selenium code goes here
        driver.get "#{server}"
        driver.manage.window.maximize
        driver.find_element(:id, 'username').clear
        driver.find_element(:id, 'username').send_keys("admin")
        driver.find_element(:id, 'password').clear
        driver.find_element(:id, 'password').send_keys("admin")
        driver.find_element(:xpath, '//button[@type="submit"]').click
        sleep 2
        if(driver.find_element(:tag_name => "body").text.include?"This is new Terms Of Service")
          driver.find_element(:xpath, "//input[@value='I accept the terms of service']").click
        end

      rescue Exception=> e
        puts e.message
        puts __FILE__

        puts caller_locations
        #puts "Rescue"
      end

    end

    def sign_in_with_password_only(server,driver,password)
      begin
        #Selenium code goes here
        driver.find_element(:id, 'password').clear
        driver.find_element(:id, 'password').send_keys("#{password}")
        driver.find_element(:xpath, '//button[@type="submit"]').click
        if(driver.find_element(:tag_name => "body").text.include?"This is new Terms Of Service")
          driver.find_element(:xpath, "//input[@value='I accept the terms of service']").click
        end
        sleep 4
      end

    rescue Exception=>e
      puts e.message
      #puts e.backtrace.inspect
      puts __FILE__

      puts caller_locations
      #puts "Rescue"
    end

    def sign_in_without_reloading_browser(server,driver,password)
      begin
        #Selenium code goes here
        driver.find_element(:id, 'username').clear
        driver.find_element(:id, 'username').send_keys("#{user_name}")
        driver.find_element(:id, 'password').clear
        driver.find_element(:id, 'password').send_keys("#{password}")
        driver.find_element(:xpath, '//button[@type="submit"]').click
        if(driver.find_element(:tag_name => "body").text.include?"This is new Terms Of Service")
          driver.find_element(:xpath, "//input[@value='I accept the terms of service']").click
        end
        sleep 4
      end

    rescue Exception=>e
      puts e.message
      #puts e.backtrace.inspect
      puts __FILE__

      puts caller_locations
      #puts "Rescue"
    end


  end


  class ADUserSignIn
    def ad_user_signin(server,driver,user_name,password,domain)
      begin
        #Selenium code goes here
        driver.get "#{server}"
        driver.manage.window.maximize
        driver.find_element(:id, 'username').clear
        driver.find_element(:id, 'username').send_keys(user_name)
        driver.find_element(:id, 'password').clear
        driver.find_element(:id, 'password').send_keys(password)
        driver.find_element(:id, 'domain').clear
        driver.find_element(:id, 'domain').send_keys("#{domain}")
        driver.find_element(:xpath, '//button[@type="submit"]').click
        sleep 2
        if(driver.find_element(:tag_name => "body").text.include?"This is new Terms Of Service")
          driver.find_element(:xpath, "//input[@value='I accept the terms of service']").click
        end

        #define who will receive the delivery
        recipient='user_r@qa-server5.com'
        return recipient

      rescue Exception=> e
        puts e.message
        puts __FILE__

        puts caller_locations
        #puts "Rescue"
      end
    end

    def ad_gc_sender_signin(server,driver,domain)
      begin
        #Selenium code goes here
        driver.get "#{server}"
        driver.manage.window.maximize
        driver.find_element(:id, "username").clear
        driver.find_element(:id, 'username').send_keys("user_s@#{domain}.com")
        driver.find_element(:id, 'password').clear
        driver.find_element(:id, 'password').send_keys('1234')
        driver.find_element(:xpath, '//button[@type="submit"]').click
        if(driver.find_element(:tag_name => "body").text.include?"This is new Terms Of Service")
          driver.find_element(:xpath, "//input[@value='I accept the terms of service']").click
        end

        #define who will receive the delivery
        recipient='user_r@qa-server5.com'
        return recipient

      rescue Exception=> e
        puts e.message
        puts __FILE__

        puts caller_locations
        #puts "Rescue"
      end
    end

    def ad_upn_sender_signin(server,driver,domain)
      begin
        #Selenium code goes here
        driver.get "#{server}"
        driver.manage.window.maximize
        driver.find_element(:id, "username").clear
        driver.find_element(:id, 'username').send_keys("user_upn@#{domain}.com")
        driver.find_element(:id, 'password').clear
        driver.find_element(:id, 'password').send_keys('1234')
        driver.find_element(:xpath, '//button[@type="submit"]').click
        if(driver.find_element(:tag_name => "body").text.include?"This is new Terms Of Service")
          driver.find_element(:xpath, "//input[@value='I accept the terms of service']").click
        end

        #define who will receive the delivery
        recipient='user_r@qa-server5.com'
        return recipient

      rescue Exception=> e
        puts e.message
        puts __FILE__

        puts caller_locations
        #puts "Rescue"
      end
    end

    def ad_default_domain_sender_signin(server,driver,domain)
      begin
        #Selenium code goes here
        driver.get "#{server}"
        driver.manage.window.maximize
        driver.find_element(:id, "username").clear
        driver.find_element(:id, 'username').send_keys("user_s")
        driver.find_element(:id, 'password').clear
        driver.find_element(:id, 'password').send_keys('1234')
        driver.find_element(:xpath, '//button[@type="submit"]').click
        if(driver.find_element(:tag_name => "body").text.include?"This is new Terms Of Service")
          driver.find_element(:xpath, "//input[@value='I accept the terms of service']").click
        end


        #define who will receive the delivery
        recipient='user_r@qa-server5.com'
        return recipient

      rescue Exception=> e
        puts e.message
        puts __FILE__

        puts caller_locations
        #puts "Rescue"
      end
    end

    # def ad_user_recipient_signin(server,driver,recipient,domain)
    #   begin
    #     #Selenium code goes here
    #     driver.get "#{server}"
    #     driver.manage.window.maximize
    #     driver.find_element(:id, 'username').clear
    #     driver.find_element(:id, 'username').send_keys("#{recipient}")
    #     driver.find_element(:id, 'password').clear
    #     driver.find_element(:id, 'password').send_keys('1234')
    #     driver.find_element(:id, 'domain').clear
    #     driver.find_element(:id, 'domain').send_keys("#{domain}")
    #     driver.find_element(:xpath, '//button[@type="submit"]').click
    #
    #   rescue Exception=> e
    #     puts e.message
    #     puts __FILE__
    #
    #     puts caller_locations
    #     #puts "Rescue"
    #   end
    # end

    def ad_user_admin(server,driver,domain)
      begin
        #Selenium code goes here
        driver.get "#{server}"
        driver.manage.window.maximize
        driver.find_element(:id, 'username').clear
        driver.find_element(:id, 'username').send_keys('user_admin')
        driver.find_element(:id, 'password').clear
        driver.find_element(:id, 'password').send_keys('1234')
        driver.find_element(:id, 'domain').clear
        driver.find_element(:id, 'domain').send_keys("#{domain}")
        driver.find_element(:xpath, '//button[@type="submit"]').click
        if(driver.find_element(:tag_name => "body").text.include?"This is new Terms Of Service")
          driver.find_element(:xpath, "//input[@value='I accept the terms of service']").click
        end


        #define who will receive the delivery
        recipient='user_r@qa-server5.com'
        return recipient

      rescue Exception=> e
        puts e.message
        puts __FILE__

        puts caller_locations
        #puts "Rescue"
      end
    end

    def ad_system_admin(server,driver,domain)
      begin
        #Selenium code goes here
        driver.get "#{server}"
        driver.manage.window.maximize
        driver.find_element(:id, 'username').clear
        driver.find_element(:id, 'username').send_keys('system_admin')
        driver.find_element(:id, 'password').clear
        driver.find_element(:id, 'password').send_keys('1234')
        driver.find_element(:id, 'domain').clear
        driver.find_element(:id, 'domain').send_keys("#{domain}")
        driver.find_element(:xpath, '//button[@type="submit"]').click
        if(driver.find_element(:tag_name => "body").text.include?"This is new Terms Of Service")
          driver.find_element(:xpath, "//input[@value='I accept the terms of service']").click
        end


        #define who will receive the delivery
        recipient='user_r@qa-server5.com'
        return recipient

      rescue Exception=> e
        puts e.message
        puts __FILE__

        puts caller_locations
        #puts "Rescue"
      end
    end

    def ad_admin(server,driver,domain)
      begin
        #Selenium code goes here
        driver.get "#{server}"
        driver.manage.window.maximize
        driver.find_element(:id, 'username').clear
        driver.find_element(:id, 'username').send_keys('admin')
        driver.find_element(:id, 'password').clear
        driver.find_element(:id, 'password').send_keys('1234')
        driver.find_element(:id, 'domain').clear
        driver.find_element(:id, 'domain').send_keys("#{domain}")
        driver.find_element(:xpath, '//button[@type="submit"]').click
        if(driver.find_element(:tag_name => "body").text.include?"This is new Terms Of Service")
          driver.find_element(:xpath, "//input[@value='I accept the terms of service']").click
        end


        #define who will receive the delivery
        recipient='user_r@qa-server5.com'
        return recipient

      rescue Exception=> e
        puts e.message
        puts __FILE__

        puts caller_locations
        #puts "Rescue"
      end
    end
  end
end