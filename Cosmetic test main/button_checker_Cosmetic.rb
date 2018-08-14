module Button_check
  class Check_button


    def is_button_present_using_xpath(driver, xpath, value)

      begin
        test = driver.find_element(:xpath, "#{xpath}").attribute('value')

        if "#{test}" == "#{value}"
          $log_found.puts "'#{value}' found"
        else
          $log_not_found.puts "'#{value}' not found"
        end

      rescue
        $log_error_occured.puts "Error Occured in '#{value}'"
      end

    end




    def is_button_present_using_link(driver, link, value)

      begin
        if driver.find_element(:link, "#{link}").text.include? "#{value}"
          puts "'#{value}' found"
          $log_found.puts "'#{value}' found"
        else
          puts "'#{value}' not found"
          $log_not_found.puts "'#{value}' not found"
        end
      rescue
        puts "Error Occured in '#{value}'"
        $log_error_occured.puts "Error Occured in '#{value}'"
      end

    end




  end
end