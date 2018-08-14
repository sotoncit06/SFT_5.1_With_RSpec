module Text_finder
  class Find_text



    def find_title_text(driver, title)

      begin
      if driver.find_element(:class, "page-header").text.include? "#{title}"
        puts "'#{title}' found: Title"
        $log_found.puts "'#{title}' found: Title"
      else
        puts "'#{title}' not found: Title"
        $log_not_found.puts "'#{title}' not found: Title"
      end
      rescue
        $log_error_occured.puts "Error occured in '#{title}' page title"
        end

    end



  end
end