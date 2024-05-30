*** Settings ***

Resource   ../resourses/Keywords.robot
Resource   ../resourses/Variables.robot

*** Test Cases ***

Creating an "events" group

    ${my_group_name}   Set Variable   events

    [Documentation]    This test adds "events" group to a BR V2 API1.0 bot
    [Tags]   AppTab   API1.0   Regression   EventsBooking
    [Setup]    Setup Chrome Webdriver and Access URL
               Login   ${credentials}[email]   ${credentials}[password]
               Open Specified Bot   ${bot_names_list}   ${my_api10_bot_name}
    [Teardown]    Close Browser

    Go To Chatflow Tab
    Add A New Group
    Set Group Name And Submit   ${my_group_name}

Adding "carousel" item, qr_book and qr_checkin items

    ${my_carousel_item_name}   Set Variable   events
    ${my_text_item_name}   Create List   qr_book   qr_checkin

    [Documentation]    This test adds a carousel item in the events group to a BR V2 API1.0 bot
    [Tags]   AppTab   API1.0   Regression   EventsBooking
    [Setup]    Setup Chrome Webdriver and Access URL
               Login   ${credentials}[email]   ${credentials}[password]
               Open Specified Bot   ${bot_names_list}   ${my_api10_bot_name}
    [Teardown]    Close Browser

    Go To Chatflow Tab
    Click Element    ${events}
    Wait Until Element Is Visible and Enabled    ${add_new_item}
    Mouse Over    ${add_new_item}
    Click My Element    ${item_card}
    Click My Element    ${new_item_name}
    Clear, Type In And Press Enter    ${new_item_name}    ${my_carousel_item_name}

    FOR    ${index}    IN RANGE    2
       # Open group1
       Click Element    ${events}
       # Add new items: qr_book and qr_checkin
       Mouse Over My Element    ${add_new_item}
       Click My Element    ${item_text}
       Click My Element    ${new_item_name}
       Clear, Type In And Press Enter    ${new_item_name}    ${my_text_item_name}[${index}]
    END

Setting up carousel chatflow action

    [Documentation]    This test sets up "Event" content source for carousel item, adds reserve and save buttons, BR V2 API1.0 bot
    [Tags]   AppTab   API1.0   Regression   EventsBooking
    [Setup]    Setup Chrome Webdriver and Access URL
               Login   ${credentials}[email]   ${credentials}[password]
               Open Specified Bot   ${bot_names_list}   ${my_api10_bot_name}
    [Teardown]    Close Browser

    Go To Chatflow Tab
    Select group and chatflow item   ${events}   ${events_item1}
    Click My Element   ${events_content_source}
    Click My Element   ${events_content_source_dropdown}
    Sleep    1s
    Click My Element    ${event_content_source}
    Sleep   3s
    #adding "reserve" button
    Select group and chatflow item   ${events}   ${events_item1}
    Click My Element   ${event_big_button1}
    Configure Button Name   ${button_name_input_field}   Reserve
    Select Radio Button    trans_type    manual
    Wait Until Element Is Visible    ${event_transition_input}
    Input Text    ${event_transition_input}    Reserve event
    Click My Element    ${reserve_event_option}
    Click Button    ${save_button_settings}
    #adding "save" button
    Select group and chatflow item   ${events}   ${events_item1}
    Click My Element   ${event_big_button2}
    Configure Button Name   ${button_name_input_field}   Save
    Click My Element    ${save_option}
    Click Button    ${save_button_settings}

Setting up qr_book and qr_checkin items

    ${my_item_text}    Create List    qr_book    qr_checkin
    ${my_item_textarea_locator}    Create List    (//textarea[@class='msg with-emoticon'])[2]   (//textarea[@class='msg with-emoticon'])[3]
    [Documentation]    This test sets up qr_book and qr_checkin items, BR V2 API1.0 bot
    [Tags]   AppTab   API1.0   Regression   EventsBooking
    [Setup]    Setup Chrome Webdriver and Access URL
               Login   ${credentials}[email]   ${credentials}[password]
               Open Specified Bot   ${bot_names_list}   ${my_api10_bot_name}
    [Teardown]    Close Browser

    Go To Chatflow Tab
    FOR    ${index}    IN RANGE    2
       Click Element    ${events}
       Click Element    ${my_item_textarea_locator}[${index}]
       Input Text    ${my_item_textarea_locator}[${index}]    ${my_item_text}[${index}]
       Press Keys    ${my_item_textarea_locator}[${index}]    ENTER
    END
    #adding "Book event" button
    Select group and chatflow item   ${events}   ${events_item2}
    Click My Element   ${event_big_button3}
    Configure Button Name   ${button_name_input_field}   Book event
    Select Radio Button    trans_type    manual
    Wait Until Element Is Visible    ${event_transition_input}
    Input Text    ${event_transition_input}    Reserve event
    Click My Element    ${reserve_event_option}
    Click Button    ${save_button_settings}
    #general tab settings
    Click My Element    ${general tab}
    Input Text    ${qr_book_input}    2:qr_book
    Click My Element    ${qr_book}
    Input Text    ${qr_checkin_input}    3:qr_checkin
    Click My Element    ${qr_checkin}
    Click My Element    ${general_tab_save_button}
    Click My Element    ${general_tab_ok_button}


