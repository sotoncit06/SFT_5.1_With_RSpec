$LOAD_PATH << '.'

require 'all_require'


puts "Please enter the number of the following servers"
puts "1. dahukv18\n"
i= Integer(gets.chomp)
if i==1
  server="http://dahukv18/bds"
end
sleep 5

def setup(browsers,machine)
  Thread.current[:driver] = Selenium::WebDriver.for :remote, :url => "http://#{machine}:4444/wd/hub", :desired_capabilities => :"#{browsers}"
end
BROWSER = {firefox: 'localhost'}#,chrome: '192.168.10.230',internet_explorer: '192.168.10.174'}
threads=[]

BROWSER.each_pair do |browser, machine|
  threads << Thread.new do
    setup(browser,machine)


    ob=SignIn::UserSignIn.new
    ob.user_signin(server,Thread.current[:driver],"sarja1@nilavodev.com","1As!#")#skaib

    #9999999000000000000000000000000000000000000
    ob=ExpressDelivery::CreateExpressDelivery.new
    ob.express_test(server,Thread.current[:driver],"sarja1@nilavodev.com",'test','no',browser)

    #00000000000000000000000000000000000000000


    #ob=SignOut::UserSignOut.new
    #ob.sign_out(server,Thread.current[:driver])


  end
end
threads.each { |thread| thread.join }
