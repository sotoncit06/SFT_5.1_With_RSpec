require 'all_require'
module Link
  class LinkOpen
    def link_open_in_browser(server,driver,file_link)

      driver.get "#{file_link}"
      driver.manage.window.maximize
      driver.navigate.refresh

    end

  end
end