GLOBAL main
section .text
    main:
        call quarterround
    quarterround:
        first:
            mov eax,dword [y0]
            add eax,dword [y3]
            rol eax,7
            mov ebx, dword [y1]
            xor eax,ebx
            mov dword [z1],eax
            
        second:
            mov eax,dword [z1]
            add eax,dword [y0]
            rol eax,9
            mov ebx, dword [y2]
            xor eax,ebx
            mov dword [z2],eax
        third:
            mov eax,dword [z2]
            add eax,dword [z1]
            rol eax,13
            mov ebx, dword [y3]
            xor eax,ebx
            mov dword [z3],eax
        fourth:
            mov eax,dword [z3]
            add eax,dword [z2]
            rol eax,18
            mov ebx, dword [y0]
            xor eax,ebx
            mov dword [z0],eax               

    ext:
            mov eax,1
            mov ebx,0
            int 0x80

section .data
    y0 dd 0x00000001
    y1 dd 0x00000000
    y2 dd 0x00000000
    y3 dd 0x00000000
    z0 dd 0
    z1 dd 0
    z2 dd 0
    z3 dd 0