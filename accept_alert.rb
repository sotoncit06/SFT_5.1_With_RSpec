module AcceptAlert

  class AcceptAlertWindow

    def accept_alert_window(server,driver)

      sleep 2
      driver.switch_to.alert
      driver.switch_to.alert.accept
      sleep 5

    end

  end

end