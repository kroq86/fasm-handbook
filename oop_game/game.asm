; OOP-on-FASM POC: Entity + GameState "classes" for a minimal combat game.
; SysV x64 calling: rdi, rsi, rdx, rcx, r8, r9; return rax/eax.
; Struct layouts must match wrapper.c.
; Follows the repository FASM rules and calling conventions.

format ELF64

; === Entity "class" (8 bytes) ===
struc Entity {
    .type   dd 0    ; 0=player, 1=enemy
    .health dd 0
}
virtual at 0
    Entity Entity
    sizeof.Entity = $
end virtual

; === GameState "class" (24 bytes) ===
struc GameState {
    .player Entity  ; offset 0, 8 bytes
    .enemy  Entity  ; offset 8, 8 bytes
    .status dd 0    ; 0=ongoing, 1=over
    .winner dd 0    ; 0=none, 1=player, 2=enemy, 3=tie
}
virtual at 0
    GameState GameState
    sizeof.GameState = $
end virtual

section '.text' executable

; --- Entity "methods" (rdi = this) ---

; Function: entity_get_health
; Input:   RDI - entity pointer
; Output:  EAX - health value
; Affects: EAX
public entity_get_health
entity_get_health:
    mov eax, [rdi + Entity.health]
    ret

; Function: entity_set_health
; Input:   RDI - entity pointer, ESI - health value
; Output:  none
; Affects: none (memory at [rdi + Entity.health])
public entity_set_health
entity_set_health:
    mov [rdi + Entity.health], esi
    ret

; --- GameState "methods" (rdi = this) ---

; Function: game_state_init
; Input:   RDI - GameState pointer
; Output:  none
; Affects: memory at [rdi]
; Notes:   In-place init: player/enemy health=100, status=ongoing
public game_state_init
game_state_init:
    mov dword [rdi + GameState.player + Entity.type], 0
    mov dword [rdi + GameState.player + Entity.health], 100
    mov dword [rdi + GameState.enemy + Entity.type], 1
    mov dword [rdi + GameState.enemy + Entity.health], 100
    mov dword [rdi + GameState.status], 0
    mov dword [rdi + GameState.winner], 0
    ret

; Function: game_state_get_player_health
; Input:   RDI - GameState pointer
; Output:  EAX - player health
; Affects: EAX
public game_state_get_player_health
game_state_get_player_health:
    mov eax, [rdi + GameState.player + Entity.health]
    ret

; Function: game_state_get_enemy_health
; Input:   RDI - GameState pointer
; Output:  EAX - enemy health
; Affects: EAX
public game_state_get_enemy_health
game_state_get_enemy_health:
    mov eax, [rdi + GameState.enemy + Entity.health]
    ret

; Function: game_state_tick
; Input:   RDI - GameState pointer, ESI - player_damage_to_enemy, EDX - enemy_damage_to_player
; Output:  none
; Affects: RBX, R12; memory at [rdi]
; Notes:   Applies damage, clamps health to >=0, sets status/winner if game over
public game_state_tick
game_state_tick:
    push rbp
    push rbx
    push r12
    mov rbp, rsp
    ; 1. Save parameters (callee-saved for use across logic)
    mov r12, rdi
    mov ebx, esi
    mov ecx, edx

    ; 2. Enemy health -= player_damage; clamp to 0
    mov eax, [r12 + GameState.enemy + Entity.health]
    sub eax, ebx
    test eax, eax
    jns .enemy_ok
    xor eax, eax
.enemy_ok:
    mov [r12 + GameState.enemy + Entity.health], eax

    ; 3. Player health -= enemy_damage; clamp to 0
    mov eax, [r12 + GameState.player + Entity.health]
    sub eax, ecx
    test eax, eax
    jns .player_ok
    xor eax, eax
.player_ok:
    mov [r12 + GameState.player + Entity.health], eax

    ; 4. Check game over: set status=1 and winner if either health <= 0
    mov eax, [r12 + GameState.status]
    cmp eax, 1
    je .done
    mov eax, [r12 + GameState.player + Entity.health]
    mov r8d, [r12 + GameState.enemy + Entity.health]
    test eax, eax
    jle .game_over
    test r8d, r8d
    jle .game_over
    jmp .done
.game_over:
    mov dword [r12 + GameState.status], 1
    test eax, eax
    jle .player_dead
    ; Player alive, enemy dead -> player wins
    mov dword [r12 + GameState.winner], 1
    jmp .done
.player_dead:
    test r8d, r8d
    jle .both_dead
    ; Player dead, enemy alive -> enemy wins
    mov dword [r12 + GameState.winner], 2
    jmp .done
.both_dead:
    mov dword [r12 + GameState.winner], 3
.done:
    mov rsp, rbp
    pop r12
    pop rbx
    pop rbp
    ret

; Function: game_state_is_over
; Input:   RDI - GameState pointer
; Output:  EAX - 1 if over, 0 else
; Affects: EAX
public game_state_is_over
game_state_is_over:
    mov eax, [rdi + GameState.status]
    ret

; Function: game_state_get_winner
; Input:   RDI - GameState pointer
; Output:  EAX - 0=none, 1=player, 2=enemy, 3=tie
; Affects: EAX
public game_state_get_winner
game_state_get_winner:
    mov eax, [rdi + GameState.winner]
    ret

; Mark stack non-executable (silences ld warning about missing .note.GNU-stack)
section '.note.GNU-stack'
