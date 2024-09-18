/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (other.player == self) exit;
global.player_health -= 5;
hitting = true;
alarm[1]=30;
audio_play_sound(snd_hit, 1, 0);
if(selection==0){
	sprite_index = narutoHit;
} 
if(selection==1){
	sprite_index = spr_sasuke_hit; 
}
