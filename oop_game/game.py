#!/usr/bin/env python3
"""
OOP-on-FASM POC: Python drives a minimal combat game whose state lives in
ASM "classes" (Entity + GameState). Damage is random in Python; all state
updates (health, game over, winner) are done in FASM.
"""
import ctypes
import random
import os

# Load shared library (build with ./build.sh first)
_lib_path = os.path.join(os.path.dirname(__file__), "mylib.so")
if not os.path.isfile(_lib_path):
    raise FileNotFoundError(f"Build the project first: cd {os.path.dirname(__file__)} && ./build.sh")

mylib = ctypes.CDLL(_lib_path)

# void* py_game_state_alloc(void)
mylib.py_game_state_alloc.argtypes = []
mylib.py_game_state_alloc.restype = ctypes.c_void_p

# void py_game_state_free(void* gs)
mylib.py_game_state_free.argtypes = [ctypes.c_void_p]
mylib.py_game_state_free.restype = None

# int py_game_state_get_player_health(void* gs)
mylib.py_game_state_get_player_health.argtypes = [ctypes.c_void_p]
mylib.py_game_state_get_player_health.restype = ctypes.c_int

# int py_game_state_get_enemy_health(void* gs)
mylib.py_game_state_get_enemy_health.argtypes = [ctypes.c_void_p]
mylib.py_game_state_get_enemy_health.restype = ctypes.c_int

# void py_game_state_tick(void* gs, int player_damage_to_enemy, int enemy_damage_to_player)
mylib.py_game_state_tick.argtypes = [ctypes.c_void_p, ctypes.c_int, ctypes.c_int]
mylib.py_game_state_tick.restype = None

# int py_game_state_is_over(void* gs)
mylib.py_game_state_is_over.argtypes = [ctypes.c_void_p]
mylib.py_game_state_is_over.restype = ctypes.c_int

# int py_game_state_get_winner(void* gs)
mylib.py_game_state_get_winner.argtypes = [ctypes.c_void_p]
mylib.py_game_state_get_winner.restype = ctypes.c_int


def game_loop():
    gs = mylib.py_game_state_alloc()
    if not gs:
        raise RuntimeError("py_game_state_alloc failed")

    try:
        print("Starting OOP-on-FASM game (Player vs Enemy)")
        print("Player and Enemy health updated in FASM; damage rolled in Python.\n")

        while mylib.py_game_state_is_over(gs) == 0:
            player_h = mylib.py_game_state_get_player_health(gs)
            enemy_h = mylib.py_game_state_get_enemy_health(gs)
            print(f"Player health: {player_h}  Enemy health: {enemy_h}")

            player_damage = 5 + random.randint(0, 10)
            enemy_damage = 5 + random.randint(0, 10)
            print(f"Player attacks enemy for {player_damage} damage")
            print(f"Enemy attacks player for {enemy_damage} damage")

            mylib.py_game_state_tick(gs, player_damage, enemy_damage)
            print("---")

        winner = mylib.py_game_state_get_winner(gs)
        player_h = mylib.py_game_state_get_player_health(gs)
        enemy_h = mylib.py_game_state_get_enemy_health(gs)

        print("\nGame over!")
        if winner == 1:
            print("Player wins!")
        elif winner == 2:
            print("Enemy wins!")
        else:
            print("It's a tie!")
        print(f"Final health - Player: {player_h}  Enemy: {enemy_h}")
    finally:
        mylib.py_game_state_free(gs)


if __name__ == "__main__":
    game_loop()
