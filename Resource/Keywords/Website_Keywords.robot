*** Keywords ***


Open Website 
    [Arguments]     ${Url}    ${Browser}  
    
    ${is_jenkins}=    Get Environment Variable    JENKINS_HOME    default=False
    
    IF    '${is_jenkins}' != 'False'
        Open Browser    ${Url}    headlesschrome    options=add_argument("--no-sandbox"); add_argument("--disable-dev-shm-usage"); add_argument("--window-size=1920,1080")
    ELSE
        Open Browser    ${Url}    ${Browser}
    END

Login 
    [Arguments]     ${Username}    ${Password}
    Input Text        ${login_username}    ${Username}
    Input Password    ${login_password}    ${Password}
    Click Button       ${btn_login}
    
Logout
    Click Element                  ${btn_logout}

Verify Message
    [Arguments]    ${expected_message}
    Wait Until Element Contains        ${Message_alert}     ${expected_message}    timeout=5s
