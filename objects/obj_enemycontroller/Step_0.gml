/// @description Insert description here
// You can write your code in this editor

if(global.body_count>10)
{
	global.upgrade = true;
	global.body_count = 0;
}

frame_counter++;
if (frame_counter >= refresh_rate) {
    spawn_interval = random_range(min_value, max_value);
    frame_counter = 0;
}

switch (state) {
    case EnemyState.GENERATE:
        if (global.enemy_count < max_enemies) {
            spawn_timer += 1;
            if (spawn_timer >= spawn_interval) {
                var new_enemy = instance_create_layer(350, -20, "Enemies", obj_enemy);
				var offset = choose(-100, 0, 100);
				new_enemy.x += offset;
                spawn_timer = 0;
                global.enemy_count += 1;
            }
        } else {
            state = EnemyState.STOP;
        }
        break;
    
    case EnemyState.STOP:
        // 停止生成敌人，不执行生成逻辑
        // 可以在这里添加其他逻辑，比如检查敌人是否被消灭等
        break;
}