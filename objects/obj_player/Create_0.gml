/// @description Controle do jogador

event_inherited();

velocidade = 5;
gravidade = 0.3;
forca_pulo = -7;
qntd_pulos = 0;
max_pulos = 2;

sprite_parado = spr_guardiao;
sprite_direita = spr_correndo;
sprite_double_jump = spr_double_jump;
sprite_wall_jump= spr_wall_jump;
sprite_fall = spr_fall;
sprite_pulo = spr_pulando;

move_checkpoint = false;

function input_player() {
    var _left = keyboard_check(ord("A"));
    var _right = keyboard_check(ord("D"));
	
    var _jump = keyboard_check_pressed(vk_space);
	
	_xDirection = _right - _left;

    velh = (_right - _left) * velocidade;
	

    var _no_chao = place_meeting(x, y + 1, obj_obstaculo);
	var _na_parede = place_meeting(x +(_xDirection),y,obj_obstaculo);

    // Direção do sprite
    if (_xDirection != 0) {
        image_xscale = _xDirection;
    }

    // Escolher sprite
    if (_no_chao) {
        if (_xDirection != 0) {
			sprite_index = sprite_direita;
			}
        else {
			sprite_index = sprite_parado;
			}
    }
	
	else if (_na_parede){
		sprite_index = sprite_wall_jump
		}
	
	else { 
		if (qntd_pulos ==(max_pulos-1)){
			sprite_index = sprite_pulo;
			}
			else {
				sprite_index = sprite_double_jump;
			}
			
			if(velv >0){
				sprite_index=sprite_fall;	
			}
			
	}
				

    // Pulo e gravidade
// Pulo e gravidade
if (_no_chao) {
    qntd_pulos = 0; // reseta ao tocar o chão
    if (_jump) {
        velv = forca_pulo;
        qntd_pulos++; // agora é 1
    }
} 
else {
    if (_jump && qntd_pulos < max_pulos) {
        velv = forca_pulo;
        qntd_pulos++; // segundo pulo agora é 2
    }
    velv += gravidade;
}

}

