*** Settings ***

Resource   ../resourses/Keywords.robot
Resource   ../resourses/Variables.robot

*** Test Cases ***

add Events to API1.0 bot

    ${event_link_list}=   Create List   https://www.udemy.com/   https://www.netflix.com/   https://soundcloud.com/
    ${event_title_list}=    Create List   Test Event1   Test Event2   Test Event3
    ${event1_image}   Set Variable   C://Users//Professional//PycharmProjects//suffering-upd//uploaddata//event_img1.jpg
    ${event2_image}   Set Variable   C://Users//Professional//PycharmProjects//suffering-upd//uploaddata//event_img2.jpg
    ${event3_image}   Set Variable   C://Users//Professional//PycharmProjects//suffering-upd//uploaddata//event_img3.jpg
    ${description}   Set Variable   Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vitae arcu turpis. Morbi quis dignissim nunc, nec luctus nibh. In luctus porttitor posuere. Quisque.
    ${seats}   Set Variable   1

    [Documentation]    This test adds 3 events (event1 and event2 application period has already started) to a BR V2 API1.0 bot
    [Tags]   EventsTab   API1.0   Regression
    [Setup]    Setup Chrome Webdriver and Access URL
               Login   ${credentials}[email]   ${credentials}[password]
               Open Specified Bot   ${bot_names_list}   ${my_api10_bot_name}
    [Teardown]    Close Browser

    Wait Until Element Is Visible and Enabled   ${expand_top_menu}
    Click Element    ${expand_top_menu}
    Wait Until Element Is Visible and Enabled   ${events_tab}
    Click Element    ${events_tab}
    #Event1
    Wait Until Element Is Visible and Enabled    ${new_event_button}
    Click Button   ${new_event_button}
    Wait Until Element Is Visible and Enabled    ${new_event_editing_popup}
    Input Text    ${event_link}    ${event_link_list}[0]
    Choose File   ${evant_image}   ${event1_image}
    Input Text    ${event_title}   ${event_title_list}[0]
    Input Text    ${event_description}   ${description}
    ${current_date}    Get Current Date    result_format=%Y-%m-%d
    ${result_date_and_time} =    Set Variable    ${current_date} 10:00
    Clear Element Text   ${event_application_start}
    Input Text   ${event_application_start}   ${result_date_and_time}
    Input Text    ${event_seats}   ${seats}
    Click Button   ${save_settings_button}
    Wait Until Page Contains Element   ${confirm_popup}   timeout=20s
    Click Element    ${confirm_save}
    #Event2
    Wait Until Element Is Visible and Enabled    ${new_event_button}
    Click Button   ${new_event_button}
    Wait Until Element Is Visible and Enabled    ${new_event_editing_popup}
    Input Text    ${event_link}    ${event_link_list}[1]
    Choose File   ${evant_image}   ${event2_image}
    Input Text    ${event_title}   ${event_title_list}[1]
    Input Text    ${event_description}   ${description}
    ${current_date}    Get Current Date    result_format=%Y-%m-%d
    ${result_date_and_time} =    Set Variable    ${current_date} 10:00
    Clear Element Text   ${event_application_start}
    Input Text   ${event_application_start}   ${result_date_and_time}
    Input Text    ${event_seats}   ${seats}
    Click Button   ${save_settings_button}
    Wait Until Page Contains Element   ${confirm_popup}   timeout=20s
    Click Element    ${confirm_save}
    #Event3
    Wait Until Element Is Visible and Enabled    ${new_event_button}
    Click Button   ${new_event_button}
    Wait Until Element Is Visible and Enabled    ${new_event_editing_popup}
    Input Text    ${event_link}    ${event_link_list}[2]
    Choose File   ${evant_image}   ${event3_image}
    Input Text    ${event_title}   ${event_title_list}[2]
    Input Text    ${event_description}   ${description}
    Input Text    ${event_seats}   ${seats}
    Click Button   ${save_settings_button}
    Wait Until Page Contains Element   ${confirm_popup}   timeout=20s
    Click Element    ${confirm_save}

add Events to API2.0 bot

    ${event_link_list}=   Create List   https://www.udemy.com/   https://www.netflix.com/   https://soundcloud.com/
    ${event_title_list}=    Create List   Test Event1   Test Event2   Test Event3
    ${event1_image}   Set Variable   C://Users//Professional//PycharmProjects//suffering-upd//uploaddata//event_img1.jpg
    ${event2_image}   Set Variable   C://Users//Professional//PycharmProjects//suffering-upd//uploaddata//event_img2.jpg
    ${event3_image}   Set Variable   C://Users//Professional//PycharmProjects//suffering-upd//uploaddata//event_img3.jpg
    ${description}   Set Variable   Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vitae arcu turpis. Morbi quis dignissim nunc, nec luctus nibh. In luctus porttitor posuere. Quisque.
    ${seats}   Set Variable   1

    [Documentation]    This test adds 3 events (event1 and event2 application period has already started) to a BR V2 API2.0 bot
    [Tags]   EventsTab   API2.0   Regression
    [Setup]    Setup Chrome Webdriver and Access URL
               Login   ${credentials}[email]   ${credentials}[password]
               Open Specified Bot   ${bot_names_list}   ${my_api20_bot_name}
    [Teardown]    Close Browser

    Wait Until Element Is Visible and Enabled   ${expand_top_menu}
    Click Element    ${expand_top_menu}
    Wait Until Element Is Visible and Enabled   ${events_tab}
    Click Element    ${events_tab}
    Wait Until Element Is Visible and Enabled   ${expand_top_menu}
    Click Element    ${expand_top_menu}
    Wait Until Element Is Visible and Enabled   ${events_tab}
    Click Element    ${events_tab}
    #Event1
    Wait Until Element Is Visible and Enabled    ${new_event_button}
    Click Button   ${new_event_button}
    Wait Until Element Is Visible and Enabled    ${new_event_editing_popup}
    Input Text    ${event_link}    ${event_link_list}[0]
    Choose File   ${evant_image}   ${event1_image}
    Input Text    ${event_title}   ${event_title_list}[0]
    Input Text    ${event_description}   ${description}
    ${current_date}    Get Current Date    result_format=%Y-%m-%d
    ${result_date_and_time} =    Set Variable    ${current_date} 10:00
    Clear Element Text   ${event_application_start}
    Input Text   ${event_application_start}   ${result_date_and_time}
    Input Text    ${event_seats}   ${seats}
    Click Button   ${save_settings_button}
    Wait Until Page Contains Element   ${confirm_popup}   timeout=20s
    Click Element    ${confirm_save}
    #Event2
    Wait Until Element Is Visible and Enabled    ${new_event_button}
    Click Button   ${new_event_button}
    Wait Until Element Is Visible and Enabled    ${new_event_editing_popup}
    Input Text    ${event_link}    ${event_link_list}[1]
    Choose File   ${evant_image}   ${event2_image}
    Input Text    ${event_title}   ${event_title_list}[1]
    Input Text    ${event_description}   ${description}
    ${current_date}    Get Current Date    result_format=%Y-%m-%d
    ${result_date_and_time} =    Set Variable    ${current_date} 10:00
    Clear Element Text   ${event_application_start}
    Input Text   ${event_application_start}   ${result_date_and_time}
    Input Text    ${event_seats}   ${seats}
    Click Button   ${save_settings_button}
    Wait Until Page Contains Element   ${confirm_popup}   timeout=20s
    Click Element    ${confirm_save}
    #Event3
    Wait Until Element Is Visible and Enabled    ${new_event_button}
    Click Button   ${new_event_button}
    Wait Until Element Is Visible and Enabled    ${new_event_editing_popup}
    Input Text    ${event_link}    ${event_link_list}[2]
    Choose File   ${evant_image}   ${event3_image}
    Input Text    ${event_title}   ${event_title_list}[2]
    Input Text    ${event_description}   ${description}
    Input Text    ${event_seats}   ${seats}
    Click Button   ${save_settings_button}
    Wait Until Page Contains Element   ${confirm_popup}   timeout=20s
    Click Element    ${confirm_save}