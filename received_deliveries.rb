module Received

  class ReceivedDeliveries

    def received_delivery_download_applet(server, driver, delivery_name)
      driver.find_element(:link,'Inbox').click
      sleep 2
      driver.find_element(:link,"#{delivery_name}").click
      sleep 2
      driver.find_element(:xpath, '//input[@name="documentIdArray"]').click
      sleep 2
      driver.find_element(:id, 'appletDownloadButton').click
      sleep 2
      message = "Script is paused until you have completed Download process through Applet. Please press Ok button to resume test."
      title = "Upload confirmation window"
      api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
      api.call(0,message,title,0)
      sleep 2
      driver.find_element(:link,'Back to delivery').click
      sleep 5
    end
    def received_delivery(server,driver,delivery_name,file_name)
      sleep 2
      driver.find_element(:link,"Inbox").click
      sleep 4
      #if verify {driver.page_source.include?"#{delivery_name}"}
      result=driver.find_element(:tag_name =>'body').text.include?("#{delivery_name}")
      result=result.to_s
      if result=='true'
        driver.find_element(:link,"#{delivery_name}").click
        sleep 2
        driver.find_element(:link,"#{file_name}").click
        window = RAutomation::Window.new(:title => /Opening #{file_name}/i)
        window.activate
        sleep 2
        p window.exists? # => true
        sleep 4
        #window.send_keys(:down)
        window.send_keys(:enter)
      else
        puts "Delivery \"#{delivery_name}\" does not exists"
        return
      end

    end
    def received_delivery_without_downloading_file(server,driver,delivery_name)
      sleep 2
      driver.find_element(:link,'Inbox').click
      sleep 4
      #if verify {driver.page_source.include?"#{delivery_name}"}
      result=driver.find_element(:tag_name =>'body').text.include?("#{delivery_name}")
      result=result.to_s
      if result=='true'
        driver.find_element(:link,"#{delivery_name}").click
        sleep 4
      else
        puts "Delivery \"#{delivery_name}\" does not exists"
        return
      end

    end

    def download_window_handle_only(server,driver,file_name)
      sleep 4
      window = RAutomation::Window.new(:title => /Opening #{file_name}/i)
      window.activate
      sleep 2
      p window.exists? # => true
      sleep 2
      #window.send_keys(:down)
      window.send_keys(:enter)
    end
  end
end