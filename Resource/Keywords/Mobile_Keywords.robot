
*** Keywords ***
Open Minimal Todo Application
    Open Application    ${APPIUM_SERVER}
    ...                 platformName=${PLATFORM_NAME}
    ...                 platformVersion=${PLATFORM_VERSION}
    ...                 deviceName=${DEVICE_NAME}
    ...                 app=${APP_PATH}
    ...                 automationName=UiAutomator2


Select Target Year Dynamic
    [Arguments]        ${TARGET_YEAR}
    
    ${YEAR_BUTTON_ID}=    Set Variable    id=com.avjindersinghsekhon.minimaltodo:id/date_picker_year
    
    AppiumLibrary.Wait Until Element Is Visible    ${YEAR_BUTTON_ID}    timeout=5s
    ${CURRENT_SCREEN_YEAR}=    AppiumLibrary.Get Text    ${YEAR_BUTTON_ID}
    
    Log    [INFO] ปีปัจจุบันบนหน้าจอคือ: ${CURRENT_SCREEN_YEAR} / ปีเป้าหมายคือ: ${TARGET_YEAR}

    IF    '${CURRENT_SCREEN_YEAR}' == '${TARGET_YEAR}'
        Log    [INFO] ปีตรงกันแล้ว ไม่ต้องเปิดหน้าเลือกปี
        RETURN
    END
    
    Click Element    ${YEAR_BUTTON_ID}
    Sleep    1.5s
    
    ${YEAR_XPATH}=    Set Variable    //android.widget.TextView[@text="${TARGET_YEAR}"]
    
    FOR    ${INDEX}    IN RANGE    0    15
        ${FOUND}=    Run Keyword And Return Status    AppiumLibrary.Page Should Contain Element    ${YEAR_XPATH}
        IF    ${FOUND}    BREAK
        
        ${INT_TARGET}=    Evaluate    int('${TARGET_YEAR}')
        ${INT_CURRENT}=   Evaluate    int('${CURRENT_SCREEN_YEAR}')
        
        IF    ${INT_TARGET} < ${INT_CURRENT}
            AppiumLibrary.Swipe    start_x=540    start_y=1100    end_x=540    end_y=1600    duration=600ms
        ELSE
            AppiumLibrary.Swipe    start_x=540    start_y=1600    end_x=540    end_y=1100    duration=600ms
        END
        Sleep    0.5s
    END
    
    AppiumLibrary.Wait Until Page Contains Element    ${YEAR_XPATH}    timeout=5s
    AppiumLibrary.Click Element    ${YEAR_XPATH}
    Sleep    1.5s


Select Target Day On Calendar
    [Arguments]    ${TARGET_DAY}    ${TARGET_MONTH}    ${TARGET_YEAR}

    
    ${MONTH_BTN_ID}=    Set Variable    id=com.avjindersinghsekhon.minimaltodo:id/date_picker_month
    AppiumLibrary.Wait Until Element Is Visible    ${MONTH_BTN_ID}    timeout=5s
    ${CURRENT_MONTH_RAW}=    AppiumLibrary.Get Text    ${MONTH_BTN_ID}
    
    ${CURRENT_MONTH_UPPER}=    Evaluate    '${CURRENT_MONTH_RAW}'.upper()
    ${TARGET_MONTH_UPPER}=     Evaluate    '${TARGET_MONTH}'.upper()
    
    ${MONTH_LIST}=    Create List    JANUARY    FEBRUARY    MARCH    APRIL    MAY    JUNE    JULY    AUGUST    SEPTEMBER    OCTOBER    NOVEMBER    DECEMBER
    ${CURRENT_INDEX}=    Collections.Get Index From List    ${MONTH_LIST}    ${CURRENT_MONTH_UPPER}
    ${TARGET_INDEX}=     Collections.Get Index From List    ${MONTH_LIST}    ${TARGET_MONTH_UPPER}
    
    ${CONVERTED_DAY}=    Evaluate    "{:02d}".format(int('${TARGET_DAY}'))
    ${DAY_XPATH}=    Set Variable    //android.view.View[contains(@content-desc, "${CONVERTED_DAY} ${TARGET_MONTH} ${TARGET_YEAR}")]
    
    FOR    ${INDEX}    IN RANGE    0    12
        ${FOUND}=    Run Keyword And Return Status    AppiumLibrary.Page Should Contain Element    ${DAY_XPATH}
        IF    ${FOUND}    BREAK
        
        IF    ${TARGET_INDEX} < ${CURRENT_INDEX}
            AppiumLibrary.Swipe    start_x=540    start_y=1100    end_x=540    end_y=1550    duration=600ms
        ELSE

            AppiumLibrary.Swipe    start_x=540    start_y=1550    end_x=540    end_y=1100    duration=600ms
        END
        Sleep    0.5s
    END
    
    AppiumLibrary.Wait Until Page Contains Element    ${DAY_XPATH}    timeout=5s
    AppiumLibrary.Click Element    ${DAY_XPATH}
    Sleep    1s

Select Target Time On Clock Fixed
    [Arguments]        ${TARGET_HOUR}    ${TARGET_MINUTE}    ${TARGET_AM_PM}
    
    AppiumLibrary.Wait Until Element Is Visible    ${BTN_TIME_PICKER}    timeout=5s
    AppiumLibrary.Click Element    ${BTN_TIME_PICKER}
    Sleep    1s
    
    ${AM_PM_LABEL_ID}=    Set Variable    id=com.avjindersinghsekhon.minimaltodo:id/ampm_label
    ${AM_PM_HITSPACE_ID}=    Set Variable    id=com.avjindersinghsekhon.minimaltodo:id/ampm_hitspace
    
    AppiumLibrary.Wait Until Element Is Visible    ${AM_PM_LABEL_ID}    timeout=5s
    ${CURRENT_AM_PM}=    AppiumLibrary.Get Text    ${AM_PM_LABEL_ID}
    
    ${TARGET_AM_PM_UPPER}=    Evaluate    '${TARGET_AM_PM}'.upper()
    ${CURRENT_AM_PM_UPPER}=   Evaluate    '${CURRENT_AM_PM}'.upper()
    
    IF    '${CURRENT_AM_PM_UPPER}' != '${TARGET_AM_PM_UPPER}'
        AppiumLibrary.Click Element    ${AM_PM_HITSPACE_ID}
        Sleep    0.5s
    END

    AppiumLibrary.Click Element    id=com.avjindersinghsekhon.minimaltodo:id/hours
    Sleep    0.5s
    
    ${INT_HOUR}=    Evaluate    int('${TARGET_HOUR}')
    IF    ${INT_HOUR} == 1
        ${X}=    Set Variable    665
        ${Y}=    Set Variable    968
    ELSE IF    ${INT_HOUR} == 2
        ${X}=    Set Variable    756
        ${Y}=    Set Variable    1060
    ELSE IF    ${INT_HOUR} == 3
        ${X}=    Set Variable    790
        ${Y}=    Set Variable    1185
    ELSE IF    ${INT_HOUR} == 4
        ${X}=    Set Variable    756
        ${Y}=    Set Variable    1310
    ELSE IF    ${INT_HOUR} == 5
        ${X}=    Set Variable    665
        ${Y}=    Set Variable    1402
    ELSE IF    ${INT_HOUR} == 6
        ${X}=    Set Variable    540
        ${Y}=    Set Variable    1435
    ELSE IF    ${INT_HOUR} == 7
        ${X}=    Set Variable    415
        ${Y}=    Set Variable    1402
    ELSE IF    ${INT_HOUR} == 8
        ${X}=    Set Variable    324
        ${Y}=    Set Variable    1310
    ELSE IF    ${INT_HOUR} == 9
        ${X}=    Set Variable    290
        ${Y}=    Set Variable    1185
    ELSE IF    ${INT_HOUR} == 10
        ${X}=    Set Variable    324
        ${Y}=    Set Variable    1060
    ELSE IF    ${INT_HOUR} == 11
        ${X}=    Set Variable    415
        ${Y}=    Set Variable    968
    ELSE IF    ${INT_HOUR} == 12
        ${X}=    Set Variable    540
        ${Y}=    Set Variable    935
    END
    
    AppiumLibrary.Swipe    start_x=${X}    start_y=${Y}    end_x=${X}    end_y=${Y}    duration=100ms
    Sleep    1s

    ${INT_MINUTE}=    Evaluate    int('${TARGET_MINUTE}')
    IF    ${INT_MINUTE} == 0
        ${MIN_X}=    Set Variable    540
        ${MIN_Y}=    Set Variable    935
    ELSE IF    ${INT_MINUTE} == 15
        ${MIN_X}=    Set Variable    790
        ${MIN_Y}=    Set Variable    1185
    ELSE IF    ${INT_MINUTE} == 30
        ${MIN_X}=    Set Variable    540
        ${MIN_Y}=    Set Variable    1435
    ELSE IF    ${INT_MINUTE} == 45
        ${MIN_X}=    Set Variable    290
        ${MIN_Y}=    Set Variable    1185
    ELSE
        ${MIN_X}=    Set Variable    540
        ${MIN_Y}=    Set Variable    1435
    END
    
    AppiumLibrary.Swipe    start_x=${MIN_X}    start_y=${MIN_Y}    end_x=${MIN_X}    end_y=${MIN_Y}    duration=100ms
    Sleep    1s
    
    AppiumLibrary.Click Element    id=com.avjindersinghsekhon.minimaltodo:id/ok
    Sleep    1s