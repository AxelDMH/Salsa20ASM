GLOBAL main
section .text
    main:
        call rowround

    rowround:
        ;firstRow
            mov eax, dword[y]
            mov dword[a], eax
            mov eax, dword[y+4]
            mov dword[b], eax
            mov eax, dword[y+8]
            mov dword[c], eax
            mov eax, dword[y+12]
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
            mov eax, dword[y+20]
            mov dword[a], eax
            mov eax, dword[y+24]
            mov dword[b], eax
            mov eax, dword[y+28]
            mov dword[c], eax
            mov eax, dword[y+16]
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
            mov eax, dword[y+40]
            mov dword[a], eax
            mov eax, dword[y+44]
            mov dword[b], eax
            mov eax, dword[y+32]
            mov dword[c], eax
            mov eax, dword[y+36]
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
            mov eax, dword[y+60]
            mov dword[a], eax
            mov eax, dword[y+48]
            mov dword[b], eax
            mov eax, dword[y+52]
            mov dword[c], eax
            mov eax, dword[y+56]
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

     y dd 0x00000001,0x00000000,0x00000000,0x00000000
       dd 0x00000001,0x00000000,0x00000000,0x00000000
       dd 0x00000001,0x00000000,0x00000000,0x00000000
       dd 0x00000001,0x00000000,0x00000000,0x00000000

     z dd 0x00000000,0x00000000,0x00000000,0x00000000
       dd 0x00000000,0x00000000,0x00000000,0x00000000
       dd 0x00000000,0x00000000,0x00000000,0x00000000
       dd 0x00000000,0x00000000,0x00000000,0x00000000
