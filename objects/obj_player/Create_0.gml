/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


// Inherit the parent event
event_inherited();

velv = 0;
velh = 0;
velocidade = 5;
gravidade = .3;

forca_pulo = -9;

function input_player()
{
	var _left, _right, _jump;
	_left = keyboard_check(ord("A"));
	_right = keyboard_check(ord("D"));
	
	_jump = keyboard_check(vk_space);
	
	velh = (_right - _left) * velocidade;
	
	var _no_chao = place_meeting(x, y+1, obj_obstaculo);
	
	if(_no_chao)
	{
		if(_jump)
		{
			velv = forca_pulo;	
		}
	}
	else
	{
		velv += gravidade;	
	}	
}
