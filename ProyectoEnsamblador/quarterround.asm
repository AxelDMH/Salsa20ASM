GLOBAL main
section .text
    main:
        call doubleround

    doubleround:
        call columnround

    columnround:
        ;firstColumn
            mov eax, dword[y]
            mov dword[a], eax
            mov eax, dword[y+16]
            mov dword[b], eax
            mov eax, dword[y+32]
            mov dword[c], eax
            mov eax, dword[y+48]
            mov dword[d], eax
            call quarterround
            mov eax, dword[e]
            mov dword[x], eax
            mov eax, dword[f]
            mov dword[x+16], eax
            mov eax, dword[g]
            mov dword[x+32], eax
            mov eax, dword[h]
            mov dword[x+48], eax
        
        ;secondColumn
            mov eax, dword[y+20]
            mov dword[a], eax
            mov eax, dword[y+36]
            mov dword[b], eax
            mov eax, dword[y+52]
            mov dword[c], eax
            mov eax, dword[y+4]
            mov dword[d], eax
            call quarterround
            mov eax, dword[e]
            mov dword[x+20], eax
            mov eax, dword[f]
            mov dword[x+36], eax
            mov eax, dword[g]
            mov dword[x+52], eax
            mov eax, dword[h]
            mov dword[x+4], eax

        ;thirdColumn
            mov eax, dword[y+40]
            mov dword[a], eax
            mov eax, dword[y+56]
            mov dword[b], eax
            mov eax, dword[y+8]
            mov dword[c], eax
            mov eax, dword[y+24]
            mov dword[d], eax
            call quarterround
            mov eax, dword[e]
            mov dword[x+40], eax
            mov eax, dword[f]
            mov dword[x+56], eax
            mov eax, dword[g]
            mov dword[x+8], eax
            mov eax, dword[h]
            mov dword[x+24], eax

        ;fourthColumn
            mov eax, dword[y+60]
            mov dword[a], eax
            mov eax, dword[y+12]
            mov dword[b], eax
            mov eax, dword[y+28]
            mov dword[c], eax
            mov eax, dword[y+44]
            mov dword[d], eax
            call quarterround
            mov eax, dword[e]
            mov dword[x+60], eax
            mov eax, dword[f]
            mov dword[x+12], eax
            mov eax, dword[g]
            mov dword[x+28], eax
            mov eax, dword[h]
            mov dword[x+44], eax

    rowround:
        ;firstRow
            mov eax, dword[x]
            mov dword[a], eax
            mov eax, dword[x+4]
            mov dword[b], eax
            mov eax, dword[x+8]
            mov dword[c], eax
            mov eax, dword[x+12]
            mov dword[d], eax
            call quarterround
            mov eax, dword[e]
            mov dword[z], eax
            mov eax, dword[f]
            mov dword[z+4], eax
            mov eax, dword[g]
            mov dword[z+8], eax
            mov eax, dword[h]
            mov dword[z+12], eax

        ;secondRow     
            mov eax, dword[x+20]
            mov dword[a], eax
            mov eax, dword[x+24]
            mov dword[b], eax
            mov eax, dword[x+28]
            mov dword[c], eax
            mov eax, dword[x+16]
            mov dword[d], eax
            call quarterround
            mov eax, dword[e]
            mov dword[z+20], eax
            mov eax, dword[f]
            mov dword[z+24], eax
            mov eax, dword[g]
            mov dword[z+28], eax
            mov eax, dword[h]
            mov dword[z+16], eax
        
        ;thirdRow
            mov eax, dword[x+40]
            mov dword[a], eax
            mov eax, dword[x+44]
            mov dword[b], eax
            mov eax, dword[x+32]
            mov dword[c], eax
            mov eax, dword[x+36]
            mov dword[d], eax
            call quarterround
            mov eax, dword[e]
            mov dword[z+40], eax
            mov eax, dword[f]
            mov dword[z+44], eax
            mov eax, dword[g]
            mov dword[z+32], eax
            mov eax, dword[h]
            mov dword[z+36], eax

        ;fourthRow
            mov eax, dword[x+60]
            mov dword[a], eax
            mov eax, dword[x+48]
            mov dword[b], eax
            mov eax, dword[x+52]
            mov dword[c], eax
            mov eax, dword[x+56]
            mov dword[d], eax
            call quarterround
            mov eax, dword[e]
            mov dword[z+60], eax
            mov eax, dword[f]
            mov dword[z+48], eax
            mov eax, dword[g]
            mov dword[z+52], eax
            mov eax, dword[h]
            mov dword[z+56], eax
            jmp ext

    quarterround:
        ;first
            mov eax, dword[a]
            add eax, dword[d]
            rol eax, 7
            mov ebx, dword[b]
            xor eax, ebx
            mov dword[f], eax
            
        ;second
            mov eax, dword[f]
            add eax, dword[a]
            rol eax, 9
            mov ebx, dword[c]
            xor eax, ebx
            mov dword[g], eax
        
        ;third
            mov eax, dword[g]
            add eax, dword[f]
            rol eax, 13
            mov ebx, dword[d]
            xor eax, ebx
            mov dword[h], eax
        
        ;fourth
            mov eax, dword[h]
            add eax, dword[g]
            rol eax, 18
            mov ebx, dword[a]
            xor eax, ebx
            mov dword[e], eax       
        ret
    
    ext:
            mov eax,1
            mov ebx,0
            int 0x80

section .data
    a dd 0x00000000
    b dd 0x00000000
    c dd 0x00000000
    d dd 0x00000000

    e dd 0x00000000
    f dd 0x00000000
    g dd 0x00000000
    h dd 0x00000000

     y dd 0xde501066,0x6f9eb8f7,0xe4fbbd9b,0x454e3f57
       dd 0xb75540d3,0x43e93a4c,0x3a6f2aa0,0x726d6b36,
       dd 0x9243f484,0x9145d1e8,0x4fa9d247,0xdc8dee11,
       dd 0x054bf545,0x254dd653,0xd9421b6d,0x67b276c1

    ;Aqui se escribe el resultado
     z dd 0x00000000,0x00000000,0x00000000,0x00000000
       dd 0x00000000,0x00000000,0x00000000,0x00000000
       dd 0x00000000,0x00000000,0x00000000,0x00000000
       dd 0x00000000,0x00000000,0x00000000,0x00000000
    
     x dd 0x00000000,0x00000000,0x00000000,0x00000000
       dd 0x00000000,0x00000000,0x00000000,0x00000000
       dd 0x00000000,0x00000000,0x00000000,0x00000000
       dd 0x00000000,0x00000000,0x00000000,0x00000000
