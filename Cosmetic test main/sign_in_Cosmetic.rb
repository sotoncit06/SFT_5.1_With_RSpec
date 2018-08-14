module Sign_in

  class User_sign_in

    def user_signin(driver,user_name,password)
      begin

        driver.find_element(:id, 'username').clear
        driver.find_element(:id, 'username').send_keys("#{user_name}")
        driver.find_element(:id, 'password').clear
        driver.find_element(:id, 'password').send_keys("#{password}")
        driver.find_element(:xpath, '//button[@type="submit"]').click

        sleep 2
      end

    rescue Exception=>e
      puts e.message
      #puts e.backtrace.inspect
      puts __FILE__

      puts caller_locations
      #puts "Rescue"
    end



    def admin(driver)
      begin

        driver.find_element(:id, 'username').clear
        driver.find_element(:id, 'username').send_keys("admin")
        driver.find_element(:id, 'password').clear
        driver.find_element(:id, 'password').send_keys("admin")
        driver.find_element(:xpath, '//button[@type="submit"]').click
        sleep 2


      rescue Exception=> e
        puts e.message
        puts __FILE__

        puts caller_locations
        #puts "Rescue"
      end

    end



  end




end