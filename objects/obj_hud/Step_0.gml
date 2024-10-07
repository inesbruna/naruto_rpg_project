/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
image_speed = 0.3;

if(!instance_exists(obj_mouse)){
	instance_create_depth(0,0,-999,obj_mouse);	
}

if(!open_inventory){
	if(instance_exists(obj_mouse)){
		instance_destroy(obj_mouse);	
	}	
}
