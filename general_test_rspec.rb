$LOAD_PATH << '.'

require 'all_require'
require 'rspec/core/project_initializer/spec/spec_helper'



describe 'General Test For SFT 5.0' do

  password= ConstantVariables::PASSWORD
  small_file=ConstantVariables::SMALL_FILE
  large_file=ConstantVariables::LARGE_FILE


    before(:all) do

      ob = DatabaseConnection.new
      ob.databaseConnection         #Creates the database connection

      #ob = DatabaseTableOperation.new
      #ob.table_create                 # Create table 'assertions' table into the database

      #assert_value = Assertion.new
      #assert_value.insertAssertionValueIntoDatabaseFromFile('assert_value.csv') #Insert Assertion Values in to database from test.csv file


      launchBrowser() # Create the browser instance


    end

    after(:all) do
      ob = DatabaseConnection.new
      ob.databaseConnectionClose
    end

#Sakib Starts

  xdescribe 'Server Configuration' do
    ob=ServerConfiguration::ServerSetUp.new
    server_config_rspec(ob)
  end

  xdescribe 'GAL list integration Test' do
  gal_list_integration
  end

  xdescribe 'AD connector Functionality' do
  ad_connector_fuctionality
  end

  xdescribe 'Open LDAP integration' do
    domain='qa-server2'
    browser='firefox'
    inbox='on'
    open_ldap(domain,browser,inbox)
  end

  xdescribe 'SunOne LDAP integration' do
    domain='qa-server3'
    browser='firefox'
    inbox='on'
    sun_one_ldap(domain,browser,inbox)
  end

  xdescribe 'Support for Legal Hold' do


  end


#Sakib Ends




#Sarja Starts


    xdescribe 'Admin Approval Tests'do

      admin_approval(@server,@driver,@browser)

    end

    xdescribe 'Account Check Tests' do

      account_check(@server,@driver,@browser)

    end

    xdescribe 'User Setting Tests' do

      user_settings(@server,@driver,@browser)

    end

    describe 'Delivery Tests' do

      delivery_app(@server,@driver,@browser)

    end

    xdescribe 'Collaboration Tests' do

      collaboration(@server,@driver,@browser)

    end


#Sarja Ends



#Tanim Starts
  xdescribe "Limited sender Functionality" do
    browser='firefox'
    limited_sender_functionality(browser)
  end

  xdescribe "Session Testing" do
    browser='firefox'
    session(browser)
  end

  xdescribe "Compliance Testing" do
    compliance_operations
  end

  xdescribe "Antivirus Testing" do
    browser='firefox'
    antivirus_functionality(browser)
  end

  xdescribe "Workspace Testing" do
    workspace
  end
#Tanim Ends

end











