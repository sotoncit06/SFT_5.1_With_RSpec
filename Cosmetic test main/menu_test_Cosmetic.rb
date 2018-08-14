module Menu_test
  class Side_Menu



    def admin_side_menu(driver)

      driver.find_element(:css, "img").click

      sleep 2

      side_menu_link(driver, "Reports", "Reports")
      side_menu_link(driver, "Administration", "Administration")
      side_menu_link(driver, "Help", "Help")

    end




    def admin_reports(driver)

      side_menu_link(driver, "Users", "Users")
      side_menu_link(driver, "System Administration", "System Administration")
      side_menu_link(driver, "Application", "Application")
      side_menu_link(driver, "Virus Scan Reports", "Virus Scan Reports")

    end




    def admin_administration(driver)

      side_menu_link(driver, "Manage Users", "Manage Users")
      side_menu_link(driver, "Server Information", "Server Information")
      side_menu_link(driver, "Server Configuration", "Server Configuration")
      side_menu_link(driver, "Server Processes", "Server Processes")
      side_menu_link(driver, "Monitor system activity", "Monitor system activity")

    end




    def side_menu_link(driver, link, text)

      begin

        if driver.find_element(:link, "#{link}").text.include? "#{text}"
          puts "'#{text}' Found"
          $log_found.puts "'#{text}' Found"
        else
          puts "Couldn't find '#{text}' "
          $log_not_found.puts "Couldn't find '#{text}' "
        end
      rescue
        $log_error_occured.puts "Error occured in '#{text}' "

      end

    end

  end
end