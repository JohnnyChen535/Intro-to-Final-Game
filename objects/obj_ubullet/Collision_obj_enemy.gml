/// @description Insert description here
// You can write your code in this editor
if(!bullet_hit){
	audio_play_sound(snd_lavaballhit, 9, false);
bullet_hit = true;
alarm[0] = game_get_speed(gamespeed_fps)*0.75;
}
