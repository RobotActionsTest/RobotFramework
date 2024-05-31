*** Settings ***

Resource   ../resourses/Keywords.robot
Resource   ../resourses/Variables.robot

*** Test Cases ***

add Store to API1.0 bot

    ${my_store_url}   Set Variable   https://jerryspringertv.com/
    ${my_store_name}   Set Variable   store1
    ${my_store_image}   Set Variable   ${IMAGE_PATH}//flamingo.jpg
    ${my_store_description}   Set Variable   Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis non ornare ante, non vestibulum elit.
    ${my_store_category}   Set Variable   TestCategory
    ${my_store_country}   Set Variable   Japan
    ${my_store_address}   Set Variable   15-1 Udagawacho, Shibuya City, Tokyo 150-0042
    ${my_store_latitude}   Set Variable   35.6621425
    ${my_store_longitude}   Set Variable   139.6984964
    ${my_store_weekdays_start_time}   Set Variable   11
    ${my_store_weekdays_end_time}   Set Variable   17
    ${my_store_break_time}   Set Variable   13:00-14:00
    ${my_store_rms_capacity}   Set Variable   1

    [Documentation]    This test adds store1 to a BR V2 API1.0 bot
    [Tags]   ReservationTab   API1.0   Regression
    [Setup]    Setup Chrome Webdriver and Access URL
               Login   ${credentials}[email]   ${credentials}[password]
               Open Specified Bot   ${bot_names_list}   ${my_api10_bot_name}
    [Teardown]    Close Browser

    Wait Until Element Is Visible and Enabled   ${rms_tab}
    Click Element    ${rms_tab}
    Wait Until Element Is Visible and Enabled   ${rms_store_tab}
    Click Element    ${rms_store_tab}
    Wait Until Element Is Visible and Enabled   ${add_new_store}
    Click Element    ${add_new_store}
    Wait Until Element Is Visible and Enabled   ${store_url}
    Clear Element Text    ${store_url}
    Input Text    ${store_url}    ${my_store_url}
    Clear Element Text    ${store_name}
    Input Text    ${store_name}    ${my_store_name}
    Choose File    ${store_image}    ${my_store_image}
    Sleep   1s
    Clear Element Text    ${store_description}
    Input Text    ${store_description}    ${my_store_description}
    Clear Element Text    ${store_category}
    Input Text    ${store_category}    ${my_store_category}
    Clear Element Text    ${store_country}
    Input Text    ${store_country}    ${my_store_country}
    Clear Element Text    ${store_address}
    Input Text    ${store_address}    ${my_store_address}
    Clear Element Text    ${store_latitude}
    Input Text    ${store_latitude}    ${my_store_latitude}
    Clear Element Text    ${store_longitude}
    Input Text    ${store_longitude}    ${my_store_longitude}
    Select From List By Label    ${store_weekend_start_time}   ${my_store_weekdays_start_time}
    Select From List By Label    ${store_weekend_end_time}   ${my_store_weekdays_end_time}
    Click Element    ${store_capacity_switch}
    Clear Element Text    ${store_rms_capacity}
    Input Text    ${store_rms_capacity}    ${my_store_rms_capacity}
    Clear Element Text    ${store_break_time}
    Input Text    ${store_break_time}    ${my_store_break_time}
    Click Element    ${store_save_settings}
    Sleep   1s
    Wait Until Element Is Not Visible    ${loader_screen}

add store to API2.0 bot

    ${my_store_url}   Set Variable   https://jerryspringertv.com/
    ${my_store_name}   Set Variable   store1
    ${my_store_image}   Set Variable   ${IMAGE_PATH}//flamingo.jpg
    ${my_store_description}   Set Variable   Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis non ornare ante, non vestibulum elit.
    ${my_store_category}   Set Variable   TestCategory
    ${my_store_country}   Set Variable   Japan
    ${my_store_address}   Set Variable   15-1 Udagawacho, Shibuya City, Tokyo 150-0042
    ${my_store_latitude}   Set Variable   35.6621425
    ${my_store_longitude}   Set Variable   139.6984964
    ${my_store_weekdays_start_time}   Set Variable   11
    ${my_store_weekdays_end_time}   Set Variable   17
    ${my_store_break_time}   Set Variable   13:00-14:00
    ${my_store_rms_capacity}   Set Variable   1

    [Documentation]    This test adds store1 to a BR V2 API2.0 bot
    [Tags]   ReservationTab   API2.0   Regression
    [Setup]    Setup Chrome Webdriver and Access URL
               Login   ${credentials}[email]   ${credentials}[password]
               Open Specified Bot   ${bot_names_list}   ${my_api20_bot_name}
    [Teardown]    Close Browser

    Wait Until Element Is Visible and Enabled   ${rms_tab}
    Click Element    ${rms_tab}
    Wait Until Element Is Visible and Enabled   ${rms_store_tab}
    Click Element    ${rms_store_tab}
    Wait Until Element Is Visible and Enabled   ${add_new_store}
    Click Element    ${add_new_store}
    Wait Until Element Is Visible and Enabled   ${store_url}
    Clear Element Text    ${store_url}
    Input Text    ${store_url}    ${my_store_url}
    Clear Element Text    ${store_name}
    Input Text    ${store_name}    ${my_store_name}
    Choose File    ${store_image}    ${my_store_image}
    Sleep   1s
    Clear Element Text    ${store_description}
    Input Text    ${store_description}    ${my_store_description}
    Clear Element Text    ${store_category}
    Input Text    ${store_category}    ${my_store_category}
    Clear Element Text    ${store_country}
    Input Text    ${store_country}    ${my_store_country}
    Clear Element Text    ${store_address}
    Input Text    ${store_address}    ${my_store_address}
    Clear Element Text    ${store_latitude}
    Input Text    ${store_latitude}    ${my_store_latitude}
    Clear Element Text    ${store_longitude}
    Input Text    ${store_longitude}    ${my_store_longitude}
    Select From List By Label    ${store_weekend_start_time}   ${my_store_weekdays_start_time}
    Select From List By Label    ${store_weekend_end_time}   ${my_store_weekdays_end_time}
    Click Element    ${store_capacity_switch}
    Clear Element Text    ${store_rms_capacity}
    Input Text    ${store_rms_capacity}    ${my_store_rms_capacity}
    Clear Element Text    ${store_break_time}
    Input Text    ${store_break_time}    ${my_store_break_time}
    Click Element    ${store_save_settings}
    Sleep   1s
    Wait Until Element Is Not Visible    ${loader_screen}