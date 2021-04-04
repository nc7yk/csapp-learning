# phase1:

![image-20210401170238910](C:\Users\de'l'l\AppData\Roaming\Typora\typora-user-images\image-20210401170238910.png)

ida直接看

也可以gdb调试 rdi和rsi存放的是函数`strings_not_equal`的参数，所以可以直接断点下到`strings_not_equal`直接看到传入的参数

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





# phase2:

源码：

```c
__int64 __fastcall phase_2(__int64 a1)
{
  __int64 result; // rax
  char *v2; // rbx
  int v3; // [rsp+0h] [rbp-38h] BYREF
  char v4; // [rsp+4h] [rbp-34h] BYREF
  char v5; // [rsp+18h] [rbp-20h] BYREF

  read_six_numbers(a1, (__int64)&v3);
  if ( v3 != 1 )
    explode_bomb();
  v2 = &v4;
  do
  {
    result = (unsigned int)(2 * *((_DWORD *)v2 - 1));
    if ( *(_DWORD *)v2 != (_DWORD)result )
      explode_bomb();
    v2 += 4;
  }
  while ( v2 != &v5 );
  return result;
}
```

思路：

首先读入6个数据，判断第一个数据要为1，然后将v4的地址存入v2，之后的数据都要是上一个的两倍 并逐个比较

也就是1 2 4 8 16 32



# phase3:

```c
__int64 __fastcall phase_3(__int64 a1)
{
  __int64 result; // rax
  int v2; // [rsp+8h] [rbp-10h] BYREF
  int v3; // [rsp+Ch] [rbp-Ch] BYREF

  if ( (int)__isoc99_sscanf(a1, "%d %d", &v2, &v3) <= 1 )
    explode_bomb();
  switch ( v2 )
  {
    case 0:
      result = 0xCFLL;
      break;
    case 1:
      result = 0x137LL;
      break;
    case 2:
      result = 0x2C3LL;
      break;
    case 3:
      result = 0x100LL;
      break;
    case 4:
      result = 0x185LL;
      break;
    case 5:
      result = 0xCELL;
      break;
    case 6:
      result = 0x2AALL;
      break;
    case 7:
      result = 327LL;
      break;
    default:
      explode_bomb();
  }
  if ( (_DWORD)result != v3 )
    explode_bomb();
  return result;
}
```

switch循环 直接过

```
0 207
```



# phase4：

```c
__int64 __fastcall phase_4(__int64 a1)
{
  __int64 result; // rax
  unsigned int v2; // [rsp+8h] [rbp-10h] BYREF
  int v3; // [rsp+Ch] [rbp-Ch] BYREF

  if ( (unsigned int)__isoc99_sscanf(a1, "%d %d", &v2, &v3) != 2 || v2 > 0xE )
    explode_bomb();
  result = func4(v2, 0LL, 14LL);
  if ( (_DWORD)result || v3 )
    explode_bomb();
  return result;
}
```

```c
__int64 __fastcall func4(__int64 a1, __int64 a2, __int64 a3)
{
  int v3; // ecx
  __int64 result; // rax

  v3 = ((int)a3 - (int)a2) / 2 + a2;
  if ( v3 > (int)a1 )
    return 2 * (unsigned int)func4(a1, a2, (unsigned int)(v3 - 1));
  result = 0LL;
  if ( v3 < (int)a1 )
    result = 2 * (unsigned int)func4(a1, (unsigned int)(v3 + 1), a3) + 1;
  return result;
}
```

输入两个数，第一个数不大于14

要让result 和 v3等于0

根据算法在fun4内，只要让v3 = a1即可返回0

v3在第一次会变为7 = 14/2

所以直接赋给a1=7即可

```
7 0
```



# phase5:

```c
unsigned __int64 __fastcall phase_5(_BYTE *a1)
{
  __int64 i; // rax
  char v3[8]; // [rsp+10h] [rbp-18h] BYREF
  unsigned __int64 v4; // [rsp+18h] [rbp-10h]

  v4 = __readfsqword(0x28u);
  if ( (unsigned int)string_length(a1) != 6 )
    explode_bomb();
  for ( i = 0LL; i != 6; ++i )
    v3[i] = array_3449[a1[i] & 0xF];
  v3[6] = 0;
  if ( (unsigned int)strings_not_equal(v3, "flyers") )
    explode_bomb();
  return __readfsqword(0x28u) ^ v4;
}
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

输入6位的char a1然后逐位和0xF做与运算，然后再取array_3449数组中对应大小位置的数值

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

```c
__int64 __fastcall phase_6(__int64 a1)
{
  int *v1; // r13
  int v2; // er12
  int v3; // ebx
  char *v4; // rax
  unsigned __int64 i; // rsi
  _QWORD *v6; // rdx
  int v7; // eax
  int v8; // ecx
  __int64 v9; // rbx
  char *v10; // rax
  __int64 j; // rcx
  __int64 v12; // rdx
  int v13; // ebp
  __int64 result; // rax
  int v15[6]; // [rsp+0h] [rbp-78h] BYREF
  char v16; // [rsp+18h] [rbp-60h] BYREF
  __int64 v17; // [rsp+20h] [rbp-58h]
  char v18; // [rsp+28h] [rbp-50h] BYREF
  char v19; // [rsp+50h] [rbp-28h] BYREF

  v1 = v15;
  read_six_numbers(a1, (__int64)v15);
  v2 = 0;
  while ( 1 )
  {
    if ( (unsigned int)(*v1 - 1) > 5 )
      explode_bomb();
    if ( ++v2 == 6 )
      break;
    v3 = v2;
    do
    {
      if ( *v1 == v15[v3] )
        explode_bomb();
      ++v3;
    }
    while ( v3 <= 5 );
    ++v1;
  }
  v4 = (char *)v15;
  do
  {
    *(_DWORD *)v4 = 7 - *(_DWORD *)v4;
    v4 += 4;
  }
  while ( v4 != &v16 );
  for ( i = 0LL; i != 24; i += 4LL )
  {
    v8 = v15[i / 4];
    if ( v8 <= 1 )
    {
      v6 = &node1;
    }
    else
    {
      v7 = 1;
      v6 = &node1;
      do
      {
        v6 = (_QWORD *)v6[1];
        ++v7;
      }
      while ( v7 != v8 );
    }
    *(__int64 *)((char *)&v17 + 2 * i) = (__int64)v6;
  }
  v9 = v17;
  v10 = &v18;
  for ( j = v17; ; j = v12 )
  {
    v12 = *(_QWORD *)v10;
    *(_QWORD *)(j + 8) = *(_QWORD *)v10;
    v10 += 8;
    if ( v10 == &v19 )
      break;
  }
  *(_QWORD *)(v12 + 8) = 0LL;
  v13 = 5;
  do
  {
    result = **(unsigned int **)(v9 + 8);
    if ( *(_DWORD *)v9 < (int)result )
      explode_bomb();
    v9 = *(_QWORD *)(v9 + 8);
    --v13;
  }
  while ( v13 );
  return result;
}
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

逻辑：

```
第一个while(1)循环是为了保证数组的值 因为是无符号整形所以需要防止溢出，符合输入规范 而且输入的6个值不能相同
第二个循环 每隔四个字节 存入*v4 = 7 - *v4 也就是使得数组a[i]每项都变成7-a[i] 这样 写入顺序时就要对7取反
对链表排序
```



中间部分是一个按照输入的数字顺序将链表的数据放入数组操作 每隔8字节存入数据 和 链表地址

```c
  v9 = v17;
  v10 = &v18;
  for ( j = v17; ; j = v12 )
  {
    v12 = *(_QWORD *)v10;
    *(_QWORD *)(j + 8) = *(_QWORD *)v10;
    v10 += 8;
    if ( v10 == &v19 )
      break;
  }
  *(_QWORD *)(v12 + 8) = 0LL;
  v13 = 5;
```



很明显 这是个判断v9是否为非升序 存在后面的数比前面的数大的 直接bomb

```c
  do
  {
    result = **(unsigned int **)(v9 + 8);
    if ( *(_DWORD *)v9 < (int)result )
      explode_bomb();
    v9 = *(_QWORD *)(v9 + 8);
    --v13;
  }
```



而v9是通过v17 读取node链表的数据

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

```
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

