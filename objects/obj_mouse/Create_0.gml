/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
depth = -9999;
inventoryHover = -1;
slotHover = -1;
inventoryDrag = -1;
slotDrag = -1;
itemDrag = -1;

mouseOver = function(){
	//empty hover results
	slotHover = -1;
	inventoryHover = -1;
	
	//mouse coordinates
	var mx = (window_mouse_get_x()/window_get_width()) * display_get_gui_width();
	var my = (window_mouse_get_y()/window_get_height()) * display_get_gui_height();
	
	//check for inventory slot hover (inventory)
	with (obj_hud){
		if (point_in_rectangle
		(
			mx,
			my,
			500,
			130,
			1515,
			1047
		))
		{
			//check for mouseover in each slot
			for (var i = 0; i < INVENTORY_SLOTS; i += 1)
			{
				var xx = 577 + (i mod rowLength) * 108 + 2;
				var yy = 370 + (i div rowLength) * 108 + 2;
				if (point_in_rectangle(mx, my, xx, yy, xx+96, yy+96)){
					other.slotHover = i;
					other.inventoryHover = id;
				}
			}
		}
	}
	//check for inventory slot hover (equipments)
	with (obj_equipments){
		if (point_in_rectangle
		(
			mx,
			my,
			500,
			130,
			1515,
			1047
		))
		{
			//check for mouseover in each slot
			var xx = 1248 + (1 mod rowLength) * 108 + 2;
			var yy = 253 + (1 div rowLength) * 108 + 2;
			if (point_in_rectangle(mx, my, xx-133, yy+208, xx-37, yy+304)){ //weapon slot
				other.slotHover = 0;
				other.inventoryHover = id;
			}
			if (point_in_rectangle(mx, my, xx, yy, xx+96, yy+96)){ //head slot
				other.slotHover = 1;
				other.inventoryHover = id;
			}
			if (point_in_rectangle(mx, my, xx, yy+145, xx+96, yy+241)){ //chest slot
				other.slotHover = 2;
				other.inventoryHover = id;
			} 
			if (point_in_rectangle(mx, my, xx, yy+280, xx+96, yy+376)){ //pants slot
				other.slotHover = 3;
				other.inventoryHover = id;
			} 
			if (point_in_rectangle(mx, my, xx, yy+415, xx+96, yy+511)){ //boots slot
				other.slotHover = 4;
				other.inventoryHover = id;
			} 
			if (point_in_rectangle(mx, my, xx+131, yy+73, xx+227, yy+169)){ //scroll slot
				other.slotHover = 5;
				other.inventoryHover = id;
			} 
			if (point_in_rectangle(mx, my, xx+131, yy+208, xx+227, yy+304)){ //gloves slot
				other.slotHover = 6;
				other.inventoryHover = id;
			}
			if (point_in_rectangle(mx, my, xx-108, yy+547, xx-12, yy+643)){ //ring 1 slot
				other.slotHover = 7;
				other.inventoryHover = id;
			}
			if (point_in_rectangle(mx, my, xx, yy+547, xx+96, yy+643)){ //amulet slot
				other.slotHover = 8;
				other.inventoryHover = id;
			} 
			if (point_in_rectangle(mx, my, xx+108, yy+547, xx+204, yy+643)){ //ring 2 slot
				other.slotHover = 9;
				other.inventoryHover = id;
			} 
			if (point_in_rectangle(mx, my, xx+131, yy+343, xx+227, yy+439)){ //costume slot
				other.slotHover = 10;
				other.inventoryHover = id;
			} 
		}
	}
}	
	
stateFree = function(){
	mouseOver();
	if (mouse_check_button(mb_left)) && (slotHover != -1) && (inventoryHover.inventory[slotHover] != -1){
		//Enter drag state
		state = stateDrag;
		itemDrag = inventoryHover.inventory[slotHover];
		inventoryDrag = inventoryHover;
		slotDrag = slotHover;
	} else if (mouse_check_button_released(mb_right)) && (slotHover != -1) && (inventoryHover.inventory[slotHover] != -1) && (inventoryHover = obj_hud.id){
		InventoryUse(slotHover);
	}
}

stateDrag = function(){
	mouseOver();
	if (!mouse_check_button(mb_left)){
		//Swap with slot if hovering
		if (slotHover != -1){
			InventorySwap(inventoryDrag, slotDrag, inventoryHover, slotHover);	
			//Return to free state
			state = stateFree;
			itemDrag = -1;
			inventoryDrag = -1;
			slotDrag = -1;
		} else {
			//go to stateThrow
			state = stateThrow;
			itemDrag = -1;
		}
	}
}

stateThrow = function(){
	//mouse coordinates
	var mx = (window_mouse_get_x()/window_get_width()) * display_get_gui_width();
	var my = (window_mouse_get_y()/window_get_height()) * display_get_gui_height();
	xx = 750;
	yy = 230;
	if point_in_circle(mx, my, xx+400, yy+152, 36)
	{
		if (mouse_check_button_pressed(mb_left)){
			//Return to free state
			state = stateFree;
			inventoryDrag.inventory[slotDrag] = -1;
			obj_hud.stack[slotDrag] -= 1;
			inventoryDrag = -1;
			slotDrag = -1;
		}
	}
	if point_in_circle(mx, my, xx+490, yy+152, 36)
	{
		if (mouse_check_button_pressed(mb_left)){
			//Return to free state
			state = stateFree;
			inventoryDrag = -1;
			slotDrag = -1;
		}
	}
}

state = stateFree;