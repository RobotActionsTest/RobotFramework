*** Settings ***

Resource   ../resourses/Keywords.robot
Resource   ../resourses/Variables.robot
Library    Process

*** Test Cases ***

Creating a "miniapps" group

    ${my_group_name}   Set Variable   miniapps

    [Documentation]    This test adds "miniapps" group to a BR V2 API1.0 bot
    [Tags]   AppTab   API1.0   Regression   Miniapps
    [Setup]    Setup Chrome Webdriver and Access URL
               Login   ${credentials}[email]   ${credentials}[password]
               Open Specified Bot   ${bot_names_list}   ${my_api10_bot_name}
    [Teardown]    Close Browser

    Go To Chatflow Tab
    Add A New Group
    Set Group Name And Submit   ${my_group_name}

Creating text items (actions) in the miniapps group

    ${my_item_name}    Create List    form_trigger   form_finish
    ${my_item_text}    Create List    Start MiniApp    {{user.ukey1}} {{user.ukey2}} {{user.ukey3}} {{user.ukey4}} {{user.ukey5}} {{user.address}} {{user.zipcode}} {{user.ukey6}} {{user.ukey7}} {{user.ukey8}} {{user.ukey9}} {{user.ukey10}} {{user.ukey11}}
    ${my_item_textarea_locator}    Create List    (//textarea[@class='msg with-emoticon'])[1]   (//textarea[@class='msg with-emoticon'])[2]

    [Documentation]    This test adds form_trigger and form_finish text actions to miniapps group
    [Tags]    AppTab    Regression    Test1   Miniapps
    [Setup]    Setup Chrome Webdriver and Access URL
               Login    ${credentials}[email]    ${credentials}[password]
               Open Specified Bot    ${bot_names_list}    ${my_api10_bot_name}
    [Teardown]    Close Browser

    # Navigate to the Chatflow tab
    Go To Chatflow Tab
    FOR    ${index}    IN RANGE    2
       # Open group1
       Click Element    ${miniapps}
       # Add new items: form_trigger and form_finish
       Mouse Over My Element    ${add_new_item}
       Click My Element    ${item_text}
       Click My Element    ${new_item_name}
       Clear, Type In And Press Enter    ${new_item_name}    ${my_item_name}[${index}]
    END
    FOR    ${index}    IN RANGE    2
       Click Element    ${miniapps}
       Click Element    ${my_item_textarea_locator}[${index}]
       Input Text    ${my_item_textarea_locator}[${index}]    ${my_item_text}[${index}]
       Press Keys    ${my_item_textarea_locator}[${index}]    ENTER
    END

Adding miniapps form1-form2

    ${my_form_miniapp_name}   Create List   form1   form2

    [Documentation]    This test adds 2 miniapp views: form1 and form2
    [Tags]   AppTab   API1.0   Regression   Miniapps
    [Setup]    Setup Chrome Webdriver and Access URL
               Login   ${credentials}[email]   ${credentials}[password]
               Open Specified Bot   ${bot_names_list}   ${my_api10_bot_name}
    [Teardown]    Close Browser

    Go To MiniApp Tab
    #form1
    Mouse Over My Element    ${add_new_miniapp}
    Click My Element    ${add_new_view}
    Click Button   ${save_settings_button}
    Click My Element    ${edit_form1_icon}
    Clear Element Text    ${view_title}
    Press Keys   ${view_title}   ${my_form_miniapp_name}[0]
    Click My Element    ${save_settings_button}
    Wait Until Element Is Visible   ${form1}
    #form2
    Mouse Over My Element    ${add_new_miniapp}
    Click My Element    ${add_new_view}
    Click Button   ${save_settings_button}
    Click My Element    ${edit_form2_icon}
    Clear Element Text    ${view_title}
    Press Keys   ${view_title}   ${my_form_miniapp_name}[1]
    Click My Element    ${save_settings_button}
    Wait Until Element Is Visible   ${form2}
    #removing elements form1
    Select My MiniApp    form1
    Delete Default MiniApp Section
    Sleep    1s
    Select My MiniApp    form1
    Delete Default MiniApp Section
    Sleep    1s
    Select My MiniApp    form1
    Sleep    1s
    #removing elements form2
    Select My MiniApp    form2
    Delete Default MiniApp Section
    Sleep    1s
    Select My MiniApp    form2
    Delete Default MiniApp Section
    Sleep    1s
    Select My MiniApp    form2
    Sleep    1s
    #setting_transition doesn't work
    #Select My MiniApp    form1
    #Open MiniApp Transition Settings
    #Select Radio Button    trans    view
    #Input Text   ${transiotion_input}   form2
    #Sleep   1s
    #Click My Element    ${form2_transition}
    #Sleep   1s
    #Save Transition Settings
    #Select My MiniApp    form2
    #Open MiniApp Transition Settings
    #Select Radio Button    trans    chat
    #Input Text   ${transiotion_input}   2:form_finish
    #Sleep   1s
    #Click My Element    ${form_finish_transition}
    #Sleep   1s
    #Save Transition Settings
    #Go To Chatflow Tab
    #Sleep    1s

Setting up form1 miniapp

    ${input_title}   Set Variable   Enter your name:
    ${checkbox_title}   Set Variable   Select checkbox option:
    ${checkbox_options}   Create List   checkbox1   checkbox2   checkbox3   checkbox4   checkbox5   checkbox6   checkbox7   checkbox8   checkbox9   checkbox10
    ${dropdown_title}   Set Variable   Select dropdown option:
    ${dropdown_options}   Create List   dropdown1   dropdown2   dropdown3   dropdown4   dropdown5   dropdown6
    ${switch_title}   Set Variable   Switch ON/OFF?
    ${date_title}   Set Variable   Select date:
    ${zipcode_title}   Set Variable  Enter zipcode:

    [Documentation]    This test adds components to form1
    [Tags]   AppTab   API1.0   Regression   Miniapps
    [Setup]    Setup Chrome Webdriver and Access URL
               Login   ${credentials}[email]   ${credentials}[password]
               Open Specified Bot   ${bot_names_list}   ${my_api10_bot_name}
    [Teardown]    Close Browser

    Go To MiniApp Tab
    Select My MiniApp    form1
    Add MiniApp Component    ${zipcode_option}
    Input My Component Title   ${zipcode_title}
    Input My Component Ukey    zipcode
    Click My Element    ${save_icon}
    Select My MiniApp    form1
    Add MiniApp Component    ${date_option}
    Input My Component Title   ${date_title}
    Input My Component Ukey    ukey5
    Click My Element    ${save_icon}
    Select My MiniApp    form1
    Add MiniApp Component    ${switch_option}
    Input My Component Title   ${switch_title}
    Input My Component Ukey    ukey4
    Click My Element    ${save_icon}
    Select My MiniApp    form1
    Add MiniApp Component    ${dropdown_option}
    Input My Component Title   ${dropdown_title}
    Input My Component Options   ${dropdown_options}
    Input My Component Ukey    ukey3
    Click My Element    ${save_icon}
    Select My MiniApp    form1
    Add MiniApp Component    ${checkbox_option}
    Input My Component Title   ${checkbox_title}
    Input My Component Options   ${checkbox_options}
    Input My Component Ukey    ukey2
    Click My Element    ${save_icon}
    Select My MiniApp    form1
    Add MiniApp Component    ${input_option}
    Input My Component Title   ${input_title}
    Input My Component Ukey    ukey1
    Click My Element    ${save_icon}

Setting up form2 miniapp

    ${file_title}   Set Variable   Upload your file:
    ${time_title}   Set Variable   Select time:
    ${calendar_title}   Set Variable   Select calendar date:
    ${checkbox_title}   Set Variable   Select checkbox option:
    ${tabmenu_title}   Set Variable   Select tabmenu option:
    ${tabmenu_options}   Create List   tab1   tab2   tab3   tab4   tab5   tab6   tab7   tab8
    ${radio_title}   Set Variable   Select radio option:
    ${radio_options}   Create List   radio1   radio2   radio3   radio4   radio5   radio6
    ${textarea_title}   Set Variable   Enter some long text:

    [Documentation]    This test adds components to form2
    [Tags]   AppTab   API1.0   Regression   Miniapps
    [Setup]    Setup Chrome Webdriver and Access URL
               Login   ${credentials}[email]   ${credentials}[password]
               Open Specified Bot   ${bot_names_list}   ${my_api10_bot_name}
    [Teardown]    Close Browser

    Go To MiniApp Tab
    Select My MiniApp    form2
    Add MiniApp Component    ${file_option}
    Input My Component Title   ${file_title}
    Input My Component Ukey    ukey11
    Click My Element    ${save_icon}
    Select My MiniApp    form2
    Add MiniApp Component    ${time_option}
    Input My Component Title   ${time_title}
    Input My Component Ukey    ukey10
    Click My Element    ${save_icon}
    Select My MiniApp    form2
    Add MiniApp Component    ${calendar_option}
    Input My Component Title   ${calendar_title}
    Input My Component Ukey    ukey9
    Click My Element    ${save_icon}
    Select My MiniApp    form2
    Add MiniApp Component    ${tabmenu_option}
    Input My Component Title   ${tabmenu_title}
    Input My Component Options   ${tabmenu_options}
    Input My Component Ukey    ukey8
    Click My Element    ${save_icon}
    Select My MiniApp    form2
    Add MiniApp Component    ${radio_option}
    Input My Component Title   ${radio_title}
    Input My Component Options   ${radio_options}
    Input My Component Ukey    ukey7
    Click My Element    ${save_icon}
    Select My MiniApp    form1
    Add MiniApp Component    ${textarea_option}
    Input My Component Title   ${textarea_title}
    Input My Component Ukey    ukey6
    Click My Element    ${save_icon}














    
