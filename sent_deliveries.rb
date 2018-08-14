module Sent

  class SentDeliveries
    def sent_delivery(server,driver,delivery_name,file_name)
      sleep 2
      #driver.find_element(:link,'Sent Deliveries').click
      #driver.find_element(:id,'sentDeliveriesLink').click
      driver.find_element(:xpath,'//li[@id="sentDeliveriesLink"]/a/span[2]').click
      sleep 2
      #if verify {driver.page_source.include?"#{delivery_name}"}
      driver.find_element(:link,"#{delivery_name}").click
      driver.find_element(:link,"#{file_name}").click
      window = RAutomation::Window.new(:title => /Opening #{file_name}/i)
      window.activate
      sleep 2
      p window.exists? # => true
      sleep 2
      window.send_keys(:down)
      window.send_keys(:enter)
    end

    def sent_deliver_received_secure_reply(server,driver,sender_name,delivery_name,file_name)

      sleep 2
      #driver.find_element(:link,'Sent Deliveries').click
      driver.find_element(:xpath,"//li[@id='sentDeliveriesLink']/a/span[2]").click
      sleep 2
      #if verify {driver.page_source.include?"#{delivery_name}"}
      driver.find_element(:link,"#{delivery_name}").click
      sleep 2
      driver.find_element(:link,"#{sender_name}").click
      sleep 2
      driver.find_element(:link,"#{file_name}").click
      window = RAutomation::Window.new(:title => /Opening #{file_name}/i)
      sleep 4
      window.activate
      sleep 4
      p window.exists? # => true
      sleep 4
      #window.send_keys(:down)
      window.send_keys(:enter)
    end

    def sent_delivery_collaboration_file_add_to_package(server,driver,sender_name,delivery_name)

      driver.find_element(:link,'Sent Items').click
      sleep 2
      #if verify {driver.page_source.include?"#{delivery_name}"}
      driver.find_element(:link,"#{delivery_name}").click
      driver.find_element(:link,"#{sender_name}").click
      sleep 2
      puts "1"
      sleep 5
      driver.find_element(:xpath, "//input[@name='replyDocumentIdArray']").click
      puts "2"
      sleep 5

      driver.find_element(:name, "overwriteFile").click
      sleep 5
      driver.find_element(:xpath, "//input[@value='Save to package']").click
      sleep 2
    end

    def sent_delivery_file_link_copy(server,driver,delivery_name,file_name)


      sleep 2
      driver.find_element(:link,'Sent Deliveries').click
      sleep 2
      #if verify {driver.page_source.include?"#{delivery_name}"}
      driver.find_element(:link,"#{delivery_name}").click
      sleep 2
      file = driver.find_element(:link,"#{file_name}")
      file_link= file.attribute("href")
      puts "#{file_link}"

      return file_link


    end

    def view_sent_items(server, driver,delivery_name)
      driver.find_element(:xpath, '//li[@id="sentDeliveriesLink"]/a/span[2]').click
      sleep 2
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


  end

end