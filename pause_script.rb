module PauseScript

  class PauseYourScript

  def pause_script_with_popup(message)

    #Test paused to upload using Applet
    title = 'Upload confirmation window'
    api = Win32API.new('user32','MessageBox',['L', 'P', 'P', 'L'],'I')
    api.call(0,message,title,0)
    sleep 2


  end

    end

end