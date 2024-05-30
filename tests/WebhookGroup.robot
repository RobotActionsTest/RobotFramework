*** Settings ***

Resource   ../resourses/Keywords.robot
Resource   ../resourses/Variables.robot

*** Test Cases ***

Creating a "webhook" group

    ${my_group_name}   Set Variable   webhook

    [Documentation]    This test adds "webhook" group to a BR V2 API1.0 bot
    [Tags]   AppTab   API1.0   Regression   Webhook
    [Setup]    Setup Chrome Webdriver and Access URL
               Login   ${credentials}[email]   ${credentials}[password]
               Open Specified Bot   ${bot_names_list}   ${my_api10_bot_name}
    [Teardown]    Close Browser

    Go To Chatflow Tab
    Add A New Group
    Set Group Name And Submit   ${my_group_name}

Creating text items (actions) in the webhook group

    ${my_item_name}    Create List    webhook1    webhook2    webhook3
    ${my_item_text}    Create List    webhook1    next   {{user.whtest1}}
    ${my_item_textarea_locator}    Create List    (//textarea[@class='msg with-emoticon'])[1]   (//textarea[@class='msg with-emoticon'])[2]   (//textarea[@class='msg with-emoticon'])[3]

    [Documentation]    This test adds webhook1, webhook2, webhook3 text actions to webhook group
    [Tags]    AppTab    Regression    Test1   Webhook
    [Setup]    Setup Chrome Webdriver and Access URL
               Login    ${credentials}[email]    ${credentials}[password]
               Open Specified Bot    ${bot_names_list}    ${my_api10_bot_name}
    [Teardown]    Close Browser

    # Navigate to the Chatflow tab
    Go To Chatflow Tab
    FOR    ${index}    IN RANGE    3
       # Open group1
       Click Element    ${webhook}
       # Add new items: webhook1 - webhook3
       Mouse Over My Element    ${add_new_item}
       Click My Element    ${item_text}
       Click My Element    ${new_item_name}
       Clear, Type In And Press Enter    ${new_item_name}    ${my_item_name}[${index}]
    END
    FOR    ${index}    IN RANGE    3
       Click Element    ${webhook}
       Click Element    ${my_item_textarea_locator}[${index}]
       Input Text    ${my_item_textarea_locator}[${index}]    ${my_item_text}[${index}]
       Press Keys    ${my_item_textarea_locator}[${index}]    ENTER
    END

Setting up transitions for webhook1-webhook3 chatflow actions

    ${my_api_url}   Set Variable   /api/service/common/save_ukey
    ${my_key_values}   Create List   bid   uid   whtest1

    [Documentation]    This test sets up transitions for webhook1-webhook3 chatflow actions in webhook group
    [Tags]    AppTab    Regression    Test1   Webhook
    [Setup]    Setup Chrome Webdriver and Access URL
               Login    ${credentials}[email]    ${credentials}[password]
               Open Specified Bot    ${bot_names_list}    ${my_api10_bot_name}
    [Teardown]    Close Browser

    Go To Chatflow Tab
    Select group and chatflow item   ${webhook}   ${webhook_item1}
    Click My Element    ${webhook_item1_big_button}
    Configure Button Name   ${button_name_input_field}   next
    Click My Element   ${advanced_settings}
    Click My Element    ${extension_function}
    Click My Element    ${webhook_tab}
    Input Text    ${webhook_api_url}    ${my_api_url}
    #key1-value1
    Input Text    ${webhook_key1}    ${my_key_values}[0]
    Input Text    ${webhook_value1}    Bot ID
    Click My Element    ${value1}
    #key2-value2
    Click My Element    ${add_key_icon1}
    Input Text    ${webhook_key2}    ${my_key_values}[1]
    Input Text    ${webhook_value2}    User ID
    Click My Element    ${value2}
    #key3-value3
    Click My Element    ${add_key_icon2}
    Input Text    ${webhook_key3}    ${my_key_values}[2]
    Input Text    ${webhook_value3}    TEST PASS
    Press Keys    ${webhook_value3}    ENTER
    Sleep    1s
    Click My Element    ${save_advanced_settings}
    Sleep    1s
    Click Button    ${save_button_settings}
    #webhook2 setting
    Select group and chatflow item   ${webhook}   ${webhook_item2}
    Sleep    1s
    Click My Element    ${webhook_item2_big_button}
    Configure Button Name   ${button_name_input_field}   next
    Click Button    ${save_button_settings}

