function InventorySearch(rootObject, itemType){ //Procura slots disponíveis
	for (var i = 0; i < INVENTORY_SLOTS; i += 1){
		if (rootObject.inventory[i] == itemType){
			return(i);	
		}
	}
	return(-1);
}

function InventoryRemove(rootObject, itemType){
	var _slot = InventorySearch(rootObject, itemType);
	if (_slot != -1){
		with (rootObject) inventory[_slot] = -1;
		obj_hud.stack[_slot] = 0;
		return true;
	}
	else return false;
}

function InventoryAdd(rootObject, itemType){
	var _slot = InventorySearch(rootObject, -1);
	if (_slot != -1){
		obj_hud.stack[_slot] += 1;
		rootObject.inventory[_slot] = itemType;
		return true;
	}
	else return false;
}

function IdSearch(target){ //Checa se o slot permitido de um item é igual ao slot que o usuário quer utilizar
	with(obj_game.s_items){ //Verificar slot
		var items = variable_struct_get_names(obj_game.s_items);
		for (var i = array_length(items)-1; i >= 0; --i) {
			var k = items[i];
			var v = variable_struct_get(obj_game.s_items, k);
			if(target == v.item_id){
				var slot = v.slot;
				return slot;
			}
		}
	}
	return -1;
}

function InventorySwap(objectFrom,slotFrom,objectTo,slotTo){
	//Variáveis
	var _itemFrom = objectFrom.inventory[slotFrom];
	var _itemTo = objectTo.inventory[slotTo];
	var _valFrom = obj_hud.stack[slotFrom];
	var _valTo = obj_hud.stack[slotTo];
	//CASO 1: inventário para inventário
	if(objectFrom != obj_equipments.id && objectTo != obj_equipments.id){
		if(_itemFrom == _itemTo){
		//caso os itens sejam iguais
			if(IdSearch(_itemFrom) == noone){
				objectFrom.inventory[slotFrom] = -1;
				obj_hud.stack[slotFrom] = 0;
				obj_hud.stack[slotTo] += _valFrom;
			} 
		} else {
		//caso os itens sejam diferentes
		objectFrom.inventory[slotFrom] = objectTo.inventory[slotTo];
		objectTo.inventory[slotTo] = _itemFrom;
		obj_hud.stack[slotFrom] =  _valTo;
		obj_hud.stack[slotTo] = _valFrom;
		}
	//CASO 2: inventário para equipamento (equipar)
	} else if (objectFrom != obj_equipments.id && objectTo == obj_equipments.id){
		slot = IdSearch(_itemFrom);
		if(slot != -1){
			if(_itemTo == -1){
				if((slot == slotTo) || (slot == 7 && slotTo == 9)){ //Equipar
					objectFrom.inventory[slotFrom] = objectTo.inventory[slotTo];
					objectTo.inventory[slotTo] = _itemFrom;
					InventoryEquipment(_itemFrom);
					obj_hud.stack[slotFrom] = 0;
				}
			} else {
				if(slot == slotTo || slot == 7 && slotTo == 9){ //Equipar
					objectFrom.inventory[slotFrom] = objectTo.inventory[slotTo];
					objectTo.inventory[slotTo] = _itemFrom;
					InventoryDesequipment(_itemTo);
					InventoryEquipment(_itemFrom);
				}
			}
		}
	//CASO 3: equipamento para inventário (desequipar)
	} else if (objectFrom == obj_equipments.id && objectTo != obj_equipments.id){
		slot = IdSearch(_itemTo);
		if(slot == slotFrom){ //Desequipar
			objectFrom.inventory[slotFrom] = objectTo.inventory[slotTo];
			objectTo.inventory[slotTo] = _itemFrom;
			InventoryDesequipment(_itemFrom);
			InventoryEquipment(_itemTo);
		} if(_itemTo == -1){
			objectFrom.inventory[slotFrom] = objectTo.inventory[slotTo];
			objectTo.inventory[slotTo] = _itemFrom;
			InventoryDesequipment(_itemFrom);
			obj_hud.stack[slotTo] = 1;
		}
		//CASO 4: equipamento para equipamento (anéis)
	} else {
		if((slotTo == 7 || slotTo == 9) && (slotFrom == 7 || slotFrom == 9)){
			objectFrom.inventory[slotFrom] = objectTo.inventory[slotTo];
			objectTo.inventory[slotTo] = _itemFrom;
		}
	}
}

function InventoryEquipment(item){ //Verifica se um item esta sendo equipado e aplica o status
	audio_play_sound(snd_slash, 0, 0); //Verificar item e aplicar status
	var items = variable_struct_get_names(obj_game.s_items);
	for (var i = array_length(items)-1; i >= 0; --i) {
		var k = items[i];
		var v = variable_struct_get(obj_game.s_items, k);
		if(item == v.item_id){
			global.player_healthmax += v.hp;
			global.player_chakramax += v.chakra;
			global.player_strength += v.strength;
			global.player_intelligence += v.intelligence;
		}
	}
	//FOR COSTUMES
	if (item = 29){
		//In developtment
	}
}

function InventoryDesequipment(item){ //Verifica se um item esta sendo desequipado e desaplica o status
	audio_play_sound(snd_slash, 0, 0); //Verificar item e desaplicar status
	var items = variable_struct_get_names(obj_game.s_items);
	for (var i = array_length(items)-1; i >= 0; --i) {
		var k = items[i];
		var v = variable_struct_get(obj_game.s_items, k);
		if(item == v.item_id){
			global.player_healthmax -= v.hp;
			global.player_chakramax -= v.chakra;
			global.player_strength -= v.strength;
			global.player_intelligence -= v.intelligence;
		}
	}
	//FOR COSTUMES
	if (item = 29){
		//In developtment
	}
}

function InventoryUse(slot){ //Consumíveis
	switch(obj_hud.inventory[slot]){	
		case 9: global.player_chakra += 50; obj_hud.stack[slot] -= 1; audio_play_sound(snd_item, 0, 0); if(obj_hud.stack[slot] == 0) { obj_hud.inventory[slot] = -1; } break;
		case 10: global.player_health += 20; obj_hud.stack[slot] -= 1; audio_play_sound(snd_item, 0, 0); if(obj_hud.stack[slot] == 0) { obj_hud.inventory[slot] = -1; } break;	
		case 11: global.player_health += 40; obj_hud.stack[slot] -= 1; audio_play_sound(snd_item, 0, 0); if(obj_hud.stack[slot] == 0) { obj_hud.inventory[slot] = -1; } break;	
		case 13: global.player_chakra += 20; obj_hud.stack[slot] -= 1; audio_play_sound(snd_item, 0, 0); if(obj_hud.stack[slot] == 0) { obj_hud.inventory[slot] = -1; } break;	
	}
}
