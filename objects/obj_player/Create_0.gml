/// @description Controle do jogador

event_inherited();

velocidade = 2;
gravidade = 0.4;
forca_pulo = -8;

sprite_parado = spr_parado;
sprite_direita = spr_andando_direita;

function input_player() {
    var _left = keyboard_check(ord("A"));
    var _right = keyboard_check(ord("D"));
    var _jump = keyboard_check_pressed(vk_space);
    var _xDirection = _right - _left;

    velh = _xDirection * velocidade;
    var _no_chao = place_meeting(x, y + 1, obj_obstaculo);

    // Direção do sprite
    if (_xDirection != 0) {
        image_xscale = _xDirection;
    }

    // Escolher sprite
    if (_no_chao) {
        if (_xDirection != 0) sprite_index = sprite_direita;
        else sprite_index = sprite_parado;
    }

    // Pulo e gravidade
    if (_no_chao) {
        if (_jump) velv = forca_pulo;
    } else {
        velv += gravidade;
    }

    // Movimento com colisão
    if (!place_meeting(x + velh, y, obj_obstaculo)) {
        x += velh;
    }

    if (!place_meeting(x, y + velv, obj_obstaculo)) {
        y += velv;
    } else {
        while (!place_meeting(x, y + sign(velv), obj_obstaculo)) {
            y += sign(velv);
        }
        velv = 0;
    }
}

