// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function muda_sprite(_sprite){
	
	if(sprite_index != _sprite){
		
		sprite_index = _sprite;
		image_index = 0;
	
	}

}

function transicao(_room)
{
	var _transicao = instance_create_layer(0,0,layer,obj_transicao);
	_transicao.room_destino = _room;
	
	
}
	
	
	