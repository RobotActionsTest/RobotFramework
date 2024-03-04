*** Settings ***

Resource    Variables.robot
Library    SeleniumLibrary
Library    OperatingSystem
Library    DateTime
Library   driversync.py
Library    Collections
Library    BuiltIn
Library    XML

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
    Clear Element Text   ${locator}
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

Click My Element
    [Arguments]   ${my_element_locator}
    Wait Until Element Is Visible    ${my_element_locator}
    Click Element    ${my_element_locator}

Mouse Over My Element
    [Arguments]   ${my_element_locator}
    Wait Until Element Is Visible    ${my_element_locator}
    Mouse Over    ${my_element_locator}

Add My Chatflow Item
    [Arguments]   ${my_chatflow_locator}
    Click My Element    ${my_chatflow_locator}
    Press Keys    ${my_chatflow_locator}    ENTER

Enter My Chatflow Item Name
    [Arguments]   ${my_element_locator}  ${my_items_name}
    Click My Element    ${my_element_locator}
    Clear Element Text   ${my_element_locator}
    Input Text    ${my_element_locator}    ${my_items_name}
    Press Keys    ${my_element_locator}    ENTER

Go To Chatflow Tab
    Click Element    ${chatflow_tab}
    Wait Until Element Is Visible and Enabled    ${add_new_group}

Select group and chatflow item
    [Arguments]   ${my_group_locator}   ${my_item_locator}
    Click Element    ${my_group_locator}
    Click Element    ${my_item_locator}

Configure Button Name
    [Arguments]   ${my_big_button_locator}   ${my_big_button_name}
    Wait Until Element Is Visible and Enabled    ${my_big_button_locator}
    Clear Element Text    ${my_big_button_locator}
    Input Text    ${my_big_button_locator}    ${my_big_button_name}

Check Element Attribute
    [Arguments]    ${element}    ${attribute_name}    ${expected_value}
    ${actual_value}    Get Element Attribute    ${element}    ${attribute_name}
    Run Keyword If    '${actual_value}' == '${expected_value}'    Return From Keyword    ${TRUE}
    Return From Keyword    ${FALSE}

Select My Content Option
    [Arguments]    ${my_content_options}    ${my_source}
    ${content_source_options} =    Get WebElements    ${my_content_options}
    FOR    ${content_source_option}    IN    @{content_source_options}
        ${option_text} =    Get Text    ${content_source_option}
        Run Keyword If    '${option_text}' == '${my_source}'   Click Element    ${content_source_option}
        Sleep    1s
        Exit For Loop
    END

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

#Booking
Add A New Group
    Mouse Over    ${add_new_group}
    Click Element    ${new_group}
    Wait Until Element Is Visible    ${new_group_name}

Set Group Name And Submit
    [Arguments]    ${group_name}
    Type In And Press Enter    ${new_group_name}    ${group_name}
    Wait Until Element Is Visible    ${booking}

Add A Text Item To A Group
    Mouse Over My Element    ${add_new_item}
    Click My Element    ${item_text}

Enter New Text Item's Name
    [Arguments]    ${item_name}
    Click My Element    ${new_item_name}
    Clear, Type In And Press Enter    ${new_item_name}    ${item_name}

Go To MiniApp Tab
    Click Element    ${miniapp_tab}

Enter MiniApp Name
    [Arguments]    ${miniapp_name}   ${miniapp_title}
    Wait Until Element Is Visible   ${miniapp_title}
    Clear Element Text   ${miniapp_title}
    Input Text    ${miniapp_title}    ${miniapp_name}

Select My MiniApp
    [Arguments]   ${my_miniapp_name}
    Wait Until Element Is Visible    ${miniapp_list}
    @{items}    Get WebElements    ${miniapp_list}
    FOR    ${item}    IN    @{items}
        ${text}    Get Text    ${item}  # Get the text of the <h5> element
        Run Keyword If    '${text}' == '${my_miniapp_name}'    Click Element    ${item}  # Click if text matches
    END

Delete Default MiniApp Section
    Click My Element   ${default_section_locator}
    Sleep    1s
    Click My Element    ${delete_icon}
    Sleep    1s

Input My Component Title
    [Arguments]   ${my_text}
    Wait Until Element Is Visible   ${form_option_title}
    Clear Element Text    ${form_option_title}
    Input Text    ${form_option_title}    ${my_text}

Input My Component Options
    [Arguments]   ${my_options}
    Wait Until Element Is Visible   ${form_option_options}
    Clear Element Text    ${form_option_options}
    ${length}    Get Length    ${my_options}
    FOR   ${index}   IN RANGE    ${length}
        ${option}    Set Variable    ${my_options}[${index}]
        Press Keys    ${form_option_options}    ${option}   ENTER
    END

Input My Component Ukey
    [Arguments]   ${my_ukey}
    Wait Until Element Is Visible   ${form_option_ukey}
    Clear Element Text    ${form_option_ukey}
    Input Text    ${form_option_ukey}    ${my_ukey}

Add MiniApp Component
    [Arguments]   ${my_component}
    Mouse Over My Element    ${add_new_miniapp_component}
    Mouse Over My Element   ${miniapp_component_list}
    Click My Element    ${my_component}

Open Transition Settings
    Wait Until Element Is Visible    ${outer_buttons_settings}
    Click Element    ${outer_buttons_settings}
    Sleep   1s
    Wait Until Element Is Visible    ${inner_buttons_settings}
    Click Button    ${inner_buttons_settings}
    Sleep   1s

Select Transition Option
    [Arguments]   ${my_transition_option}
    Wait Until Element Is Visible   ${transiotion_input}
    Click My Element    ${transiotion_input}
    Sleep   1s
    Press Keys    ${transiotion_input}    ${my_transition_option}   ENTER
    Sleep   1s

Save Transition Settings
    Wait Until Element Is Visible    ${save_settings_button}
    Click Element    ${save_settings_button}
    Sleep   1s
    Wait Until Element Is Visible    ${save_transition_icon}
    Click Element    ${save_transition_icon}
    Sleep   1s

Open Calendar Settings
    Wait Until Element Is Visible    ${calendar_settings}
    Click Element    ${calendar_settings}

Set Calendar Ukey
    [Arguments]   ${my_calendar_ukey}
    Wait Until Element Is Visible   ${calendar_ukey}
    Clear Element Text    ${calendar_ukey}
    Input Text    ${calendar_ukey}    ${my_calendar_ukey}

Set Calendar Transition
    Select Radio Button    trans    chat
    Wait Until Element Is Visible    ${calendar_chat_transition_input}
    Clear Element Text    ${calendar_chat_transition_input}
    Press Keys   ${calendar_chat_transition_input}   2:booking_confirm   ENTER

Enter Chatflow Item Text
    [Arguments]   ${my_input}   ${my_text}
    Wait Until Element Is Visible    ${my_input}
    Clear Element Text    ${my_input}
    Press Keys   ${my_input}   ${my_text}   ENTER
    Sleep   1s

Set Transition To MiniApp
    [Arguments]   ${my_view}
    Click My Element    ${miniapp_transition_option}
    Wait Until Element Is Visible    ${transition_option_input}
    Clear Element Text    ${transition_option_input}
    Press Keys   ${transition_option_input}   ${my_view}   ENTER

Save Button Settings
    Wait Until Element Is Visible   ${save_button_settings}
    Click Element    ${save_button_settings}
    












