*** Settings ***

Resource   ../resourses/Keywords.robot
Resource   ../resourses/Variables.robot

*** Test Cases ***

create API1.0 bot

    ${checkbox_values}=    Create List    crm    events    coupons    catalog    rms    chat    ec    mail    stores    campaign    elgana    g_events    bot_posts    user_logs    linepoints    sfa_salesforce    sfa_hubspot    lp    stamp_card    ms365    files
    ${my_company_name}   Set Variable   Evolany Co., Ltd.

    [Documentation]    This test creates a BR V2 API1.0 bot under Evolany Co., Ltd. company
    [Tags]   NewAppPopup   API1.0   Regression   Test1   Test2
    [Setup]    Setup Chrome Webdriver and Access URL
               Login   ${credentials}[email]   ${credentials}[password]
    [Teardown]    Close Browser

    Wait Until Element Is Visible and Enabled    ${new_app_button}
    Click Button   ${new_app_button}
    #input bot name
    Wait Until Element Is Visible and Enabled  ${new_bot_name}
    Input Text   ${new_bot_name}    ${my_api10_bot_name}
    #check all bot moduls except ChatGPT
    FOR    ${value}    IN    @{checkbox_values}
        Run Keyword If    '${value}' != 'chatgpt'    Click Element    //input[@value='${value}']
    END
    #select plan option
    Select Radio Button   plan   pro
    #select API1.0 option
    Select Radio Button   apiver   1
    #enter Company name
    Wait Until Element Is Visible and Enabled   ${company_name_input_field}
    Click Element    ${company_name_input_field}
    Sleep    1s
    Input Text    ${company_name_input_field}    ${my_company_name}
    Sleep   1s
    Wait Until Element Is Visible and Enabled   ${company_name_option}
    Click Element    ${company_name_option}
    #save new bot
    Wait Until Element Is Visible and Enabled   ${save_bot_settings}
    Click Button    ${save_bot_settings}
    #Verification
    Wait Until Page Does Not Contain Element    ${loader_screen}   timeout=30s

create API2.0 bot

    ${checkbox_values}=    Create List    crm    events    coupons    catalog    rms    chat    ec    mail    stores    campaign    elgana    g_events    bot_posts    user_logs    linepoints    sfa_salesforce    sfa_hubspot    lp    stamp_card    ms365    files
    ${my_company_name}   Set Variable   Evolany Co., Ltd.

    [Documentation]    This test creates a BR V2 API2.0 bot under Evolany Co., Ltd. company
    [Tags]   NewAppPopup   API2.0   Regression
    [Setup]    Setup Chrome Webdriver and Access URL
               Login   ${credentials}[email]   ${credentials}[password]
    [Teardown]    Close Browser

    Wait Until Element Is Visible and Enabled    ${new_app_button}
    Click Button   ${new_app_button}
    #input bot name
    Wait Until Element Is Visible and Enabled  ${new_bot_name}
    Input Text   ${new_bot_name}    ${my_api20_bot_name}
    #check all bot moduls except ChatGPT
    FOR    ${value}    IN    @{checkbox_values}
        Run Keyword If    '${value}' != 'chatgpt'    Click Element    //input[@value='${value}']
    END
    #select plan option
    Select Radio Button   plan   pro
    #select API1.0 option
    Select Radio Button   apiver   2
    #enter Company name
    Wait Until Element Is Visible and Enabled   ${company_name_input_field}
    Click Element    ${company_name_input_field}
    Input Text    ${company_name_input_field}    ${my_company_name}
    Wait Until Element Is Visible and Enabled   ${company_name_option}
    Click Element    ${company_name_option}
    #save new bot
    Wait Until Element Is Visible and Enabled   ${save_bot_settings}
    Click Button    ${save_bot_settings}
    #Verification
    Wait Until Page Does Not Contain Element    ${loader_screen}   timeout=30s


