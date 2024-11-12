/// @description Insert description here
// You can write your code in this editor
enum EnemyState {
    GENERATE,  
    STOP       
}

global.body_count = 0;
global.enemy_count = 0;                
max_enemies = 30;                   
spawn_timer = 0;                
state = EnemyState.GENERATE; 

min_value = 50;
max_value = 200;
refresh_rate = 30;    
frame_counter = 0;    
spawn_interval = random_range(min_value, max_value);