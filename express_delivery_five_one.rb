def secure_reply_applet_ckeditor(server,driver)
  sleep 2
  driver.find_element(:xpath,"//input[@value='Reply securely']").click
  sleep 2
  #driver.find_element(:xpath, "(//a[contains(text(),'Action')])[2]").click
  driver.find_element(:xpath,"//button[@type='button']").click
  driver.find_element(:link, "Use applet for file upload").click
  a=driver.switch_to.alert
  window_message=a.text
  expected_message='Switching to applet page will discard the changes you made in current page. Are you sure you want to continue?'
  driver.switch_to.alert.accept
  sleep 4
  ckeditor_frame = driver.find_element(:class => 'cke_wysiwyg_frame')
  driver.switch_to.frame(ckeditor_frame)
  sleep 2
  editor_body = driver.find_element(:tag_name => 'body')
  editor_body.send_keys('Secure message')
  driver.switch_to.default_content
  #driver.find_element(:xpath, '//textarea[@id="appletSecureMessageId"]').send_keys('This is secure reply notification message')
  #driver.find_element(:xpath, "//input[@value='Add files and Send reply']").click
  driver.find_element(:xpath,"(//button[@type='submit'])[2]").click
  sleep 2
  message = "Script is paused until you have completed upload process through Applet. Please press Ok button to resume test."
  title = "Upload confirmation window"
  api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
  api.call(0,message,title,0)
  sleep 2
  driver.find_element(:link,'Back to Your Delivery').click
end

def secure_reply_applet_direct_ckeditor(server,driver)
  sleep 2
  driver.find_element(:xpath,"//input[@value='Reply securely']").click
  sleep 2
  #driver.find_element(:xpath, '//textarea[@id="appletSecureMessageId"]').send_keys('This is secure reply notification message')
  ckeditor_frame = driver.find_element(:class => 'cke_wysiwyg_frame')
  driver.switch_to.frame(ckeditor_frame)
  sleep 2
  editor_body = driver.find_element(:tag_name => 'body')
  editor_body.send_keys('Secure message')
  driver.switch_to.default_content
  #driver.find_element(:xpath, "//input[@value='Add files and Send reply']").click
  driver.find_element(:xpath,"(//button[@type='submit'])[2]").click
  sleep 2
  message = "Script is paused until you have completed upload process through Applet. Please press Ok button to resume test."
  title = "Upload confirmation window"
  api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
  api.call(0,message,title,0)
  sleep 2
  driver.find_element(:link,'Back to Your Delivery').click
end

def secure_reply_from_sender_applet_ckeditor(server,driver)
  sleep 2
  driver.find_element(:xpath,"//input[@value='Reply securely']").click
  sleep 2
  #driver.find_element(:xpath, "(//a[contains(text(),'Action')])[2]").click
  driver.find_element(:xpath,"//button[@type='button']").click
  driver.find_element(:link, "Use applet for file upload").click
  a=driver.switch_to.alert #this alert currently not working for sft 5.1
  window_message=a.text
  expected_message='Switching to applet page will discard the changes you made in current page. Are you sure you want to continue?'
  driver.switch_to.alert.accept
  sleep 4
  ckeditor_frame = driver.find_element(:class => 'cke_wysiwyg_frame')
  driver.switch_to.frame(ckeditor_frame)
  sleep 2
  editor_body = driver.find_element(:tag_name => 'body')
  editor_body.send_keys('Secure message')
  driver.switch_to.default_content
  driver.find_element(:xpath,"(//button[@type='submit'])[2]").click
  #driver.find_element(:xpath, '//textarea[@name="message"]').send_keys('This is secure reply notification message')
  #driver.find_element(:xpath, "//input[@value='Add files and Send reply']").click
  sleep 2
  message = "Script is paused until you have completed upload process through Applet. Please press Ok button to resume test."
  title = "Upload confirmation window"
  api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
  api.call(0,message,title,0)
  sleep 2
  driver.find_element(:link,'Back to Delivery Details').click
end

def send_express_delivery_applet_ckeditor(server,driver,recipient,subject)
  begin

    sleep 2
    driver.find_element(:xpath,'//div[@id="expressDeliveryLink"]/a/span[2]').click
    driver.find_element(:css, 'div.navbar-collapse.collapse').click
    sleep 2
    driver.find_element(:xpath, "//button[@type='button']").click
    driver.find_element(:link, 'Use applet for file upload').click
    sleep 3

    a=driver.switch_to.alert
    window_message=a.text
    expected_message='Switching to applet page will discard the changes you made in current page. Are you sure you want to continue?'
    #if expected_message==window_message
    sleep 3
    driver.switch_to.alert.accept
    sleep 2
    driver.find_element(:xpath,'//div[@id="button-premiter"]/div/button').click
    driver.find_element(:xpath,'//div[@id="button-premiter"]/div/button[2]').click
    #driver.find_element(:link,'Show options').click
    driver.find_element(:id,'token-input-recipientsToInput').send_keys("#{recipient}")
    sleep 2
    driver.action.send_keys(:enter).perform
    #driver.find_element(:id,'token-input-recipientsToInput').send_keys(",")
    sleep 2
    driver.action.send_keys(:enter)
    driver.find_element(:id,'subject').send_keys("#{subject}")


    sleep 4
    ckeditor_frame = driver.find_element(:class => 'cke_wysiwyg_frame')
    driver.switch_to.frame(ckeditor_frame)
    sleep 2
    editor_body = driver.find_element(:tag_name => 'body')
    editor_body.send_keys('Secure message')
    driver.switch_to.default_content
    sleep 2

    driver.find_element(:xpath, '//button[@type="submit"]').click

    #Test paused to upload using Applet
    message = "Script is paused until you have completed upload process through Applet. Please press Ok button to resume test."
    title = "Upload confirmation window"
    api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
    api.call(0,message,title,0)
    sleep 2
    driver.find_element(:link,'Go to delivery').click
      #secure reply

  rescue Exception=> e
    # puts e.message
    puts __FILE__
#        driver.find_element(:id, 'email')
    puts caller_locations
    #puts "Rescue"
  end
end

def send_express_delivery_direct_by_applet_ckeditor(server,driver,recipient,subject)

  begin
    sleep 2
    driver.find_element(:xpath, '//div[@id="expressDeliveryLink"]/a/span[2]').click
    sleep 2
    driver.find_element(:xpath,'//div[@id="button-premiter"]/div/button').click
    driver.find_element(:xpath,'//div[@id="button-premiter"]/div/button[2]').click
    #driver.find_element(:link,'Show options').click
    driver.find_element(:id,'token-input-recipientsToInput').send_keys("#{recipient}")
    sleep 2
    driver.action.send_keys(:enter).perform
    #driver.find_element(:id,'token-input-recipientsToInput').send_keys(",")
    sleep 2
    driver.action.send_keys(:enter)
    driver.find_element(:id,'subject').send_keys("#{subject}")
    sleep 4
    ckeditor_frame = driver.find_element(:class => 'cke_wysiwyg_frame')
    driver.switch_to.frame(ckeditor_frame)
    sleep 2
    editor_body = driver.find_element(:tag_name => 'body')
    editor_body.send_keys('Secure message')
    driver.switch_to.default_content
    sleep 2

    driver.find_element(:xpath, '//button[@type="submit"]').click

    #Test paused to upload using Applet
    message = "Script is paused until you have completed upload process through Applet. Please press Ok button to resume test."
    title = "Upload confirmation window"
    api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
    api.call(0,message,title,0)
    sleep 2
    driver.find_element(:link,'Go to delivery').click
      #secure reply

  rescue Exception=> e
    #puts e.message
    puts __FILE__
#        driver.find_element(:id, 'email')
    puts caller_locations
    #puts "Rescue"
  end

end

def express_test(server,driver,recipient,subject,filename,browser)

  #CKEDITOR BODY
  lmb=lambda { sleep 2
  ckeditor_frame = driver.find_element(:class => 'cke_wysiwyg_frame')
  driver.switch_to.frame(ckeditor_frame)
  sleep 2
  editor_body = driver.find_element(:tag_name => 'body')
  editor_body.send_keys('Secure Message ')
  driver.switch_to.default_content
  sleep 2
  }
  #CKEDITOR BODY ENDS

  sleep 2
  driver.find_element(:xpath,'//div[@id="expressDeliveryLink"]/a/span[2]').click
  sleep 2
  #CKEDITOR STARTS
  sleep 2
  ckeditor_combo_button = driver.find_element(:class => "cke_combo_open")
  ckeditor_combo_button.click

  sleep 2
  #driver.element.equals(driver.switchTo().activeElement());
  #driver.find_element(:xpath,"//[@css='#cke_63 > a']").click
  #river.execute_script("document.getElementsById('#{<REF_TO_HIDDEN_DROPDOWN}')[0].style.display = 'cke_136_option'")
  #driver.find_element(:xpath,"//div[@idte_scrip='cke_131']")
  #driver.execute_script("document.getElementById('cke_136_option').focus()")
  #driver.switch_to.active_javascript_framework

  ckeditor_frame_style = driver.find_element(:class => 'cke_panel_frame')
  driver.switch_to.frame(ckeditor_frame_style)

  driver.find_element(:xpath, "//a[@id='cke_148_option']/span").click
  #driver.find_element(:id,'cke_136_option').click

  #driver.find_element(:title,"Marker").click
  driver.execute_script('javascript:CKEDITOR.tools.callFunction(156,event,this);')
  #driver.find_element(:xpath, "//li[contains('Marker')]") .click
  #driver.find_element(:xpath, "//span[contains('Marker')]") .click
  driver.find_element(:xpath,"//[@class='marker']").click
  #driver.find_element(:link, "javascript:void('Marker')").click
  #driver.execute_script('javascript:void("Marker").click();#
  # #driver.findElement(By.linkText("Add a New Credit Card")).click();
  #driver.findElement(By.__id__("cke_136_option")).click
  #driver.find_element(:xpath, "//li[@id='cke_136_option' and @class='cke_panel_listItem']").click
  #driver.find_element(:title,"Marker").click #driver.find_element(:xpath,"//*[contains(text(), 'Marker')]")
  #text.click
  #puts "#{text}"


end
