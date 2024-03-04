*** Variables ***
${url}   https://pre.bonp.me//member
#Bot Names
${my_api10_bot_name}   test1
${my_api20_bot_name}   test2
#Login Page
${options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
${environment}   https://pre.bonp.me//member
${email_input}   //input[@name='email']
${pass_input}   //input[@name='pass']
${submit_button}   //button[@type='text']
&{credentials}    email=alexandra@evolany.com    password=221373897221373897qW!1
#New APP popup
${new_app_button}   //button[text()[contains(.,'New App')]]
${new_bot_name}   //input[@name='name']
@{checkbox_values}   crm    events    coupons    catalog    rms    chat    ec    mail    stores    campaign    elgana    g_events    bot_posts    user_logs    linepoints    sfa_salesforce    sfa_hubspot    lp    stamp_card    ms365    files
${company_name_input_field}   //input[@target_name='com_id']
${company_name_options}   //ul[@id='form-item-autocomplete']/li
${company_name_option}   (//ul[@id='form-item-autocomplete']/li)[1]
${save_bot_settings}   //button[@class='icon save']
${locator}   //button[@class='tooltip icon new deploy']
${bot_option_list}   //td[@class='list-item-name']
#APP tab
${expand_top_menu}   //a[@class='miniapps icon dots-v']
${top_menu_option_list}   //nav[@class='btns app-menus']/a
${expand_top_menu_option_list}   //section[@class='submenus']
${events_tab}   (//section[@class='submenus']/ul/li)[2]
${loader_screen}    //article[@id='mask']
${bot_names_list}   //table[@class='list-view']
#Events tab
${new_event_button}   //button[@class='new icon plus-square']
${new_event_editing_popup}   //section[@class='white popup event_edit_view']
${event_link}   //input[@name='linkto']
${evant_image}   //div[@class='form-type-file']/div/div/input
${event_title}   //input[@name='title']
${event_description}   //textarea[@name='desc']
${event_application_start}   //div[@class='form-item-datetime-picker dt-picker-box']/input[@placeholder='Start at']
${event_seats}   //input[@name='seats']
${save_settings_button}   //button[@class='icon save']
${confirm_popup}   //div[@class='popup window']
${confirm_save}   //footer/button
#Chatflow tab
${chatflow_tab}   //dd[@name='navi-flow']
${add_new_group}   (//button[@class='icon plus-square'])[1]
${new_group}   //dd[@class='new-group']
${new_group_name}   //li[@class='group_0 editing on']//input[@type='text']
${group1}   //h5[normalize-space()='group1']
${booking}   //h5[normalize-space()='booking']
${add_new_item}   (//button[@class='icon plus-square'])[2]
${item_text}   //dd[@rt='text']
${item_text_textarea}   (//textarea[@class='msg with-emoticon'])[1]
${new_item_name}   //input[@type='text']
${item_card}   //dd[@rt='card']
${item_imagecard}   //dd[@rt='imagecard']
${item_imagemap}   //dd[@rt='imagemap']
${item_image}   //dd[@rt='image']
${item_video}   //dd[@rt='video']
${item_conditional}   //dd[@rt='logical']
${item_flex}   //dd[@rt='flex']
${confirm_adding_flex}   //button[@class='a1']
${button_name_input_field}   //input[@name='label']
${save_button_settings}   //button[@class='icon save label']
${my_new_rn_button}   (//label[@class='new'])[2]
${button_next_action}   //input[@target_name='act']
${advanced_settings_popup}   //label[@class='icon cog advanced-button']
${user_key_input_field}   //input[@name='ukey']
${text_handler_button}   (//span[@tp='ipts'])[3]
${match_type_dropdown}   (//div[@class='ui-dropdown form-item'])[1]
${match_type}   //li[@val='pattern']
${match_type_option}   //li[@val='len:1']
${file_handler_button}   (//span[@tp='fhs'])[4]
${api_source}   (//b[@class='icon coding'])[5]
${api_source_input_field}   (//input[@class='api'])[9]
${textitem1_big_button}   (//li[@tp='items'])[1]
${carousel1_big_button}   (//li[@tp='items'])[12]
${content_source}   (//b[@class='icon double-right'])[2]
${content_source_dropdown}   (//button[@class='ui-menu'])[12]
${content_source_option_list}   //article[@id='mask']/ul/li
#${event_content_source}   Events
${event_content_source}   (//ul[@class='ui-dropdown-opts']/li)[5]
${carousel2_reaction_button}   (//label[@class='new'])[6]
${content_source_img_carousel}   (//b[@class='icon double-right'])[3]
${content_source_dropdown_img_carousel}   (//button[@class='ui-menu'])[14]
${img_carousel_reaction_button}   (//li[@tp='items'])[30]
${flex_reaction_button}   (//label[@class='new'])[8]
${flex_add_content}   //ol[@class='card imagecard new flex']
${flex_content_input}   //textarea[@id='flex-area']
${image_map_name}   //input[@data-value='ImageMap']
${image_name}   //input[@data-value='Image']
${video_name}   //input[@data-value='Video']
#Broadcast
${users_tab}   //a[@name='user_list_view']
${broadcast_button}   //button[@id='btn_broadcast']
${broadcast_popup}   //section[@class='broadcasting']
${group1_br}   (//ul[@class='groups']/li)[4]
@{group1_item_list}   //section[@class='actions']/ul/li
${textitem1}   //h5[normalize-space()='textitem1']
${textitem2}   //h5[normalize-space()='textitem2']
${textitem3}   //h5[normalize-space()='textitem3']
${textitem4}   //h5[normalize-space()='textitem4']
${carousel1}   //h5[normalize-space()='carousel1']
${carousel2}   //h5[normalize-space()='carousel2']
${image_carousel}   //h5[normalize-space()='image_carousel']
${flex_message}   //h5[normalize-space()='flex_message']
${image_map}   //h5[normalize-space()='image_map']
${image1}   //h5[normalize-space()='image1']
${video1}   //h5[normalize-space()='video1']

${send_broadcast}   //button[@class='icon send label']
${success_sending_message}    //div[@class='content']/p
${close_popup_icon}   (//i[@class='icon close'])[2]

#Booking & MiniApps
${booking}   //h5[normalize-space()='booking']
${booking_trigger}   //h5[normalize-space()='booking_trigger']
${booking_trigger_button}   (//li[@tp='items'])[1]
${miniapp_transition_option}   //span[@tp='app']
${transition_option_input}    //input[@target_name='viewid']
${booking_confirm}   //h5[normalize-space()='booking_confirm']
${booking_reminder}   //h5[normalize-space()='booking_reminder']
${booking_follow_up}   //h5[normalize-space()='booking_follow_up']
${miniapp_tab}   //dd[@name='navi-miniapp']
${add_new_miniapp}   //nav[@class='navi view-navi']/div/button
${add_new_view}   //dd[@act='group']
${rms_seats_title}   //input[@name='title']
${default_section_locator}   (//section[@class='comp-mask'])[2]
${delete_icon}   (//i[@class='ico trash'])[2]
${calendar1_title}  (//input[@name='title'])[3]
${miniapp_list}   //ul/li/h5
${add_new_miniapp_component}   (//div[@class='bar'])[1]
${miniapp_component_list}   (//dd[@tp='formitems'])[1]
${miniapp_component_options}   (//dl[@class='sub formitems'])[1]/dd
${dropdown_option}   (//dd[@tp='dropdown'])[1]
${form_option_title}   //input[@name='title']
${form_option_options}   //textarea[@name='options']
${form_option_ukey}   (//input[@name='name'])[2]
${save_icon}   (//i[@class='ico save'])[2]
${outer_buttons_settings}   (//section[@class='comp-mask'])[3]
${inner_buttons_settings}   //button[@name='button-0']
${transiotion_input}   //input[@target_name='view']
${save_transition_icon}   (//i[@class='ico save'])[3]
${calendar_settings}   //section[@class='comp-mask']
${calendar_ukey}   //input[@name='name']
${calendar_chat_transition_input}   //input[@target_name='chat']
${calendar_save_icon}   //i[@class='ico save']




