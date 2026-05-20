*** Settings ***

Resource          ../ResourcePath/Common_Resource_Web.robot
Test Teardown     Close Browser


*** Test Cases ***

TSW_01 : Login success
        [Documentation]       Login success
        ...                   To verify that users can login successfully when input a correct username and password.
        [Tags]                TSW_01         
        Open Website          ${Url}                         ${Browser} 
        Login                 ${Username}                    ${Password}
        Verify Message        ${Message_Login_success}
        Logout
        Verify Message        ${Message_Logout_success}

TSW_02 : Login failed - Password incorrect
        [Documentation]       Login failed - Password incorrect 
        ...                   To verify that users can login unsuccessfully
        ...                   when they input a correct username but wrong password.
        [Tags]                TSW_02  
        Open Website          ${Url}                         ${Browser} 
        Login                 ${Username}                    ${Password_incorrect}
        Verify Message        ${Message_invalid_password}

TSW_03 : Login failed - Username not found
        [Documentation]       Login failed - Username not found 
        ...                   To verify that users can login unsuccessfully
        ...                   when they input a username that did not exist.
        [Tags]                TSW_03 
        Open Website          ${Url}                         ${Browser} 
        Login                 ${Username_incorrect}          ${Password_incorrect}
        Verify Message        ${Message_invalid_username}





