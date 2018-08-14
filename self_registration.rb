require 'all_require'

def self_registration(server,driver,email,password,tos_value,restricted_email,browser)
begin
  sleep 2
  i=0
  j=email.length
  while i<j
    if email[i]==restricted_email
      sleep 5
      driver.find_element(:link, "here").click
      driver.find_element(:id, "emailAddr").clear
      driver.find_element(:id, "emailAddr").send_keys (email[i])
      driver.find_element(:name, "email2").clear
      driver.find_element(:name, "email2").send_keys (email[i])
      driver.find_element(:name, "password1").clear
      driver.find_element(:name, "password1").send_keys (password)
      driver.find_element(:name, "password2").clear
      driver.find_element(:name, "password2").send_keys (password)
      # driver.find_element(:name, "questions").clear
      # driver.find_element(:name, "questions").send_keys "que1"
      # driver.find_element(:name, "answers").clear
      # driver.find_element(:name, "answers").send_keys "ans1"
      # driver.find_element(:name, "hints").clear
      # driver.find_element(:name, "hints").send_keys "1"
      driver.find_element(:name, "tosAccepted").click
      message = "Please enter reCaptcha."
      title = "Upload confirmation window"
      api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
      api.call(0,message,title,0)
      sleep 2

      driver.find_element(:name, "register").click

      a=driver.switch_to.alert
      window_message=a.text
      p window_message
      driver.switch_to.alert.accept

      sleep 2
      password=1
      driver.find_element(:name, "password1").clear
      driver.find_element(:name, "password1").send_keys (password)
      driver.find_element(:name, "password2").clear
      driver.find_element(:name, "password2").send_keys (password)
      driver.find_element(:name, "register").click
      a=driver.switch_to.alert
      window_message=a.text
      p window_message
      driver.switch_to.alert.accept

      sleep 2
      password='1A'
      driver.find_element(:name, "password1").clear
      driver.find_element(:name, "password1").send_keys (password)
      driver.find_element(:name, "password2").clear
      driver.find_element(:name, "password2").send_keys (password)
      driver.find_element(:name, "register").click
      a=driver.switch_to.alert
      window_message=a.text
      p window_message
      driver.switch_to.alert.accept

      sleep 2
      password='1A#'
      driver.find_element(:name, "password1").clear
      driver.find_element(:name, "password1").send_keys (password)
      driver.find_element(:name, "password2").clear
      driver.find_element(:name, "password2").send_keys (password)
      driver.find_element(:name, "register").click
      p 'test11'
      a=driver.switch_to.alert
      window_message=a.text
      p window_message
      driver.switch_to.alert.accept

      sleep 2
      password='1As!#'
      driver.find_element(:name, "password1").clear
      driver.find_element(:name, "password1").send_keys (password)
      driver.find_element(:name, "password2").clear
      driver.find_element(:name, "password2").send_keys (password)
      message = "Please enter reCaptcha."
      title = "Upload confirmation window"
      api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
      api.call(0,message,title,0)
      sleep 2

      driver.find_element(:name, "register").click

      result=driver.find_element(:tag_name => "body").text.include?"Registration is not allowed for the email address you have specified. If you belong to a domain, please try signing in using your domain credentials. Otherwise, please contact the system administrator."
      if result==TRUE
        p "#{email[i]} is restricted"
      else
        p 'Error'
      end
      driver.find_element(:link,'Back to sign in page').click
      i+=1

      sleep 2
    else
      driver.find_element(:link, "here").click
      driver.find_element(:id, "emailAddr").clear
      driver.find_element(:id, "emailAddr").send_keys (email[i])
      driver.find_element(:name, "email2").clear
      driver.find_element(:name, "email2").send_keys (email[i])
      driver.find_element(:name, "password1").clear
      driver.find_element(:name, "password1").send_keys (password)
      driver.find_element(:name, "password2").clear
      driver.find_element(:name, "password2").send_keys (password)
      driver.find_element(:name, "questions").clear
      driver.find_element(:name, "questions").send_keys "que1"
      driver.find_element(:name, "answers").clear
      driver.find_element(:name, "answers").send_keys "ans1"
      driver.find_element(:name, "hints").clear
      driver.find_element(:name, "hints").send_keys "1"
      driver.find_element(:name, "tosAccepted").click
      message = "Please enter reCaptcha."
      title = "Upload confirmation window"
      api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
      api.call(0,message,title,0)
      sleep 2

      driver.find_element(:name, "register").click
      # driver.switch_to.alert
      # a=driver.switch_to.alert
      # window_message=a.text
      # p window_message
      # driver.switch_to.alert.accept
      #
      # sleep 2
      # password=1
      # driver.find_element(:name, "password1").clear
      # driver.find_element(:name, "password1").send_keys (password)
      # driver.find_element(:name, "password2").clear
      # driver.find_element(:name, "password2").send_keys (password)
      # driver.find_element(:name, "register").click
      # a=driver.switch_to.alert
      # window_message=a.text
      # p window_message
      # driver.switch_to.alert.accept
      #
      # sleep 2
      # password='1A'
      # driver.find_element(:name, "password1").clear
      # driver.find_element(:name, "password1").send_keys (password)
      # driver.find_element(:name, "password2").clear
      # driver.find_element(:name, "password2").send_keys (password)
      # driver.find_element(:name, "register").click
      # a=driver.switch_to.alert
      # window_message=a.text
      # p window_message
      # driver.switch_to.alert.accept
      #
      # sleep 2
      # password='1A#'
      # driver.find_element(:name, "password1").clear
      # driver.find_element(:name, "password1").send_keys (password)
      # driver.find_element(:name, "password2").clear
      # driver.find_element(:name, "password2").send_keys (password)
      # driver.find_element(:name, "register").click
      # a=driver.switch_to.alert
      # window_message=a.text
      # p window_message
      # driver.switch_to.alert.accept
      #
      # sleep 2
      # password='1As!#'
      # driver.find_element(:name, "password1").clear
      # driver.find_element(:name, "password1").send_keys (password)
      # driver.find_element(:name, "password2").clear
      # driver.find_element(:name, "password2").send_keys (password)
      # driver.find_element(:name, "register").click

      driver.find_element(:xpath, "//div[@id='layoutLogo']/a/img").click
      i+=1
    end
  end
rescue Exception=> e
  puts e.message
  #puts "Rescue"

end
end