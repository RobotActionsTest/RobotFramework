*** Settings ***

Resource   ../resourses/Keywords.robot
Resource   ../resourses/Variables.robot
Resource   ../uploaddata/flex_variable.robot

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
    Click My Element    ${new_group}
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
       # Add new items: textitem1 - textitem4
       Mouse Over My Element    ${add_new_item}
       Click My Element    ${item_text}
       Click My Element    ${new_item_name}
       Clear, Type In And Press Enter    ${new_item_name}    ${my_item_name}[${index}]
    END

Entering text in the text item's input field

    ${my_item_text}    Create List    text1    text2    text3    text4
    ${my_item_textarea_locator}    Create List    (//textarea[@class='msg with-emoticon'])[1]   (//textarea[@class='msg with-emoticon'])[2]   (//textarea[@class='msg with-emoticon'])[3]   (//textarea[@class='msg with-emoticon'])[4]

    [Documentation]    This test enters "text1"-"text4" in the text fields of the created text items
    [Tags]    AppTab    API1.0    Regression    Test1
    [Setup]    Setup Chrome Webdriver and Access URL
               Login    ${credentials}[email]    ${credentials}[password]
               Open Specified Bot    ${bot_names_list}    ${my_api10_bot_name}
    [Teardown]    Close Browser

    #Navigate to the Chatflow tab
    Go To Chatflow Tab

    #Iterate through each text item and add text1-text4 in the textarea
    FOR    ${index}    IN RANGE    4
       Click Element    ${group1}
       Click Element    ${my_item_textarea_locator}[${index}]
       Input Text    ${my_item_textarea_locator}[${index}]    ${my_item_text}[${index}]
       Press Keys    ${my_item_textarea_locator}[${index}]    ENTER
    END

Adding a "big" button to a text item (textitem1)

    ${my_big_button_text}  Set Variable   text1 button

    [Documentation]    This test adds a "big" button to textitem1 in the "group1" chatflow.
    [Tags]    AppTab    API1.0    Regression    Test1
    [Setup]    Setup Chrome Webdriver and Access URL
               Login    ${credentials}[email]    ${credentials}[password]
               Open Specified Bot    ${bot_names_list}    ${my_api10_bot_name}
    [Teardown]    Close Browser

    #Navigate to the Chatflow tab
    Go To Chatflow Tab

    #Click the "textitem1" item in "group1"
    Select group and chatflow item   ${group1}   ${textitem1}

    #Add a "big" button to the text item
    Click My Element    ${textitem1_big_button}

    #Set the "big" button's new name
    Configure Button Name    ${button_name_input_field}   ${my_big_button_text}

    #Save "big" button's settings
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

    # Click the "textitem2" item in "group1"
    Select group and chatflow item   ${group1}   ${textitem2}
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

    # Click the "textitem2" item in "group1"
    Select group and chatflow item   ${group1}   ${textitem2}
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

Adding a 'Text handler' button to a text item (textitem3)

    [Documentation]    This test adds a "text handler" button to textitem3 in the "group1" chatflow.
    [Tags]    AppTab   Regression    Test1
    [Setup]    Setup Chrome Webdriver and Access URL
               Login    ${credentials}[email]    ${credentials}[password]
               Open Specified Bot    ${bot_names_list}    ${my_api10_bot_name}
    [Teardown]    Close Browser

    #Navigate to the Chatflow tab
    Go To Chatflow Tab

    #Click the "textitem3" item in "group1"
    Select group and chatflow item   ${group1}   ${textitem3}

    #Click "Text handler" button
    Click My Element    ${text_handler_button}

    #Expand match keywords dropdown
    Click My Element    ${match_type_dropdown}

    #Select "Match Pattern of" option
    Click My Element    ${match_type}

    #Select "Match all patterns" option
    Click My Element    ${match_type_option}

    #Save "Text handler" button's settings
    Click Button    ${save_button_settings}

Adding a 'File handler' button to a text item (textitem4)

    [Documentation]    This test adds a "file handler" button to textitem4 in the "group1" chatflow.
    [Tags]    AppTab   Regression    Test1
    [Setup]    Setup Chrome Webdriver and Access URL
               Login    ${credentials}[email]    ${credentials}[password]
               Open Specified Bot    ${bot_names_list}    ${my_api10_bot_name}
    [Teardown]    Close Browser

    #Navigate to the Chatflow tab
    Go To Chatflow Tab

    #Click the "textitem4" item in "group1"
    Select group and chatflow item   ${group1}   ${textitem4}

    #Click "File handler" button
    Click My Element    ${file_handler_button}

    #Save "Text handler" button's settings
    Click Button    ${save_button_settings}

Adding carousel items

    ${my_item_name}    Create List    carousel1    carousel2

    [Documentation]    This test creates "carousel1" and "carousel2" items in the "group1" chatflow.
    [Tags]    AppTab   Regression    Test1
    [Setup]    Setup Chrome Webdriver and Access URL
               Login    ${credentials}[email]    ${credentials}[password]
               Open Specified Bot    ${bot_names_list}    ${my_api10_bot_name}
    [Teardown]    Close Browser

    #Navigate to the Chatflow tab
    Go To Chatflow Tab

    FOR    ${index}    IN RANGE    2
       # Open group1
       Click Element    ${group1}
       Wait Until Element Is Visible and Enabled    ${add_new_item}
       # Add new card items: carousel1 - carousel4
       Mouse Over    ${add_new_item}
       Click My Element    ${item_card}
       Click My Element    ${new_item_name}
       Clear, Type In And Press Enter    ${new_item_name}    ${my_item_name}[${index}]
    END

Setting [API] data source for a carousel item (carousel1)

    ${my_api_link}    Set Variable    https://pre.bonp.me/api/service/recipes/?format=list

    [Documentation]    This test adds API source link to "carousel1" item in the "group1" chatflow.
    [Tags]    AppTab   Regression    Test1
    [Setup]    Setup Chrome Webdriver and Access URL
               Login    ${credentials}[email]    ${credentials}[password]
               Open Specified Bot    ${bot_names_list}    ${my_api10_bot_name}
    [Teardown]    Close Browser

    #Navigate to the Chatflow tab
    Go To Chatflow Tab

    #Click the "carousel1" item in "group1"
    Select group and chatflow item   ${group1}   ${carousel1}

    #Click the "API" source option
    Click My Element    ${api_source}

    #Click the "API" source input field
    Click My Element    ${api_source_input_field}

    #Type in the API link
    Type In And Press Enter   ${api_source_input_field}   ${my_api_link}
    #Think how to chnage it
    Sleep    2s

Adding a "big" button to a carousel item (carousel1)
    
    ${my_button_name}   Set Variable   Next

    [Documentation]    This test adds a "big" button to "carousel1" item in the "group1" chatflow.
    [Tags]    AppTab   Regression    Test1
    [Setup]    Setup Chrome Webdriver and Access URL
               Login    ${credentials}[email]    ${credentials}[password]
               Open Specified Bot    ${bot_names_list}    ${my_api10_bot_name}
    [Teardown]    Close Browser
    
    #Navigate to the Chatflow tab
    Go To Chatflow Tab

    #Click the "carousel1" item in "group1"
    Select group and chatflow item   ${group1}   ${carousel1}
    
    #Click "carousel1" item's "big" button
    Click My Element    ${carousel1_big_button}

    #Set the "big" button's new name
    Configure Button Name    ${button_name_input_field}    ${my_button_name}

    #Save "big" button's settings
    Click Button    ${save_button_settings}

Setting Content data source for a carousel item (carousel2)

    [Documentation]    This test sets "Content" setting as "Events" for "carousel1" item in the "group1" chatflow.
    [Tags]    AppTab   Regression    Test1
    [Setup]    Setup Chrome Webdriver and Access URL
               Login    ${credentials}[email]    ${credentials}[password]
               Open Specified Bot    ${bot_names_list}    ${my_api10_bot_name}
    [Teardown]    Close Browser

    #Navigate to the Chatflow tab
    Go To Chatflow Tab

    #Click the "carousel1" item in "group1"
    Select group and chatflow item   ${group1}   ${carousel2}
    
    #Click the "Content" source option
    Click My Element    ${content_source}
    
    #Expand the "Content" source options ropdown
    Click My Element    ${content_source_dropdown}

    #Select the "Events" content source
    Click My Element    ${event_content_source}
    #Select My Content Option    ${content_source_option_list}    ${event_content_source} --> uncomment if fix the iteration keyword
    #Think how to chnage it
    Sleep    3s

Adding a 'Quick reaction' reaction to a carousel item (carousel2)

    ${my_button_name}   Set Variable   Next

    [Documentation]    This test adds a "Quick reaction" button to "carousel2" item in the "group1" chatflow.
    [Tags]    AppTab   Regression    Test1
    [Setup]    Setup Chrome Webdriver and Access URL
               Login    ${credentials}[email]    ${credentials}[password]
               Open Specified Bot    ${bot_names_list}    ${my_api10_bot_name}
    [Teardown]    Close Browser

    #Navigate to the Chatflow tab
    Go To Chatflow Tab

    #Click the "carousel1" item in "group1"
    Select group and chatflow item   ${group1}   ${carousel2}

    #Click "carousel2" item's "quick reaction" button
    Click My Element    ${carousel2_reaction_button}

    #Set the "quick reaction" button's new name
    Configure Button Name    ${button_name_input_field}    ${my_button_name}

    #Save "big" button's settings
    Click Button    ${save_button_settings}

Adding an image carousel item (image_carousel)

    ${my_item_name}    Set Variable    image_carousel

    [Documentation]    This test creates "image_carousel" item in the "group1" chatflow.
    [Tags]    AppTab   Regression    Test1
    [Setup]    Setup Chrome Webdriver and Access URL
               Login    ${credentials}[email]    ${credentials}[password]
               Open Specified Bot    ${bot_names_list}    ${my_api10_bot_name}
    [Teardown]    Close Browser

    #Navigate to the Chatflow tab
    Go To Chatflow Tab

    Click Element    ${group1}
    Wait Until Element Is Visible and Enabled    ${add_new_item}
    Mouse Over    ${add_new_item}
    Click My Element    ${item_imagecard}
    Click My Element    ${new_item_name}
    Clear, Type In And Press Enter    ${new_item_name}    ${my_item_name}

Setting a data source and adding a "big" button for an image carousel item

    ${my_button_name}   Set Variable   Next

    [Documentation]    This test sets "Content" setting as "Events" and adds a "big" button to "image_carousel" item in the "group1" chatflow.
    [Tags]    AppTab   Regression    Test1
    [Setup]    Setup Chrome Webdriver and Access URL
               Login    ${credentials}[email]    ${credentials}[password]
               Open Specified Bot    ${bot_names_list}    ${my_api10_bot_name}
    [Teardown]    Close Browser

    #Navigate to the Chatflow tab
    Go To Chatflow Tab

    #Click the "image_carousel" item in "group1"
    Select group and chatflow item   ${group1}   ${image_carousel}

    #Click the "Content" source option
    Click My Element    ${content_source_img_carousel}

    #Expand the "Content" source options ropdown
    Click My Element    ${content_source_dropdown_img_carousel}

    #Select the "Events" content source
    Sleep    1s
    Click My Element    ${event_content_source}
    #Select My Content Option    ${content_source_option_list}    ${event_content_source} --> uncomment if fix the iteration keyword
    #Think how to change Sleep
    Sleep   3s

    #Click "image_carousel" item's "big" button
    Click My Element    ${img_carousel_reaction_button}

    #Set the "big" button's new name
    Configure Button Name    ${button_name_input_field}    ${my_button_name}

    #Save "big" button's settings
    Click Button    ${save_button_settings}

Adding a flex message item

    ${my_item_name}    Set Variable    flex_message

    [Documentation]    This test creates "flex_message" item in the "group1" chatflow.
    [Tags]    AppTab   Regression
    [Setup]    Setup Chrome Webdriver and Access URL
               Login    ${credentials}[email]    ${credentials}[password]
               Open Specified Bot    ${bot_names_list}    ${my_api10_bot_name}
    [Teardown]    Close Browser

    #Navigate to the Chatflow tab
    Go To Chatflow Tab

    Click Element    ${group1}
    Wait Until Element Is Visible and Enabled    ${add_new_item}
    Mouse Over    ${add_new_item}
    Click My Element    ${item_flex}
    Click Button    ${confirm_adding_flex}
    Click My Element    ${new_item_name}
    Clear, Type In And Press Enter    ${new_item_name}    ${my_item_name}

Adding a flex message content

    [Documentation]    This test adds content in JSON form to the "flex_message" item in the "group1" chatflow.
    [Tags]    AppTab   Regression
    [Setup]    Setup Chrome Webdriver and Access URL
               Login    ${credentials}[email]    ${credentials}[password]
               Open Specified Bot    ${bot_names_list}    ${my_api10_bot_name}
    [Teardown]    Close Browser

    #Navigate to the Chatflow tab
    Go To Chatflow Tab

    #Click the "flex_message" item in "group1"
    Select group and chatflow item   ${group1}   ${flex_message}

    #Click "Add content of flex message" link
    Click My Element    ${flex_add_content}

    Input Text    //textarea[@id='flex-area']    ${my_json_data}
    Sleep   3s
    
    Click Button    ${save_settings_button}

Adding a 'Quick reaction' reaction to a flex item (flex_message)

    ${my_button_name}   Set Variable   Next

    [Documentation]    This test adds a "Quick reaction" button to "flex_message" item in the "group1" chatflow.
    [Tags]    AppTab   Regression
    [Setup]    Setup Chrome Webdriver and Access URL
               Login    ${credentials}[email]    ${credentials}[password]
               Open Specified Bot    ${bot_names_list}    ${my_api10_bot_name}
    [Teardown]    Close Browser

    #Navigate to the Chatflow tab
    Go To Chatflow Tab

    #Click the "carousel1" item in "group1"
    Select group and chatflow item   ${group1}   ${flex_message}

    #Click "carousel2" item's "quick reaction" button
    Click My Element    ${flex_reaction_button}

    #Set the "quick reaction" button's new name
    Configure Button Name    ${button_name_input_field}    ${my_button_name}

    #Save "big" button's settings
    Click Button    ${save_button_settings}

Adding an image map item

    ${my_item_name}    Set Variable    image_map

    [Documentation]    This test creates "image_map" item in the "group1" chatflow.
    [Tags]    AppTab   Regression
    [Setup]    Setup Chrome Webdriver and Access URL
               Login    ${credentials}[email]    ${credentials}[password]
               Open Specified Bot    ${bot_names_list}    ${my_api10_bot_name}
    [Teardown]    Close Browser

    #Navigate to the Chatflow tab
    Go To Chatflow Tab
    Click Element    ${group1}
    Mouse Over My Element   ${add_new_item}
    Add My Chatflow Item   ${item_imagemap}
    Enter My Chatflow Item Name   ${image_map_name}   ${my_item_name}

Adding an image item

    ${my_item_name}    Set Variable    image1

    [Documentation]    This test creates "image1" item in the "group1" chatflow.
    [Tags]    AppTab   Regression
    [Setup]    Setup Chrome Webdriver and Access URL
               Login    ${credentials}[email]    ${credentials}[password]
               Open Specified Bot    ${bot_names_list}    ${my_api10_bot_name}
    [Teardown]    Close Browser

    #Navigate to the Chatflow tab
    Go To Chatflow Tab
    Click Element    ${group1}
    Mouse Over My Element   ${add_new_item}
    Add My Chatflow Item   ${item_image}
    Enter My Chatflow Item Name   ${image_name}   ${my_item_name}

Upload an image for the image item

    [Documentation]    This test uploades on image by link for "image1" item in the "group1" chatflow.
    [Tags]    AppTab   Regression
    [Setup]    Setup Chrome Webdriver and Access URL
               Login    ${credentials}[email]    ${credentials}[password]
               Open Specified Bot    ${bot_names_list}    ${my_api10_bot_name}
    [Teardown]    Close Browser

    #Navigate to the Chatflow tab
    Go To Chatflow Tab

    #Click the "image1" item in "group1"
    Select group and chatflow item   ${group1}   ${image1}


Adding a video item

    ${my_item_name}    Set Variable    video1

    [Documentation]    This test creates "video1" item in the "group1" chatflow.
    [Tags]    AppTab   Regression
    [Setup]    Setup Chrome Webdriver and Access URL
               Login    ${credentials}[email]    ${credentials}[password]
               Open Specified Bot    ${bot_names_list}    ${my_api10_bot_name}
    [Teardown]    Close Browser

    #Navigate to the Chatflow tab
    Go To Chatflow Tab
    Click Element    ${group1}
    Mouse Over My Element   ${add_new_item}
    Add My Chatflow Item   ${item_video}
    Enter My Chatflow Item Name   ${video_name}   ${my_item_name}








