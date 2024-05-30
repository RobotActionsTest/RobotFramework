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
&{credentials}    email=alexandra@evolany.com    password=mP5:eR2$mO3#oA3|fS1*
#New APP popup
${new_app_button}   //button[text()[contains(.,'New App')]]
${new_bot_name}   //input[@name='name']
@{checkbox_values}   crm    events    coupons    catalog    rms    chat    ec    mail    stores    campaign    elgana    g_events    bot_posts    user_logs    linepoints    sfa_salesforce    sfa_hubspot    lp    stamp_card    ms365    files
${company_name_input_field}   //input[@target_name='com_id']
${company_name_options}   //ul[@id='form-item-autocomplete']/li
${company_name_option}   //*[text()='Evolany Co., Ltd.']
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
${match_type_option_dropdown}   (//div[@class='ui-dropdown form-item'])[2]
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
${image_reaction_button}   (//label[@class='new'])[10]
${video_reaction_button}   (//label[@class='new'])[11]
${flex_add_content}   //ol[@class='card imagecard new flex']
${flex_content_input}   //textarea[@id='flex-area']
${image_map_name}   //input[@data-value='ImageMap']
${item_camera_icon}   (//ol[@class='card imagecard seq-0']/i[@class='icon camera large upload-btn'])[17]
${image_name}   //input[@data-value='Image']
${video_name}   //input[@data-value='Video']
${carousel1_name}   //input[@data-value='Card']
${card}   //h5[normalize-space()='Card']
${carousel2_name}   //input[@data-value='Card 1']
${card1}   //h5[normalize-space()='Card 1']
${image_card}   //h5[normalize-space()='Image Carousel']
${image_card_name}   //input[@data-value='Image Carousel']
${flex}   //h5[normalize-space()='Flex Message']
${flex_name}   //input[@data-value='Flex Message']
${loader}   //dd[@class='loading on']//b[@class='fa fa-spinner fa-pulse fa-3x fa-fw']
${imap}   //h5[normalize-space()='ImageMap']
${imap_name}   //input[@data-value='ImageMap']
${image}   //h5[normalize-space()='Image']
${img_name}   //input[@data-value='Image']
${video}   //h5[normalize-space()='Video']
${vid_name}   //input[@data-value='Video']

#Manage Reservations
${rms_tab}   //nav/a[@name='rms_view']
${rms_store_tab}   //li[@fid='store_list']
${add_new_store}   //button[@class='new icon plus-square']
${store_url}   //input[@name='uri']
${store_name}   //input[@name='title']
${store_image}   //div[@class='form-type-file']/div/div/input
${store_description}   //textarea[@name='desc']
${store_category}   //input[@target_name='category']
${store_country}   //input[@target_name='country']
${store_address}   //input[@name='address']
${store_latitude}   //input[@name='lat']
${store_longitude}   //input[@name='lng']
${store_weekend_start_time}   //select[@name='open_time.hour']
${store_weekend_end_time}   //select[@name='close_time.hour']
${store_capacity_switch}   (//b[@class='form-item-switch'])[1]
${store_rms_capacity}   //input[@name='capacity_default']
${store_break_time}   //textarea[@name='break_time']
${store_save_settings}   (//div[@class='buttons']/button)[7]
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
${my_imap_icon_location}   (//i[@class='icon link large upload-btn'])[17]
${my_imap_link_input_field}   /html[1]/body[1]/article[1]/main[1]/section[4]/section[1]/ul[1]/li[9]/div[2]/div[1]/ol[1]/i[4]/input[1]

#Booking & MiniApps
${booking}   //h5[normalize-space()='booking']
${booking_trigger}   //h5[normalize-space()='booking_trigger']
${booking_trigger_button}   (//li[@tp='items'])[1]
${booking_confirm_button}   (//li[@tp='items'])[5]
${reservation_tab}   //dd[@name='rms']
${reservation_switch}   //li[@title='Turn reservations']/div/div/b[@class='form-item-switch']
${reservation_store_input}    //input[@target_name='store_id']
${reservation_before_day}    //input[@name='before_day']
${reservation_before_hours}   //input[@name='before_hour']
${reservation_reminder_message}   //input[@target_name='before_acts']
${reservation_after_day}   //input[@name='after_day']
${reservation_after_hours}   //input[@name='after_hour']
${reservation_follow_message}   //input[@target_name='after_acts']
${res_booking_reminder}   //*[text()='3:booking_reminder']
${res_booking_follow}   //*[text()='4:booking_follow_up']
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
${store_setting}   //input[@target_name='store_ids']
${store1}   //*[text()='store1']
${rms_seats}   //h5[text()='rms_seats']
${calendar1}   //h5[text()='calendar1']
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
${outer_buttons_settings_miniapp}   (//section[@class='comp-mask'])[2]
${inner_buttons_settings}   //button[@name='button-0']
${transiotion_input}   //input[@target_name='view']
${save_transition_icon}   (//i[@class='ico save'])[3]
${calendar_settings}   //section[@class='comp-mask']
${calendar_ukey}   //input[@name='name']
${calendar_chat_transition_input}   //input[@target_name='chat']
${booking_confirm_item}   //*[text()='2:booking_confirm']
${calendar_save_icon}   //i[@class='ico save']
${rms_save_button}   //button[@class='icon save']
${rms_save_icon}   (//i[@class='ico save'])[4]
${miniapp_transition_option}   //span[@tp='app']
${rms_seats_option}   //*[text()='rms_seats']
${calendar1_option}   (//*[text()='calendar1'])[2]
#RichMenu
${richmenu_tab}   //dd[@msg='navi-menu']
${add_richmenu_button}   //button[@class='icon plus-circle']
${richmenu1}   //*[text()='richmenu1']
${richmenu2}   //*[text()='richmenu2']
${richmenu_name_input}   //input[@type='text']
${richmenu_image_link}   //div[@class='img-url-box']/input
${uploaded_image}   //div[@org_w='2500']
${richmnenu_save_settings}   //button[@class='icon save']
${imagemap_richmenu}    /div[@class='imagemap']
${area_name_input}   //input[@rid='temp_1']
${richmenu_target_action_input}   (//input[@target_name='act'])[1]
${richmenu_textitem1}   //*[text()='textitem1']
#events
${events}   //h5[normalize-space()='events']
${events_item1}   (//h5[text()='events'])[2]
${events_item2}   //h5[text()='qr_book']
${events_item2}   //h5[text()='qr_checkin']
${events_content_source}   //b[@class='icon double-right']
${events_content_source_dropdown}   (//button[@class='ui-menu'])[2]
${event_big_button1}   (//li[@tp='items'])[2]
${event_big_button2}   (//li[@tp='items'])[4]
${event_big_button3}   (//ol[@class='card rt-text']/li[@class='item new'])[2]
${event_transition_input}    //input[@target_name='act']
${reserve_event_option}   //*[text()='Reserve event']
${save_option}   //span[@tp='stock']
${general tab}   //dd[@name='navi-bot']
${qr_book_input}   //input[@target_name='events_aid']
${qr_checkin_input}    //input[@target_name='events_ck_aid']
${qr_book}   //*[text()='2:qr_book']
${qr_checkin}    //*[text()='3:qr_checkin']
${general_tab_save_button}   //button[@class='icon save label']
${general_tab_ok_button}   (//footer/button)[5]
#webhook
${webhook}   //h5[normalize-space()='webhook']
${webhook_item1}   //h5[normalize-space()='webhook1']
${webhook_item2}   //h5[normalize-space()='webhook2']
${webhook_item3}   //h5[normalize-space()='webhook3']
${webhook_item1_big_button}   (//li[@tp='items'])[1]
${webhook_item2_big_button}   (//ol[@class='card rt-text']/li[@class='item new'])[2]
${advanced_settings}   //label[@class='icon cog advanced-button']
${extension_function}    //button[@class='vip ext-btn icon biz']
${webhook_tab}   //dd[@name='webhook']
${webhook_api_url}   (//input[@name='uri'])[5]
${webhook_key1}   //input[@name='key']
${webhook_key2}   (//input[@name='key'])[2]
${webhook_key3}   (//input[@name='key'])[3]
${webhook_value1}   //ul[@class='webhook-params']/li/div/input[@type='text']
${webhook_value2}   (//ul[@class='webhook-params']/li/div/input[@type='text'])[2]
${webhook_value3}   (//ul[@class='webhook-params']/li/div/input[@type='text'])[3]
${add_key_icon1}   //i[@class='icon plus-square']
${add_key_icon2}   (//i[@class='icon plus-square'])[2]
${value1}   //*[text()='Bot ID']
${value2}   //*[text()='User ID']
${value3}   //*[text()='TEST PASS']
${save_advanced_settings}   (//button[@class='icon save label'])[2]
#miniapps
${miniapps}   //h5[normalize-space()='miniapps']
${form1}   //h5[text()='form1']
${form2}   //h5[text()='form2']
${form}    //h5[text()='Form']
${form2_option}   //*[text()='form2']
${mini_form_title}    //input[@name='title']
${edit_form1_icon}    (//i[@class='icon cog'])[3]
${edit_form2_icon}    (//i[@class='icon cog'])[4]
${view_title}    //input[@placeholder='View title']
${input_option}   (//dd[@tp='input'])[1]
${checkbox_option}   (//dd[@tp='checkbox'])[1]
${switch_option}    (//dd[@tp='switch'])[1]
${date_option}   (//dd[@tp='yymmdd'])[1]
${zipcode_option}   (//dd[@tp='zipcode'])[1]
${file_option}   (//dd[@tp='file'])[1]
${time_option}   (//dd[@tp='time'])[1]
${calendar_option}   (//dd[@tp='calendar'])[1]
${tabmenu_option}   (//dd[@tp='tabmenu'])[1]
${radio_option}   (//dd[@tp='radio'])[1]
${textarea_option}   (//dd[@tp='textarea'])[1]
${form_finish}   //*[text()='2:form_finish']
${form2_transition}   //span[normalize-space()='form2']
${form_finish_transition}   //span[normalize-space()='2:form_finish']
${robot}    {
    "type": "carousel",
    "contents": [
        {
            "type": "bubble",
            "body": {
                "type": "box",
                "layout": "vertical",
                "contents": [
                    {
                        "type": "image",
                        "url": "https://images.unsplash.com/photo-1565711561500-49678a10a63f?ixid=MnwxNzIzMjF8MHwxfGFsbHx8fHx8fHx8fDE2Njg5ODAxMDk&ixlib=rb-4.0.3&fm=jpg&q=85&fit=crop&w=1140&h=500",
                        "size": "full",
                        "aspectMode": "cover",
                        "aspectRatio": "2:3",
                        "gravity": "top"
                    },
                    {
                        "type": "box",
                        "layout": "vertical",
                        "contents": [
                            {
                                "type": "box",
                                "layout": "vertical",
                                "contents": [
                                    {
                                        "type": "text",
                                        "text": "Brown's T-shirts",
                                        "size": "xl",
                                        "color": "#ffffff",
                                        "weight": "bold"
                                    }
                                ]
                            },
                            {
                                "type": "box",
                                "layout": "baseline",
                                "contents": [
                                    {
                                        "type": "text",
                                        "text": "¥35,800",
                                        "color": "#ebebeb",
                                        "size": "sm",
                                        "flex": 0
                                    },
                                    {
                                        "type": "text",
                                        "text": "¥75,000",
                                        "color": "#ffffffcc",
                                        "decoration": "line-through",
                                        "gravity": "bottom",
                                        "flex": 0,
                                        "size": "sm"
                                    }
                                ],
                                "spacing": "lg"
                            },
                            {
                                "type": "box",
                                "layout": "vertical",
                                "contents": [
                                    {
                                        "type": "filler"
                                    },
                                    {
                                        "type": "box",
                                        "layout": "baseline",
                                        "contents": [
                                            {
                                                "type": "filler"
                                            },
                                            {
                                                "type": "icon",
                                                "url": "https://scdn.line-apps.com/n/channel_devcenter/img/flexsnapshot/clip/clip14.png"
                                            },
                                            {
                                                "type": "text",
                                                "text": "Add to cart",
                                                "color": "#ffffff",
                                                "flex": 0,
                                                "offsetTop": "-2px"
                                            },
                                            {
                                                "type": "filler"
                                            }
                                        ],
                                        "spacing": "sm"
                                    },
                                    {
                                        "type": "filler"
                                    }
                                ],
                                "borderWidth": "1px",
                                "cornerRadius": "4px",
                                "spacing": "sm",
                                "borderColor": "#ffffff",
                                "margin": "xxl",
                                "height": "40px"
                            }
                        ],
                        "position": "absolute",
                        "offsetBottom": "0px",
                        "offsetStart": "0px",
                        "offsetEnd": "0px",
                        "backgroundColor": "#03303Acc",
                        "paddingAll": "20px",
                        "paddingTop": "18px"
                    },
                    {
                        "type": "box",
                        "layout": "vertical",
                        "contents": [
                            {
                                "type": "text",
                                "text": "SALE",
                                "color": "#ffffff",
                                "align": "center",
                                "size": "xs",
                                "offsetTop": "3px"
                            }
                        ],
                        "position": "absolute",
                        "cornerRadius": "20px",
                        "offsetTop": "18px",
                        "backgroundColor": "#ff334b",
                        "offsetStart": "18px",
                        "height": "25px",
                        "width": "53px"
                    }
                ],
                "paddingAll": "0px"
            }
        },
        {
            "type": "bubble",
            "body": {
                "type": "box",
                "layout": "vertical",
                "contents": [
                    {
                        "type": "image",
                        "url": "https://scdn.line-apps.com/n/channel_devcenter/img/flexsnapshot/clip/clip2.jpg",
                        "size": "full",
                        "aspectMode": "cover",
                        "aspectRatio": "2:3",
                        "gravity": "top"
                    },
                    {
                        "type": "box",
                        "layout": "vertical",
                        "contents": [
                            {
                                "type": "box",
                                "layout": "vertical",
                                "contents": [
                                    {
                                        "type": "text",
                                        "text": "Cony's T-shirts",
                                        "size": "xl",
                                        "color": "#ffffff",
                                        "weight": "bold"
                                    }
                                ]
                            },
                            {
                                "type": "box",
                                "layout": "baseline",
                                "contents": [
                                    {
                                        "type": "text",
                                        "text": "¥35,800",
                                        "color": "#ebebeb",
                                        "size": "sm",
                                        "flex": 0
                                    },
                                    {
                                        "type": "text",
                                        "text": "¥75,000",
                                        "color": "#ffffffcc",
                                        "decoration": "line-through",
                                        "gravity": "bottom",
                                        "flex": 0,
                                        "size": "sm"
                                    }
                                ],
                                "spacing": "lg"
                            },
                            {
                                "type": "box",
                                "layout": "vertical",
                                "contents": [
                                    {
                                        "type": "filler"
                                    },
                                    {
                                        "type": "box",
                                        "layout": "baseline",
                                        "contents": [
                                            {
                                                "type": "filler"
                                            },
                                            {
                                                "type": "icon",
                                                "url": "https://scdn.line-apps.com/n/channel_devcenter/img/flexsnapshot/clip/clip14.png"
                                            },
                                            {
                                                "type": "text",
                                                "text": "Add to cart",
                                                "color": "#ffffff",
                                                "flex": 0,
                                                "offsetTop": "-2px"
                                            },
                                            {
                                                "type": "filler"
                                            }
                                        ],
                                        "spacing": "sm"
                                    },
                                    {
                                        "type": "filler"
                                    }
                                ],
                                "borderWidth": "1px",
                                "cornerRadius": "4px",
                                "spacing": "sm",
                                "borderColor": "#ffffff",
                                "margin": "xxl",
                                "height": "40px"
                            }
                        ],
                        "position": "absolute",
                        "offsetBottom": "0px",
                        "offsetStart": "0px",
                        "offsetEnd": "0px",
                        "backgroundColor": "#9C8E7Ecc",
                        "paddingAll": "20px",
                        "paddingTop": "18px"
                    },
                    {
                        "type": "box",
                        "layout": "vertical",
                        "contents": [
                            {
                                "type": "text",
                                "text": "SALE",
                                "color": "#ffffff",
                                "align": "center",
                                "size": "xs",
                                "offsetTop": "3px"
                            }
                        ],
                        "position": "absolute",
                        "cornerRadius": "20px",
                        "offsetTop": "18px",
                        "backgroundColor": "#ff334b",
                        "offsetStart": "18px",
                        "height": "25px",
                        "width": "53px"
                    }
                ],
                "paddingAll": "0px"
            }
        }
    ]
}
"""



