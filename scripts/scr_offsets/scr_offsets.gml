// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_offsets(){
	offsets = {
	    free: {
			stance: {
				ears: [0, -55], 
				tail: [-18, -12]  
			},
			running: {
				ears: [-2, -34], 
				tail: [-26, -9] 
			} 
	    },
		jumping: {
	        ears: [5, -58], 
	        tail: [-20, -16] 
	    },
	    falling: {
	        ears: [5, -58], 
	        tail: [-20, -16]   
	    },
		hit: {
	        ears: [4, -55], 
	        tail: [-18, -12]   
	    },
		defense: {
	        ears: [2, -54],
	        tail: [-22, -10]  
	    },
		dead: {
	        ears: [0, 0],
	        tail: [0, 0]  
	    },
		charge: {
	        ears: [7, -54],
	        tail: [-21, -13]  
	    },
		combo: {
			combo1: {
				ears: [-15, -58], //Arrumar aqui por frame
				tail: [-21, -14] 
			},
			combo2: {
		        ears: [9, -48], 
		        tail: [-16, -14]  
		    },
			combo3: {
		        ears: [-3, -53], 
		        tail: [-16, -12]  
		    }
	    },
		down: {
	        ears: [-1, -35], 
	        tail: [-20, -9]  
	    },
		dash: {
	        ears: [5, -58], 
	        tail: [-20, -16] 
	    },
		wait: {
	        ears: [0, 0],
	        tail: [0, 0]  
	    },
		transform: {
	        ears: [10, -25],
	        tail: [-10, -5]  
	    },
		detransform: {
	        ears: [0, 0],
	        tail: [0, 0]  
	    },
		chargingChakra: {
	        ears: [0, 0],
	        tail: [0, 0]  
	    },
		jutsuSpit: {
	        ears: [0, 0],
	        tail: [0, 0]  
	    },
		jutsuDashFromDown: {
	        ears: [0, 0],
	        tail: [0, 0]  
	    },
		clon: {
	        ears: [0, 0],
	        tail: [0, 0]  
	    },
		jumpJutsuSpit: {
	        ears: [0, 0],
	        tail: [0, 0]  
	    }
	};
}