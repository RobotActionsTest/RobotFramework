*** Settings ***

Resource   ../resourses/Keywords.robot
Resource   ../resourses/Variables.robot

*** Test Cases ***

Creating a New Chat Group

    ${my_group_name}   Set Variable   group1

    [Documentation]    This test adds group1 to a BR V2 API1.0 bot
    [Tags]   AppTab   API1.0   Regression   Test1
    [Setup]    Setup Chrome Webdriver and Access URL
               Login   ${credentials}[email]   ${credentials}[password]
               Open Specified Bot   ${bot_names_list}   ${my_api10_bot_name}
    [Teardown]    Close Browser

    # Navigate to the Chatflow tab
    Go To Chatflow Tab

    # Add a new group
    Mouse Over    ${add_new_group}
    Wait Until Element Is Visible and Enabled    ${new_group}
    Click Element    ${new_group}
    Wait Until Element Is Visible and Enabled    ${new_group_name}

    # Set the name for the new group and press Enter
    Type In And Press Enter    ${new_group_name}    ${my_group_name}
    Wait Until Element Is Visible and Enabled    ${group1}

Creating text items (actions)

    ${my_item_name}    Create List    textitem1    textitem2    textitem3    textitem4

    [Documentation]    This test adds textitem1, textitem2, textitem3, textitem4 text actions to group1
    [Tags]    AppTab    API1.0    Regression    Test1
    [Setup]    Setup Chrome Webdriver and Access URL
               Login    ${credentials}[email]    ${credentials}[password]
               Open Specified Bot    ${bot_names_list}    ${my_api10_bot_name}
    [Teardown]    Close Browser

    # Navigate to the Chatflow tab
    Go To Chatflow Tab

    FOR    ${index}    IN RANGE    4
       # Open group1
       Click Element    ${group1}
       Wait Until Element Is Visible and Enabled    ${add_new_item}
       # Add new items: textitem1 - textitem4
       Mouse Over    ${add_new_item}
       Wait Until Element Is Visible and Enabled    ${item_text}
       Click Element    ${item_text}
       Wait Until Element Is Visible and Enabled    ${new_item_name}
       Click Element    ${new_item_name}
       Clear, Type In And Press Enter    ${new_item_name}    ${my_item_name}[${index}]
    END

Entering text in the text field

    ${my_item_text}    Create List    text1    text2    text3    text4
    ${my_item_textarea_locator}    Create List    (//textarea[@class='msg with-emoticon'])[1]   (//textarea[@class='msg with-emoticon'])[2]   (//textarea[@class='msg with-emoticon'])[3]   (//textarea[@class='msg with-emoticon'])[4]

    [Documentation]    This test enters "text1"-"text4" in the text fields of the created text items
    [Tags]    AppTab    API1.0    Regression    Test1
    [Setup]    Setup Chrome Webdriver and Access URL
               Login    ${credentials}[email]    ${credentials}[password]
               Open Specified Bot    ${bot_names_list}    ${my_api10_bot_name}
    [Teardown]    Close Browser

    # Navigate to the Chatflow tab
    Go To Chatflow Tab

    # Iterate through each text item and add text1-text4 in the textarea
    FOR    ${index}    IN RANGE    4
       Click Element    ${group1}
       Click Element    ${my_item_textarea_locator}[${index}]
       Input Text    ${my_item_textarea_locator}[${index}]    ${my_item_text}[${index}]
       Press Keys    ${my_item_textarea_locator}[${index}]    ENTER
    END

Adding a "big" button to a text item (textitem1)

    ${my_big_button_text}  Set Variable   text1 button
    ${my_new_big_button}   Set Variable   (//ol[@class='card rt-text']/li[@tp='items'])[1]

    [Documentation]    This test adds a "big" button to textitem1 in the "group1" chatflow.
    [Tags]    AppTab    API1.0    Regression    Test1
    [Setup]    Setup Chrome Webdriver and Access URL
               Login    ${credentials}[email]    ${credentials}[password]
               Open Specified Bot    ${bot_names_list}    ${my_api10_bot_name}
    [Teardown]    Close Browser

    # Navigate to the Chatflow tab
    Go To Chatflow Tab

    # Click the "textitem1" in "group1"
    Select group and chatflow item   ${group1}   ${textitem1_br}
    Wait Until Element Is Visible and Enabled    ${my_new_big_button}

    # Add a "big" button to the text item
    Click Element    ${my_new_big_button}
    Wait Until Element Is Visible and Enabled    ${button_name_input_field}

    # Configure the "big" button
    Clear Element Text    ${button_name_input_field}
    Input Text    ${button_name_input_field}    ${my_big_button_text}
    Click Button    ${save_button_settings}

Adding a 'Quick reaction' buttons to a text item (textitem2)

    ${my_rn_button_name1}  Set Variable   choice1
    ${my_rn_button_name2}  Set Variable   choice2
    ${my_target_chatflow_item}   Set Variable   3:textitem3
    ${my_ukey_value}   Set Variable   choice

    [Documentation]    This test adds 2 quick reaction buttons "choice1" and "choice2" to textitem2 in the "group1" chatflow.
    [Tags]    AppTab    Regression    Test1
    [Setup]    Setup Chrome Webdriver and Access URL
               Login    ${credentials}[email]    ${credentials}[password]
               Open Specified Bot    ${bot_names_list}    ${my_api10_bot_name}
    [Teardown]    Close Browser

    # Navigate to the Chatflow tab
    Go To Chatflow Tab

    # Click the "textitem2" in "group1"
    Select group and chatflow item   ${group1}   ${textitem2_br}
    Wait Until Element Is Visible and Enabled    ${my_new_rn_button}

    # Add first "quick reaction" button to textitem2
    Click Element    ${my_new_rn_button}
    Wait Until Element Is Visible    ${button_name_input_field}

    # Enter button's name
    Clear Element Text   ${button_name_input_field}
    Input Text    ${button_name_input_field}    ${my_rn_button_name1}

    # Select "manually"
    Select Radio Button    trans_type    manual

    # Set transition to textitem3
    Click Element    ${button_next_action}
    Type In And Press Enter    ${button_next_action}   ${my_target_chatflow_item}

    # Open advanced settings popup
    Wait Until Element Is Visible    ${advanced_settings_popup}
    Click Element    ${advanced_settings_popup}

    # Save users data as choice
    Wait Until Element Is Visible   ${user_key_input_field}
    Clear Element Text   ${user_key_input_field}
    Input Text   ${user_key_input_field}   ${my_ukey_value}

    # Save button's settings
    Click Button    ${save_button_settings}

    # Click the "textitem2" in "group1"
    Select group and chatflow item   ${group1}   ${textitem2_br}
    Wait Until Element Is Visible and Enabled    ${my_new_rn_button}

    # Add second "quick reaction" button to textitem2
    Click Element    ${my_new_rn_button}
    Wait Until Keyword Succeeds    3x    2s    Click Element    ${my_new_rn_button}
    Wait Until Element Is Visible    ${button_name_input_field}

    # Enter button's name
    Clear Element Text   ${button_name_input_field}
    Input Text    ${button_name_input_field}    ${my_rn_button_name2}

    # Select "manually"
    Select Radio Button    trans_type    manual

    # Set transition to textitem3
    Click Element    ${button_next_action}
    Type In And Press Enter    ${button_next_action}   ${my_target_chatflow_item}

    # Open advanced settings popup
    Wait Until Element Is Visible    ${advanced_settings_popup}
    Click Element    ${advanced_settings_popup}

    # Save users data as choice
    Wait Until Element Is Visible   ${user_key_input_field}
    Clear Element Text   ${user_key_input_field}
    Input Text   ${user_key_input_field}   ${my_ukey_value}

    # Save button's settings
    Click Button    ${save_button_settings}

Adding a 'text handler' button to a text item (textitem3)
    [Documentation]    This test adds a "text handler" to textitem3 in the "group1" chatflow.
    [Tags]    AppTab   Regression    Test1
    [Setup]    Setup Chrome Webdriver and Access URL
               Login    ${credentials}[email]    ${credentials}[password]
               Open Specified Bot    ${bot_names_list}    ${my_api10_bot_name}
    [Teardown]    Close Browser

    # Navigate to the Chatflow tab
    Go To Chatflow Tab

    # Click the "textitem2" in "group1"
    Select group and chatflow item   ${group1}   ${textitem3_br}
    Wait Until Element Is Visible and Enabled    ${text_handler_button}
