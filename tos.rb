module TermsOfService
  class TOS
    def tos_accept(server,driver,tos_value)
      sleep 2
      result=driver.find_element(:tag_name => "body").text.include?tos_value
      result=result.to_s
      if result=='true'
        p 'TOS is correct'
      else
        puts "Incorrect TOS"
      end
      driver.find_element(:xpath, "//input[@value='I accept the terms of service']").click

      sleep 4
    end
  end
end