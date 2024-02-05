*** Settings ***

Resource   ../resourses/Keywords.robot
Resource   ../resourses/Variables.robot

*** Test Cases ***

Creating a New Chat Group

    ${my_group_name}   Set Variable   group1

    [Documentation]    This test adds group1 to a BR V2 API1.0 bot
    [Tags]   AppTab   API1.0   Regression   Test1
    [Setup]    Setup Chrome Webdriver
               Login   ${credentials}[email]   ${credentials}[password]
               Open Specified Bot   ${bot_names_list}   ${my_api10_bot_name}
    [Teardown]    Close Browser

    # Navigate to the Chatflow tab
    Click Element   ${chatflow_tab}
    Wait Until Element Is Visible and Enabled    ${add_new_group}

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
    [Setup]    Setup Chrome Webdriver
               Login    ${credentials}[email]    ${credentials}[password]
               Open Specified Bot    ${bot_names_list}    ${my_api10_bot_name}
    [Teardown]    Close Browser

    Click Element    ${chatflow_tab}
    Wait Until Element Is Visible and Enabled    ${add_new_group}

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
    [Setup]    Setup Chrome Webdriver
               Login    ${credentials}[email]    ${credentials}[password]
               Open Specified Bot    ${bot_names_list}    ${my_api10_bot_name}
    [Teardown]    Close Browser

    # Iterate through each text item and add text1-text4 in the textarea
    FOR    ${index}    IN RANGE    4
       Click Element    ${chatflow_tab}
       Wait Until Element Is Visible and Enabled    ${add_new_group}
       Click Element    ${group1}
       Click Element    ${my_item_textarea_locator}[${index}]
       Input Text    ${my_item_textarea_locator}[${index}]    ${my_item_text}[${index}]
       Press Keys    ${my_item_textarea_locator}[${index}]    ENTER
    END

Adding a "big" button to a text item (textitem1)

    ${my_big_button_text}  Set Variable   text1 button
    ${my_new_big_button}   Set Variable   (//ol[@class='card rt-text']/li[@tp='items'])[1]

    [Documentation]    This test adds a "big" button to text item 1 in the chatflow action.
    [Tags]    AppTab    API1.0    Regression    Test1
    [Setup]    Setup Chrome Webdriver
               Login    ${credentials}[email]    ${credentials}[password]
               Open Specified Bot    ${bot_names_list}    ${my_api10_bot_name}
    [Teardown]    Close Browser

    # Navigate to the Chatflow tab
    Click Element    ${chatflow_tab}
    Wait Until Element Is Visible and Enabled    ${add_new_group}

    # Open the "textitem1" group
    Click Element    ${group1}
    Wait Until Element Is Visible and Enabled    ${my_new_big_button}

    # Add a "big" button to the text item
    Click Element    ${my_new_big_button}
    Wait Until Element Is Visible and Enabled    ${big_button_name_input_field}

    # Configure the "big" button
    Clear Element Text    ${big_button_name_input_field}
    Input Text    ${big_button_name_input_field}    ${my_big_button_text}
    Click Button    ${save_button_settings}




#Adding a 'Quick reaction' buttons to a text item (textitem2)


