
require "mail"

module Email

  class CheckMail
    def sft_email(username, passwd, ip)

      begin
        Mail.defaults do
          puts "#{username}"
          retriever_method :pop3, :address => "192.168.10.91",
                           :port => 110,
                           :user_name => "#{username}",
                           :password => "#{passwd}",
                           :enable_ssl => false
          file= Array.new

          mail = Mail.last
          #file=mail.body.decoded.force_encoding("ISO-8859-1").encode("UTF-8")
          file = mail.html_part.decoded
          #file = mail.body.message.decoded
          File.open("email.txt", "w") { |the_file| the_file.puts("#{file}") }

          arr = Array.new
          path = Array.new
          test = Array.new
          line_num=0
          j=0

          File.open("email.txt").each do |line|
            arr<<line
            line_num += 1

            flag = false
            line_num.times do |i|

              if flag == true
                break
              end

              if arr[i] =~ /http:\/\/#{ip}\/bds\//
              then
                arr[i]
                #arr[i]=arr[i].to_s
                arr[i]=arr[i].gsub(/"/,"")
                #path[0]=arr[i].slice(arr[i].index('p')..(arr[i].index(arr[arr[i].length-4])))
                path[0]=arr[i].slice(arr[i].index('http')..arr[i].index(arr[i].last))
                path[0]=path[0].gsub("\s", "")
                path[0]=path[0].gsub("\n", '')
                path[0]=path[0].gsub("\s", "")
                #path[0]=path[0].gsub("Link:","")
               # puts path[0]

                flag = true
                break

              end

            end

          end




          server = path[0]



          File.open("temp.txt", "w") { |the_file| the_file.puts("#{path[0]}") }

          File.open("temp.txt").each do |line|
            test<<line
          end
          return "#{server}"
        end

      rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        puts e.message
        #puts "Rescue"
      end
    end

    def sft_email_subject(username, passwd)

      begin
        Mail.defaults do
          puts "#{username}"
          retriever_method :pop3, :address => "192.168.10.91",
                           :port => 110,
                           :user_name => "#{username}",
                           :password => "#{passwd}",
                           :enable_ssl => false
          file= Array.new
          mail = Mail.last
          subject = mail.subject
          #puts subject

          return subject

        end

      end




      rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        puts e.message
        #puts "Rescue"
      end

  end




  class EmailAccess<CheckMail

    def get_link(server, driver, username, password, ip)

      begin
        ob=Email::CheckMail.new
        link= ob.sft_email("#{username}", "#{password}", ip)
        puts ("#{link}")
        driver.get "#{link}"
        driver.manage.window.maximize
        driver.navigate.refresh
        puts ("#{link}")
        sleep(5)

      rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        puts e.message
        #puts "Rescue"
      end

    end


    def get_email_subject(server,driver,username,password)

      begin
        ob=Email::CheckMail.new
        subject= ob.sft_email_subject("#{username}", "#{password}")
        return subject
      rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        puts e.message
        #puts "Rescue"
      end


    end

  end




end