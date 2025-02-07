local hud_colour = "light"
local efb_up_button_begin = 0
local efb_down_button_begin = 0
local efb_save_buttn_begin = 0
--------------------------------------------------------------


include("libs/table.save.lua")

--MOUSE & BUTTONS--
function EFB_execute_page_4_buttons()
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 642,618,673,745, function ()
        set(VOLUME_ext, get(VOLUME_ext)-0.1)
        --print("ext_down")
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 1042,618,1073,745, function ()
        set(VOLUME_ext, get(VOLUME_ext)+0.1)
        --print("ext_up")
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 642,557,673,584, function ()
        set(VOLUME_int, get(VOLUME_int)-0.1)
        --print("int_down")
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 1042,557,1073,584, function ()
        set(VOLUME_int, get(VOLUME_int)+0.1)
        --print("int_up")
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 642,497,673,525, function ()
        set(VOLUME_wind, get(VOLUME_wind)-0.1)
        --print("wind_down")
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 1042,497,1073,525, function ()
        set(VOLUME_wind, get(VOLUME_wind)+0.1)
        --print("wind_up")
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 642,437,673,466, function ()
        set(VOLUME_cabin, get(VOLUME_cabin)-0.1)
        --print("cabin_down")
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 1042,437,1073,466, function ()
        set(VOLUME_cabin, get(VOLUME_cabin)+0.1)
        --print("cabin_up")
    end)

    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 69,594,136,623, function ()
        hud_colour = "light"
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 154,594,221,623, function ()
        hud_colour = "dark"
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 110,537,179,567, function ()
        efb_up_button_begin = get(TIME)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 110,495,179,526, function ()
        efb_down_button_begin = get(TIME)
    end)

    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 414,46,738,90, function ()
        efb_save_buttn_begin = get(TIME)
    end)

    --Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 751,150,972,174, function ()
    --    table.save(EFB_preferences, moduleDirectory .. "/Custom Module/saved_configs/EFB_preferences")
    --end)
    
----------------------------------------------TOGGLE OPTIONS
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 620,363,659,381, function ()
        EFB_preferences["syncqnh"] = 1 - EFB_preferences["syncqnh"]
        --print("toggle_options_sync")
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 620,329,659,347, function ()
        EFB_preferences["rolltonws"] = 1 - EFB_preferences["rolltonws"]
        --print("toggle_options_roll")
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 620,295,659,313, function ()
        EFB_preferences["tca"] = 1 - EFB_preferences["tca"]
        --print("toggle_options_tca")
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 620,261,659,279, function ()
        EFB_preferences["pausetd"] = 1 - EFB_preferences["pausetd"]
        --print("toggle_options_pausetd")
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 620,227,659,245, function ()
        EFB_preferences["copilot"] = 1 - EFB_preferences["copilot"]
        --print("toggle_options_callout")
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 620,193,659,211, function ()
        set(FBW_mode_transition_version, 1 - get(FBW_mode_transition_version))
        EFB_preferences["flarelaw"] = get(FBW_mode_transition_version)
        --print("toggle_flarelaw_mode")
    end)
end

--UPDATE LOOPS--
function EFB_update_page_4()
    if get(VOLUME_ext) > 1 then
        set(VOLUME_ext, 1)
    elseif get(VOLUME_ext) < 0 then
        set(VOLUME_ext, 0)
    end

    if get(VOLUME_int) > 1 then
        set(VOLUME_int, 1)
    elseif get(VOLUME_int) < 0 then
        set(VOLUME_int, 0)
    end

    if get(VOLUME_wind) > 1 then
        set(VOLUME_wind, 1)
    elseif get(VOLUME_wind) < 0 then
        set(VOLUME_wind, 0)
    end

    if get(VOLUME_cabin) > 1 then
        set(VOLUME_cabin, 1)
    elseif get(VOLUME_cabin) < 0 then
        set(VOLUME_cabin, 0)
    end
end

--DRAW LOOPS--
function EFB_draw_page_4()


    if hud_colour == "light" then
        SASL_drawSegmentedImg_xcenter_aligned (EFB_highlighter, 102,580,192,58,2,1)
        SASL_drawSegmentedImg_xcenter_aligned (EFB_highlighter, 188,580,192,58,2,2)
        sasl.gl.drawTexture ( EFB_CONFIG_hud, 0 , 0 , 1143 , 800 , 0,255/255,0 )
    else
        SASL_drawSegmentedImg_xcenter_aligned (EFB_highlighter, 102,580,192,58,2,2)
        SASL_drawSegmentedImg_xcenter_aligned (EFB_highlighter, 188,580,192,58,2,1)
        sasl.gl.drawTexture ( EFB_CONFIG_hud, 0 , 0 , 1143 , 800 , 0,170/255,0 )
    end


    if get(TIME) - efb_up_button_begin < 0.5 then
    SASL_drawSegmentedImg_xcenter_aligned (EFB_highlighter, 144,524,192,58,2,2)
    else
    SASL_drawSegmentedImg_xcenter_aligned (EFB_highlighter, 144,524,192,58,2,1)
    end


    if get(TIME) - efb_down_button_begin < 0.5 then
    SASL_drawSegmentedImg_xcenter_aligned (EFB_highlighter, 144,482,192,58,2,2)
    else
    SASL_drawSegmentedImg_xcenter_aligned (EFB_highlighter, 144,482,192,58,2,1)
    end


    if get(TIME) - efb_save_buttn_begin < 0.5 then
    SASL_drawSegmentedImg_xcenter_aligned (EFB_CONFIG_save, 577,54,634,32,2,2)
    else
    SASL_drawSegmentedImg_xcenter_aligned (EFB_CONFIG_save, 577,54,634,32,2,1)
    end


    sasl.gl.drawTexture ( EFB_CONFIG_bgd, 0 , 0 , 1143 , 800 , ECAM_WHITE )
    sasl.gl.drawTexture ( EFB_CONFIG_slider, get(VOLUME_ext)*333+680 , 619 , 22 , 22 , ECAM_WHITE )
    sasl.gl.drawTexture ( EFB_CONFIG_slider, get(VOLUME_int)*333+680 , 559 , 22 , 22 , ECAM_WHITE )
    sasl.gl.drawTexture ( EFB_CONFIG_slider, get(VOLUME_wind)*333+680 , 499 , 22 , 22 , ECAM_WHITE )
    sasl.gl.drawTexture ( EFB_CONFIG_slider, get(VOLUME_cabin)*333+680 , 439 , 22 , 22 , ECAM_WHITE )

    SASL_drawSegmentedImg_xcenter_aligned (EFB_toggle, 640, 364, 78, 18, 2, EFB_preferences["syncqnh"] == 1 and 2 or 1)
    SASL_drawSegmentedImg_xcenter_aligned (EFB_toggle, 640, 330, 78, 18, 2, EFB_preferences["rolltonws"] == 1 and 2 or 1)
    SASL_drawSegmentedImg_xcenter_aligned (EFB_toggle, 640, 296, 78, 18, 2, EFB_preferences["tca"] == 1 and 2 or 1)
    SASL_drawSegmentedImg_xcenter_aligned (EFB_toggle, 640, 262, 78, 18, 2, EFB_preferences["pausetd"] == 1 and 2 or 1)
    SASL_drawSegmentedImg_xcenter_aligned (EFB_toggle, 640, 228, 78, 18, 2, EFB_preferences["copilot"] == 1 and 2 or 1)
    SASL_drawSegmentedImg_xcenter_aligned (EFB_toggle, 640, 194, 78, 18, 2, EFB_preferences["flarelaw"] == 1 and 2 or 1)
    --print(EFB_CURSOR_X, EFB_CURSOR_Y)


end