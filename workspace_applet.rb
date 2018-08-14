require 'all_require'

def workspace()
    password= ConstantVariables::PASSWORD
    describe "Workspace Starts" do
        context "User Admin" do
            it "Should Sign in as admin" do
                username='admin'
                pass='admin'
                admin=SignIn::UserSignIn.new
                admin.user_signin(@server,@driver,username,pass)
            end

            it "Should Edit the role of tanim2 And Sign Out" do
                role=1
                ob=EditUser::UserEdit.new
                ob.user_role_edit(@server, @driver, 'tanim2@nilavodev.com',role)

                ob=SignOut::UserSignOut.new
                ob.sign_out(@server, @driver)
            end

            it "Should sign in as Tanim1 and create Workspace" do
                ob=SignIn::UserSignIn.new
                ob.user_signin(@server,@driver,'tanim1@nilavodev.com', password)

                workspace_name='WS1'
                manager='tanim2@nilavodev.com'
                collaborator='tanim3@nilavodev.com'
                viewer='tanim4@nilavodev.com'
                ob=Workspace::WorkspaceConfiguration.new
                ob.workspace_creation_applet(@server, @driver,workspace_name,manager, collaborator, viewer)
            end

            it "Should perform the Manager operations" do
                workspace_name='WS1'
                ob=Workspace::WorkspaceConfiguration.new
                ob.go_to_workspace(@server, @driver, workspace_name)


                comment='Comment from manager'
                ob.add_comment(@server, @driver, comment)
                sleep 2
                ob.workspace_lock(@server, @driver)
                sleep 2
                ob.workspace_unlock(@server, @driver)
                sleep 2

                folder_name='Test'
                ob=Workspace::WorkspaceConfiguration.new
                ob.create_new_folder(@server, @driver,folder_name)

                ob=Workspace::WorkspaceConfiguration.new
                ob.folder_open_upload_file(@server, @driver,folder_name)
                ob.click_on_up_button(@server, @driver)

                sleep 3
                folder_name='Test'
                ob=Workspace::WorkspaceConfiguration.new
                ob.file_folder_download(@server, @driver,folder_name)

                ob=Workspace::WorkspaceConfiguration.new
                ob.file_folder_create_zip_file(@server, @driver,folder_name)

                renamed_name='Renamed_folder'
                ob=Workspace::WorkspaceConfiguration.new
                ob.file_folder_rename(@server, @driver,folder_name,renamed_name)

                folder_name=renamed_name
                description='Description'
                ob=Workspace::WorkspaceConfiguration.new
                ob.file_folder_edit_description(@server, @driver,folder_name, description)

                sleep 2
                folder_name='Renamed_folder'
                ob=Workspace::WorkspaceConfiguration.new
                ob.file_folder_delete(@server, @driver,folder_name)

                file_name='Test.zip'
                ob=Workspace::WorkspaceConfiguration.new
                ob.file_extract(@server, @driver,file_name)
                ob=Workspace::WorkspaceConfiguration.new
                ob.file_extract_folder(@server, @driver,file_name)

                file_name='manager.txt'
                ob=Workspace::WorkspaceConfiguration.new
                ob.file_folder_download(@server, @driver,file_name)
                ob.file_folder_create_zip_file(@server, @driver,file_name)
                renamed_name='Renamed.txt'
                ob.file_folder_rename(@server, @driver,file_name, renamed_name)
                file_name=renamed_name
                description='Description'
                ob.file_folder_edit_description(@server, @driver,file_name, description)
                ob.file_folder_delete(@server, @driver,file_name)

                ob=SignOut::UserSignOut.new
                ob.sign_out(@server, @driver)
            end
            it "Should Sign in as Collaborator and perform Collaborator's operations" do
                ob=SignIn::UserSignIn.new
                ob.user_signin(@server,@driver,'tanim3@nilavodev.com', password)

                ob=UserPreference::SetPreferences.new
                ob.applet_settings(@server, @driver)

                workspace_name='WS1'
                ob=Workspace::WorkspaceConfiguration.new
                ob.go_to_workspace(@server, @driver, workspace_name)

                comment='Comment from collaborator'
                ob.add_comment(@server, @driver, comment)

                folder_name='Test1'
                ob=Workspace::WorkspaceConfiguration.new
                ob.create_new_folder(@server, @driver,folder_name)

                ob=Workspace::WorkspaceConfiguration.new
                ob.folder_open_upload_file(@server, @driver,folder_name)
                ob.click_on_up_button(@server, @driver)

                folder_name='Test1'
                ob=Workspace::WorkspaceConfiguration.new
                ob.file_folder_download(@server, @driver,folder_name)

                ob=Workspace::WorkspaceConfiguration.new
                ob.file_folder_create_zip_file(@server, @driver,folder_name)

                renamed_name='Renamed_folder'
                ob=Workspace::WorkspaceConfiguration.new
                ob.file_folder_rename(@server, @driver,folder_name,renamed_name)

                folder_name=renamed_name
                description='Description'
                ob=Workspace::WorkspaceConfiguration.new
                ob.file_folder_edit_description(@server, @driver,folder_name, description)


                sleep 2
                folder_name='Renamed_folder'
                ob=Workspace::WorkspaceConfiguration.new
                ob.file_folder_delete_collaborator(@server, @driver,folder_name)

                file_name='Test1.zip'
                ob=Workspace::WorkspaceConfiguration.new
                ob.file_extract(@server, @driver,file_name)
                ob=Workspace::WorkspaceConfiguration.new
                ob.file_extract_folder(@server, @driver,file_name)


                sleep 3
                file_name='collaborator.txt'
                ob=Workspace::WorkspaceConfiguration.new
                ob.file_folder_download(@server, @driver,file_name)
                sleep 3
                ob.file_folder_create_zip_file(@server, @driver,file_name)
                renamed_name='Renamed.txt'
                sleep 3
                ob.file_folder_rename(@server, @driver,file_name, renamed_name)


                sleep 3
                file_name='Renamed.txt'
                description='Description'
                ob.file_folder_edit_description(@server, @driver,file_name, description)
                sleep 3
                ob.file_folder_delete_collaborator(@server, @driver,file_name)

                ob=SignOut::UserSignOut.new
                ob.sign_out(@server, @driver)

            end

            it "Should sign in as Viewer and perform viewer's operations" do
                ob=SignIn::UserSignIn.new
                ob.user_signin(@server,@driver,'tanim4@nilavodev.com', password)

                ob=UserPreference::SetPreferences.new
                ob.applet_settings(@server, @driver)

                workspace_name='WS1'
                ob=Workspace::WorkspaceConfiguration.new
                ob.go_to_workspace(@server, @driver, workspace_name)
                folder_name='Test'
                ob.file_folder_download(@server, @driver,folder_name)
                file_name='viewer.txt'
                ob.file_folder_download(@server, @driver,file_name)

                ob=SignOut::UserSignOut.new
                ob.sign_out(@server, @driver)
            end
        end
    end
end
