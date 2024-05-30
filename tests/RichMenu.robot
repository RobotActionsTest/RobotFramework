*** Settings ***

Resource   ../resourses/Keywords.robot
Resource   ../resourses/Variables.robot

*** Test Cases ***

create a new richmenu1 for API1.0 bot

    ${my_richmenu_name}    Create List    richmenu1    richmenu2
    ${richmenu1_image}   Set Variable   https://anybot-prerelease.s3.amazonaws.com/131_1650877831_0.jpg
    ${richmenu2_image}   Set Variable   https://anybot-prerelease.s3.amazonaws.com/588_1673835904_0_newfmt.jpg

    [Documentation]    This test adds richmenu1 BR V2 API1.0 bot
    [Tags]   EventsTab   API1.0   Regression
    [Setup]    Setup Chrome Webdriver and Access URL
               Login   ${credentials}[email]   ${credentials}[password]
               Open Specified Bot   ${bot_names_list}   ${my_api10_bot_name}
    [Teardown]    Close Browser

    Wait Until Element Is Visible and Enabled   ${richmenu_tab}
    Click Element    ${richmenu_tab}
    #add richmenu1
    Wait Until Element Is Visible and Enabled   ${add_richmenu_button}
    Click Element    ${add_richmenu_button}
    Wait Until Element Is Visible and Enabled    ${richmenu_name_input}
    Type In And Press Enter    ${richmenu_name_input}    ${my_richmenu_name}[0]
    Wait Until Element Is Visible and Enabled    ${richmenu1}
    Wait Until Element Is Visible and Enabled    ${richmenu_image_link}
    Click Element   ${richmenu_image_link}
    Input Text   ${richmenu_image_link}   ${richmenu1_image}
    Press Keys    ${richmenu_image_link}    ENTER
    Wait Until Element Is Visible   ${uploaded_image}
    Click Element    ${richmnenu_save_settings}

create a new richmenu2 for API1.0 bot

    ${my_richmenu_name}    Create List    richmenu1    richmenu2
    ${richmenu1_image}   Set Variable   https://anybot-prerelease.s3.amazonaws.com/131_1650877831_0.jpg
    ${richmenu2_image}   Set Variable   https://anybot-prerelease.s3.amazonaws.com/588_1673835904_0_newfmt.jpg

    [Documentation]    This test adds richmenu1 BR V2 API1.0 bot
    [Tags]   EventsTab   API1.0   Regression
    [Setup]    Setup Chrome Webdriver and Access URL
               Login   ${credentials}[email]   ${credentials}[password]
               Open Specified Bot   ${bot_names_list}   ${my_api10_bot_name}
    [Teardown]    Close Browser

    Wait Until Element Is Visible and Enabled   ${richmenu_tab}
    Click Element    ${richmenu_tab}
    #add richmenu1
    Wait Until Element Is Visible and Enabled   ${add_richmenu_button}
    Click Element    ${add_richmenu_button}
    Wait Until Element Is Visible and Enabled    ${richmenu_name_input}
    Type In And Press Enter    ${richmenu_name_input}    ${my_richmenu_name}[1]
    Wait Until Element Is Visible and Enabled    ${richmenu2}
    Wait Until Element Is Visible and Enabled    ${richmenu_image_link}
    Click Element   ${richmenu_image_link}
    Input Text   ${richmenu_image_link}   ${richmenu2_image}
    Press Keys    ${richmenu_image_link}    ENTER
    Wait Until Element Is Visible   ${uploaded_image}
    Click Element    ${richmnenu_save_settings}






