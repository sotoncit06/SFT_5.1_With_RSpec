  def launchBrowser()
    #@driver = Selenium::WebDriver.for :firefox
    @driver=Selenium::WebDriver.for :remote, :url => "http://localhost:4444/wd/hub", :desired_capabilities => :firefox
    @driver.manage.window.maximize

    #@server = "http://rupshav13/bds/"
    @server = "http://192.168.10.212:8080/bds/"
    @browser = "firefox"

    @driver.get "#{@server}"

    return
  end

  def launchBrowserWithThread()

    server="http://192.168.10.56/bds"
    server="http://192.168.11.56:8080/bds/Login.do"
  #server="http://192.168.10.188/sync"

    def setup(browsers, machine)
      Thread.current[:driver] = Selenium::WebDriver.for :remote, :url => "http://#{machine}:4444/wd/hub", :desired_capabilities => :"#{browsers}"
    end

    @BROWSER = {chrome: 'localhost'} #,chrome: '192.168.10.230',internet_explorer: '192.168.10.174'}

  end
