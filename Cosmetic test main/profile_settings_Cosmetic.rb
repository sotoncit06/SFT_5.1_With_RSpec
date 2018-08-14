module Profile_settings
  class Profile



    def user_profile(driver, link, text)

      if driver.find_element(:link, "#{link}").text.include? "#{text}"
        puts "'#{text}' Found"
        $log_found.puts "'#{text}' Found"
      else
        puts "Couldn't find '#{text}' "
        $log_not_found.puts "Couldn't find '#{text}' "
      end

      puts "Clicked on profile link"
      $log_found.puts "Clicked on profile link"
      $log_not_found.puts "Clicked on profile link"
      $log_error_occured.puts "Clicked on profile link"
      driver.find_element(:link, "#{link}").click

      if ("#{link}" == "Admin")
        settings_name(driver, "admin", "admin")
      else
        settings_name(driver, "#{link}", "#{text}")
      end

      settings_name(driver, "Edit Profile", "Edit Profile")
      settings_name(driver, "Change Password", "Change Password")
      settings_name(driver, "Set Preferences", "Set Preferences")
      settings_name(driver, "Sign out", "Sign out")

    end




    def settings_name(driver, link, text)

      begin
        if driver.find_element(:link, "#{link}").text.include? "#{text}"
          puts "'#{text}' Found"
          $log_found.puts "'#{text}' Found"
        else
          puts "Couldn't find '#{text}' "
          $log_not_found.puts "Couldn't find '#{text}' "
        end
      rescue
        $log_error_occured.puts "Error occured in '#{text}' settings in user profile"
      end

    end

  end
end