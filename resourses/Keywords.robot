*** Settings ***

Resource    Variables.robot
Library    SeleniumLibrary
Library    OperatingSystem
Library    DateTime
Library   driversync.py

*** Keywords ***

Setup Chrome Webdriver and Access URL
    ${chromedriver_path}=   driversync.Get Chromedriver Path
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --disable-notifications
    Call Method    ${options}    add_argument    --disable-infobars
    Call Method    ${options}    add_argument    --disable-extensions
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --start-maximized
    Open Browser    https://pre.bonp.me//member    browser=chrome    options=${options}   executable_path=${chromedriver_path}
    Set Selenium Implicit Wait    15s


Setup Firefox Webdriver and Access URL
    ${geckodriver_path}=   driversync.Get Geckodriver Path
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys
    Call Method    ${options}    add_argument    --disable-notifications
    Call Method    ${options}    add_argument    --disable-infobars
    Call Method    ${options}    add_argument    --disable-extensions
    Call Method    ${options}    add_argument    --start-maximized
    Open Browser    https://pre.bonp.me//member    browser=firefox    options=${options}   executable_path=${geckodriver_path}
    Set Selenium Implicit Wait    15s


Login
    [Arguments]    ${username}    ${password}
    Go To    ${environment}
    Wait Until Element Is Visible and Enabled    ${email_input}
    Input Text    ${email_input}    ${username}
    Wait Until Element Is Visible and Enabled    ${pass_input}
    Input Text    ${pass_input}    ${password}
    Wait Until Element Is Visible and Enabled    ${submit_button}
    Click Button    ${submit_button}


Open Specified Bot
    [Arguments]    ${table_locator}    ${target_text}
    Wait Until Element Is Visible and Enabled   ${table_locator}
    ${table_elements}    Get WebElements    ${table_locator}//td
    FOR    ${cell_element}    IN    @{table_elements}
        ${cell_text}    Get Text    ${cell_element}
        Run Keyword If    '${target_text}' in '${cell_text}'    Click Element    ${cell_element}
        Exit For Loop If    '${target_text}' in '${cell_text}'   # Exit the loop if the text is found
    END
    Wait Until Page Does Not Contain Element    ${loader_screen}   timeout=30s


Open Bot 1
    [Arguments]   ${my_bot_name}   ${my_locator}
    Wait Until Element Is Visible and Enabled   ${my_locator}
    ${elements}    Get WebElements    ${my_locator}
    FOR    ${element}    IN    @{elements}
        ${text}    Get Text    ${element}
        Run Keyword If    '${my_bot_name}' in '${text}'    Click Element    ${element}
    END
    Wait Until Page Does Not Contain Element    ${loader_screen}   timeout=30s


Click Element with Specified Text
    [Arguments]   ${my_elements_locator}   ${target_text}
    ${elements}    Get WebElements    ${my_elements_locator}
    FOR    ${element}    IN    @{elements}
        ${text}    Get Text    ${element}
        Run Keyword If    '${target_text}' in '${text}'    Click Element    ${element}
    END


Wait Until Element Is Visible and Enabled
    [Arguments]    ${locator}    ${timeout}=40s
    Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    Wait Until Element Is Enabled    ${locator}    timeout=${timeout}


Select Option With Specified Text
    [Arguments]    ${table_xpath}    ${expected_text}    ${timeout}=30s
    ${cell_list} =    Get WebElements    ${table_xpath}
    FOR    ${cell}    IN    @{cell_list}
        ${cell_text} =    Get Text    ${cell}
        Run Keyword If    '${expected_text}' in '${cell_text}'    Click Element    ${cell}
        Exit For Loop
        Wait Until Page Contains    ${expected_text}    ${timeout}=30s
        Log    Clicked cell with text '${expected_text}'
    END


Type In And Press Enter
    [Arguments]   ${locator}   ${text}
    Input Text    ${locator}    ${text}
    Press Keys    ${locator}    ENTER


Clear, Type In And Press Enter
    [Arguments]   ${locator}   ${text}
    ${attribute_value}=    Get Element Attribute   ${new_item_name}    data-value
    ${text_length}=    Get Length    ${attribute_value}
    FOR    ${i}    IN RANGE    ${text_length}
        Press Keys    ${new_item_name}    BACKSPACE
    END
    Input Text    ${new_item_name}    ${text}
    Press Keys    ${new_item_name}    ENTER

Go To Chatflow Tab
    Click Element    ${chatflow_tab}
    Wait Until Element Is Visible and Enabled    ${add_new_group}

Select group and chatflow item
    [Arguments]   ${my_group_locator}   ${my_item_locator}
    Click Element    ${my_group_locator}
    Click Element    ${my_item_locator}

Add Quick Reaction Button
    [Arguments]   ${button_name}
    Wait Until Element Is Visible and Enabled    ${my_new_rn_button}
    Click Element    ${my_new_rn_button}
    #Wait Until Keyword Succeeds    3x    2s    Click Element    ${my_new_rn_button}
    Wait Until Element Is Visible    ${button_name_input_field}
    Clear Element Text    ${button_name_input_field}
    Input Text    ${button_name_input_field}    ${button_name}
    Select Radio Button    trans_type    manual
    Click Element    ${button_next_action}
    Type In And Press Enter    ${button_next_action}   3:textitem3
    Wait Until Element Is Visible    {advanced_settings_popup}
    Click Element    {advanced_settings_popup}
    Wait Until Element Is Visible    {user_key_input_field}
    Clear Element Text    {user_key_input_field}
    Input Text    {user_key_input_field}    choice
    Click Button    ${save_button_settings}