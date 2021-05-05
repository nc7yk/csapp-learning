
yis.o：     文件格式 elf64-x86-64


Disassembly of section .text:

0000000000000000 <usage>:
   0:	48 83 ec 08          	sub    $0x8,%rsp
   4:	48 89 fa             	mov    %rdi,%rdx
   7:	be 00 00 00 00       	mov    $0x0,%esi
   c:	bf 01 00 00 00       	mov    $0x1,%edi
  11:	b8 00 00 00 00       	mov    $0x0,%eax
  16:	e8 00 00 00 00       	callq  1b <usage+0x1b>
  1b:	bf 00 00 00 00       	mov    $0x0,%edi
  20:	e8 00 00 00 00       	callq  25 <main>

0000000000000025 <main>:
  25:	41 57                	push   %r15
  27:	41 56                	push   %r14
  29:	41 55                	push   %r13
  2b:	41 54                	push   %r12
  2d:	55                   	push   %rbp
  2e:	53                   	push   %rbx
  2f:	48 83 ec 08          	sub    $0x8,%rsp
  33:	89 fb                	mov    %edi,%ebx
  35:	49 89 f4             	mov    %rsi,%r12
  38:	bf 00 20 00 00       	mov    $0x2000,%edi
  3d:	e8 00 00 00 00       	callq  42 <main+0x1d>
  42:	48 89 c5             	mov    %rax,%rbp
  45:	48 8b 78 08          	mov    0x8(%rax),%rdi
  49:	e8 00 00 00 00       	callq  4e <main+0x29>
  4e:	49 89 c6             	mov    %rax,%r14
  51:	8d 43 fe             	lea    -0x2(%rbx),%eax
  54:	83 f8 01             	cmp    $0x1,%eax
  57:	76 09                	jbe    62 <main+0x3d>
  59:	49 8b 3c 24          	mov    (%r12),%rdi
  5d:	e8 00 00 00 00       	callq  62 <main+0x3d>
  62:	49 8b 7c 24 08       	mov    0x8(%r12),%rdi
  67:	be 00 00 00 00       	mov    $0x0,%esi
  6c:	e8 00 00 00 00       	callq  71 <main+0x4c>
  71:	48 85 c0             	test   %rax,%rax
  74:	75 25                	jne    9b <main+0x76>
  76:	49 8b 4c 24 08       	mov    0x8(%r12),%rcx
  7b:	ba 00 00 00 00       	mov    $0x0,%edx
  80:	be 01 00 00 00       	mov    $0x1,%esi
  85:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 8c <main+0x67>
  8c:	e8 00 00 00 00       	callq  91 <main+0x6c>
  91:	bf 01 00 00 00       	mov    $0x1,%edi
  96:	e8 00 00 00 00       	callq  9b <main+0x76>
  9b:	48 8b 7d 10          	mov    0x10(%rbp),%rdi
  9f:	ba 01 00 00 00       	mov    $0x1,%edx
  a4:	48 89 c6             	mov    %rax,%rsi
  a7:	e8 00 00 00 00       	callq  ac <main+0x87>
  ac:	85 c0                	test   %eax,%eax
  ae:	75 14                	jne    c4 <main+0x9f>
  b0:	bf 00 00 00 00       	mov    $0x0,%edi
  b5:	e8 00 00 00 00       	callq  ba <main+0x95>
  ba:	b8 01 00 00 00       	mov    $0x1,%eax
  bf:	e9 f3 00 00 00       	jmpq   1b7 <main+0x192>
  c4:	48 8b 7d 10          	mov    0x10(%rbp),%rdi
  c8:	e8 00 00 00 00       	callq  cd <main+0xa8>
  cd:	49 89 c7             	mov    %rax,%r15
  d0:	41 bd 10 27 00 00    	mov    $0x2710,%r13d
  d6:	83 fb 02             	cmp    $0x2,%ebx
  d9:	7e 1b                	jle    f6 <main+0xd1>
  db:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
  e0:	ba 0a 00 00 00       	mov    $0xa,%edx
  e5:	be 00 00 00 00       	mov    $0x0,%esi
  ea:	e8 00 00 00 00       	callq  ef <main+0xca>
  ef:	41 89 c5             	mov    %eax,%r13d
  f2:	85 c0                	test   %eax,%eax
  f4:	7e 26                	jle    11c <main+0xf7>
  f6:	bb 00 00 00 00       	mov    $0x0,%ebx
  fb:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 102 <main+0xdd>
 102:	48 89 ef             	mov    %rbp,%rdi
 105:	e8 00 00 00 00       	callq  10a <main+0xe5>
 10a:	41 89 c4             	mov    %eax,%r12d
 10d:	83 c3 01             	add    $0x1,%ebx
 110:	44 39 eb             	cmp    %r13d,%ebx
 113:	7d 12                	jge    127 <main+0x102>
 115:	83 f8 01             	cmp    $0x1,%eax
 118:	74 e1                	je     fb <main+0xd6>
 11a:	eb 0b                	jmp    127 <main+0x102>
 11c:	41 bc 01 00 00 00    	mov    $0x1,%r12d
 122:	bb 00 00 00 00       	mov    $0x0,%ebx
 127:	0f b6 7d 18          	movzbl 0x18(%rbp),%edi
 12b:	e8 00 00 00 00       	callq  130 <main+0x10b>
 130:	49 89 c5             	mov    %rax,%r13
 133:	44 89 e7             	mov    %r12d,%edi
 136:	e8 00 00 00 00       	callq  13b <main+0x116>
 13b:	49 89 c0             	mov    %rax,%r8
 13e:	4d 89 e9             	mov    %r13,%r9
 141:	48 8b 4d 00          	mov    0x0(%rbp),%rcx
 145:	89 da                	mov    %ebx,%edx
 147:	be 00 00 00 00       	mov    $0x0,%esi
 14c:	bf 01 00 00 00       	mov    $0x1,%edi
 151:	b8 00 00 00 00       	mov    $0x0,%eax
 156:	e8 00 00 00 00       	callq  15b <main+0x136>
 15b:	bf 00 00 00 00       	mov    $0x0,%edi
 160:	e8 00 00 00 00       	callq  165 <main+0x140>
 165:	48 8b 75 08          	mov    0x8(%rbp),%rsi
 169:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # 170 <main+0x14b>
 170:	4c 89 f7             	mov    %r14,%rdi
 173:	e8 00 00 00 00       	callq  178 <main+0x153>
 178:	bf 00 00 00 00       	mov    $0x0,%edi
 17d:	e8 00 00 00 00       	callq  182 <main+0x15d>
 182:	48 8b 75 10          	mov    0x10(%rbp),%rsi
 186:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # 18d <main+0x168>
 18d:	4c 89 ff             	mov    %r15,%rdi
 190:	e8 00 00 00 00       	callq  195 <main+0x170>
 195:	48 89 ef             	mov    %rbp,%rdi
 198:	e8 00 00 00 00       	callq  19d <main+0x178>
 19d:	4c 89 f7             	mov    %r14,%rdi
 1a0:	b8 00 00 00 00       	mov    $0x0,%eax
 1a5:	e8 00 00 00 00       	callq  1aa <main+0x185>
 1aa:	4c 89 ff             	mov    %r15,%rdi
 1ad:	e8 00 00 00 00       	callq  1b2 <main+0x18d>
 1b2:	b8 00 00 00 00       	mov    $0x0,%eax
 1b7:	48 83 c4 08          	add    $0x8,%rsp
 1bb:	5b                   	pop    %rbx
 1bc:	5d                   	pop    %rbp
 1bd:	41 5c                	pop    %r12
 1bf:	41 5d                	pop    %r13
 1c1:	41 5e                	pop    %r14
 1c3:	41 5f                	pop    %r15
 1c5:	c3                   	retq   
