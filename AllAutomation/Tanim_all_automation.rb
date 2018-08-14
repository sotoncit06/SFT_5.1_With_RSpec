$LOAD_PATH << '.'
$LOAD_PATH << 'C:\Users\Sakib\RubymineProjects\General_SFT_5.1'
require 'all_require'

puts "Please enter the number of the following servers"
puts "1. dahukv18\n2. internal\n3. dahuk7"
i= Integer(gets.chomp)
if i==1
  server="http://dahukv18/bds"

elsif i==2
  server="http://internal/bds"
elsif i==3
  server="http://dahukv7/bds"
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
  #domain='qa-server5'

  # create_user(server, Thread.current[:driver],browser)
  # ckeditor_limited_sender_functionality(server, Thread.current[:driver], browser)
  # ckeditor_limited_sender_role(server, Thread.current[:driver], browser)
  applet(server, Thread.current[:driver], browser)
  #antivirus(server, Thread.current[:driver], browser)
  # session(server, Thread.current[:driver], browser)
  #workspace(server, Thread.current[:driver])
  # compliance_operations(server, Thread.current[:driver])
  #workspace_quota(server,Thread.current[:driver],browser)
  # ob=Branding::Branding_Int.new
  # ob.Branding_Interface(server,Thread.current[:driver])
  sorting_printing_view(server,Thread.current[:driver], browser)
  secure_reply_enhancement(server, Thread.current[:driver], browser)
  # user_registration_enhancement(server, Thread.current[:driver], browser)
  # add_viewers(server, Thread.current[:driver], browser)

  end
end
threads.each { |thread| thread.join }





