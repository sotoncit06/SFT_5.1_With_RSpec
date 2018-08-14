require 'all_require'

def workspace(server, driver, browser)
    driver.get "#{server}"

    # ob=Workspace::WorkspaceConfiguration.new
    # ob.enable_workspace(server, driver)

##############>>>>>>>>>>>>Manager>>>>>>>>>>>>>>>>>>

    ob=SignIn::UserSignIn.new
    ob.user_signin(server,driver,'tanim1@nilavodev.com', '1234')

    # workspace_name='WS1'
    # manager='tanim2@nilavodev.com'
    # collaborator='tanim3@nilavodev.com'
    # viewer='tanim4@nilavodev.com'
    # ob=Workspace::WorkspaceConfiguration.new
    # ob.workspace_creation_applet(server, driver,workspace_name,manager, collaborator, viewer)

    workspace_name='WS1'
    ob=Workspace::WorkspaceConfiguration.new
    ob.go_to_workspace(server, driver, workspace_name)

    # comment='Comment from manager'
    # ob.add_comment(server, driver, comment)
    # ob.workspace_lock(server, driver)
    # ob.workspace_unlock(server, driver)
    #
    # folder_name='Test'
    # ob=Workspace::WorkspaceConfiguration.new
    # ob.create_new_folder(server, driver,folder_name)
    #
    # ob=Workspace::WorkspaceConfiguration.new
    # ob.folder_open_upload_file(server, driver,folder_name)
    # ob.click_on_up_button(server, driver)

    folder_name='Test'
    # ob=Workspace::WorkspaceConfiguration.new
    # ob.file_folder_download(server, driver,folder_name)

    ob=Workspace::WorkspaceConfiguration.new
    ob.file_folder_create_zip_file(server, driver,folder_name)

    renamed_name='Renamed_folder'
    ob=Workspace::WorkspaceConfiguration.new
    ob.file_folder_rename(server, driver,folder_name,renamed_name)

    folder_name=renamed_name
    description='Description'
    ob=Workspace::WorkspaceConfiguration.new
    ob.file_folder_edit_description(server, driver,folder_name, description)

    ob=Workspace::WorkspaceConfiguration.new
    ob.file_folder_delete(server, driver,folder_name)

    file_name='Test.zip'
    ob=Workspace::WorkspaceConfiguration.new
    ob.file_extract(server, driver,file_name)
    ob=Workspace::WorkspaceConfiguration.new
    ob.file_extract_folder(server, driver,file_name)

    file_name='manager.txt'
    ob=Workspace::WorkspaceConfiguration.new
    ob.file_folder_download(server, driver,file_name)
    ob.file_folder_create_zip_file(server, driver,file_name)
    renamed_name='Renamed.txt'
    ob.file_folder_rename(server, driver,file_name, renamed_name)
    file_name=renamed_name
    description='Description'
    ob.file_folder_edit_description(server, driver,file_name, description)
    ob.file_folder_delete(server, driver,file_name)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server, driver)

##############>>>>>>>>>>>>Manager>>>>>>>>>>>>>>>>>>


##############>>>>>>>>>>>>Collaborator>>>>>>>>>>>>>>>>>>

    ob=SignIn::UserSignIn.new
    ob.user_signin(server,driver,'tanim3@nilavodev.com', '1234')

    ob=UserPreference::SetPreferences.new
    ob.applet_settings(server, driver)

    workspace_name='WS1'
    ob=Workspace::WorkspaceConfiguration.new
    ob.go_to_workspace(server, driver, workspace_name)

    comment='Comment from collaborator'
    ob.add_comment(server, driver, comment)

    folder_name='Test1'
    ob=Workspace::WorkspaceConfiguration.new
    ob.create_new_folder(server, driver,folder_name)

    ob=Workspace::WorkspaceConfiguration.new
    ob.folder_open_upload_file(server, driver,folder_name)
    ob.click_on_up_button(server, driver)

    ob=Workspace::WorkspaceConfiguration.new
    ob.file_folder_download(server, driver,folder_name)

    ob=Workspace::WorkspaceConfiguration.new
    ob.file_folder_create_zip_file(server, driver,folder_name)

    renamed_name='Renamed_folder'
    ob=Workspace::WorkspaceConfiguration.new
    ob.file_folder_rename(server, driver,folder_name,renamed_name)

    folder_name=renamed_name
    description='Description'
    ob=Workspace::WorkspaceConfiguration.new
    ob.file_folder_edit_description(server, driver,folder_name, description)

    folder_name='Renamed_folder'
    ob=Workspace::WorkspaceConfiguration.new
    ob.file_folder_delete(server, driver,folder_name)

    file_name='Test1.zip'
    ob=Workspace::WorkspaceConfiguration.new
    ob.file_extract(server, driver,file_name)
    ob=Workspace::WorkspaceConfiguration.new
    ob.file_extract_folder(server, driver,file_name)

    file_name='collaborator.txt'
    ob=Workspace::WorkspaceConfiguration.new
    ob.file_folder_download(server, driver,file_name)
    ob.file_folder_create_zip_file(server, driver,file_name)
    renamed_name='Renamed.txt'
    ob.file_folder_rename(server, driver,file_name, renamed_name)
    file_name=renamed_name
    description='Description'
    ob.file_folder_edit_description(server, driver,file_name, description)
    ob.file_folder_delete(server, driver,file_name)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server, driver)

##############>>>>>>>>>>>>Collaborator>>>>>>>>>>>>>>>>>>

##############>>>>>>>>>>>>Viewer>>>>>>>>>>>>>>>>>>
    ob=SignIn::UserSignIn.new
    ob.user_signin(server,driver,'tanim4@nilavodev.com', '1234')

    ob=UserPreference::SetPreferences.new
    ob.applet_settings(server, driver)

    workspace_name='WS1'
    ob=Workspace::WorkspaceConfiguration.new
    ob.go_to_workspace(server, driver, workspace_name)
    folder_name='Test'
    ob.file_folder_download(server, driver,folder_name)
    file_name='viewer.txt'
    ob.file_folder_download(server, driver,file_name)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server, driver)


##############>>>>>>>>>>>>Viewer>>>>>>>>>>>>>>>>>>
end
