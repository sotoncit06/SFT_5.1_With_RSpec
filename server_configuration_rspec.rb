def server_config_rspec(obj)
  ob=obj
  describe 'should Sign in as Admin User'  do
    context 'User Admin' do

      it 'should Sign in as Admin User' do
        user_name='admin'
        password='admin'
        admin=SignIn::UserSignIn.new
        admin.user_signin(@server,@driver,user_name,password)
      end

      it 'should configure email settings'do
        mail_server='192.168.10.91'

        ob.server_configuration(@server,@driver)
        ob.email_settings(@server,@driver,mail_server)
      end
      it 'should configure Delivery settings'do
        ob.delivery_settings(@server,@driver)
      end
      it 'should configure Package settings'do
        ob.package_settings(@server,@driver)
      end
      it 'should configure Workspace settings'do
        ob.workspace_settings(@server,@driver)
      end
      it 'should configure Antivirus settings'do
        ob.antivirus_settings(@server,@driver)
      end
      it 'should configure User settings'do
        ob.user_settings(@server,@driver)
      end
      it 'should configure Contact & Group settings'do
        ob.contact_and_group_settings(@server,@driver)
      end
      it 'should configure Username & Password settings'do
        ob.sign_in_and_password(@server,@driver)
      end
      it 'should configure User Interface settings'do
        restricted_email='sakib0@nilavodev.com'
        tos_value=ob.user_registration(@server,@driver,restricted_email)
        tos_value='This is new Terms Of Service'
        ob.user_interface(@server,@driver)
      end
    end
  end
end
