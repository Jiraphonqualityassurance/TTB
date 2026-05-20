*** Settings ***
Resource          ../ResourcePath/Common_Resource_Api.robot



*** Test Cases ***

TSA_01 Get user profile success
        [Documentation]       Get user profile success
        ...                   success To verify get user profile api will return correct data when trying to get profile of existing user.
        [Tags]                TSA_01    success
        ${headers}=    Create Dictionary    x-api-key=${API_KEY}    Accept=application/json
        ${response}=    GET    ${Api_base_url}/api/users/${Api_user_id}    headers=${headers}    expected_status=200
        ${response_json}=    Set Variable    ${response.json()}
        ${actual_data}=    Get From Dictionary    ${response_json}    data
        Dictionaries Should Be Equal    ${actual_data}    ${TSA01_Api}

TSA_02 Get user profile but user not found
        [Documentation]       Get user profile but user not found
        ...                   To verify get user profile api will return 404 not found when trying to get exist profile of not existing user.
        [Tags]                TSA_02    fail
        ${headers}=    Create Dictionary    x-api-key=${API_KEY}    Accept=application/json
        ${response}=    GET    ${Api_base_url}/api/users/${Api_user_not_found}    headers=${headers}    expected_status=404
        ${response_json}=    Set Variable    ${response.json()}
        ${data_empty}=    Create Dictionary
        Dictionaries Should Be Equal    ${response_json}    ${data_empty}


