# phase1:

gdb调试 rdi和rsi存放的是函数`strings_not_equal`的参数，所以可以直接断点下到`strings_not_equal`直接看到传入的参数

```properties
 RAX  0x603780 (input_strings) ◂— 0x31 /* '1' */
 RBX  0x0
 RCX  0x1
 RDX  0x1
 RDI  0x603780 (input_strings) ◂— 0x31 /* '1' */
 RSI  0x402400 ◂— outsd  dx, dword ptr [rsi] /* 'Border relations with Canada have never been better.' */
 R8   0x604422 ◂— 0x0
 R9   0x7ffff7fd8700 ◂— 0x7ffff7fd8700
 R10  0x519
```

exp:

```
Border relations with Canada have never been better.
```



# phase2:

源码：

```c
.text:0000000000400EFC                 public phase_2
.text:0000000000400EFC phase_2         proc near               ; CODE XREF: main+B6↑p
.text:0000000000400EFC
.text:0000000000400EFC var_38          = dword ptr -38h
.text:0000000000400EFC var_34          = byte ptr -34h
.text:0000000000400EFC var_20          = byte ptr -20h
.text:0000000000400EFC
.text:0000000000400EFC ; __unwind {
.text:0000000000400EFC                 push    rbp
.text:0000000000400EFD                 push    rbx
.text:0000000000400EFE                 sub     rsp, 28h
.text:0000000000400F02                 mov     rsi, rsp
.text:0000000000400F05                 call    read_six_numbers
.text:0000000000400F0A                 cmp     [rsp+38h+var_38], 1
.text:0000000000400F0E                 jz      short loc_400F30
.text:0000000000400F10                 call    explode_bomb
.text:0000000000400F15 ; ---------------------------------------------------------------------------
.text:0000000000400F15                 jmp     short loc_400F30
.text:0000000000400F17 ; ---------------------------------------------------------------------------
.text:0000000000400F17
.text:0000000000400F17 loc_400F17:                             ; CODE XREF: phase_2+30↓j
.text:0000000000400F17                                         ; phase_2+3E↓j
.text:0000000000400F17                 mov     eax, [rbx-4]
.text:0000000000400F1A                 add     eax, eax
.text:0000000000400F1C                 cmp     [rbx], eax
.text:0000000000400F1E                 jz      short loc_400F25
.text:0000000000400F20                 call    explode_bomb
.text:0000000000400F25 ; ---------------------------------------------------------------------------
.text:0000000000400F25
.text:0000000000400F25 loc_400F25:                             ; CODE XREF: phase_2+22↑j
.text:0000000000400F25                 add     rbx, 4
.text:0000000000400F29                 cmp     rbx, rbp
.text:0000000000400F2C                 jnz     short loc_400F17
.text:0000000000400F2E                 jmp     short loc_400F3C
.text:0000000000400F30 ; ---------------------------------------------------------------------------
.text:0000000000400F30
.text:0000000000400F30 loc_400F30:                             ; CODE XREF: phase_2+12↑j
.text:0000000000400F30                                         ; phase_2+19↑j
.text:0000000000400F30                 lea     rbx, [rsp+38h+var_34]
.text:0000000000400F35                 lea     rbp, [rsp+38h+var_20]
.text:0000000000400F3A                 jmp     short loc_400F17
.text:0000000000400F3C ; ---------------------------------------------------------------------------
.text:0000000000400F3C
.text:0000000000400F3C loc_400F3C:                             ; CODE XREF: phase_2+32↑j
.text:0000000000400F3C                 add     rsp, 28h
.text:0000000000400F40                 pop     rbx
.text:0000000000400F41                 pop     rbp
.text:0000000000400F42                 retn
.text:0000000000400F42 ; } // starts at 400EFC
```

read_six_number:

```
.text:000000000040145C ; __unwind {
.text:000000000040145C                 sub     rsp, 18h
.text:0000000000401460                 mov     rdx, rsi
.text:0000000000401463                 lea     rcx, [rsi+4]
.text:0000000000401467                 lea     rax, [rsi+14h]
.text:000000000040146B                 mov     [rsp+18h+var_10], rax
.text:0000000000401470                 lea     rax, [rsi+10h]
.text:0000000000401474                 mov     [rsp+18h+var_18], rax
.text:0000000000401478                 lea     r9, [rsi+0Ch]
.text:000000000040147C                 lea     r8, [rsi+8]
.text:0000000000401480                 mov     esi, offset unk_4025C3
.text:0000000000401485                 mov     eax, 0
.text:000000000040148A                 call    ___isoc99_sscanf
.text:000000000040148F                 cmp     eax, 5
.text:0000000000401492                 jg      short loc_401499
.text:0000000000401494                 call    explode_bomb
```

思路：

首先利用read_six_number读入到栈内6个数据，



```
 RSP  0x7fffffffdcd0 ◂— 0x200000001
 RIP  0x400f0a (phase_2+14) ◂— cmp    dword ptr [rsp], 1
```

判断第一个数据要为1

```
.text:0000000000400F17                 mov     eax, [rbx-4]
.text:0000000000400F1A                 add     eax, eax
.text:0000000000400F1C                 cmp     [rbx], eax
.text:0000000000400F1E                 jz      short loc_400F25
.text:0000000000400F20                 call    explode_bomb
.text:0000000000400F25 ; ---------------------------------------------------------------------------
.text:0000000000400F25
.text:0000000000400F25 loc_400F25:                             ; CODE XREF: phase_2+22↑j
.text:0000000000400F25                 add     rbx, 4
.text:0000000000400F29                 cmp     rbx, rbp
.text:0000000000400F2C                 jnz     short loc_400F17
.text:0000000000400F2E                 jmp     short loc_400F3C
```

然后中间执行了一个循环判断 每次循环都会先将输入的值赋给eax，然后对eax翻倍 判断输入的下个值是否与之相等 相等继续循环 否则直接退出

exp也就是1 2 4 8 16 32



# phase3:

```c
.text:0000000000400F43
.text:0000000000400F43                 public phase_3
.text:0000000000400F43 phase_3         proc near               ; CODE XREF: main+D2↑p
.text:0000000000400F43
.text:0000000000400F43 var_10          = dword ptr -10h
.text:0000000000400F43 var_C           = dword ptr -0Ch
.text:0000000000400F43
.text:0000000000400F43 ; __unwind {
.text:0000000000400F43                 sub     rsp, 18h
.text:0000000000400F47                 lea     rcx, [rsp+18h+var_C]
.text:0000000000400F4C                 lea     rdx, [rsp+18h+var_10]
.text:0000000000400F51                 mov     esi, offset aDD ; "%d %d"
.text:0000000000400F56                 mov     eax, 0
.text:0000000000400F5B                 call    ___isoc99_sscanf
.text:0000000000400F60                 cmp     eax, 1
.text:0000000000400F63                 jg      short loc_400F6A
.text:0000000000400F65                 call    explode_bomb
.text:0000000000400F6A ; ---------------------------------------------------------------------------
.text:0000000000400F6A
.text:0000000000400F6A loc_400F6A:                             ; CODE XREF: phase_3+20↑j
.text:0000000000400F6A                 cmp     [rsp+18h+var_10], 7 ; switch 8 cases
.text:0000000000400F6F                 ja      short def_400F75 ; jumptable 0000000000400F75 default case
.text:0000000000400F71                 mov     eax, [rsp+18h+var_10]
.text:0000000000400F75                 jmp     ds:jpt_400F75[rax*8] ; switch jump
.text:0000000000400F7C ; ---------------------------------------------------------------------------
.text:0000000000400F7C
.text:0000000000400F7C loc_400F7C:                             ; CODE XREF: phase_3+32↑j
.text:0000000000400F7C                                         ; DATA XREF: .rodata:jpt_400F75↓o
.text:0000000000400F7C                 mov     eax, 0CFh       ; jumptable 0000000000400F75 case 0
.text:0000000000400F81                 jmp     short loc_400FBE
.text:0000000000400F83 ; ---------------------------------------------------------------------------
.text:0000000000400F83
.text:0000000000400F83 loc_400F83:                             ; CODE XREF: phase_3+32↑j
.text:0000000000400F83                                         ; DATA XREF: .rodata:jpt_400F75↓o
.text:0000000000400F83                 mov     eax, 2C3h       ; jumptable 0000000000400F75 case 2
.text:0000000000400F88                 jmp     short loc_400FBE
.text:0000000000400F8A ; ---------------------------------------------------------------------------
.text:0000000000400F8A
.text:0000000000400F8A loc_400F8A:                             ; CODE XREF: phase_3+32↑j
.text:0000000000400F8A                                         ; DATA XREF: .rodata:jpt_400F75↓o
.text:0000000000400F8A                 mov     eax, 100h       ; jumptable 0000000000400F75 case 3
.text:0000000000400F8F                 jmp     short loc_400FBE
.text:0000000000400F91 ; ---------------------------------------------------------------------------
.text:0000000000400F91
.text:0000000000400F91 loc_400F91:                             ; CODE XREF: phase_3+32↑j
.text:0000000000400F91                                         ; DATA XREF: .rodata:jpt_400F75↓o
.text:0000000000400F91                 mov     eax, 185h       ; jumptable 0000000000400F75 case 4
.text:0000000000400F96                 jmp     short loc_400FBE
.text:0000000000400F98 ; ---------------------------------------------------------------------------
.text:0000000000400F98
.text:0000000000400F98 loc_400F98:                             ; CODE XREF: phase_3+32↑j
.text:0000000000400F98                                         ; DATA XREF: .rodata:jpt_400F75↓o
.text:0000000000400F98                 mov     eax, 0CEh       ; jumptable 0000000000400F75 case 5
.text:0000000000400F9D                 jmp     short loc_400FBE
.text:0000000000400F9F ; ---------------------------------------------------------------------------
.text:0000000000400F9F
.text:0000000000400F9F loc_400F9F:                             ; CODE XREF: phase_3+32↑j
.text:0000000000400F9F                                         ; DATA XREF: .rodata:jpt_400F75↓o
.text:0000000000400F9F                 mov     eax, 2AAh       ; jumptable 0000000000400F75 case 6
.text:0000000000400FA4                 jmp     short loc_400FBE
.text:0000000000400FA6 ; ---------------------------------------------------------------------------
.text:0000000000400FA6
.text:0000000000400FA6 loc_400FA6:                             ; CODE XREF: phase_3+32↑j
.text:0000000000400FA6                                         ; DATA XREF: .rodata:jpt_400F75↓o
.text:0000000000400FA6                 mov     eax, 147h       ; jumptable 0000000000400F75 case 7
.text:0000000000400FAB                 jmp     short loc_400FBE
.text:0000000000400FAD ; ---------------------------------------------------------------------------
.text:0000000000400FAD
.text:0000000000400FAD def_400F75:                             ; CODE XREF: phase_3+2C↑j
.text:0000000000400FAD                 call    explode_bomb    ; jumptable 0000000000400F75 default case
.text:0000000000400FB2 ; ---------------------------------------------------------------------------
.text:0000000000400FB2                 mov     eax, 0
.text:0000000000400FB7                 jmp     short loc_400FBE
.text:0000000000400FB9 ; ---------------------------------------------------------------------------
.text:0000000000400FB9
.text:0000000000400FB9 loc_400FB9:                             ; CODE XREF: phase_3+32↑j
.text:0000000000400FB9                                         ; DATA XREF: .rodata:jpt_400F75↓o
.text:0000000000400FB9                 mov     eax, 137h       ; jumptable 0000000000400F75 case 1
.text:0000000000400FBE
.text:0000000000400FBE loc_400FBE:                             ; CODE XREF: phase_3+3E↑j
.text:0000000000400FBE                                         ; phase_3+45↑j ...
.text:0000000000400FBE                 cmp     eax, [rsp+18h+var_C]
.text:0000000000400FC2                 jz      short loc_400FC9
.text:0000000000400FC4                 call    explode_bomb
.text:0000000000400FC9 ; ---------------------------------------------------------------------------
.text:0000000000400FC9
.text:0000000000400FC9 loc_400FC9:                             ; CODE XREF: phase_3+7F↑j
.text:0000000000400FC9                 add     rsp, 18h
.text:0000000000400FCD                 retn
.text:0000000000400FCD ; } // starts at 400F43
.text:0000000000400FCD phase_3         endp
```

输入两个整形的数 

先判断输入的第一个数判断是否大于7

然后在每个switch分支都赋值eax一个值 在switch结束后跟第二个数进行判断

```
0 207
1 311
2 707
3 256
4 389
5 206
6 682
7 327
```



# phase4：

```c
.text:000000000040100C phase_4         proc near               ; CODE XREF: main+EE↑p
.text:000000000040100C
.text:000000000040100C var_10          = dword ptr -10h
.text:000000000040100C var_C           = dword ptr -0Ch
.text:000000000040100C
.text:000000000040100C ; __unwind {
.text:000000000040100C                 sub     rsp, 18h
.text:0000000000401010                 lea     rcx, [rsp+18h+var_C]
.text:0000000000401015                 lea     rdx, [rsp+18h+var_10]
.text:000000000040101A                 mov     esi, offset aDD ; "%d %d"
.text:000000000040101F                 mov     eax, 0
.text:0000000000401024                 call    ___isoc99_sscanf
.text:0000000000401029                 cmp     eax, 2
.text:000000000040102C                 jnz     short loc_401035
.text:000000000040102E                 cmp     [rsp+18h+var_10], 0Eh
.text:0000000000401033                 jbe     short loc_40103A
.text:0000000000401035
.text:0000000000401035 loc_401035:                             ; CODE XREF: phase_4+20↑j
.text:0000000000401035                 call    explode_bomb
.text:000000000040103A ; ---------------------------------------------------------------------------
.text:000000000040103A
.text:000000000040103A loc_40103A:                             ; CODE XREF: phase_4+27↑j
.text:000000000040103A                 mov     edx, 0Eh
.text:000000000040103F                 mov     esi, 0
.text:0000000000401044                 mov     edi, [rsp+18h+var_10]
.text:0000000000401048                 call    func4
.text:000000000040104D                 test    eax, eax
.text:000000000040104F                 jnz     short loc_401058
.text:0000000000401051                 cmp     [rsp+18h+var_C], 0
.text:0000000000401056                 jz      short loc_40105D
.text:0000000000401058
.text:0000000000401058 loc_401058:                             ; CODE XREF: phase_4+43↑j
.text:0000000000401058                 call    explode_bomb
.text:000000000040105D ; ---------------------------------------------------------------------------
.text:000000000040105D
.text:000000000040105D loc_40105D:                             ; CODE XREF: phase_4+4A↑j
.text:000000000040105D                 add     rsp, 18h
.text:0000000000401061                 retn
.text:0000000000401061 ; } // starts at 40100C
.text:0000000000401061 phase_4         endp
```

```c
.text:0000000000400FCE func4           proc near               ; CODE XREF: func4+1B↓p
.text:0000000000400FCE                                         ; func4+30↓p ...
.text:0000000000400FCE ; __unwind {
.text:0000000000400FCE                 sub     rsp, 8
.text:0000000000400FD2                 mov     eax, edx
.text:0000000000400FD4                 sub     eax, esi
.text:0000000000400FD6                 mov     ecx, eax
.text:0000000000400FD8                 shr     ecx, 1Fh
.text:0000000000400FDB                 add     eax, ecx
.text:0000000000400FDD                 sar     eax, 1
.text:0000000000400FDF                 lea     ecx, [rax+rsi]
.text:0000000000400FE2                 cmp     ecx, edi
.text:0000000000400FE4                 jle     short loc_400FF2
.text:0000000000400FE6                 lea     edx, [rcx-1]
.text:0000000000400FE9                 call    func4
.text:0000000000400FEE                 add     eax, eax
.text:0000000000400FF0                 jmp     short loc_401007
.text:0000000000400FF2 ; ---------------------------------------------------------------------------
.text:0000000000400FF2
.text:0000000000400FF2 loc_400FF2:                             ; CODE XREF: func4+16↑j
.text:0000000000400FF2                 mov     eax, 0
.text:0000000000400FF7                 cmp     ecx, edi
.text:0000000000400FF9                 jge     short loc_401007
.text:0000000000400FFB                 lea     esi, [rcx+1]
.text:0000000000400FFE                 call    func4
.text:0000000000401003                 lea     eax, [rax+rax+1]
.text:0000000000401007
.text:0000000000401007 loc_401007:                             ; CODE XREF: func4+22↑j
.text:0000000000401007                                         ; func4+2B↑j
.text:0000000000401007                 add     rsp, 8
.text:000000000040100B                 retn
.text:000000000040100B ; } // starts at 400FCE
.text:000000000040100B func4           endp
```

输入两个数 cmp判断第一个数不大于14 

将0xe赋给edx 清空esi 将第一个值赋给edi 然后进入fun4

```pro
第一个cmp:
 RAX  0x7
 RBX  0x0
 RCX  0x7
 RDX  0xe
 RDI  0x1
 RSI  0x0
 R8   0x0
 R9   0x0
 R10  0x0
 R11  0x7ffff7b846a0 (_nl_C_LC_CTYPE_class+256) ◂— add    al, byte ptr [rax]
 R12  0x400c90 (_start) ◂— xor    ebp, ebp
 R13  0x7fffffffddf0 ◂— 0x1
 R14  0x0
 R15  0x0
 RBP  0x402210 (__libc_csu_init) ◂— mov    qword ptr [rsp - 0x28], rbp
 RSP  0x7fffffffdce0 —▸ 0x402210 (__libc_csu_init) ◂— mov    qword ptr [rsp - 0x28], rbp
 RIP  0x400fe2 (func4+20) ◂— cmp    ecx, edi
───────────────────────────────────────────────────────────[ DISASM ]───────────────────────────────────────────────────────────
   0x400fdf <func4+17>    lea    ecx, [rax + rsi]
 ► 0x400fe2 <func4+20>    cmp    ecx, edi
   0x400fe4 <func4+22>    jle    func4+36 <0x400ff2>
```

判断第一个数是否为7 之后每次递归 rcx对2取整 直到rcx小于rdi



```
 cmp     [rsp+18h+var_C], 0
```

第二个数直接判断是否为0

exp也就是

```
7 0
```



# phase5:

```c
.text:0000000000401062 phase_5         proc near               ; CODE XREF: main+10A↑p
.text:0000000000401062
.text:0000000000401062 var_28          = qword ptr -28h
.text:0000000000401062 var_18          = byte ptr -18h
.text:0000000000401062 var_12          = byte ptr -12h
.text:0000000000401062 var_10          = qword ptr -10h
.text:0000000000401062
.text:0000000000401062 ; __unwind {
.text:0000000000401062                 push    rbx
.text:0000000000401063                 sub     rsp, 20h
.text:0000000000401067                 mov     rbx, rdi
.text:000000000040106A                 mov     rax, fs:28h
.text:0000000000401073                 mov     [rsp+28h+var_10], rax
.text:0000000000401078                 xor     eax, eax
.text:000000000040107A                 call    string_length
.text:000000000040107F                 cmp     eax, 6
.text:0000000000401082                 jz      short loc_4010D2
.text:0000000000401084                 call    explode_bomb
.text:0000000000401089 ; ---------------------------------------------------------------------------
.text:0000000000401089                 jmp     short loc_4010D2
.text:000000000040108B ; ---------------------------------------------------------------------------
.text:000000000040108B
.text:000000000040108B loc_40108B:                             ; CODE XREF: phase_5+4A↓j
.text:000000000040108B                                         ; phase_5+75↓j
.text:000000000040108B                 movzx   ecx, byte ptr [rbx+rax]
.text:000000000040108F                 mov     byte ptr [rsp+28h+var_28], cl
.text:0000000000401092                 mov     rdx, [rsp+28h+var_28]
.text:0000000000401096                 and     edx, 0Fh
.text:0000000000401099                 movzx   edx, ds:array_3449[rdx]
.text:00000000004010A0                 mov     [rsp+rax+28h+var_18], dl
.text:00000000004010A4                 add     rax, 1
.text:00000000004010A8                 cmp     rax, 6
.text:00000000004010AC                 jnz     short loc_40108B
.text:00000000004010AE                 mov     [rsp+28h+var_12], 0
.text:00000000004010B3                 mov     esi, offset aFlyers ; "flyers"
.text:00000000004010B8                 lea     rdi, [rsp+28h+var_18]
.text:00000000004010BD                 call    strings_not_equal
.text:00000000004010C2                 test    eax, eax
.text:00000000004010C4                 jz      short loc_4010D9
.text:00000000004010C6                 call    explode_bomb
.text:00000000004010C6 ; ---------------------------------------------------------------------------
.text:00000000004010CB                 align 10h
.text:00000000004010D0                 jmp     short loc_4010D9
.text:00000000004010D2 ; ---------------------------------------------------------------------------
.text:00000000004010D2
.text:00000000004010D2 loc_4010D2:                             ; CODE XREF: phase_5+20↑j
.text:00000000004010D2                                         ; phase_5+27↑j
.text:00000000004010D2                 mov     eax, 0
.text:00000000004010D7                 jmp     short loc_40108B
.text:00000000004010D9 ; ---------------------------------------------------------------------------
.text:00000000004010D9
.text:00000000004010D9 loc_4010D9:                             ; CODE XREF: phase_5+62↑j
.text:00000000004010D9                                         ; phase_5+6E↑j
.text:00000000004010D9                 mov     rax, [rsp+28h+var_10]
.text:00000000004010DE                 xor     rax, fs:28h
.text:00000000004010E7                 jz      short loc_4010EE
.text:00000000004010E9                 call    ___stack_chk_fail
.text:00000000004010EE ; ---------------------------------------------------------------------------
.text:00000000004010EE
.text:00000000004010EE loc_4010EE:                             ; CODE XREF: phase_5+85↑j
.text:00000000004010EE                 add     rsp, 20h
.text:00000000004010F2                 pop     rbx
.text:00000000004010F3                 retn
.text:00000000004010F3 ; } // starts at 401062
.text:00000000004010F3 phase_5         endp
```

```
.rodata:00000000004024B0 array_3449      db 6Dh                  ; DATA XREF: phase_5+37↑r
.rodata:00000000004024B1                 db  61h ; a
.rodata:00000000004024B2                 db  64h ; d
.rodata:00000000004024B3                 db  75h ; u
.rodata:00000000004024B4                 db  69h ; i
.rodata:00000000004024B5                 db  65h ; e
.rodata:00000000004024B6                 db  72h ; r
.rodata:00000000004024B7                 db  73h ; s
.rodata:00000000004024B8                 db  6Eh ; n
.rodata:00000000004024B9                 db  66h ; f
.rodata:00000000004024BA                 db  6Fh ; o
.rodata:00000000004024BB                 db  74h ; t
.rodata:00000000004024BC                 db  76h ; v
.rodata:00000000004024BD                 db  62h ; b
.rodata:00000000004024BE                 db  79h ; y
.rodata:00000000004024BF                 db  6Ch ; l
```

思路：

输入6位的字符然后逐位 和 0xF做与运算，然后再取array_3449数组中对应大小位置的数值

```
9 15 14 5 6 7

1001 1111 1110 0101 0110 0111
所以有很多种解 只要满足&0xf之后是可见字符并且与上面几个相同即可
0100 1001 = 73 = I
0100 1111 = 79 = O
0100 1110 = 70 = N
0100 0101 = 69 = E
0100 0110 = 70 = F
0100 0111 = 71 = G
```

```
IONEFG
```



# phase6:

汇编没太看懂 直接看了源码

```c
.text:00000000004010F4 phase_6         proc near               ; CODE XREF: main+126↑p
.text:00000000004010F4
.text:00000000004010F4 var_78          = dword ptr -78h
.text:00000000004010F4 var_60          = byte ptr -60h
.text:00000000004010F4 var_58          = qword ptr -58h
.text:00000000004010F4 var_50          = byte ptr -50h
.text:00000000004010F4 var_28          = byte ptr -28h
.text:00000000004010F4
.text:00000000004010F4 ; __unwind {
.text:00000000004010F4                 push    r14
.text:00000000004010F6                 push    r13
.text:00000000004010F8                 push    r12
.text:00000000004010FA                 push    rbp
.text:00000000004010FB                 push    rbx
.text:00000000004010FC                 sub     rsp, 50h
.text:0000000000401100                 mov     r13, rsp
.text:0000000000401103                 mov     rsi, rsp
.text:0000000000401106                 call    read_six_numbers
.text:000000000040110B                 mov     r14, rsp
.text:000000000040110E                 mov     r12d, 0
.text:0000000000401114
.text:0000000000401114 loc_401114:                             ; CODE XREF: phase_6+5D↓j
.text:0000000000401114                 mov     rbp, r13
.text:0000000000401117                 mov     eax, [r13+0]
.text:000000000040111B                 sub     eax, 1
.text:000000000040111E                 cmp     eax, 5
.text:0000000000401121                 jbe     short loc_401128
.text:0000000000401123                 call    explode_bomb
.text:0000000000401128 ; ---------------------------------------------------------------------------
.text:0000000000401128
.text:0000000000401128 loc_401128:                             ; CODE XREF: phase_6+2D↑j
.text:0000000000401128                 add     r12d, 1
.text:000000000040112C                 cmp     r12d, 6
.text:0000000000401130                 jz      short loc_401153
.text:0000000000401132                 mov     ebx, r12d
.text:0000000000401135
.text:0000000000401135 loc_401135:                             ; CODE XREF: phase_6+57↓j
.text:0000000000401135                 movsxd  rax, ebx
.text:0000000000401138                 mov     eax, [rsp+rax*4+78h+var_78]
.text:000000000040113B                 cmp     [rbp+0], eax
.text:000000000040113E                 jnz     short loc_401145
.text:0000000000401140                 call    explode_bomb
.text:0000000000401145 ; ---------------------------------------------------------------------------
.text:0000000000401145
.text:0000000000401145 loc_401145:                             ; CODE XREF: phase_6+4A↑j
.text:0000000000401145                 add     ebx, 1
.text:0000000000401148                 cmp     ebx, 5
.text:000000000040114B                 jle     short loc_401135
.text:000000000040114D                 add     r13, 4
.text:0000000000401151                 jmp     short loc_401114
.text:0000000000401153 ; ---------------------------------------------------------------------------
.text:0000000000401153
.text:0000000000401153 loc_401153:                             ; CODE XREF: phase_6+3C↑j
.text:0000000000401153                 lea     rsi, [rsp+78h+var_60]
.text:0000000000401158                 mov     rax, r14
.text:000000000040115B                 mov     ecx, 7
.text:0000000000401160
.text:0000000000401160 loc_401160:                             ; CODE XREF: phase_6+79↓j
.text:0000000000401160                 mov     edx, ecx
.text:0000000000401162                 sub     edx, [rax]
.text:0000000000401164                 mov     [rax], edx
.text:0000000000401166                 add     rax, 4
.text:000000000040116A                 cmp     rax, rsi
.text:000000000040116D                 jnz     short loc_401160
.text:000000000040116F                 mov     esi, 0
.text:0000000000401174                 jmp     short loc_401197
.text:0000000000401176 ; ---------------------------------------------------------------------------
.text:0000000000401176
.text:0000000000401176 loc_401176:                             ; CODE XREF: phase_6+8B↓j
.text:0000000000401176                                         ; phase_6+B5↓j
.text:0000000000401176                 mov     rdx, [rdx+8]
.text:000000000040117A                 add     eax, 1
.text:000000000040117D                 cmp     eax, ecx
.text:000000000040117F                 jnz     short loc_401176
.text:0000000000401181                 jmp     short loc_401188
.text:0000000000401183 ; ---------------------------------------------------------------------------
.text:0000000000401183
.text:0000000000401183 loc_401183:                             ; CODE XREF: phase_6+A9↓j
.text:0000000000401183                 mov     edx, offset node1
.text:0000000000401188
.text:0000000000401188 loc_401188:                             ; CODE XREF: phase_6+8D↑j
.text:0000000000401188                 mov     [rsp+rsi*2+78h+var_58], rdx
.text:000000000040118D                 add     rsi, 4
.text:0000000000401191                 cmp     rsi, 18h
.text:0000000000401195                 jz      short loc_4011AB
.text:0000000000401197
.text:0000000000401197 loc_401197:                             ; CODE XREF: phase_6+80↑j
.text:0000000000401197                 mov     ecx, [rsp+rsi+78h+var_78]
.text:000000000040119A                 cmp     ecx, 1
.text:000000000040119D                 jle     short loc_401183
.text:000000000040119F                 mov     eax, 1
.text:00000000004011A4                 mov     edx, offset node1
.text:00000000004011A9                 jmp     short loc_401176
.text:00000000004011AB ; ---------------------------------------------------------------------------
.text:00000000004011AB
.text:00000000004011AB loc_4011AB:                             ; CODE XREF: phase_6+A1↑j
.text:00000000004011AB                 mov     rbx, [rsp+78h+var_58]
.text:00000000004011B0                 lea     rax, [rsp+78h+var_50]
.text:00000000004011B5                 lea     rsi, [rsp+78h+var_28]
.text:00000000004011BA                 mov     rcx, rbx
.text:00000000004011BD
.text:00000000004011BD loc_4011BD:                             ; CODE XREF: phase_6+DC↓j
.text:00000000004011BD                 mov     rdx, [rax]
.text:00000000004011C0                 mov     [rcx+8], rdx
.text:00000000004011C4                 add     rax, 8
.text:00000000004011C8                 cmp     rax, rsi
.text:00000000004011CB                 jz      short loc_4011D2
.text:00000000004011CD                 mov     rcx, rdx
.text:00000000004011D0                 jmp     short loc_4011BD
.text:00000000004011D2 ; ---------------------------------------------------------------------------
.text:00000000004011D2
.text:00000000004011D2 loc_4011D2:                             ; CODE XREF: phase_6+D7↑j
.text:00000000004011D2                 mov     qword ptr [rdx+8], 0
.text:00000000004011DA                 mov     ebp, 5
.text:00000000004011DF
.text:00000000004011DF loc_4011DF:                             ; CODE XREF: phase_6+101↓j
.text:00000000004011DF                 mov     rax, [rbx+8]
.text:00000000004011E3                 mov     eax, [rax]
.text:00000000004011E5                 cmp     [rbx], eax
.text:00000000004011E7                 jge     short loc_4011EE
.text:00000000004011E9                 call    explode_bomb
.text:00000000004011EE ; ---------------------------------------------------------------------------
.text:00000000004011EE
.text:00000000004011EE loc_4011EE:                             ; CODE XREF: phase_6+F3↑j
.text:00000000004011EE                 mov     rbx, [rbx+8]
.text:00000000004011F2                 sub     ebp, 1
.text:00000000004011F5                 jnz     short loc_4011DF
.text:00000000004011F7                 add     rsp, 50h
.text:00000000004011FB                 pop     rbx
.text:00000000004011FC                 pop     rbp
.text:00000000004011FD                 pop     r12
.text:00000000004011FF                 pop     r13
.text:0000000000401201                 pop     r14
.text:0000000000401203                 retn
.text:0000000000401203 ; } // starts at 4010F4
.text:0000000000401203 phase_6         endp
```

几个node地址

```
.data:00000000006032D0 node1           db  4Ch ; L             ; DATA XREF: phase_6:loc_401183↑o
.data:00000000006032E0 node2           db 0A8h
.data:00000000006032F0 node3           db  9Ch
.data:0000000000603300 node4           db 0B3h
.data:0000000000603310 node5           db 0DDh
.data:0000000000603320 node6           db 0BBh
```



```
.text:0000000000401114 loc_401114:                             ; CODE XREF: phase_6+5D↓j
.text:0000000000401114                 mov     rbp, r13
.text:0000000000401117                 mov     eax, [r13+0]
.text:000000000040111B                 sub     eax, 1
.text:000000000040111E                 cmp     eax, 5
.text:0000000000401121                 jbe     short loc_401128
.text:0000000000401123                 call    explode_bomb
.text:0000000000401128 ; ---------------------------------------------------------------------------
.text:0000000000401128
.text:0000000000401128 loc_401128:                             ; CODE XREF: phase_6+2D↑j
.text:0000000000401128                 add     r12d, 1
.text:000000000040112C                 cmp     r12d, 6
.text:0000000000401130                 jz      short loc_401153
.text:0000000000401132                 mov     ebx, r12d
.text:0000000000401135
.text:0000000000401135 loc_401135:                             ; CODE XREF: phase_6+57↓j
.text:0000000000401135                 movsxd  rax, ebx
.text:0000000000401138                 mov     eax, [rsp+rax*4+78h+var_78]
.text:000000000040113B                 cmp     [rbp+0], eax
.text:000000000040113E                 jnz     short loc_401145
.text:0000000000401140                 call    explode_bomb
.text:0000000000401145 ; ---------------------------------------------------------------------------
.text:0000000000401145
.text:0000000000401145 loc_401145:                             ; CODE XREF: phase_6+4A↑j
.text:0000000000401145                 add     ebx, 1
.text:0000000000401148                 cmp     ebx, 5
.text:000000000040114B                 jle     short loc_401135
.text:000000000040114D                 add     r13, 4
.text:0000000000401151                 jmp     short loc_401114
```

首先读入6个数字到栈里 两层循环判断互不相等 

 

```
.text:0000000000401153 loc_401153:                             ; CODE XREF: phase_6+3C↑j
.text:0000000000401153                 lea     rsi, [rsp+78h+var_60]
.text:0000000000401158                 mov     rax, r14
.text:000000000040115B                 mov     ecx, 7
.text:0000000000401160
.text:0000000000401160 loc_401160:                             ; CODE XREF: phase_6+79↓j
.text:0000000000401160                 mov     edx, ecx
.text:0000000000401162                 sub     edx, [rax]
.text:0000000000401164                 mov     [rax], edx
.text:0000000000401166                 add     rax, 4
.text:000000000040116A                 cmp     rax, rsi
.text:000000000040116D                 jnz     short loc_401160
.text:000000000040116F                 mov     esi, 0
.text:0000000000401174                 jmp     short loc_401197
```

通过操作ecx 对输入的数进行对7取反 得到将要对链表排序的顺序



```
.text:0000000000401176
.text:0000000000401176 loc_401176:                             ; CODE XREF: phase_6+8B↓j
.text:0000000000401176                                         ; phase_6+B5↓j
.text:0000000000401176                 mov     rdx, [rdx+8]
.text:000000000040117A                 add     eax, 1
.text:000000000040117D                 cmp     eax, ecx
.text:000000000040117F                 jnz     short loc_401176
.text:0000000000401181                 jmp     short loc_401188
.text:0000000000401183 ; ---------------------------------------------------------------------------
.text:0000000000401183
.text:0000000000401183 loc_401183:                             ; CODE XREF: phase_6+A9↓j
.text:0000000000401183                 mov     edx, offset node1
.text:0000000000401188
.text:0000000000401188 loc_401188:                             ; CODE XREF: phase_6+8D↑j
.text:0000000000401188                 mov     [rsp+rsi*2+78h+var_58], rdx
.text:000000000040118D                 add     rsi, 4
.text:0000000000401191                 cmp     rsi, 18h
.text:0000000000401195                 jz      short loc_4011AB
.text:0000000000401197
.text:0000000000401197 loc_401197:                             ; CODE XREF: phase_6+80↑j
.text:0000000000401197                 mov     ecx, [rsp+rsi+78h+var_78]
.text:000000000040119A                 cmp     ecx, 1
.text:000000000040119D                 jle     short loc_401183
.text:000000000040119F                 mov     eax, 1
.text:00000000004011A4                 mov     edx, offset node1
.text:00000000004011A9                 jmp     short loc_401176
```

读入链表操作 



```
.text:00000000004011AB
.text:00000000004011AB loc_4011AB:                             ; CODE XREF: phase_6+A1↑j
.text:00000000004011AB                 mov     rbx, [rsp+78h+var_58]
.text:00000000004011B0                 lea     rax, [rsp+78h+var_50]
.text:00000000004011B5                 lea     rsi, [rsp+78h+var_28]
.text:00000000004011BA                 mov     rcx, rbx
.text:00000000004011BD
.text:00000000004011BD loc_4011BD:                             ; CODE XREF: phase_6+DC↓j
.text:00000000004011BD                 mov     rdx, [rax]
.text:00000000004011C0                 mov     [rcx+8], rdx
.text:00000000004011C4                 add     rax, 8
.text:00000000004011C8                 cmp     rax, rsi
.text:00000000004011CB                 jz      short loc_4011D2
.text:00000000004011CD                 mov     rcx, rdx
.text:00000000004011D0                 jmp     short loc_4011BD
```

按照读入的数字顺序将链表排序



```
.text:00000000004011D2
.text:00000000004011D2 loc_4011D2:                             ; CODE XREF: phase_6+D7↑j
.text:00000000004011D2                 mov     qword ptr [rdx+8], 0
.text:00000000004011DA                 mov     ebp, 5
.text:00000000004011DF
.text:00000000004011DF loc_4011DF:                             ; CODE XREF: phase_6+101↓j
.text:00000000004011DF                 mov     rax, [rbx+8]
.text:00000000004011E3                 mov     eax, [rax]
.text:00000000004011E5                 cmp     [rbx], eax
.text:00000000004011E7                 jge     short loc_4011EE
.text:00000000004011E9                 call    explode_bomb
.text:00000000004011EE ; ---------------------------------------------------------------------------
.text:00000000004011EE
.text:00000000004011EE loc_4011EE:                             ; CODE XREF: phase_6+F3↑j
.text:00000000004011EE                 mov     rbx, [rbx+8]
.text:00000000004011F2                 sub     ebp, 1
.text:00000000004011F5                 jnz     short loc_4011DF
.text:00000000004011F7                 add     rsp, 50h
.text:00000000004011FB                 pop     rbx
.text:00000000004011FC                 pop     rbp
.text:00000000004011FD                 pop     r12
.text:00000000004011FF                 pop     r13
.text:0000000000401201                 pop     r14
.text:0000000000401203                 retn
.text:0000000000401203 ; } // starts at 4010F4
```

将排序好的链表的值 与该地址+8(即下一个链表结点)的值比较 如果不满足 当前节点的值≥下一个结点的值 就`bomb`



gdb查看node链表的值

```
pwndbg> x/20gx 0x0000000006032D0
0x6032d0 <node1>:	0x000000010000014c	0x00000000006032e0
0x6032e0 <node2>:	0x00000002000000a8	0x0000000000000000
0x6032f0 <node3>:	0x000000030000039c	0x0000000000603300
0x603300 <node4>:	0x00000004000002b3	0x0000000000603310
0x603310 <node5>:	0x00000005000001dd	0x0000000000603320
0x603320 <node6>:	0x00000006000001bb	0x00000000006032d0
0x603330:	0x0000000000000000	0x0000000000000000
0x603340 <host_table>:	0x0000000000402629	0x0000000000402643
0x603350 <host_table+16>:	0x000000000040265d	0x0000000000000000
0x603360 <host_table+32>:	0x0000000000000000	0x0000000000000000

```

按照大小排列 就是3 4 5 6 1 2 

对7取反就是 4 3 2 1 6 5







# exp全：

```python
from pwn import *
context(arch='amd64',endian='el',os='linux')
context.log_level='debug'
p = process("./bomb")
p.sendlineafter("which to blow yourself up. Have a nice day!\n",'Border relations with Canada have never been better.') # 1
p.sendlineafter("How about the next one?\n",'1 2 4 8 16 32') # 2
p.sendlineafter("That's number 2.  Keep going!\n", '0 207') # 3
p.sendlineafter("Halfway there!\n", "7 0") # 4
p.sendlineafter("So you got that one.  Try this one.\n", "IONEFG") # 5
p.sendlineafter("Good work!  On to the next...\n", "4 3 2 1 6 5") # 6
p.interactive()
```

