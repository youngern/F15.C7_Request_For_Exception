set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050000 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2013.01.01'
,p_release=>'5.0.2.00.07'
,p_default_workspace_id=>13001847666778110641
,p_default_application_id=>31154
,p_default_owner=>'SONGYE'
);
end;
/
prompt --application/set_environment
 
prompt APPLICATION 31154 - RESTful Part 2
--
-- Application Export:
--   Application:     31154
--   Name:            RESTful Part 2
--   Date and Time:   15:01 Tuesday November 24, 2015
--   Exported By:     ADWIGHT@UTEXAS.EDU
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         5.0.2.00.07
--   Instance ID:     63113759365424
--

-- Application Statistics:
--   Pages:                      3
--     Items:                   11
--     Processes:                1
--     Regions:                  4
--     Buttons:                  3
--     Dynamic Actions:          1
--   Shared Components:
--     Logic:
--       Web Services:           1
--     Navigation:
--       Lists:                  1
--       Breadcrumbs:            1
--       NavBar Entries:         1
--     Security:
--       Authentication:         1
--     User Interface:
--       Themes:                 1
--       Templates:
--         Page:                 3
--         Region:              14
--         Label:                3
--         List:                 5
--         Popup LOV:            1
--         Calendar:             1
--         Button:               2
--         Report:               1
--     Globalization:
--     Reports:
--   Supporting Objects:  Included

prompt --application/delete_application
begin
wwv_flow_api.remove_flow(wwv_flow.g_flow_id);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/create_application
begin
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_display_id=>nvl(wwv_flow_application_install.get_application_id,31154)
,p_owner=>nvl(wwv_flow_application_install.get_schema,'SONGYE')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'RESTful Part 2')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'F_31154')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'7D0AD3000076C3E5EBACA576122A6FA636C8B2844D3EA4A35C008DFE207CBEE0'
,p_bookmark_checksum_function=>'SH512'
,p_compatibility_mode=>'5.0'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(18181898713365259133)
,p_application_tab_set=>0
,p_logo_image=>'TEXT:RESTful Part 2'
,p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,'')
,p_flow_version=>'release 1.0'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_last_updated_by=>'ADWIGHT@UTEXAS.EDU'
,p_last_upd_yyyymmddhh24miss=>'20151124150111'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_ui_type_name => null
);
end;
/
prompt --application/shared_components/navigation/lists
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(18181889996849259068)
,p_name=>'Mobile Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(18181899687361259140)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(18182987209489349164)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'P2 RESTful'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(18181899687361259140)
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/files
begin
null;
end;
/
prompt --application/plugin_settings
begin
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(18181889671027259068)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(18181889768747259068)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_CSS_CALENDAR'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(18181889813825259068)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'Y'
);
end;
/
prompt --application/shared_components/security/authorizations
begin
null;
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
wwv_flow_api.create_icon_bar_item(
 p_id=>wwv_flow_api.id(18181898630947259129)
,p_icon_sequence=>200
,p_icon_subtext=>'Log Out'
,p_icon_target=>'&LOGOUT_URL.'
,p_icon_image_alt=>'Log Out'
,p_icon_height=>32
,p_icon_width=>32
,p_icon_height2=>24
,p_icon_width2=>24
,p_nav_entry_is_feedback_yn=>'N'
,p_cell_colspan=>1
);
end;
/
prompt --application/shared_components/logic/application_processes
begin
null;
end;
/
prompt --application/shared_components/logic/application_items
begin
null;
end;
/
prompt --application/shared_components/logic/application_computations
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/standard
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/parent
begin
null;
end;
/
prompt --application/shared_components/user_interface/lovs
begin
null;
end;
/
prompt --application/shared_components/navigation/trees
begin
null;
end;
/
prompt --application/pages/page_groups
begin
null;
end;
/
prompt --application/comments
begin
null;
end;
/
prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(18181898823318259136)
,p_name=>' Breadcrumb'
);
end;
/
prompt --application/shared_components/user_interface/templates/page
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(18181890024514259070)
,p_theme_id=>51
,p_name=>'Dialog'
,p_is_popup=>true
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="&BROWSER_LANGUAGE.">',
'',
'<head>',
'',
'  <meta charset="utf-8" />',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_STYLE_CSS#',
'  #THEME_CSS#',
'  #APPLICATION_CSS#',
'  #APEX_JAVASCRIPT#',
'  #APPLICATION_JAVASCRIPT#',
'  #HEAD#',
'</head>',
'<body #ONLOAD#>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#PAGE_STATIC_ID#" data-dialog="true" data-role="page" data-close-btn="right" aria-label="#TITLE#" data-apex-page-transition="#PAGE_TRANSITION#" data-apex-popup-transition="#POPUP_TRANSITION#" data-theme="a">',
' <div data-role="header" class="ui-header ui-bar-c">',
'  <h1>#TITLE#</h1>',
' </div>',
'#TEMPLATE_CSS#',
'#PAGE_CSS#',
'#FORM_OPEN#',
'',
'<div data-role="content" data-theme="a">',
'  <div id="messages">',
'    #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'  </div>',
'  #BODY#',
'</div><!-- /content -->',
'#FORM_CLOSE#',
'#THEME_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</div><!-- /page -->',
''))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="ui-bar ui-bar-d success" id="success-message">',
'  <h4 style="display:inline-block;margin-top:5px;">#SUCCESS_MESSAGE#</h4>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="ui-bar ui-bar-b notification" id="notification-message">',
'  <h4 style="display:inline-block; margin-top:5px;">#MESSAGE#</h4>',
'</div>'))
,p_theme_class_id=>4
,p_grid_type=>'VARIABLE'
,p_grid_max_columns=>5
,p_grid_always_use_max_columns=>false
,p_grid_has_column_span=>false
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_template=>'<div class="ui-grid-#USED_COLUMNS_ALPHA_MINUS#">#ROWS#</div>'
,p_grid_row_template=>'#COLUMNS#'
,p_grid_column_template=>'<div class="ui-block-#COLUMN_ALPHA#">#CONTENT#</div>'
,p_grid_javascript_debug_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'apex.jQuery(document).on("apex-devbar-grid-debug-on", function(){',
'    apex.jQuery(".apex-grid-debug > [class*=''ui-block-'']").addClass("ui-bar-e"); });',
'',
'apex.jQuery(document).on("apex-devbar-grid-debug-off", function(){',
'    apex.jQuery(".apex-grid-debug > [class*=''ui-block-'']").removeClass("ui-bar-e"); });',
''))
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_width=>'92.5%'
,p_dialog_max_width=>'500px'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>3944623128197965030
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(18181890182359259078)
,p_theme_id=>51
,p_name=>'Page'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="&BROWSER_LANGUAGE.">',
'',
'<head>',
'',
'  <meta charset="utf-8" />',
'  <meta name="apple-mobile-web-app-capable" content="yes">',
'  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_STYLE_CSS#',
'  #THEME_CSS#',
'  #APPLICATION_CSS#',
'  #APEX_JAVASCRIPT#',
'  #THEME_JAVASCRIPT#',
'  #APPLICATION_JAVASCRIPT#',
'  #HEAD#',
'</head>',
'<body #ONLOAD#>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#PAGE_STATIC_ID#" data-role="page" data-apex-page-transition="#PAGE_TRANSITION#" data-apex-popup-transition="#POPUP_TRANSITION#" data-theme="a" data-url="#REQUESTED_URL#" class="ui-responsive-panel" >',
'#TEMPLATE_CSS#',
'#PAGE_CSS#',
'#FORM_OPEN#',
'',
'#REGION_POSITION_01#',
'',
'<div data-role="panel" id="menupanel"  class="jqm-navmenu-panel" data-position="left" data-display="overlay">',
'    #SIDE_GLOBAL_NAVIGATION_LIST#',
'</div>    ',
'',
'<div data-role="content" data-theme="a">',
'  <div id="messages">',
'    #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'  </div>',
'  #BODY#',
'</div>',
'',
'#REGION_POSITION_08#',
'',
'#FORM_CLOSE#',
'#TEMPLATE_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="ui-bar ui-bar-d success" style="margin-bottom:20px;" id="success-message">',
'  <h4 style="display:inline-block;margin-top:5px;">#SUCCESS_MESSAGE#</h4>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="ui-bar ui-bar-b notification" id="notification-message">',
'  <h4 style="display:inline-block; margin-top:5px;">#MESSAGE#</h4>',
'</div>'))
,p_theme_class_id=>17
,p_grid_type=>'VARIABLE'
,p_grid_max_columns=>5
,p_grid_always_use_max_columns=>false
,p_grid_has_column_span=>false
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_template=>'<div class="ui-grid-#USED_COLUMNS_ALPHA_MINUS# apex-grid-debug">#ROWS#</div>'
,p_grid_row_template=>'#COLUMNS#'
,p_grid_column_template=>'<div class="ui-block-#COLUMN_ALPHA#">#CONTENT#</div>'
,p_grid_javascript_debug_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'apex.jQuery(document).on("apex-devbar-grid-debug-on", function(){',
'    apex.jQuery(".apex-grid-debug > [class*=''ui-block-'']").addClass("ui-bar-e"); });',
'',
'apex.jQuery(document).on("apex-devbar-grid-debug-off", function(){',
'    apex.jQuery(".apex-grid-debug > [class*=''ui-block-'']").removeClass("ui-bar-e"); });',
''))
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>3773948923360905623
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(18181890217009259079)
,p_page_template_id=>wwv_flow_api.id(18181890182359259078)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(18181890380036259079)
,p_page_template_id=>wwv_flow_api.id(18181890182359259078)
,p_name=>'Header Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(18181890479806259079)
,p_page_template_id=>wwv_flow_api.id(18181890182359259078)
,p_name=>'Footer Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(18181890970671259084)
,p_theme_id=>51
,p_name=>'Popup'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="&BROWSER_LANGUAGE.">',
'',
'<head>',
'',
'  <meta charset="utf-8" />',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_STYLE_CSS#',
'  #THEME_CSS#    ',
'  #APPLICATION_CSS#',
'  #APEX_JAVASCRIPT#',
'  #THEME_JAVASCRIPT#',
'  #APPLICATION_JAVASCRIPT#',
'  #HEAD#',
'</head>',
'<body #ONLOAD#>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#PAGE_STATIC_ID#" data-role="page" data-apex-page-transition="#PAGE_TRANSITION#" data-apex-popup-transition="#POPUP_TRANSITION#" data-theme="a">',
'#TEMPLATE_CSS#',
'#PAGE_CSS#',
'#FORM_OPEN#',
'',
'<div data-role="content" data-theme="a">',
'  <div id="messages">',
'    #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'  </div>',
'  #BODY#',
'</div><!-- /content -->',
'#FORM_CLOSE#',
'#TEMPLATE_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</div><!-- /page -->',
''))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="ui-bar ui-bar-d success" id="success-message">',
'  <h4 style="display:inline-block;margin-top:5px;">#SUCCESS_MESSAGE#</h4>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="ui-bar ui-bar-b notification" id="notification-message">',
'  <h4 style="display:inline-block; margin-top:5px;">#MESSAGE#</h4>',
'</div>'))
,p_theme_class_id=>17
,p_grid_type=>'VARIABLE'
,p_grid_max_columns=>5
,p_grid_always_use_max_columns=>false
,p_grid_has_column_span=>false
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_template=>'<div class="ui-grid-#USED_COLUMNS_ALPHA_MINUS#">#ROWS#</div>'
,p_grid_row_template=>'#COLUMNS#'
,p_grid_column_template=>'<div class="ui-block-#COLUMN_ALPHA#">#CONTENT#</div>'
,p_grid_javascript_debug_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'apex.jQuery(document).on("apex-devbar-grid-debug-on", function(){',
'    apex.jQuery(".apex-grid-debug > [class*=''ui-block-'']").addClass("ui-bar-e"); });',
'',
'apex.jQuery(document).on("apex-devbar-grid-debug-off", function(){',
'    apex.jQuery(".apex-grid-debug > [class*=''ui-block-'']").removeClass("ui-bar-e"); });',
''))
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>3773982230016967788
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/button
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(18181893380994259100)
,p_template_name=>'Icon Button'
,p_template=>'<button id="#BUTTON_ID#" type="button" data-inline="true" onclick="#JAVASCRIPT#" class="ui-btn #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#>#LABEL#</button>'
,p_hot_template=>'<button id="#BUTTON_ID#" type="button" data-inline="true" onclick="#JAVASCRIPT#" class="ui-btn ui-btn-b #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#>#LABEL#</button>'
,p_reference_id=>3769112915850328396
,p_translate_this_template=>'N'
,p_theme_class_id=>4
,p_default_template_options=>'ui-btn-inline:ui-corner-all'
,p_preset_template_options=>'ui-btn-icon-notext'
,p_theme_id=>51
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(18181897590311259106)
,p_template_name=>'Standard Button'
,p_template=>'<button id="#BUTTON_ID#" type="button" data-inline="true" onclick="#JAVASCRIPT#" class="ui-btn #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#>#LABEL#</button>'
,p_hot_template=>'<button id="#BUTTON_ID#" type="button" data-inline="true" onclick="#JAVASCRIPT#" class="ui-btn ui-btn-b #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#>#LABEL#</button>'
,p_reference_id=>3773985424233098554
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_default_template_options=>'ui-btn-inline:ui-corner-all'
,p_theme_id=>51
);
end;
/
prompt --application/shared_components/user_interface/templates/region
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(18181891097633259084)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" data-role="controlgroup" data-type="horizontal" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>',
'#CLOSE#',
'#DELETE#',
'#CREATE#',
'#EDIT#',
'#CHANGE#',
'#BODY#',
'</div>'))
,p_page_plug_template_name=>'Button Group (Horizontal)'
,p_theme_id=>51
,p_theme_class_id=>17
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3773986716277171983
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(18181891176209259091)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" data-role="controlgroup" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>',
'#CLOSE#',
'#DELETE#',
'#CREATE#',
'#EDIT#',
'#CHANGE#',
'#BODY#',
'</div>'))
,p_page_plug_template_name=>'Button Group (Vertical)'
,p_theme_id=>51
,p_theme_class_id=>17
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3773986516015153022
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(18181891201954259091)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" data-role="collapsible" #REGION_CSS_CLASSES# #REGION_ATTRIBUTES#>',
'<h3>#TITLE#</h3>',
'#BODY#',
'</div>'))
,p_page_plug_template_name=>'Collapsible (Closed)'
,p_theme_id=>51
,p_theme_class_id=>1
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3802613893727675064
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(18181891367758259091)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" data-role="collapsible" data-collapsed="false" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>',
'<h3>#TITLE#</h3>',
'#BODY#',
'</div>'))
,p_page_plug_template_name=>'Collapsible (Open)'
,p_theme_id=>51
,p_theme_class_id=>1
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3773989519618239167
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(18181891418131259091)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" data-role="collapsible-set" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>',
'#SUB_REGIONS#',
'</div>'))
,p_page_plug_template_name=>'Collapsible Set'
,p_theme_id=>51
,p_theme_class_id=>1
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3773995014648303985
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(18181891596547259091)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" data-role="footer" data-theme="b" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>',
'  #CHANGE#',
'  #BODY#',
'</div> <!-- /footer -->'))
,p_page_plug_template_name=>'Footer Toolbar (Displays at Bottom of Page)'
,p_theme_id=>51
,p_theme_class_id=>22
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3773960018627216969
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(18181891675814259092)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" data-id="#REGION_STATIC_ID#" data-role="footer" data-theme="b" data-position="fixed" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>',
'  #CHANGE#',
'  #BODY#',
'</div> <!-- /footer -->'))
,p_page_plug_template_name=>'Footer Toolbar (Fixed)'
,p_theme_id=>51
,p_theme_class_id=>22
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3773956337432111625
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(18181891723634259092)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" data-id="#REGION_STATIC_ID#" data-role="footer" data-theme="b" data-position="fixed" data-fullscreen="true" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>',
'  #CHANGE#',
'  #BODY#',
'</div> <!-- /footer -->'))
,p_page_plug_template_name=>'Footer Toolbar (Fullscreen)'
,p_theme_id=>51
,p_theme_class_id=>22
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3773955815682111625
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(18181891859869259092)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" data-id="#REGION_STATIC_ID#" data-role="header" data-theme="a" data-position="fixed" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>',
'  #PREVIOUS#',
'  <h1>#PAGE_TITLE#</h1>',
'  #NEXT#',
'  #BODY#',
'</div> <!-- /header -->'))
,p_page_plug_template_name=>'Header Toolbar (Fixed)'
,p_theme_id=>51
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3773957032569111626
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(18181891902789259092)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" data-id="#REGION_STATIC_ID#" data-role="header" data-theme="a" data-position="fixed" data-fullscreen="true" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>',
'  #PREVIOUS#',
'  <h1>#TITLE#</h1>',
'  #NEXT#',
'  #BODY#',
'</div> <!-- /header -->'))
,p_page_plug_template_name=>'Header Toolbar (Fullscreen)'
,p_theme_id=>51
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3773956714688111626
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(18181892084032259092)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div data-role="panel" id="#REGION_STATIC_ID#" data-position="right" data-display="overlay" class="#REGION_CSS_CLASSES#">',
'#BODY#',
'#SUB_REGIONS#',
'#CLOSE#',
'#DELETE#',
'#CREATE#',
'#EDIT#',
'#CHANGE#',
'</div>  '))
,p_page_plug_template_name=>'Panel'
,p_theme_id=>51
,p_theme_class_id=>2
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>4376395493293226388
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(18181892170254259093)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#">',
'#BODY#',
'#SUB_REGIONS#',
'#CLOSE#',
'#DELETE#',
'#CREATE#',
'#EDIT#',
'#CHANGE#',
'#PREVIOUS#',
'#NEXT#    ',
'</div>'))
,p_page_plug_template_name=>'Plain (No Title)'
,p_theme_id=>51
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3773970912843347834
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(18181892200166259093)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" class="ui-collapsible #REGION_CSS_CLASSES#" data-theme="b" #REGION_ATTRIBUTES#>',
'  <h3 class="ui-collapsible-heading ui-btn ui-corner-top ui-btn-up-a">',
'    <span class="ui-btn-inner ui-corner-top ui-corner-bottom">',
'      <span lass="ui-btn-text">#TITLE#</span>',
'    </span>',
'  </h3>',
'  <div class="ui-collapsible-content ui-body-c ui-corner-bottom">',
'    #BODY#',
'    #SUB_REGIONS#',
'    #EDIT#',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Region (With Title Bar)'
,p_theme_id=>51
,p_theme_class_id=>8
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3774008426020553267
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(18181892338203259093)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" class="#REGION_CSS_CLASSES#" data-theme="b" #REGION_ATTRIBUTES#>',
'<h3>#TITLE#</h3>',
'#BODY#',
'#SUB_REGIONS#',
'#EDIT#',
'</div>'))
,p_page_plug_template_name=>'Region (With Title)'
,p_theme_id=>51
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3774032731297886006
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(18181892503430259095)
,p_list_template_current=>'<a href="#LINK#" rel="external" data-role="button" data-icon="#A01#">#TEXT_ESC_SC#</a>'
,p_list_template_noncurrent=>'<a href="#LINK#" rel="external" data-role="button" data-icon="#A01#">#TEXT_ESC_SC#</a>'
,p_list_template_name=>'Button Control Group'
,p_theme_id=>51
,p_theme_class_id=>9
,p_list_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="navgroup">',
'   <div data-role="controlgroup" data-type="horizontal">'))
,p_list_template_after_rows=>'</div></div>'
,p_reference_id=>4142824253118274072
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(18181892634928259097)
,p_list_template_current=>'<li data-theme="b"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'List View'
,p_theme_id=>51
,p_theme_class_id=>9
,p_list_template_before_rows=>'<ul data-role="listview">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li data-theme="b"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li data-theme="b">',
'<a href="#LINK#">#TEXT_ESC_SC#</a>',
'#SUB_LISTS#',
'</li>'))
,p_item_templ_noncurr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li>',
'<a href="#LINK#">#TEXT_ESC_SC#</a>',
'#SUB_LISTS#',
'</li>'))
,p_sub_templ_curr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li data-theme="b">',
'<a href="#LINK#">#TEXT_ESC_SC#</a>',
'#SUB_LISTS#',
'</li>'))
,p_sub_templ_noncurr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li>',
'<a href="#LINK#">#TEXT_ESC_SC#</a>',
'#SUB_LISTS#',
'</li>'))
,p_reference_id=>3776865227797444118
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(18181892761991259097)
,p_list_template_current=>'<li data-theme="b"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'List View (Inset)'
,p_theme_id=>51
,p_theme_class_id=>10
,p_list_template_before_rows=>'<ul data-role="listview" data-inset="true">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<ul data-inset="true">'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li data-theme="b"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li data-theme="b">',
'<a href="#LINK#">#TEXT_ESC_SC#</a>',
'#SUB_LISTS#',
'</li>'))
,p_item_templ_noncurr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li>',
'<a href="#LINK#">#TEXT_ESC_SC#</a>',
'#SUB_LISTS#',
'</li>'))
,p_sub_templ_curr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li data-theme="b">',
'<a href="#LINK#">#TEXT_ESC_SC#</a>',
'#SUB_LISTS#',
'</li>'))
,p_sub_templ_noncurr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li>',
'<a href="#LINK#">#TEXT_ESC_SC#</a>',
'#SUB_LISTS#',
'</li>'))
,p_reference_id=>3935648678734663305
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(18181892872254259097)
,p_list_template_current=>'<li><a href="#LINK#" class="ui-btn-active" data-transition="flow" data-icon="#IMAGE#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#" data-transition="flow" data-icon="#IMAGE#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Navigation Bar'
,p_theme_id=>51
,p_theme_class_id=>11
,p_list_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div data-role="navbar">',
'  <ul>',
''))
,p_list_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  </ul>',
'</div><!-- /navbar -->'))
,p_reference_id=>3773961435821288174
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(18181892954986259097)
,p_list_template_current=>'<li data-theme="b"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Navigation Menu'
,p_inline_css=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'.jqm-navmenu-panel .ui-listview > li .ui-collapsible-heading {',
'    margin: 0;',
'}',
'.jqm-navmenu-panel .ui-collapsible.ui-li-static {',
'    border: medium none !important;',
'    padding: 0;',
'}',
'.jqm-navmenu-panel .ui-collapsible + li > .ui-btn, .jqm-navmenu-panel .ui-collapsible + .ui-collapsible > .ui-collapsible-heading > .ui-btn, .jqm-navmenu-panel .ui-panel-inner > .ui-listview > li.ui-first-child .ui-btn {',
'    border-top: medium none !important;',
'}',
'.jqm-navmenu-panel .ui-listview .ui-listview .ui-btn {',
'    color: #999;',
'    padding-left: 1.5em;',
'}',
'.jqm-navmenu-panel .ui-listview .ui-listview .ui-btn.ui-btn-active {',
'    color: #fff;',
'}',
'.jqm-navmenu-panel .ui-btn:after {',
'    opacity: 0.4;',
'}',
'.jqm-demos .jqm-navmenu-panel.jqm-panel-page-nav {',
'    display: none;',
'    left: 12px;',
'    position: absolute;',
'    top: 178px;',
'}',
'.jqm-demos .jqm-navmenu-panel.jqm-panel-page-nav ul li:first-child a {',
'    border-top: medium none;',
'}',
'',
''))
,p_theme_id=>51
,p_theme_class_id=>9
,p_list_template_before_rows=>'<ul data-role="listview">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<ul data-role="listview" data-theme="b">'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li data-theme="b"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li data-role="collapsible" data-iconpos="right" data-inset="false">',
'    <h2>#TEXT_ESC_SC#</h2>',
'    <ul data-role="listview" data-theme="b">',
'        #SUB_LISTS#',
'    </ul>',
'</li>'))
,p_item_templ_noncurr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li data-role="collapsible" data-iconpos="right" data-inset="false">',
'    <h2>#TEXT_ESC_SC#</h2>',
'    #SUB_LISTS#',
'</li>'))
,p_sub_templ_curr_w_child=>'<li data-theme="b"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_sub_templ_noncurr_w_child=>'<li data-theme="b"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_reference_id=>5052261073199403386
);
end;
/
prompt --application/shared_components/user_interface/templates/report
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(18181892476915259093)
,p_row_template_name=>'Standard Report'
,p_row_template1=>'<div class="list-view-cell" style="width:#COLUMN_WIDTH_VAL#%">#COLUMN_VALUE#</div>'
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">',
'<ul data-role="listview">'))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</ul>',
'</div>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_before_column_heading=>'<li data-role="list-divider">'
,p_column_heading_template=>'<div class="list-view-cell" id="#COLUMN_HEADER_NAME#" style="width:#COLUMN_WIDTH_VAL#%">#COLUMN_HEADER#</div>'
,p_after_column_heading=>'</li>'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_next_page_template=>'<a href="#LINK#" data-role="button" data-icon="arrow-r" data-iconpos="right" data-transition="slide">#PAGINATION_NEXT#</a>'
,p_previous_page_template=>'<a href="#LINK#" data-role="button" data-icon="arrow-l" data-iconpos="left" data-transition="slide" data-direction="reverse">#PAGINATION_PREVIOUS#</a>'
,p_next_set_template=>'<a href="#LINK#" data-role="button" data-icon="arrow-r" data-iconpos="right" data-transition="slide">#PAGINATION_NEXT_SET#</a>'
,p_previous_set_template=>'<a href="#LINK#" data-role="button" data-icon="arrow-l" data-iconpos="left" data-transition="slide" data-direction="reverse">#PAGINATION_PREVIOUS_SET#</a>'
,p_row_style_checked=>'#ccc'
,p_theme_id=>51
,p_theme_class_id=>4
,p_reference_id=>3938915966414985025
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(18181892476915259093)
,p_row_template_before_first=>'<li>'
,p_row_template_after_last=>'</li>'
);
exception when others then null;
end;
end;
/
prompt --application/shared_components/user_interface/templates/label
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(18181893018753259098)
,p_template_name=>'No Label (For Screenreaders)'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#">'
,p_template_body2=>'</label>'
,p_before_item=>'<div class="ui-hide-label" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_on_error_before_label=>' '
,p_on_error_after_label=>' '
,p_theme_id=>51
,p_theme_class_id=>13
,p_reference_id=>3774000536044404829
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(18181893144514259099)
,p_template_name=>'Optional'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#">'
,p_template_body2=>'</label>'
,p_before_item=>'<div id="#CURRENT_ITEM_CONTAINER_ID#" class="ui-field-contain">'
,p_after_item=>'</div>'
,p_on_error_before_label=>' '
,p_on_error_after_label=>' '
,p_theme_id=>51
,p_theme_class_id=>3
,p_reference_id=>3773999522622381968
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(18181893200054259099)
,p_template_name=>'Required'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#">'
,p_template_body2=>'<span class="a-Icon icon-asterisk"></span></label>'
,p_before_item=>'<div id="#CURRENT_ITEM_CONTAINER_ID#" class="ui-field-contain">'
,p_after_item=>'</div>'
,p_on_error_before_label=>' '
,p_on_error_after_label=>' '
,p_theme_id=>51
,p_theme_class_id=>4
,p_reference_id=>3773952434061913595
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/breadcrumb
begin
null;
end;
/
prompt --application/shared_components/user_interface/templates/popuplov
begin
wwv_flow_api.create_popup_lov_template(
 p_id=>wwv_flow_api.id(18181897922262259108)
,p_popup_icon=>'#IMAGE_PREFIX#list.gif'
,p_popup_icon_attr=>'width=13 height=13 alt="#LIST_OF_VALUES#" title="#LIST_OF_VALUES#"'
,p_page_name=>'winlov'
,p_page_title=>'Search Dialog'
,p_page_html_head=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<html lang="&BROWSER_LANGUAGE.">',
'<head>',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#APEX_JAVASCRIPT#',
'<link rel=stylesheet href=#IMAGE_PREFIX#platform2.css type=text/css>',
'#THEME_CSS#',
'</head>'))
,p_page_body_attr=>'bgcolor=white OnLoad=first_field()'
,p_before_field_text=>' '
,p_page_heading_text=>'<link rel=stylesheet href=#IMAGE_PREFIX#platform2.css type=text/css><style>a:link { color:#336699; text-decoration:none; padding:2px;} a:visited { color:#336699; text-decoration:none;} a:hover { color:red; text-decoration:underline;} body { font-fami'
||'ly:arial; background-color:#ffffff;} </style>'
,p_page_footer_text=>'</center></td></tr></table>'
,p_filter_width=>'20'
,p_filter_max_width=>'100'
,p_find_button_text=>'Search'
,p_close_button_text=>'Close'
,p_next_button_text=>'Next'
,p_prev_button_text=>'Previous'
,p_after_field_text=>'</div><br />'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'400'
,p_height=>'450'
,p_result_row_x_of_y=>'Row(s) #FIRST_ROW# - #LAST_ROW#'
,p_result_rows_per_pg=>10
,p_theme_id=>51
,p_theme_class_id=>1
,p_reference_id=>3773970616521339369
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar
begin
wwv_flow_api.create_calendar_template(
 p_id=>wwv_flow_api.id(18181897811065259107)
,p_cal_template_name=>'Basic Calendar'
,p_day_of_week_format=>'<th scope="col" class="m-DayOfWeek">#IDY#</th>'
,p_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table summary="#CALENDAR_TITLE# #IMONTH# #YYYY#" class="m-Calendar" id="calendar_month_#REGION_STATIC_ID#" data-enhance=false>',
'<tr><th scope="colgroup" class="m-MonthTitle" colspan="7" >#IMONTH# #YYYY#</th></tr>',
''))
,p_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<tr><td colspan="7">',
'<div id="calendar_day_details_#REGION_STATIC_ID#"></div>',
'</td>',
'</tr>',
'</table>',
'<script>',
'apex.jQuery( "##PAGE_STATIC_ID#" ).on( "pageinit", function() {',
'',
'    // Initialize calendar data as list view as soon as that section has been refreshed',
'    // Use Swipe Left and Right to go to the next or previous month',
'    apex.jQuery( "##REGION_STATIC_ID#", apex.gPageContext$ )',
'        .on( "apexafterrefresh", function() {',
'            apex.jQuery( "#calendar_month_#REGION_STATIC_ID#", apex.gPageContext$ )',
'                .find( "[data-role=''listview'']")',
'                .listview(); })',
'        .on( "swipeleft", function() {',
'            apex.widget.calendar.ajax_calendar(''S'', ''next''); } )',
'        .on( "swiperight", function() {',
'            apex.widget.calendar.ajax_calendar(''S'', ''previous''); } );',
'',
'    // Load calendar data of date if it''s tapped',
'    apex.jQuery( "##REGION_STATIC_ID#", apex.gPageContext$ ).on( "tap", "#calendar_month_#REGION_STATIC_ID# td[class*=m-]", function () {',
'        var lDate     = apex.jQuery( this ).data( "date" ),',
'            lDetails$ = apex.jQuery( "#calendar_day_details_#REGION_STATIC_ID#", apex.gPageContext$ );',
'        apex.jQuery(".apex-calendar-today-has-data")',
'            .addClass(''apex-calendar-has-data'')',
'            .removeClass("apex-calendar-today-has-data");',
'        apex.jQuery( ".m-Today" )',
'            .addClass("m-Day")',
'            .removeClass( "m-Today" );',
'        apex.jQuery( this ).addClass( "m-Today" );',
'',
'        apex.widget.calendar.getDayData( "#REGION_STATIC_ID#", lDate, {',
'            clear: function() {',
'                lDetails$.empty();',
'            },',
'            success: function( pData ) {',
'                lDetails$.html( pData );',
'            }',
'        });',
'    });',
'',
'    // New calendar entries can be added with tab and hold',
'    apex.jQuery( "##REGION_STATIC_ID#", apex.gPageContext$ ).on( "taphold", "#calendar_month_#REGION_STATIC_ID# td[class*=m-]", function (e) {',
'       apex.widget.calendar.ajaxAddData(e);',
'    });',
'',
'    // Get the data of the current day as soon as the page gets displayed',
'    apex.jQuery( "##PAGE_STATIC_ID#" ).on( "pageshow", function() {',
'        var lDetails$ = apex.jQuery( "#calendar_day_details_#REGION_STATIC_ID#", apex.gPageContext$ );',
'        apex.jQuery( ".m-Today", apex.gPageContext$ )',
'            .addClass( "m-Day" )',
'            .removeClass( "m-Today" );',
'        apex.jQuery( "#calendar_month_#REGION_STATIC_ID#", apex.gPageContext$ )',
'            .find( "td[data-date=#CURRENT_DATE#]" )',
'            .addClass( "m-Today" );',
'        apex.widget.calendar.getDayData( "#REGION_STATIC_ID#", "#CURRENT_DATE#", {',
'            clear: function() {',
'                lDetails$.empty();',
'            },',
'            success: function( pData ) {',
'                lDetails$.html( pData );',
'            }',
'        });',
'    });',
'',
'});',
'</script>'))
,p_day_title_format=>'<div class="content-primary" class="m-DayTitle">#DD#</div>'
,p_day_open_format=>'<td class="m-Day #HAS_DATA#" data-date="#CANONICAL_DATE#">#TITLE_FORMAT#'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td class="m-Today #HAS_DATA#" data-date="#CANONICAL_DATE#">#TITLE_FORMAT#'
,p_weekend_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="content-primary" class="m-WeekendDayTitle">#DD#</div>',
''))
,p_weekend_open_format=>'<td class="m-WeekendDay #HAS_DATA#"  data-date="#CANONICAL_DATE#">#TITLE_FORMAT#'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'<div class="content-primary" class="m-NonDayTitle">#DD#</div>'
,p_nonday_open_format=>'<td class="m-NonDay"  data-date="#CANONICAL_DATE#">'
,p_nonday_close_format=>'</td>'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr> '
,p_weekly_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="m-WeekCalendar">',
'	<tr>',
'        <th scope="colgroup" class="m-monthTitle" colspan="7" >#WTITLE#</th>',
'	</tr>'))
,p_weekly_day_of_week_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<th scope="col" class="m-DayOfWeek" >#IDY# #MM#/#DD#</th>',
''))
,p_weekly_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table>',
'<script>',
'    // register a delegated event on the table listening for all taphold in TD''s',
'    apex.jQuery( "##REGION_STATIC_ID#" ).on( "taphold", "td[class^=m-]", function (e) {',
'        apex.widget.calendar.ajaxAddData(e);',
'    });',
'</script>'))
,p_weekly_day_open_format=>'<td class="m-Day">'
,p_weekly_day_close_format=>'</td>'
,p_weekly_today_open_format=>'<td class="m-Today">'
,p_weekly_weekend_open_format=>'<td class="m-NonDay">'
,p_weekly_weekend_close_format=>'</td>'
,p_weekly_time_open_format=>'<th scope="row" class="m-hour">'
,p_weekly_time_close_format=>'</th>'
,p_weekly_time_title_format=>'#TIME#'
,p_weekly_hour_open_format=>'<tr rowspan="2">'
,p_weekly_hour_close_format=>'</tr>'
,p_daily_day_of_week_format=>'<th scope="col" class="m-DayOfWeek">#IDAY# #DD# #IMONTH# #YYYY#</th>'
,p_daily_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table summary="#CALENDAR_TITLE# #START_DL#" class="m-DayCalendar"><tr>',
''))
,p_daily_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table>',
'<script>',
'    // register a delegated event on the table listening for all taphold in TD''s',
'    apex.jQuery( "##REGION_STATIC_ID#" ).on( "taphold", "td[class^=m-]", function (e) {',
'        apex.widget.calendar.ajaxAddData(e);',
'    });',
'</script>'))
,p_daily_day_open_format=>'<td class="m-Day">'
,p_daily_day_close_format=>'</td>'
,p_daily_today_open_format=>'<td class="m-ToDay">'
,p_daily_time_open_format=>'<th scope="row" class="m-hour">'
,p_daily_time_close_format=>'</th>'
,p_daily_time_title_format=>'#TIME#'
,p_daily_hour_open_format=>'<tr rowspan="2" >'
,p_daily_hour_close_format=>'</tr>'
,p_agenda_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul data-role="listview">',
'#DAYS#',
'</ul>',
''))
,p_agenda_past_day_format=>'<li data-role="list-divider" data-theme="a">#IDAY# #IMONTH# #DD# #YYYY#</li>'
,p_agenda_today_day_format=>'<li data-role="list-divider" data-theme="b">#IDAY# #IMONTH# #DD# #YYYY#</li>'
,p_agenda_future_day_format=>'<li  data-role="list-divider" >#IDAY# #IMONTH# #DD# #YYYY#</li>'
,p_agenda_past_entry_format=>'<li >#DATA#<p class="ui-li-aside">#TIME#</p></li>'
,p_agenda_today_entry_format=>'<li >#DATA#<p class="ui-li-aside">#TIME#</p></li>'
,p_agenda_future_entry_format=>'<li >#DATA#<p class="ui-li-aside">#TIME#</p></li>'
,p_month_data_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul id="listview_#REGION_STATIC_ID#" data-role="listview" data-inset="true" data-theme="a">#DAYS#</ul>',
''))
,p_month_data_entry_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li align="left" >#LINK##DATA#<p class="ui-li-aside">#TIME#</p></li>',
' '))
,p_theme_id=>51
,p_theme_class_id=>1
,p_reference_id=>3894606461977238251
);
end;
/
prompt --application/shared_components/user_interface/themes
begin
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(18181898451527259117)
,p_theme_id=>51
,p_theme_name=>'Mobile'
,p_ui_type_name=>'JQM_SMARTPHONE'
,p_navigation_type=>'L'
,p_nav_bar_type=>'NAVBAR'
,p_reference_id=>3773947624214896911
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(18181890182359259078)
,p_default_dialog_template=>wwv_flow_api.id(18181890024514259070)
,p_error_template=>wwv_flow_api.id(18181890182359259078)
,p_printer_friendly_template=>wwv_flow_api.id(18181890182359259078)
,p_login_template=>wwv_flow_api.id(18181890182359259078)
,p_default_button_template=>wwv_flow_api.id(18181897590311259106)
,p_default_region_template=>wwv_flow_api.id(18181892170254259093)
,p_default_chart_template=>wwv_flow_api.id(18181892170254259093)
,p_default_form_template=>wwv_flow_api.id(18181892170254259093)
,p_default_reportr_template=>wwv_flow_api.id(18181892338203259093)
,p_default_tabform_template=>wwv_flow_api.id(18181892170254259093)
,p_default_wizard_template=>wwv_flow_api.id(18181892170254259093)
,p_default_irr_template=>wwv_flow_api.id(18181892170254259093)
,p_default_report_template=>wwv_flow_api.id(18181892476915259093)
,p_default_label_template=>wwv_flow_api.id(18181893144514259099)
,p_default_calendar_template=>wwv_flow_api.id(18181897811065259107)
,p_default_list_template=>wwv_flow_api.id(18181892761991259097)
,p_default_nav_list_template=>wwv_flow_api.id(18181892634928259097)
,p_default_top_nav_list_temp=>wwv_flow_api.id(18181892634928259097)
,p_default_side_nav_list_temp=>wwv_flow_api.id(18181892954986259097)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_api.id(18181891097633259084)
,p_default_dialogr_template=>wwv_flow_api.id(18181892170254259093)
,p_default_option_label=>wwv_flow_api.id(18181893144514259099)
,p_default_header_template=>wwv_flow_api.id(18181891859869259092)
,p_default_footer_template=>wwv_flow_api.id(18181891675814259092)
,p_default_required_label=>wwv_flow_api.id(18181893200054259099)
,p_default_page_transition=>'SLIDE'
,p_default_popup_transition=>'POP'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(51),'#IMAGE_PREFIX#themes/theme_51/')
,p_css_file_urls=>'#THEME_IMAGES#css/5_0.css'
);
end;
/
prompt --application/shared_components/user_interface/theme_style
begin
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(18181898090493259111)
,p_theme_id=>51
,p_name=>'Blue'
,p_css_file_urls=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#themes/theme_51/css/blue/theme_style_blue.min.css',
'#IMAGE_PREFIX#themes/theme_51/css/blue/jquery.mobile.icons.min.css'))
,p_is_current=>false
,p_theme_roller_read_only=>false
,p_reference_id=>3558019537230577370
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(18181898129144259111)
,p_theme_id=>51
,p_name=>'Dark'
,p_css_file_urls=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#themes/theme_51/css/dark/theme_style_dark.min.css',
'#IMAGE_PREFIX#themes/theme_51/css/dark/jquery.mobile.icons.min.css'))
,p_is_current=>false
,p_theme_roller_read_only=>false
,p_reference_id=>3806542953350945495
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(18181898258228259111)
,p_theme_id=>51
,p_name=>'Default'
,p_css_file_urls=>'#IMAGE_PREFIX#themes/theme_51/css/default/theme_style_default.css'
,p_is_current=>true
,p_theme_roller_read_only=>false
,p_reference_id=>3768671220784242708
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(18181898340903259112)
,p_theme_id=>51
,p_name=>'Red'
,p_css_file_urls=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#themes/theme_51/css/red/theme_style_red.min.css',
'#IMAGE_PREFIX#themes/theme_51/css/red/jquery.mobile.icons.min.css'))
,p_is_current=>false
,p_theme_roller_read_only=>false
,p_reference_id=>3558019537227576001
);
end;
/
prompt --application/shared_components/user_interface/theme_files
begin
null;
end;
/
prompt --application/shared_components/user_interface/theme_display_points
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_opt_groups
begin
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(18181890504925259082)
,p_theme_id=>51
,p_name=>'MENU_PANEL_OPTIONS'
,p_display_name=>'Menu Panel Options'
,p_display_sequence=>1
,p_template_types=>'PAGE'
,p_help_text=>'The relationship of the menu panel to the page contents. Can either push the page over ("reveal"), re-flow the content to fit the panel content as a column ("push"), or sit over the content ("overlay").'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(18181893497710259103)
,p_theme_id=>51
,p_name=>'ICON_BUTTON'
,p_display_name=>'Icon Button'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(18181893933717259104)
,p_theme_id=>51
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
end;
/
prompt --application/shared_components/user_interface/template_options
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181890648331259082)
,p_theme_id=>51
,p_name=>'OVERLAY'
,p_display_name=>'Overlay'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(18181890182359259078)
,p_css_classes=>'overlay'
,p_group_id=>wwv_flow_api.id(18181890504925259082)
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181890761434259084)
,p_theme_id=>51
,p_name=>'PUSH'
,p_display_name=>'Push'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(18181890182359259078)
,p_css_classes=>'push'
,p_group_id=>wwv_flow_api.id(18181890504925259082)
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181890854578259084)
,p_theme_id=>51
,p_name=>'REVEAL'
,p_display_name=>'Reveal'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(18181890182359259078)
,p_css_classes=>'reveal'
,p_group_id=>wwv_flow_api.id(18181890504925259082)
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181893571974259103)
,p_theme_id=>51
,p_name=>'ICON_ACTION'
,p_display_name=>'Action'
,p_display_sequence=>100
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-icon-action'
,p_group_id=>wwv_flow_api.id(18181893497710259103)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181893682032259103)
,p_theme_id=>51
,p_name=>'ICON_ALERT'
,p_display_name=>'Alert'
,p_display_sequence=>110
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-icon-alert'
,p_group_id=>wwv_flow_api.id(18181893497710259103)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181893775979259103)
,p_theme_id=>51
,p_name=>'ICON_BACK'
,p_display_name=>'Back'
,p_display_sequence=>120
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-icon-back'
,p_group_id=>wwv_flow_api.id(18181893497710259103)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181893830314259104)
,p_theme_id=>51
,p_name=>'ICON_BARS'
,p_display_name=>'Bars'
,p_display_sequence=>130
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-icon-bars'
,p_group_id=>wwv_flow_api.id(18181893497710259103)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181894018081259104)
,p_theme_id=>51
,p_name=>'ICON_BOTTOM'
,p_display_name=>'Bottom'
,p_display_sequence=>50
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-btn-icon-bottom'
,p_group_id=>wwv_flow_api.id(18181893933717259104)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181894197269259104)
,p_theme_id=>51
,p_name=>'ICON_BULLETS'
,p_display_name=>'Bullets'
,p_display_sequence=>140
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-icon-bullets'
,p_group_id=>wwv_flow_api.id(18181893497710259103)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181894219187259104)
,p_theme_id=>51
,p_name=>'ICON_CALENDAR'
,p_display_name=>'Calendar'
,p_display_sequence=>150
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-icon-calendar'
,p_group_id=>wwv_flow_api.id(18181893497710259103)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181894385480259104)
,p_theme_id=>51
,p_name=>'ICON_CARAT_DOWN'
,p_display_name=>'Down'
,p_display_sequence=>160
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-icon-carat-d'
,p_group_id=>wwv_flow_api.id(18181893497710259103)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181894421662259104)
,p_theme_id=>51
,p_name=>'ICON_CARAT_LEFT'
,p_display_name=>'Left'
,p_display_sequence=>170
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-icon-carat-l'
,p_group_id=>wwv_flow_api.id(18181893497710259103)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181894576856259104)
,p_theme_id=>51
,p_name=>'ICON_CARAT_RIGHT'
,p_display_name=>'Right'
,p_display_sequence=>180
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-icon-carat-r'
,p_group_id=>wwv_flow_api.id(18181893497710259103)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181894690041259104)
,p_theme_id=>51
,p_name=>'ICON_CARAT_UP'
,p_display_name=>'Up'
,p_display_sequence=>190
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-icon-carat-u'
,p_group_id=>wwv_flow_api.id(18181893497710259103)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181894754734259104)
,p_theme_id=>51
,p_name=>'ICON_CHECK'
,p_display_name=>'Check'
,p_display_sequence=>210
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-icon-check'
,p_group_id=>wwv_flow_api.id(18181893497710259103)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181894874979259104)
,p_theme_id=>51
,p_name=>'ICON_CLOCK'
,p_display_name=>'Clock'
,p_display_sequence=>240
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-icon-clock'
,p_group_id=>wwv_flow_api.id(18181893497710259103)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181894907427259104)
,p_theme_id=>51
,p_name=>'ICON_CLOUD'
,p_display_name=>'Cloud'
,p_display_sequence=>220
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-icon-cloud'
,p_group_id=>wwv_flow_api.id(18181893497710259103)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181895036960259104)
,p_theme_id=>51
,p_name=>'ICON_COMMENT'
,p_display_name=>'Comment'
,p_display_sequence=>230
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-icon-comment'
,p_group_id=>wwv_flow_api.id(18181893497710259103)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181895112601259104)
,p_theme_id=>51
,p_name=>'ICON_DELETE'
,p_display_name=>'Delete'
,p_display_sequence=>200
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-icon-delete'
,p_group_id=>wwv_flow_api.id(18181893497710259103)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181895229417259104)
,p_theme_id=>51
,p_name=>'ICON_EDIT'
,p_display_name=>'Edit'
,p_display_sequence=>250
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-icon-edit'
,p_group_id=>wwv_flow_api.id(18181893497710259103)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181895311533259104)
,p_theme_id=>51
,p_name=>'ICON_GEAR'
,p_display_name=>'Gear'
,p_display_sequence=>260
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-icon-gear'
,p_group_id=>wwv_flow_api.id(18181893497710259103)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181895431326259104)
,p_theme_id=>51
,p_name=>'ICON_GRID'
,p_display_name=>'Grid'
,p_display_sequence=>270
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-icon-grid'
,p_group_id=>wwv_flow_api.id(18181893497710259103)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181895525760259105)
,p_theme_id=>51
,p_name=>'ICON_HOME'
,p_display_name=>'Home'
,p_display_sequence=>280
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-icon-home'
,p_group_id=>wwv_flow_api.id(18181893497710259103)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181895649194259105)
,p_theme_id=>51
,p_name=>'ICON_INFO'
,p_display_name=>'Info'
,p_display_sequence=>290
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-icon-info'
,p_group_id=>wwv_flow_api.id(18181893497710259103)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181895702933259105)
,p_theme_id=>51
,p_name=>'ICON_LEFT'
,p_display_name=>'Left'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-btn-icon-left'
,p_group_id=>wwv_flow_api.id(18181893933717259104)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181895857465259105)
,p_theme_id=>51
,p_name=>'ICON_LOCATION'
,p_display_name=>'Location'
,p_display_sequence=>300
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-icon-location'
,p_group_id=>wwv_flow_api.id(18181893497710259103)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181895934217259105)
,p_theme_id=>51
,p_name=>'ICON_LOCK'
,p_display_name=>'Lock'
,p_display_sequence=>310
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-icon-lock'
,p_group_id=>wwv_flow_api.id(18181893497710259103)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181896022908259105)
,p_theme_id=>51
,p_name=>'ICON_MAIL'
,p_display_name=>'Mail'
,p_display_sequence=>320
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-icon-mail'
,p_group_id=>wwv_flow_api.id(18181893497710259103)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181896148200259105)
,p_theme_id=>51
,p_name=>'ICON_MINUS'
,p_display_name=>'Minus'
,p_display_sequence=>330
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-icon-minus'
,p_group_id=>wwv_flow_api.id(18181893497710259103)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181896272229259105)
,p_theme_id=>51
,p_name=>'ICON_PHONE'
,p_display_name=>'Phone'
,p_display_sequence=>340
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-icon-phone'
,p_group_id=>wwv_flow_api.id(18181893497710259103)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181896321589259105)
,p_theme_id=>51
,p_name=>'ICON_PLUS'
,p_display_name=>'Plus'
,p_display_sequence=>350
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-icon-plus'
,p_group_id=>wwv_flow_api.id(18181893497710259103)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181896440584259105)
,p_theme_id=>51
,p_name=>'ICON_POWER'
,p_display_name=>'Power'
,p_display_sequence=>360
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-icon-power'
,p_group_id=>wwv_flow_api.id(18181893497710259103)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181896537428259105)
,p_theme_id=>51
,p_name=>'ICON_REFRESH'
,p_display_name=>'Refresh'
,p_display_sequence=>370
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-icon-refresh'
,p_group_id=>wwv_flow_api.id(18181893497710259103)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181896683297259105)
,p_theme_id=>51
,p_name=>'ICON_RIGHT'
,p_display_name=>'Right'
,p_display_sequence=>40
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-btn-icon-right'
,p_group_id=>wwv_flow_api.id(18181893933717259104)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181896731024259105)
,p_theme_id=>51
,p_name=>'ICON_SEARCH'
,p_display_name=>'Search'
,p_display_sequence=>380
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-icon-search'
,p_group_id=>wwv_flow_api.id(18181893497710259103)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181896862526259105)
,p_theme_id=>51
,p_name=>'ICON_STAR'
,p_display_name=>'Star'
,p_display_sequence=>390
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-icon-star'
,p_group_id=>wwv_flow_api.id(18181893497710259103)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181896999122259105)
,p_theme_id=>51
,p_name=>'ICON_TAG'
,p_display_name=>'Tag'
,p_display_sequence=>400
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-icon-tag'
,p_group_id=>wwv_flow_api.id(18181893497710259103)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181897002357259106)
,p_theme_id=>51
,p_name=>'ICON_TOP'
,p_display_name=>'Top'
,p_display_sequence=>30
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-btn-icon-top'
,p_group_id=>wwv_flow_api.id(18181893933717259104)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181897182412259106)
,p_theme_id=>51
,p_name=>'ICON_USER'
,p_display_name=>'User'
,p_display_sequence=>410
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-icon-user'
,p_group_id=>wwv_flow_api.id(18181893497710259103)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181897206015259106)
,p_theme_id=>51
,p_name=>'INLINE_BUTTON'
,p_display_name=>'Inline Button'
,p_display_sequence=>5
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-btn-inline'
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181897321994259106)
,p_theme_id=>51
,p_name=>'NO_TEXT'
,p_display_name=>'No Text'
,p_display_sequence=>60
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-btn-icon-notext'
,p_group_id=>wwv_flow_api.id(18181893933717259104)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181897468379259106)
,p_theme_id=>51
,p_name=>'ROUNDED_CORNERS'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_css_classes=>'ui-corner-all'
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181897637334259106)
,p_theme_id=>51
,p_name=>'INLINE_BUTTON'
,p_display_name=>'Inline Button'
,p_display_sequence=>1
,p_button_template_id=>wwv_flow_api.id(18181897590311259106)
,p_css_classes=>'ui-btn-inline'
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(18181897735468259106)
,p_theme_id=>51
,p_name=>'ROUNDED_CORNERS'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>1
,p_button_template_id=>wwv_flow_api.id(18181897590311259106)
,p_css_classes=>'ui-corner-all'
,p_template_types=>'BUTTON'
);
end;
/
prompt --application/shared_components/logic/build_options
begin
null;
end;
/
prompt --application/shared_components/globalization/language
begin
null;
end;
/
prompt --application/shared_components/globalization/translations
begin
null;
end;
/
prompt --application/shared_components/globalization/messages
begin
null;
end;
/
prompt --application/shared_components/globalization/dyntranslations
begin
null;
end;
/
prompt --application/shared_components/user_interface/shortcuts
begin
null;
end;
/
prompt --application/shared_components/security/authentications
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(18181898713365259133)
,p_name=>'No Authentication'
,p_scheme_type=>'NATIVE_DAD'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/user_interfaces
begin
wwv_flow_api.create_user_interface(
 p_id=>wwv_flow_api.id(18181898515517259123)
,p_ui_type_name=>'JQM_SMARTPHONE'
,p_display_name=>'Mobile'
,p_display_seq=>10
,p_use_auto_detect=>false
,p_is_default=>true
,p_theme_id=>51
,p_home_url=>'f?p=&APP_ID.:1:&SESSION.'
,p_global_page_id=>0
,p_navigation_list_id=>wwv_flow_api.id(18181889996849259068)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>wwv_flow_api.id(18181892954986259097)
,p_nav_list_template_options=>'#DEFAULT#'
,p_nav_bar_type=>'NAVBAR'
);
end;
/
prompt --application/user_interfaces/combined_files
begin
null;
end;
/
prompt --application/pages/page_00000
begin
wwv_flow_api.create_page(
 p_id=>0
,p_user_interface_id=>wwv_flow_api.id(18181898515517259123)
,p_name=>'Global Page - Mobile'
,p_page_mode=>'NORMAL'
,p_step_title=>'Global Page - Mobile'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'D'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20151123012635'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18181899150459259137)
,p_plug_name=>'Header'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(18181891859869259092)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'CURRENT_PAGE_NOT_IN_CONDITION'
,p_plug_display_when_condition=>'101'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
,p_plug_comment=>'Header'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18181899446362259138)
,p_plug_name=>'Footer'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(18181891675814259092)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_08'
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'CURRENT_PAGE_NOT_IN_CONDITION'
,p_plug_display_when_condition=>'101'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
,p_plug_comment=>'Footer'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18181899360184259138)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(18181899150459259137)
,p_button_name=>'LOGOUT'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(18181897590311259106)
,p_button_image_alt=>'Log Out'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'javascript:location.href="&LOGOUT_URL.";'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18181899267593259138)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(18181899150459259137)
,p_button_name=>'MENU'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:ui-btn-icon-notext:ui-icon-bars'
,p_button_template_id=>wwv_flow_api.id(18181893380994259100)
,p_button_image_alt=>'Menu'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_cattributes=>' data-direction="reverse"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(18181899501851259138)
,p_name=>'open panel'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(18181899267593259138)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(18181899501851259138)
,p_event_id=>wwv_flow_api.id(18181899501851259138)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$.mobile.activePage.find(''#menupanel'').panel("open");'
,p_stop_execution_on_error=>'Y'
);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(18181898515517259123)
,p_name=>'Home'
,p_page_mode=>'NORMAL'
,p_step_title=>'Home'
,p_step_sub_title=>'Home'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20151123012635'
);
end;
/
prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(18181898515517259123)
,p_name=>'P2RestfulReL'
,p_page_mode=>'NORMAL'
,p_step_title=>'P2RestfulReL'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADWIGHT@UTEXAS.EDU'
,p_last_upd_yyyymmddhh24miss=>'20151124150111'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18182901221310177445)
,p_plug_name=>'doREST'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(18181892170254259093)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(18182949504323177462)
,p_name=>'Results'
,p_template=>wwv_flow_api.id(18181892338203259093)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ',
'jt3.title title,',
'jt4.genre genre,',
'jt5.metascore metascore,',
'jt1.tname tname,',
'jt2.phone phone',
'from apex_collections t,',
'json_table(t.clob001, ''$.X0_1[*]'' COLUMNS rid for ordinality, tname varchar2(100) path ''$'') jt1,',
'json_table(t.clob001, ''$.X1_1[*]'' COLUMNS rid for ordinality, phone varchar2(50) path ''$'') jt2,',
'json_table(t.clob001, ''$.TITLE[*]'' COLUMNS rid for ordinality, title varchar2(50) path ''$'') jt3,',
'json_table(t.clob001, ''$.GENRE[*]'' COLUMNS rid for ordinality, genre varchar2(100) path ''$'') jt4,',
'json_table(t.clob001, ''$.METASCORE[*]'' COLUMNS rid for ordinality, metascore number path ''$'') jt5,',
'json_table(t.clob001, ''$.X2_1[*]'' COLUMNS rid for ordinality, zip varchar2(10) path ''$'') jt6',
'where t.collection_name = ''P2_DOREST_RESULTS'' and',
'jt1.rid = jt2.rid and jt2.rid = jt3.rid and jt3.rid = jt4.rid and jt4.rid = jt5.rid and jt5.rid = jt6.rid and',
'zip IS NOT NULL and',
'metascore >= :P2_META and',
'tname LIKE CONCAT(CONCAT(''%'',:P2_THEATRE),''%'')',
'order by zip, title'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'N'
,p_query_row_template=>wwv_flow_api.id(18181892476915259093)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data found.'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_query_row_count_max=>500
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(18345379707370433527)
,p_query_column_id=>1
,p_column_alias=>'TITLE'
,p_column_display_sequence=>3
,p_column_heading=>'Title'
,p_use_as_row_header=>'N'
,p_report_column_width=>32
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(18345379881476433528)
,p_query_column_id=>2
,p_column_alias=>'GENRE'
,p_column_display_sequence=>4
,p_column_heading=>'Genre'
,p_use_as_row_header=>'N'
,p_report_column_width=>20
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(18345379986255433529)
,p_query_column_id=>3
,p_column_alias=>'METASCORE'
,p_column_display_sequence=>5
,p_column_heading=>'Metascore'
,p_use_as_row_header=>'N'
,p_report_column_width=>8
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(18345379518612433525)
,p_query_column_id=>4
,p_column_alias=>'TNAME'
,p_column_display_sequence=>1
,p_column_heading=>'Tname'
,p_use_as_row_header=>'N'
,p_report_column_width=>20
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(18345379660953433526)
,p_query_column_id=>5
,p_column_alias=>'PHONE'
,p_column_display_sequence=>2
,p_column_heading=>'Phone'
,p_use_as_row_header=>'N'
,p_report_column_width=>20
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18182901655135177447)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(18182901221310177445)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(18181897590311259106)
,p_button_image_alt=>'Submit'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(18182902050672177448)
,p_branch_action=>'f?p=&APP_ID.:2:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18182902887566177451)
,p_name=>'P2_DB'
,p_item_sequence=>1
,p_item_plug_id=>wwv_flow_api.id(18182901221310177445)
,p_item_default=>'jdbc:oracle:thin:@sayonara.microlab.cs.utexas.edu:1521:orcl'
,p_source=>'jdbc:oracle:thin:@sayonara.microlab.cs.utexas.edu:1521:orcl'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18182903641858177454)
,p_name=>'P2_USER'
,p_item_sequence=>2
,p_item_plug_id=>wwv_flow_api.id(18182901221310177445)
,p_item_default=>'C##cs347_ad36457'
,p_source=>'C##cs347_ad36457'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18182904489298177455)
,p_name=>'P2_PASS'
,p_item_sequence=>3
,p_item_plug_id=>wwv_flow_api.id(18182901221310177445)
,p_item_default=>'orcl_ad36457'
,p_source=>'orcl_ad36457'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18182905274808177456)
,p_name=>'P2_MODE'
,p_item_sequence=>4
,p_item_plug_id=>wwv_flow_api.id(18182901221310177445)
,p_item_default=>'rdf_mode'
,p_source=>'rdf_mode'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18182906073769177457)
,p_name=>'P2_MODEL'
,p_item_sequence=>5
,p_item_plug_id=>wwv_flow_api.id(18182901221310177445)
,p_item_default=>'C7'
,p_source=>'C7'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18182906897262177457)
,p_name=>'P2_RETURNDIMENSIONS'
,p_item_sequence=>6
,p_item_plug_id=>wwv_flow_api.id(18182901221310177445)
,p_item_default=>'False'
,p_source=>'False'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18182907681160177458)
,p_name=>'P2_RETURNFOR'
,p_item_sequence=>7
,p_item_plug_id=>wwv_flow_api.id(18182901221310177445)
,p_item_default=>'Neo4j_JSON'
,p_source=>'Neo4j_JSON'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18182948469818177459)
,p_name=>'P2_QUERY'
,p_item_sequence=>8
,p_item_plug_id=>wwv_flow_api.id(18182901221310177445)
,p_item_default=>'"MATCH (b:movie)-[:playingat]->(a:ttr) RETURN a.tname, a.phone, a.zip, b.title, b.genre, b.metascore"'
,p_source=>'"MATCH (b:movie)-[:playingat]->(a:ttr) RETURN a.tname, a.phone, a.zip, b.title, b.genre, b.metascore"'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18345380057209433530)
,p_name=>'P2_INSTRUCTIONS'
,p_item_sequence=>18
,p_item_plug_id=>wwv_flow_api.id(18182901221310177445)
,p_prompt=>'Instructions'
,p_post_element_text=>'Welcome to the simple movie database. Select a theatre and minimum rating. Ratings range from 0 - 100. If no rating is input, you will see all options.'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(18181893144514259099)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18345380553523433535)
,p_name=>'P2_THEATRE'
,p_item_sequence=>38
,p_item_plug_id=>wwv_flow_api.id(18182901221310177445)
,p_prompt=>'Theatre'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Alamo Draft House;ALAMO DRAFT HOUSE,AMC Barton Creek;AMC BARTON CREEK,Bob Bullock Museum IMAX;BULLOCK MUSEUM IMAX,Galaxy Highland;GALAXY HIGHLAND,Regal Metropolitan Stadium 14;REGAL METROPOLITAN,Regal Westlake Stadium 11;REGAL WESTGATE'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(18181893144514259099)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18345380875176433538)
,p_name=>'P2_META'
,p_item_sequence=>58
,p_item_plug_id=>wwv_flow_api.id(18182901221310177445)
,p_item_default=>'0'
,p_prompt=>'Minimum Metascore rating'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(18181893144514259099)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'0'
,p_attribute_02=>'100'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18182902454961177449)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_WEB_SERVICE'
,p_process_name=>'Web Service Request'
,p_process_sql_clob=>'18182015657640103005:18182015810419103006'
,p_attribute_01=>wwv_flow_api.id(18182015810419103006)
,p_attribute_02=>'COLLECTION'
,p_attribute_03=>'P2_DOREST_RESULTS'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/shared_components/logic/webservices/p2restfulrel
begin
wwv_flow_api.create_web_service(
 p_id=>wwv_flow_api.id(18182015657640103005)
,p_name=>'P2RestfulReL'
,p_url=>'skipper.cs.utexas.edu:5001/rest/native/'
,p_action=>'REST'
,p_static_parm_04=>'GET'
,p_static_parm_05=>'json'
,p_static_parm_10=>'nvp'
);
wwv_flow_api.create_ws_operations(
 p_id=>wwv_flow_api.id(18182015810419103006)
,p_ws_id=>wwv_flow_api.id(18182015657640103005)
,p_name=>'doREST'
);
wwv_flow_api.create_ws_parameters(
 p_id=>wwv_flow_api.id(18182016107180103009)
,p_ws_opers_id=>wwv_flow_api.id(18182015810419103006)
,p_name=>'query'
,p_input_or_output=>'I'
,p_parm_type=>'string'
,p_type_is_xsd=>'Y'
);
wwv_flow_api.create_ws_process_parms_map(
 p_id=>wwv_flow_api.id(18182948863522177461)
,p_parameter_id=>wwv_flow_api.id(18182016107180103009)
,p_process_id=>wwv_flow_api.id(18182902454961177449)
,p_map_type=>'ITEM'
,p_parm_value=>'P2_QUERY'
);
wwv_flow_api.create_ws_parameters(
 p_id=>wwv_flow_api.id(18182016464707103011)
,p_ws_opers_id=>wwv_flow_api.id(18182015810419103006)
,p_name=>'json'
,p_input_or_output=>'O'
,p_parm_type=>'json'
,p_type_is_xsd=>'N'
);
wwv_flow_api.create_ws_parameters(
 p_id=>wwv_flow_api.id(18182049907787108381)
,p_ws_opers_id=>wwv_flow_api.id(18182015810419103006)
,p_name=>'DB'
,p_input_or_output=>'H'
,p_type_is_xsd=>'Y'
);
wwv_flow_api.create_ws_process_parms_map(
 p_id=>wwv_flow_api.id(18182903204807177453)
,p_parameter_id=>wwv_flow_api.id(18182049907787108381)
,p_process_id=>wwv_flow_api.id(18182902454961177449)
,p_map_type=>'ITEM'
,p_parm_value=>'P2_DB'
);
wwv_flow_api.create_ws_parameters(
 p_id=>wwv_flow_api.id(18182050267377108381)
,p_ws_opers_id=>wwv_flow_api.id(18182015810419103006)
,p_name=>'USER'
,p_input_or_output=>'H'
,p_type_is_xsd=>'Y'
);
wwv_flow_api.create_ws_process_parms_map(
 p_id=>wwv_flow_api.id(18182904008679177455)
,p_parameter_id=>wwv_flow_api.id(18182050267377108381)
,p_process_id=>wwv_flow_api.id(18182902454961177449)
,p_map_type=>'ITEM'
,p_parm_value=>'P2_USER'
);
wwv_flow_api.create_ws_parameters(
 p_id=>wwv_flow_api.id(18182050596327108382)
,p_ws_opers_id=>wwv_flow_api.id(18182015810419103006)
,p_name=>'PASS'
,p_input_or_output=>'H'
,p_type_is_xsd=>'Y'
);
wwv_flow_api.create_ws_process_parms_map(
 p_id=>wwv_flow_api.id(18182904863426177456)
,p_parameter_id=>wwv_flow_api.id(18182050596327108382)
,p_process_id=>wwv_flow_api.id(18182902454961177449)
,p_map_type=>'ITEM'
,p_parm_value=>'P2_PASS'
);
wwv_flow_api.create_ws_parameters(
 p_id=>wwv_flow_api.id(18182050813523108382)
,p_ws_opers_id=>wwv_flow_api.id(18182015810419103006)
,p_name=>'MODE'
,p_input_or_output=>'H'
,p_type_is_xsd=>'Y'
);
wwv_flow_api.create_ws_process_parms_map(
 p_id=>wwv_flow_api.id(18182905644416177456)
,p_parameter_id=>wwv_flow_api.id(18182050813523108382)
,p_process_id=>wwv_flow_api.id(18182902454961177449)
,p_map_type=>'ITEM'
,p_parm_value=>'P2_MODE'
);
wwv_flow_api.create_ws_parameters(
 p_id=>wwv_flow_api.id(18182051133443108382)
,p_ws_opers_id=>wwv_flow_api.id(18182015810419103006)
,p_name=>'MODEL'
,p_input_or_output=>'H'
,p_type_is_xsd=>'Y'
);
wwv_flow_api.create_ws_process_parms_map(
 p_id=>wwv_flow_api.id(18182906404986177457)
,p_parameter_id=>wwv_flow_api.id(18182051133443108382)
,p_process_id=>wwv_flow_api.id(18182902454961177449)
,p_map_type=>'ITEM'
,p_parm_value=>'P2_MODEL'
);
wwv_flow_api.create_ws_parameters(
 p_id=>wwv_flow_api.id(18182051484032108382)
,p_ws_opers_id=>wwv_flow_api.id(18182015810419103006)
,p_name=>'returnDimensions'
,p_input_or_output=>'H'
,p_type_is_xsd=>'Y'
);
wwv_flow_api.create_ws_process_parms_map(
 p_id=>wwv_flow_api.id(18182907248063177458)
,p_parameter_id=>wwv_flow_api.id(18182051484032108382)
,p_process_id=>wwv_flow_api.id(18182902454961177449)
,p_map_type=>'ITEM'
,p_parm_value=>'P2_RETURNDIMENSIONS'
);
wwv_flow_api.create_ws_parameters(
 p_id=>wwv_flow_api.id(18182051778562108383)
,p_ws_opers_id=>wwv_flow_api.id(18182015810419103006)
,p_name=>'returnFor'
,p_input_or_output=>'H'
,p_type_is_xsd=>'Y'
);
wwv_flow_api.create_ws_process_parms_map(
 p_id=>wwv_flow_api.id(18182948024496177458)
,p_parameter_id=>wwv_flow_api.id(18182051778562108383)
,p_process_id=>wwv_flow_api.id(18182902454961177449)
,p_map_type=>'ITEM'
,p_parm_value=>'P2_RETURNFOR'
);
end;
/
prompt --application/deployment/definition
begin
wwv_flow_api.create_install(
 p_id=>wwv_flow_api.id(18351774505916978351)
);
end;
/
prompt --application/deployment/install
begin
null;
end;
/
prompt --application/deployment/checks
begin
null;
end;
/
prompt --application/deployment/buildoptions
begin
null;
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
