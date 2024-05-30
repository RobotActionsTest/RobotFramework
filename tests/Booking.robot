*** Settings ***

Resource   ../resourses/Keywords.robot
Resource   ../resourses/Variables.robot

*** Test Cases ***

Creating a "booking" group

    ${my_group_name}   Set Variable   booking

    [Documentation]    This test adds "booking" to a BR V2 API1.0 bot
    [Tags]   AppTab   API1.0   Regression   Booking
    [Setup]    Setup Chrome Webdriver and Access URL
               Login   ${credentials}[email]   ${credentials}[password]
               Open Specified Bot   ${bot_names_list}   ${my_api10_bot_name}
    [Teardown]    Close Browser

    Go To Chatflow Tab
    Add A New Group
    Set Group Name And Submit   ${my_group_name}

Adding 4 text items to a "booking" group

    ${my_item_name}    Create List    booking_trigger    booking_confirm    booking_reminder    booking_follow_up

    [Documentation]    This test adds 4 text items (booking_trigger, booking_confirm, booking_reminder, booking_follow_up) to a BR V2 API1.0 bot
    [Tags]   AppTab   API1.0   Regression   Booking
    [Setup]    Setup Chrome Webdriver and Access URL
               Login   ${credentials}[email]   ${credentials}[password]
               Open Specified Bot   ${bot_names_list}   ${my_api10_bot_name}
    [Teardown]    Close Browser

    Go To Chatflow Tab
    FOR    ${index}    IN RANGE    4
       Click Element    ${booking}
       Add A Text Item To A Group
       Enter New Text Item's Name    ${my_item_name}[${index}]
    END

Adding a booking miniapps

    ${my_miniapp_name}   Create List   rms_seats   calendar1

    [Documentation]    This test adds 2 miniapps views: rms_seats and calendar1.
    [Tags]   AppTab   API1.0   Regression   Booking
    [Setup]    Setup Chrome Webdriver and Access URL
               Login   ${credentials}[email]   ${credentials}[password]
               Open Specified Bot   ${bot_names_list}   ${my_api10_bot_name}
    [Teardown]    Close Browser

    Go To MiniApp Tab
    Mouse Over My Element    ${add_new_miniapp}
    Click My Element    ${add_new_view}
    Select Radio Button    type    form
    Enter MiniApp Name   ${my_miniapp_name}[0]   ${rms_seats_title}
    Click Button   ${save_settings_button}
    Wait Until Element Is Visible   ${rms_seats}

    Mouse Over My Element    ${add_new_miniapp}
    Click My Element    ${add_new_view}
    Select Radio Button    type    calendar
    Enter MiniApp Name   ${my_miniapp_name}[1]   ${calendar1_title}
    Input Text   ${store_setting}    store1
    Wait Until Element Is Visible    ${store1}
    Click Element    ${store1}
    Click Button   ${save_settings_button}
    Wait Until Element Is Visible   ${calendar1}

Setting up rms_seats miniapp

    ${dropdown_title}   Set Variable   Select number of seats:
    ${dropdown_options}   Create List   1   2
    ${ukey}   Set Variable   rms_seats

    [Documentation]    This test sets up a rms_seat miniapp and adds transition to calendar1 miniapp.
    [Tags]   AppTab   API1.0   Regression   Booking
    [Setup]    Setup Chrome Webdriver and Access URL
               Login   ${credentials}[email]   ${credentials}[password]
               Open Specified Bot   ${bot_names_list}   ${my_api10_bot_name}
    [Teardown]    Close Browser

    Go To MiniApp Tab
    Select My MiniApp    rms_seats
    Delete Default MiniApp Section
    Sleep    1s
    Select My MiniApp    rms_seats
    Delete Default MiniApp Section
    Sleep    1s
    Select My MiniApp    rms_seats
    Sleep    1s
    Add MiniApp Component    ${dropdown_option}
    Input My Component Title   ${dropdown_title}
    Input My Component Options   ${dropdown_options}
    Input My Component Ukey    ${ukey}
    Click My Element    ${save_icon}
    Open Transition Settings
    Select Radio Button    trans    view
    Input Text   ${transiotion_input}   calendar1
    Sleep   1s
    Click My Element    ${calendar1_option}
    Sleep   1s
    Save Transition Settings

Setting up calendar1 miniapp

    ${ukey}   Set Variable   rms_start_datetime

    [Documentation]    This test sets up a calendar miniapp and adds transition to booking_ confirm chat item.
    [Tags]   AppTab   API1.0   Regression   Booking
    [Setup]    Setup Chrome Webdriver and Access URL
               Login   ${credentials}[email]   ${credentials}[password]
               Open Specified Bot   ${bot_names_list}   ${my_api10_bot_name}
    [Teardown]    Close Browser

    Go To MiniApp Tab
    Select My MiniApp    calendar1
    Open Calendar Settings
    Set Calendar Ukey   ${ukey}
    Select Radio Button    trans    chat
    Input Text    ${calendar_chat_transition_input}    2:booking_confirm
    Click Element    ${booking_confirm_item}
    Click My Element    ${calendar_save_icon}

Setting up booking_trigger chatflow item

    ${my_item_text}   Set Variable   booking_trigger
    ${my_item_button_text}    Set Variable   booking_trigger
    ${my_item_textarea_locator}   Set Variable   (//textarea[@class='msg with-emoticon'])[1]

    [Documentation]    This test sets up a booking_trigger chatflow item and adds transition to the rms_seats miniapp view.
    [Tags]   AppTab   API1.0   Regression   Booking
    [Setup]    Setup Chrome Webdriver and Access URL
               Login   ${credentials}[email]   ${credentials}[password]
               Open Specified Bot   ${bot_names_list}   ${my_api10_bot_name}
    [Teardown]    Close Browser

    Go To Chatflow Tab
    Select group and chatflow item   ${booking}   ${booking_trigger}
    Enter Chatflow Item Text    ${my_item_textarea_locator}    ${my_item_text}
    Click My Element   ${booking_trigger_button}
    Configure Button Name    ${button_name_input_field}   ${my_item_button_text}
    Click Element    ${miniapp_transition_option}
    Input Text    ${transition_option_input}    rms_seats
    Wait Until Element Is Visible    ${rms_seats_option}
    Click Element    ${rms_seats_option}
    Save Button Settings

Setting up booking_confirm chatflow item

    ${my_item_text}   Set Variable   booking_confirm Date&time: {{user.rms_start_datetime}} Seats: {{user.rms_seats}}
    ${my_item_button_text}    Set Variable   confirm_booking
    ${my_item_textarea_locator}   Set Variable   (//textarea[@class='msg with-emoticon'])[2]

    [Documentation]    This test sets up a booking_confirm chatflow item.
    [Tags]   AppTab   API1.0   Regression
    [Setup]    Setup Chrome Webdriver and Access URL
               Login   ${credentials}[email]   ${credentials}[password]
               Open Specified Bot   ${bot_names_list}   ${my_api10_bot_name}
    [Teardown]    Close Browser

    Go To Chatflow Tab
    Select group and chatflow item   ${booking}   ${booking_confirm}
    Enter Chatflow Item Text   ${my_item_textarea_locator}   ${my_item_text}
    Click My Element   ${booking_confirm_button}
    Configure Button Name    ${button_name_input_field}   ${my_item_button_text}
    Click My Element   ${advanced_settings}
    Click My Element    ${extension_function}
    Click My Element    ${reservation_tab}
    Click My Element    ${reservation_switch}
    Input Text    ${reservation_store_input}   store1
    Click My Element    ${store1}
    Sleep    1s
    Press Keys   ${reservation_before_day}   1   ENTER
    Sleep    1s
    Press Keys   ${reservation_before_hours}   15   ENTER
    Sleep    1s
    Input Text    ${reservation_reminder_message}   3:booking_reminder
    Sleep    1s
    Click My Element    ${res_booking_reminder}
    Sleep    1s
    Press Keys   ${reservation_after_day}   1   ENTER
    Sleep    1s
    Press Keys   ${reservation_after_hours}   10   ENTER
    Sleep    1s
    Input Text    ${reservation_follow_message}   4:booking_follow_up
    Sleep    1s
    Click My Element    ${res_booking_follow}
    Sleep    1s
    Click My Element    ${save_advanced_settings}
    Sleep    1s
    Click Button    ${save_button_settings}

Setting up booking_reminder chatflow item

    ${my_item_text}   Set Variable   booking_reminder Date&time: {{user.rms_start_datetime}} Seats: {{user.rms_seats}}
    ${my_item_textarea_locator}   Set Variable   (//textarea[@class='msg with-emoticon'])[3]

    [Documentation]    This test sets up a booking_reminder chatflow item.
    [Tags]   AppTab   API1.0   Regression
    [Setup]    Setup Chrome Webdriver and Access URL
               Login   ${credentials}[email]   ${credentials}[password]
               Open Specified Bot   ${bot_names_list}   ${my_api10_bot_name}
    [Teardown]    Close Browser

    Go To Chatflow Tab
    Select group and chatflow item   ${booking}   ${booking_reminder}
    Enter Chatflow Item Text   ${my_item_textarea_locator}   ${my_item_text}

Setting up booking_follow_up chatflow item

    ${my_item_text}   Set Variable   This is a follow-up message for the store reservation you attended.
    ${my_item_textarea_locator}   Set Variable   (//textarea[@class='msg with-emoticon'])[4]

    [Documentation]    This test sets up a booking_follow_up chatflow item.
    [Tags]   AppTab   API1.0   Regression   Booking
    [Setup]    Setup Chrome Webdriver and Access URL
               Login   ${credentials}[email]   ${credentials}[password]
               Open Specified Bot   ${bot_names_list}   ${my_api10_bot_name}
    [Teardown]    Close Browser

    Go To Chatflow Tab
    Select group and chatflow item   ${booking}   ${booking_follow_up}
    Enter Chatflow Item Text    ${my_item_textarea_locator}    ${my_item_text}






    














