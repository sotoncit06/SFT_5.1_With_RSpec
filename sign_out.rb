module SignOut

  class UserSignOut

    def sign_out(server,driver)
      # driver.find_element(:css, 'b.caret').click
      sleep 4
      driver.find_element(:link, 'Sign out').click
      sleep 2

    end
  end
end