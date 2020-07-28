/// @description Insert description here
// You can write your code in this editor



draw_set_font(font0);
draw_text(50, 50, "Init Result: " + string(obj_wwise.initResult));
draw_text(50, 100, "Init Bank: " + string(obj_wwise.initBankResult));
draw_text(50, 150, "Test Bank: " + string(obj_wwise.testBankResult));
draw_text(50, 200, "Music State: " + currentState);
draw_text(50, 250, "Global RTPC: " + string(currentRTPC));
draw_text(50, 300, "GameObject RTPC: " + string(pitchRTPC));