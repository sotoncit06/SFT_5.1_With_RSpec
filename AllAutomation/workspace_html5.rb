require 'all_require'

def workspace_quota(server, driver, browser)


    # ob=Workspace::WorkspaceConfiguration.new
    # ob.enable_workspace(server, driver)
    # ob.set_quota(server, driver)


    ob=SignIn::UserSignIn.new
    ob.user_signin(server,driver,'tanim1@nilavodev.com', '1234')


    workspace_name='WS2'
    manager='tanim2@nilavodev.com'
    collaborator='tanim3@nilavodev.com'
    viewer='tanim3@nilavodev.com'
    #filename='C:\test.txt'
    filename='C:\Users\Sakib\Desktop\Quota\5mb.txt'
    ob=Workspace::WorkspaceConfiguration.new
    ob.workspace_creation_html5(server, driver,workspace_name,manager, collaborator, viewer, filename)

    ob=UserProfile::EditProfile.new
    ob.view_profile(server, driver)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server, driver)


    ob=SignIn::UserSignIn.new
    ob.user_signin(server,driver,'tanim2@nilavodev.com', '1234')

    ob=UserPreference::SetPreferences.new
    ob.applet_set_no(server, driver)

    workspace_name='WS2'
    ob=Workspace::WorkspaceConfiguration.new
    ob.go_to_workspace(server, driver, workspace_name)

    folder_name='Html5'
    ob.create_new_folder(server, driver, folder_name)
    ob.folder_open(server, driver, folder_name)
    filename='C:\Users\Sakib\Desktop\Quota\4MB.txt'
    #browser_name='firefox'
    ob.file_upload_html5(server, driver, filename, browser)

    ob=UserProfile::EditProfile.new
    ob.view_profile(server, driver)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server, driver)

    ob=SignIn::UserSignIn.new
    ob.user_signin(server,driver,'tanim3@nilavodev.com', '1234')

    ob=UserPreference::SetPreferences.new
    ob.applet_set_no(server, driver)

    workspace_name='WS2'
    ob=Workspace::WorkspaceConfiguration.new
    ob.go_to_workspace(server, driver, workspace_name)

    filename='C:\Users\Sakib\Desktop\Quota\1MB.txt'
    #browser_name='firefox'
    ob.file_upload_html5(server, driver, filename, browser)

    ob=UserProfile::EditProfile.new
    ob.view_profile(server, driver)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server, driver)

    ob=SignIn::UserSignIn.new
    ob.user_signin(server,driver,'tanim1@nilavodev.com', '1234')

    workspace_name='WS2'
    ob=Workspace::WorkspaceConfiguration.new
    ob.go_to_workspace(server, driver, workspace_name)

    filename='C:\Users\Sakib\Desktop\Quota\1MB - Copy'
    #browser_name='firefox'
    ob.file_upload_html5(server, driver, filename, browser)

    folder_name='Html5'
    ob.file_folder_create_zip_file(server, driver, folder_name)
    sleep 3
    ob.click_on_ok(server, driver)
    sleep 3
    ob.self_remove(server, driver)
    sleep 3
    workspace_name='WS3'
    manager='tanim2@nilavodev.com'
    collaborator='tanim3@nilavodev.com'
    viewer='tanim4@nilavodev.com'
    #filename='C:\test.txt'
    filename='C:\Users\Sakib\Desktop\Quota\5mb.txt'
    ob=Workspace::WorkspaceConfiguration.new
    ob.workspace_creation_html5(server, driver,workspace_name,manager, collaborator, viewer, filename)
    sleep 5
    ob=SignOut::UserSignOut.new
    ob.sign_out(server, driver)


end
