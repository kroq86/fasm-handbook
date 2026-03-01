/*
 * C wrapper for OOP-on-FASM game.asm.
 * Struct layout must match game.asm: Entity 8 bytes, GameState 24 bytes.
 * Calling convention: SysV x64 (RDI, RSI, RDX, ...; EAX return).
 */
#include <stdint.h>
#include <stdlib.h>

typedef struct {
    int type;    /* 0=player, 1=enemy */
    int health;
} Entity;

typedef struct {
    Entity player;
    Entity enemy;
    int status;   /* 0=ongoing, 1=over */
    int winner;  /* 0=none, 1=player, 2=enemy, 3=tie */
} GameState;

/* ASM symbols */
extern void game_state_init(void *gs);
extern int entity_get_health(void *entity);
extern void entity_set_health(void *entity, int health);
extern int game_state_get_player_health(void *gs);
extern int game_state_get_enemy_health(void *gs);
extern void game_state_tick(void *gs, int player_damage_to_enemy, int enemy_damage_to_player);
extern int game_state_is_over(void *gs);
extern int game_state_get_winner(void *gs);

void *py_game_state_alloc(void) {
    GameState *gs = (GameState *)malloc(sizeof(GameState));
    if (gs)
        game_state_init(gs);
    return gs;
}

void py_game_state_free(void *gs) {
    free(gs);
}

void py_game_state_init(void *gs) {
    game_state_init(gs);
}

int py_entity_get_health(void *entity) {
    return entity_get_health(entity);
}

void py_entity_set_health(void *entity, int health) {
    entity_set_health(entity, health);
}

int py_game_state_get_player_health(void *gs) {
    return game_state_get_player_health(gs);
}

int py_game_state_get_enemy_health(void *gs) {
    return game_state_get_enemy_health(gs);
}

void py_game_state_tick(void *gs, int player_damage_to_enemy, int enemy_damage_to_player) {
    game_state_tick(gs, player_damage_to_enemy, enemy_damage_to_player);
}

int py_game_state_is_over(void *gs) {
    return game_state_is_over(gs);
}

int py_game_state_get_winner(void *gs) {
    return game_state_get_winner(gs);
}
