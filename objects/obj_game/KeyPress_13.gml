/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if(global.player_health <= 0){
	global.player_health = global.player_healthmax;
	if(room != konoha) { room_goto(konoha); }
	obj_player.x = 100;
	obj_player.y = 148;
	obj_player.state = "free";
}