/// @description Insert description here
// You can write your code in this editor
 var res= WWISE_RegisterGameObj(id, "Emitter");
 
 WWISE_PostEvent("Music", id);
 
 show_debug_message(res)
 
window_set_cursor(cr_none)