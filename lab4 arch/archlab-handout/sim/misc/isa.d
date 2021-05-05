
isa.o：     文件格式 elf64-x86-64


Disassembly of section .text:

0000000000000000 <find_register>:
       0:	41 54                	push   %r12
       2:	55                   	push   %rbp
       3:	53                   	push   %rbx
       4:	49 89 fc             	mov    %rdi,%r12
       7:	bb 00 00 00 00       	mov    $0x0,%ebx
       c:	48 89 d8             	mov    %rbx,%rax
       f:	48 c1 e0 04          	shl    $0x4,%rax
      13:	48 8b b0 00 00 00 00 	mov    0x0(%rax),%rsi
      1a:	4c 89 e7             	mov    %r12,%rdi
      1d:	e8 00 00 00 00       	callq  22 <find_register+0x22>
      22:	85 c0                	test   %eax,%eax
      24:	75 0f                	jne    35 <find_register+0x35>
      26:	48 63 eb             	movslq %ebx,%rbp
      29:	48 c1 e5 04          	shl    $0x4,%rbp
      2d:	8b 85 00 00 00 00    	mov    0x0(%rbp),%eax
      33:	eb 0f                	jmp    44 <find_register+0x44>
      35:	48 83 c3 01          	add    $0x1,%rbx
      39:	48 83 fb 0f          	cmp    $0xf,%rbx
      3d:	75 cd                	jne    c <find_register+0xc>
      3f:	b8 10 00 00 00       	mov    $0x10,%eax
      44:	5b                   	pop    %rbx
      45:	5d                   	pop    %rbp
      46:	41 5c                	pop    %r12
      48:	c3                   	retq   

0000000000000049 <reg_name>:
      49:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 50 <reg_name+0x7>
      50:	83 ff 0e             	cmp    $0xe,%edi
      53:	77 0d                	ja     62 <reg_name+0x19>
      55:	89 ff                	mov    %edi,%edi
      57:	48 c1 e7 04          	shl    $0x4,%rdi
      5b:	48 8b 87 00 00 00 00 	mov    0x0(%rdi),%rax
      62:	f3 c3                	repz retq 

0000000000000064 <reg_valid>:
      64:	b8 00 00 00 00       	mov    $0x0,%eax
      69:	83 ff 0e             	cmp    $0xe,%edi
      6c:	77 12                	ja     80 <reg_valid+0x1c>
      6e:	89 f8                	mov    %edi,%eax
      70:	48 c1 e0 04          	shl    $0x4,%rax
      74:	39 b8 00 00 00 00    	cmp    %edi,0x0(%rax)
      7a:	0f 94 c0             	sete   %al
      7d:	0f b6 c0             	movzbl %al,%eax
      80:	f3 c3                	repz retq 

0000000000000082 <find_instr>:
      82:	41 54                	push   %r12
      84:	55                   	push   %rbp
      85:	53                   	push   %rbx
      86:	49 89 fc             	mov    %rdi,%r12
      89:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 90 <find_instr+0xe>
      90:	48 85 ff             	test   %rdi,%rdi
      93:	74 3f                	je     d4 <find_instr+0x52>
      95:	bb 00 00 00 00       	mov    $0x0,%ebx
      9a:	bd 00 00 00 00       	mov    $0x0,%ebp
      9f:	4c 89 e6             	mov    %r12,%rsi
      a2:	e8 00 00 00 00       	callq  a7 <find_instr+0x25>
      a7:	85 c0                	test   %eax,%eax
      a9:	75 12                	jne    bd <find_instr+0x3b>
      ab:	48 63 ed             	movslq %ebp,%rbp
      ae:	48 8d 44 ad 00       	lea    0x0(%rbp,%rbp,4),%rax
      b3:	48 8d 04 c5 00 00 00 	lea    0x0(,%rax,8),%rax
      ba:	00 
      bb:	eb 1c                	jmp    d9 <find_instr+0x57>
      bd:	83 c5 01             	add    $0x1,%ebp
      c0:	48 83 c3 28          	add    $0x28,%rbx
      c4:	48 8b 7b d8          	mov    -0x28(%rbx),%rdi
      c8:	48 85 ff             	test   %rdi,%rdi
      cb:	75 d2                	jne    9f <find_instr+0x1d>
      cd:	b8 00 00 00 00       	mov    $0x0,%eax
      d2:	eb 05                	jmp    d9 <find_instr+0x57>
      d4:	b8 00 00 00 00       	mov    $0x0,%eax
      d9:	5b                   	pop    %rbx
      da:	5d                   	pop    %rbp
      db:	41 5c                	pop    %r12
      dd:	c3                   	retq   

00000000000000de <iname>:
      de:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # e5 <iname+0x7>
      e5:	48 85 c0             	test   %rax,%rax
      e8:	74 2f                	je     119 <iname+0x3b>
      ea:	0f b6 15 00 00 00 00 	movzbl 0x0(%rip),%edx        # f1 <iname+0x13>
      f1:	39 d7                	cmp    %edx,%edi
      f3:	74 29                	je     11e <iname+0x40>
      f5:	ba 00 00 00 00       	mov    $0x0,%edx
      fa:	eb 0c                	jmp    108 <iname+0x2a>
      fc:	48 83 c2 28          	add    $0x28,%rdx
     100:	0f b6 49 08          	movzbl 0x8(%rcx),%ecx
     104:	39 f9                	cmp    %edi,%ecx
     106:	74 16                	je     11e <iname+0x40>
     108:	48 89 d1             	mov    %rdx,%rcx
     10b:	48 8b 02             	mov    (%rdx),%rax
     10e:	48 85 c0             	test   %rax,%rax
     111:	75 e9                	jne    fc <iname+0x1e>
     113:	b8 00 00 00 00       	mov    $0x0,%eax
     118:	c3                   	retq   
     119:	b8 00 00 00 00       	mov    $0x0,%eax
     11e:	f3 c3                	repz retq 

0000000000000120 <bad_instr>:
     120:	b8 00 00 00 00       	mov    $0x0,%eax
     125:	c3                   	retq   

0000000000000126 <init_mem>:
     126:	55                   	push   %rbp
     127:	53                   	push   %rbx
     128:	48 83 ec 08          	sub    $0x8,%rsp
     12c:	89 fb                	mov    %edi,%ebx
     12e:	bf 18 00 00 00       	mov    $0x18,%edi
     133:	e8 00 00 00 00       	callq  138 <init_mem+0x12>
     138:	48 89 c5             	mov    %rax,%rbp
     13b:	8d 43 3e             	lea    0x3e(%rbx),%eax
     13e:	83 c3 1f             	add    $0x1f,%ebx
     141:	89 df                	mov    %ebx,%edi
     143:	0f 48 f8             	cmovs  %eax,%edi
     146:	83 e7 e0             	and    $0xffffffe0,%edi
     149:	89 7d 00             	mov    %edi,0x0(%rbp)
     14c:	48 63 ff             	movslq %edi,%rdi
     14f:	be 01 00 00 00       	mov    $0x1,%esi
     154:	e8 00 00 00 00       	callq  159 <init_mem+0x33>
     159:	48 89 45 10          	mov    %rax,0x10(%rbp)
     15d:	48 89 e8             	mov    %rbp,%rax
     160:	48 83 c4 08          	add    $0x8,%rsp
     164:	5b                   	pop    %rbx
     165:	5d                   	pop    %rbp
     166:	c3                   	retq   

0000000000000167 <clear_mem>:
     167:	48 83 ec 08          	sub    $0x8,%rsp
     16b:	48 63 17             	movslq (%rdi),%rdx
     16e:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
     172:	be 00 00 00 00       	mov    $0x0,%esi
     177:	e8 00 00 00 00       	callq  17c <clear_mem+0x15>
     17c:	48 83 c4 08          	add    $0x8,%rsp
     180:	c3                   	retq   

0000000000000181 <free_mem>:
     181:	53                   	push   %rbx
     182:	48 89 fb             	mov    %rdi,%rbx
     185:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
     189:	e8 00 00 00 00       	callq  18e <free_mem+0xd>
     18e:	48 89 df             	mov    %rbx,%rdi
     191:	e8 00 00 00 00       	callq  196 <free_mem+0x15>
     196:	5b                   	pop    %rbx
     197:	c3                   	retq   

0000000000000198 <copy_mem>:
     198:	55                   	push   %rbp
     199:	53                   	push   %rbx
     19a:	48 83 ec 08          	sub    $0x8,%rsp
     19e:	48 89 fb             	mov    %rdi,%rbx
     1a1:	8b 3f                	mov    (%rdi),%edi
     1a3:	e8 00 00 00 00       	callq  1a8 <copy_mem+0x10>
     1a8:	48 89 c5             	mov    %rax,%rbp
     1ab:	48 8b 78 10          	mov    0x10(%rax),%rdi
     1af:	48 63 13             	movslq (%rbx),%rdx
     1b2:	48 8b 73 10          	mov    0x10(%rbx),%rsi
     1b6:	e8 00 00 00 00       	callq  1bb <copy_mem+0x23>
     1bb:	48 89 e8             	mov    %rbp,%rax
     1be:	48 83 c4 08          	add    $0x8,%rsp
     1c2:	5b                   	pop    %rbx
     1c3:	5d                   	pop    %rbp
     1c4:	c3                   	retq   

00000000000001c5 <hex2dig>:
     1c5:	55                   	push   %rbp
     1c6:	53                   	push   %rbx
     1c7:	48 83 ec 08          	sub    $0x8,%rsp
     1cb:	89 fb                	mov    %edi,%ebx
     1cd:	e8 00 00 00 00       	callq  1d2 <hex2dig+0xd>
     1d2:	48 0f be eb          	movsbq %bl,%rbp
     1d6:	48 8b 00             	mov    (%rax),%rax
     1d9:	0f b7 04 68          	movzwl (%rax,%rbp,2),%eax
     1dd:	f6 c4 08             	test   $0x8,%ah
     1e0:	74 08                	je     1ea <hex2dig+0x25>
     1e2:	0f be db             	movsbl %bl,%ebx
     1e5:	8d 43 d0             	lea    -0x30(%rbx),%eax
     1e8:	eb 13                	jmp    1fd <hex2dig+0x38>
     1ea:	f6 c4 01             	test   $0x1,%ah
     1ed:	74 08                	je     1f7 <hex2dig+0x32>
     1ef:	0f be db             	movsbl %bl,%ebx
     1f2:	8d 43 c9             	lea    -0x37(%rbx),%eax
     1f5:	eb 06                	jmp    1fd <hex2dig+0x38>
     1f7:	0f be db             	movsbl %bl,%ebx
     1fa:	8d 43 a9             	lea    -0x57(%rbx),%eax
     1fd:	48 83 c4 08          	add    $0x8,%rsp
     201:	5b                   	pop    %rbx
     202:	5d                   	pop    %rbp
     203:	c3                   	retq   

0000000000000204 <load_mem>:
     204:	41 57                	push   %r15
     206:	41 56                	push   %r14
     208:	41 55                	push   %r13
     20a:	41 54                	push   %r12
     20c:	55                   	push   %rbp
     20d:	53                   	push   %rbx
     20e:	48 81 ec 38 10 00 00 	sub    $0x1038,%rsp
     215:	49 89 ff             	mov    %rdi,%r15
     218:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
     21d:	89 54 24 1c          	mov    %edx,0x1c(%rsp)
     221:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
     228:	00 00 
     22a:	48 89 84 24 28 10 00 	mov    %rax,0x1028(%rsp)
     231:	00 
     232:	31 c0                	xor    %eax,%eax
     234:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%rsp)
     23b:	00 
     23c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%rsp)
     243:	00 
     244:	e9 69 02 00 00       	jmpq   4b2 <load_mem+0x2ae>
     249:	83 44 24 18 01       	addl   $0x1,0x18(%rsp)
     24e:	e8 00 00 00 00       	callq  253 <load_mem+0x4f>
     253:	49 89 c6             	mov    %rax,%r14
     256:	48 8b 28             	mov    (%rax),%rbp
     259:	b8 00 00 00 00       	mov    $0x0,%eax
     25e:	89 c3                	mov    %eax,%ebx
     260:	0f b6 54 04 20       	movzbl 0x20(%rsp,%rax,1),%edx
     265:	48 83 c0 01          	add    $0x1,%rax
     269:	48 0f be ca          	movsbq %dl,%rcx
     26d:	f6 44 4d 01 20       	testb  $0x20,0x1(%rbp,%rcx,2)
     272:	75 ea                	jne    25e <load_mem+0x5a>
     274:	80 fa 30             	cmp    $0x30,%dl
     277:	0f 85 35 02 00 00    	jne    4b2 <load_mem+0x2ae>
     27d:	8d 43 01             	lea    0x1(%rbx),%eax
     280:	48 98                	cltq   
     282:	0f b6 44 04 20       	movzbl 0x20(%rsp,%rax,1),%eax
     287:	83 e0 df             	and    $0xffffffdf,%eax
     28a:	3c 58                	cmp    $0x58,%al
     28c:	0f 85 20 02 00 00    	jne    4b2 <load_mem+0x2ae>
     292:	83 c3 02             	add    $0x2,%ebx
     295:	48 63 c3             	movslq %ebx,%rax
     298:	0f b6 7c 04 20       	movzbl 0x20(%rsp,%rax,1),%edi
     29d:	48 0f be c7          	movsbq %dil,%rax
     2a1:	f6 44 45 01 10       	testb  $0x10,0x1(%rbp,%rax,2)
     2a6:	74 30                	je     2d8 <load_mem+0xd4>
     2a8:	41 bc 00 00 00 00    	mov    $0x0,%r12d
     2ae:	83 c3 01             	add    $0x1,%ebx
     2b1:	49 c1 e4 04          	shl    $0x4,%r12
     2b5:	40 0f be ff          	movsbl %dil,%edi
     2b9:	e8 00 00 00 00       	callq  2be <load_mem+0xba>
     2be:	48 98                	cltq   
     2c0:	49 01 c4             	add    %rax,%r12
     2c3:	48 63 c3             	movslq %ebx,%rax
     2c6:	0f b6 7c 04 20       	movzbl 0x20(%rsp,%rax,1),%edi
     2cb:	48 0f be c7          	movsbq %dil,%rax
     2cf:	f6 44 45 01 10       	testb  $0x10,0x1(%rbp,%rax,2)
     2d4:	75 d8                	jne    2ae <load_mem+0xaa>
     2d6:	eb 06                	jmp    2de <load_mem+0xda>
     2d8:	41 bc 00 00 00 00    	mov    $0x0,%r12d
     2de:	48 63 c3             	movslq %ebx,%rax
     2e1:	0f b6 44 04 20       	movzbl 0x20(%rsp,%rax,1),%eax
     2e6:	48 0f be d0          	movsbq %al,%rdx
     2ea:	f6 44 55 01 20       	testb  $0x20,0x1(%rbp,%rdx,2)
     2ef:	74 16                	je     307 <load_mem+0x103>
     2f1:	83 c3 01             	add    $0x1,%ebx
     2f4:	48 63 c3             	movslq %ebx,%rax
     2f7:	0f b6 44 04 20       	movzbl 0x20(%rsp,%rax,1),%eax
     2fc:	48 0f be d0          	movsbq %al,%rdx
     300:	f6 44 55 01 20       	testb  $0x20,0x1(%rbp,%rdx,2)
     305:	75 ea                	jne    2f1 <load_mem+0xed>
     307:	83 c3 01             	add    $0x1,%ebx
     30a:	3c 3a                	cmp    $0x3a,%al
     30c:	75 19                	jne    327 <load_mem+0x123>
     30e:	48 63 c3             	movslq %ebx,%rax
     311:	48 0f be 44 04 20    	movsbq 0x20(%rsp,%rax,1),%rax
     317:	f6 44 45 01 20       	testb  $0x20,0x1(%rbp,%rax,2)
     31c:	0f 85 84 00 00 00    	jne    3a6 <load_mem+0x1a2>
     322:	e9 92 00 00 00       	jmpq   3b9 <load_mem+0x1b5>
     327:	b8 00 00 00 00       	mov    $0x0,%eax
     32c:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%rsp)
     331:	0f 84 9c 01 00 00    	je     4d3 <load_mem+0x2cf>
     337:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 33e <load_mem+0x13a>
     33e:	ba 23 00 00 00       	mov    $0x23,%edx
     343:	be 01 00 00 00       	mov    $0x1,%esi
     348:	bf 00 00 00 00       	mov    $0x0,%edi
     34d:	e8 00 00 00 00       	callq  352 <load_mem+0x14e>
     352:	4c 8d 44 24 20       	lea    0x20(%rsp),%r8
     357:	8b 4c 24 18          	mov    0x18(%rsp),%ecx
     35b:	ba 00 00 00 00       	mov    $0x0,%edx
     360:	be 01 00 00 00       	mov    $0x1,%esi
     365:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 36c <load_mem+0x168>
     36c:	b8 00 00 00 00       	mov    $0x0,%eax
     371:	e8 00 00 00 00       	callq  376 <load_mem+0x172>
     376:	48 63 c3             	movslq %ebx,%rax
     379:	0f be 4c 04 20       	movsbl 0x20(%rsp,%rax,1),%ecx
     37e:	41 89 d8             	mov    %ebx,%r8d
     381:	ba 00 00 00 00       	mov    $0x0,%edx
     386:	be 01 00 00 00       	mov    $0x1,%esi
     38b:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 392 <load_mem+0x18e>
     392:	b8 00 00 00 00       	mov    $0x0,%eax
     397:	e8 00 00 00 00       	callq  39c <load_mem+0x198>
     39c:	b8 00 00 00 00       	mov    $0x0,%eax
     3a1:	e9 2d 01 00 00       	jmpq   4d3 <load_mem+0x2cf>
     3a6:	83 c3 01             	add    $0x1,%ebx
     3a9:	48 63 c3             	movslq %ebx,%rax
     3ac:	48 0f be 44 04 20    	movsbq 0x20(%rsp,%rax,1),%rax
     3b2:	f6 44 45 01 20       	testb  $0x20,0x1(%rbp,%rax,2)
     3b7:	75 ed                	jne    3a6 <load_mem+0x1a2>
     3b9:	8d 53 01             	lea    0x1(%rbx),%edx
     3bc:	48 63 c3             	movslq %ebx,%rax
     3bf:	0f b6 44 04 20       	movzbl 0x20(%rsp,%rax,1),%eax
     3c4:	48 0f be c8          	movsbq %al,%rcx
     3c8:	f6 44 4d 01 10       	testb  $0x10,0x1(%rbp,%rcx,2)
     3cd:	0f 84 df 00 00 00    	je     4b2 <load_mem+0x2ae>
     3d3:	83 c3 02             	add    $0x2,%ebx
     3d6:	48 63 d2             	movslq %edx,%rdx
     3d9:	44 0f b6 6c 14 20    	movzbl 0x20(%rsp,%rdx,1),%r13d
     3df:	49 0f be d5          	movsbq %r13b,%rdx
     3e3:	f6 44 55 01 10       	testb  $0x10,0x1(%rbp,%rdx,2)
     3e8:	0f 84 c4 00 00 00    	je     4b2 <load_mem+0x2ae>
     3ee:	49 63 17             	movslq (%r15),%rdx
     3f1:	4c 39 e2             	cmp    %r12,%rdx
     3f4:	7f 5e                	jg     454 <load_mem+0x250>
     3f6:	eb 08                	jmp    400 <load_mem+0x1fc>
     3f8:	49 63 17             	movslq (%r15),%rdx
     3fb:	4c 39 e2             	cmp    %r12,%rdx
     3fe:	7f 54                	jg     454 <load_mem+0x250>
     400:	b8 00 00 00 00       	mov    $0x0,%eax
     405:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%rsp)
     40a:	0f 84 c3 00 00 00    	je     4d3 <load_mem+0x2cf>
     410:	4c 89 e1             	mov    %r12,%rcx
     413:	ba 00 00 00 00       	mov    $0x0,%edx
     418:	be 01 00 00 00       	mov    $0x1,%esi
     41d:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 424 <load_mem+0x220>
     424:	e8 00 00 00 00       	callq  429 <load_mem+0x225>
     429:	4c 8d 44 24 20       	lea    0x20(%rsp),%r8
     42e:	8b 4c 24 18          	mov    0x18(%rsp),%ecx
     432:	ba 00 00 00 00       	mov    $0x0,%edx
     437:	be 01 00 00 00       	mov    $0x1,%esi
     43c:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 443 <load_mem+0x23f>
     443:	b8 00 00 00 00       	mov    $0x0,%eax
     448:	e8 00 00 00 00       	callq  44d <load_mem+0x249>
     44d:	b8 00 00 00 00       	mov    $0x0,%eax
     452:	eb 7f                	jmp    4d3 <load_mem+0x2cf>
     454:	0f be f8             	movsbl %al,%edi
     457:	e8 00 00 00 00       	callq  45c <load_mem+0x258>
     45c:	89 c5                	mov    %eax,%ebp
     45e:	41 0f be fd          	movsbl %r13b,%edi
     462:	e8 00 00 00 00       	callq  467 <load_mem+0x263>
     467:	49 83 c4 01          	add    $0x1,%r12
     46b:	49 8b 57 10          	mov    0x10(%r15),%rdx
     46f:	c1 e5 04             	shl    $0x4,%ebp
     472:	01 e8                	add    %ebp,%eax
     474:	42 88 44 22 ff       	mov    %al,-0x1(%rdx,%r12,1)
     479:	83 44 24 0c 01       	addl   $0x1,0xc(%rsp)
     47e:	49 8b 0e             	mov    (%r14),%rcx
     481:	8d 53 01             	lea    0x1(%rbx),%edx
     484:	48 63 c3             	movslq %ebx,%rax
     487:	0f b6 44 04 20       	movzbl 0x20(%rsp,%rax,1),%eax
     48c:	48 0f be f0          	movsbq %al,%rsi
     490:	f6 44 71 01 10       	testb  $0x10,0x1(%rcx,%rsi,2)
     495:	74 1b                	je     4b2 <load_mem+0x2ae>
     497:	83 c3 02             	add    $0x2,%ebx
     49a:	48 63 d2             	movslq %edx,%rdx
     49d:	44 0f b6 6c 14 20    	movzbl 0x20(%rsp,%rdx,1),%r13d
     4a3:	49 0f be d5          	movsbq %r13b,%rdx
     4a7:	f6 44 51 01 10       	testb  $0x10,0x1(%rcx,%rdx,2)
     4ac:	0f 85 46 ff ff ff    	jne    3f8 <load_mem+0x1f4>
     4b2:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
     4b7:	be 00 10 00 00       	mov    $0x1000,%esi
     4bc:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
     4c1:	e8 00 00 00 00       	callq  4c6 <load_mem+0x2c2>
     4c6:	48 85 c0             	test   %rax,%rax
     4c9:	0f 85 7a fd ff ff    	jne    249 <load_mem+0x45>
     4cf:	8b 44 24 0c          	mov    0xc(%rsp),%eax
     4d3:	48 8b b4 24 28 10 00 	mov    0x1028(%rsp),%rsi
     4da:	00 
     4db:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
     4e2:	00 00 
     4e4:	74 05                	je     4eb <load_mem+0x2e7>
     4e6:	e8 00 00 00 00       	callq  4eb <load_mem+0x2e7>
     4eb:	48 81 c4 38 10 00 00 	add    $0x1038,%rsp
     4f2:	5b                   	pop    %rbx
     4f3:	5d                   	pop    %rbp
     4f4:	41 5c                	pop    %r12
     4f6:	41 5d                	pop    %r13
     4f8:	41 5e                	pop    %r14
     4fa:	41 5f                	pop    %r15
     4fc:	c3                   	retq   

00000000000004fd <get_byte_val>:
     4fd:	48 85 f6             	test   %rsi,%rsi
     500:	78 1d                	js     51f <get_byte_val+0x22>
     502:	48 63 0f             	movslq (%rdi),%rcx
     505:	b8 00 00 00 00       	mov    $0x0,%eax
     50a:	48 39 ce             	cmp    %rcx,%rsi
     50d:	7d 15                	jge    524 <get_byte_val+0x27>
     50f:	48 8b 47 10          	mov    0x10(%rdi),%rax
     513:	0f b6 04 30          	movzbl (%rax,%rsi,1),%eax
     517:	88 02                	mov    %al,(%rdx)
     519:	b8 01 00 00 00       	mov    $0x1,%eax
     51e:	c3                   	retq   
     51f:	b8 00 00 00 00       	mov    $0x0,%eax
     524:	f3 c3                	repz retq 

0000000000000526 <get_word_val>:
     526:	48 85 f6             	test   %rsi,%rsi
     529:	78 3d                	js     568 <get_word_val+0x42>
     52b:	4c 8d 46 08          	lea    0x8(%rsi),%r8
     52f:	48 63 0f             	movslq (%rdi),%rcx
     532:	b8 00 00 00 00       	mov    $0x0,%eax
     537:	49 39 c8             	cmp    %rcx,%r8
     53a:	7f 31                	jg     56d <get_word_val+0x47>
     53c:	48 03 77 10          	add    0x10(%rdi),%rsi
     540:	b9 00 00 00 00       	mov    $0x0,%ecx
     545:	bf 00 00 00 00       	mov    $0x0,%edi
     54a:	0f b6 06             	movzbl (%rsi),%eax
     54d:	48 d3 e0             	shl    %cl,%rax
     550:	48 09 c7             	or     %rax,%rdi
     553:	48 83 c6 01          	add    $0x1,%rsi
     557:	83 c1 08             	add    $0x8,%ecx
     55a:	83 f9 40             	cmp    $0x40,%ecx
     55d:	75 eb                	jne    54a <get_word_val+0x24>
     55f:	48 89 3a             	mov    %rdi,(%rdx)
     562:	b8 01 00 00 00       	mov    $0x1,%eax
     567:	c3                   	retq   
     568:	b8 00 00 00 00       	mov    $0x0,%eax
     56d:	f3 c3                	repz retq 

000000000000056f <diff_mem>:
     56f:	41 57                	push   %r15
     571:	41 56                	push   %r14
     573:	41 55                	push   %r13
     575:	41 54                	push   %r12
     577:	55                   	push   %rbp
     578:	53                   	push   %rbx
     579:	48 83 ec 38          	sub    $0x38,%rsp
     57d:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
     584:	00 00 
     586:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
     58b:	31 c0                	xor    %eax,%eax
     58d:	8b 07                	mov    (%rdi),%eax
     58f:	44 8b 26             	mov    (%rsi),%r12d
     592:	48 85 d2             	test   %rdx,%rdx
     595:	0f 95 44 24 0f       	setne  0xf(%rsp)
     59a:	44 39 e0             	cmp    %r12d,%eax
     59d:	44 0f 4e e0          	cmovle %eax,%r12d
     5a1:	4d 63 e4             	movslq %r12d,%r12
     5a4:	4d 85 e4             	test   %r12,%r12
     5a7:	0f 8e a7 00 00 00    	jle    654 <diff_mem+0xe5>
     5ad:	49 89 fe             	mov    %rdi,%r14
     5b0:	49 89 f7             	mov    %rsi,%r15
     5b3:	49 89 d5             	mov    %rdx,%r13
     5b6:	bb 08 00 00 00       	mov    $0x8,%ebx
     5bb:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%rsp)
     5c2:	00 
     5c3:	48 8d 6b f8          	lea    -0x8(%rbx),%rbp
     5c7:	48 c7 44 24 18 00 00 	movq   $0x0,0x18(%rsp)
     5ce:	00 00 
     5d0:	48 c7 44 24 20 00 00 	movq   $0x0,0x20(%rsp)
     5d7:	00 00 
     5d9:	48 8d 54 24 18       	lea    0x18(%rsp),%rdx
     5de:	48 89 ee             	mov    %rbp,%rsi
     5e1:	4c 89 f7             	mov    %r14,%rdi
     5e4:	e8 00 00 00 00       	callq  5e9 <diff_mem+0x7a>
     5e9:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
     5ee:	48 89 ee             	mov    %rbp,%rsi
     5f1:	4c 89 ff             	mov    %r15,%rdi
     5f4:	e8 00 00 00 00       	callq  5f9 <diff_mem+0x8a>
     5f9:	4c 8b 4c 24 20       	mov    0x20(%rsp),%r9
     5fe:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
     603:	4d 39 c1             	cmp    %r8,%r9
     606:	74 2c                	je     634 <diff_mem+0xc5>
     608:	4d 85 ed             	test   %r13,%r13
     60b:	74 65                	je     672 <diff_mem+0x103>
     60d:	48 89 e9             	mov    %rbp,%rcx
     610:	ba 00 00 00 00       	mov    $0x0,%edx
     615:	be 01 00 00 00       	mov    $0x1,%esi
     61a:	4c 89 ef             	mov    %r13,%rdi
     61d:	b8 00 00 00 00       	mov    $0x0,%eax
     622:	e8 00 00 00 00       	callq  627 <diff_mem+0xb8>
     627:	48 89 d8             	mov    %rbx,%rax
     62a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%rsp)
     631:	00 
     632:	eb 11                	jmp    645 <diff_mem+0xd6>
     634:	48 89 d8             	mov    %rbx,%rax
     637:	83 7c 24 08 00       	cmpl   $0x0,0x8(%rsp)
     63c:	74 07                	je     645 <diff_mem+0xd6>
     63e:	80 7c 24 0f 00       	cmpb   $0x0,0xf(%rsp)
     643:	74 17                	je     65c <diff_mem+0xed>
     645:	48 83 c3 08          	add    $0x8,%rbx
     649:	49 39 c4             	cmp    %rax,%r12
     64c:	0f 8f 71 ff ff ff    	jg     5c3 <diff_mem+0x54>
     652:	eb 08                	jmp    65c <diff_mem+0xed>
     654:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%rsp)
     65b:	00 
     65c:	8b 44 24 08          	mov    0x8(%rsp),%eax
     660:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
     665:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
     66c:	00 00 
     66e:	74 11                	je     681 <diff_mem+0x112>
     670:	eb 0a                	jmp    67c <diff_mem+0x10d>
     672:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%rsp)
     679:	00 
     67a:	eb e0                	jmp    65c <diff_mem+0xed>
     67c:	e8 00 00 00 00       	callq  681 <diff_mem+0x112>
     681:	48 83 c4 38          	add    $0x38,%rsp
     685:	5b                   	pop    %rbx
     686:	5d                   	pop    %rbp
     687:	41 5c                	pop    %r12
     689:	41 5d                	pop    %r13
     68b:	41 5e                	pop    %r14
     68d:	41 5f                	pop    %r15
     68f:	c3                   	retq   

0000000000000690 <set_byte_val>:
     690:	48 85 f6             	test   %rsi,%rsi
     693:	78 1a                	js     6af <set_byte_val+0x1f>
     695:	48 63 0f             	movslq (%rdi),%rcx
     698:	b8 00 00 00 00       	mov    $0x0,%eax
     69d:	48 39 ce             	cmp    %rcx,%rsi
     6a0:	7d 12                	jge    6b4 <set_byte_val+0x24>
     6a2:	48 8b 47 10          	mov    0x10(%rdi),%rax
     6a6:	88 14 30             	mov    %dl,(%rax,%rsi,1)
     6a9:	b8 01 00 00 00       	mov    $0x1,%eax
     6ae:	c3                   	retq   
     6af:	b8 00 00 00 00       	mov    $0x0,%eax
     6b4:	f3 c3                	repz retq 

00000000000006b6 <set_word_val>:
     6b6:	48 85 f6             	test   %rsi,%rsi
     6b9:	78 31                	js     6ec <set_word_val+0x36>
     6bb:	4c 8d 46 08          	lea    0x8(%rsi),%r8
     6bf:	48 63 0f             	movslq (%rdi),%rcx
     6c2:	b8 00 00 00 00       	mov    $0x0,%eax
     6c7:	49 39 c8             	cmp    %rcx,%r8
     6ca:	7f 25                	jg     6f1 <set_word_val+0x3b>
     6cc:	48 89 f0             	mov    %rsi,%rax
     6cf:	4c 89 c6             	mov    %r8,%rsi
     6d2:	48 8b 4f 10          	mov    0x10(%rdi),%rcx
     6d6:	88 14 01             	mov    %dl,(%rcx,%rax,1)
     6d9:	48 c1 fa 08          	sar    $0x8,%rdx
     6dd:	48 83 c0 01          	add    $0x1,%rax
     6e1:	48 39 f0             	cmp    %rsi,%rax
     6e4:	75 ec                	jne    6d2 <set_word_val+0x1c>
     6e6:	b8 01 00 00 00       	mov    $0x1,%eax
     6eb:	c3                   	retq   
     6ec:	b8 00 00 00 00       	mov    $0x0,%eax
     6f1:	f3 c3                	repz retq 

00000000000006f3 <dump_memory>:
     6f3:	41 57                	push   %r15
     6f5:	41 56                	push   %r14
     6f7:	41 55                	push   %r13
     6f9:	41 54                	push   %r12
     6fb:	55                   	push   %rbp
     6fc:	53                   	push   %rbx
     6fd:	48 83 ec 28          	sub    $0x28,%rsp
     701:	49 89 fc             	mov    %rdi,%r12
     704:	49 89 f6             	mov    %rsi,%r14
     707:	49 89 d5             	mov    %rdx,%r13
     70a:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
     711:	00 00 
     713:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
     718:	31 c0                	xor    %eax,%eax
     71a:	f6 c2 1f             	test   $0x1f,%dl
     71d:	74 0d                	je     72c <dump_memory+0x39>
     71f:	49 83 ed 01          	sub    $0x1,%r13
     723:	83 c1 01             	add    $0x1,%ecx
     726:	41 f6 c5 1f          	test   $0x1f,%r13b
     72a:	75 f3                	jne    71f <dump_memory+0x2c>
     72c:	8d 41 3e             	lea    0x3e(%rcx),%eax
     72f:	83 c1 1f             	add    $0x1f,%ecx
     732:	0f 48 c8             	cmovs  %eax,%ecx
     735:	83 e1 e0             	and    $0xffffffe0,%ecx
     738:	89 ce                	mov    %ecx,%esi
     73a:	41 8b 06             	mov    (%r14),%eax
     73d:	48 63 d1             	movslq %ecx,%rdx
     740:	4c 01 ea             	add    %r13,%rdx
     743:	48 63 c8             	movslq %eax,%rcx
     746:	44 29 e8             	sub    %r13d,%eax
     749:	48 39 ca             	cmp    %rcx,%rdx
     74c:	0f 4e c6             	cmovle %esi,%eax
     74f:	89 44 24 0c          	mov    %eax,0xc(%rsp)
     753:	85 c0                	test   %eax,%eax
     755:	7e 76                	jle    7cd <dump_memory+0xda>
     757:	41 bf 00 00 00 00    	mov    $0x0,%r15d
     75d:	48 c7 44 24 10 00 00 	movq   $0x0,0x10(%rsp)
     764:	00 00 
     766:	49 63 ef             	movslq %r15d,%rbp
     769:	4c 01 ed             	add    %r13,%rbp
     76c:	48 89 e9             	mov    %rbp,%rcx
     76f:	ba 00 00 00 00       	mov    $0x0,%edx
     774:	be 01 00 00 00       	mov    $0x1,%esi
     779:	4c 89 e7             	mov    %r12,%rdi
     77c:	b8 00 00 00 00       	mov    $0x0,%eax
     781:	e8 00 00 00 00       	callq  786 <dump_memory+0x93>
     786:	48 89 eb             	mov    %rbp,%rbx
     789:	48 83 c5 20          	add    $0x20,%rbp
     78d:	48 8d 54 24 10       	lea    0x10(%rsp),%rdx
     792:	48 89 de             	mov    %rbx,%rsi
     795:	4c 89 f7             	mov    %r14,%rdi
     798:	e8 00 00 00 00       	callq  79d <dump_memory+0xaa>
     79d:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
     7a2:	ba 00 00 00 00       	mov    $0x0,%edx
     7a7:	be 01 00 00 00       	mov    $0x1,%esi
     7ac:	4c 89 e7             	mov    %r12,%rdi
     7af:	b8 00 00 00 00       	mov    $0x0,%eax
     7b4:	e8 00 00 00 00       	callq  7b9 <dump_memory+0xc6>
     7b9:	48 83 c3 08          	add    $0x8,%rbx
     7bd:	48 39 dd             	cmp    %rbx,%rbp
     7c0:	75 cb                	jne    78d <dump_memory+0x9a>
     7c2:	41 83 c7 20          	add    $0x20,%r15d
     7c6:	44 39 7c 24 0c       	cmp    %r15d,0xc(%rsp)
     7cb:	7f 90                	jg     75d <dump_memory+0x6a>
     7cd:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
     7d2:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
     7d9:	00 00 
     7db:	74 05                	je     7e2 <dump_memory+0xef>
     7dd:	e8 00 00 00 00       	callq  7e2 <dump_memory+0xef>
     7e2:	48 83 c4 28          	add    $0x28,%rsp
     7e6:	5b                   	pop    %rbx
     7e7:	5d                   	pop    %rbp
     7e8:	41 5c                	pop    %r12
     7ea:	41 5d                	pop    %r13
     7ec:	41 5e                	pop    %r14
     7ee:	41 5f                	pop    %r15
     7f0:	c3                   	retq   

00000000000007f1 <init_reg>:
     7f1:	48 83 ec 08          	sub    $0x8,%rsp
     7f5:	bf 80 00 00 00       	mov    $0x80,%edi
     7fa:	e8 00 00 00 00       	callq  7ff <init_reg+0xe>
     7ff:	48 83 c4 08          	add    $0x8,%rsp
     803:	c3                   	retq   

0000000000000804 <free_reg>:
     804:	48 83 ec 08          	sub    $0x8,%rsp
     808:	e8 00 00 00 00       	callq  80d <free_reg+0x9>
     80d:	48 83 c4 08          	add    $0x8,%rsp
     811:	c3                   	retq   

0000000000000812 <copy_reg>:
     812:	48 83 ec 08          	sub    $0x8,%rsp
     816:	e8 00 00 00 00       	callq  81b <copy_reg+0x9>
     81b:	48 83 c4 08          	add    $0x8,%rsp
     81f:	c3                   	retq   

0000000000000820 <diff_reg>:
     820:	41 57                	push   %r15
     822:	41 56                	push   %r14
     824:	41 55                	push   %r13
     826:	41 54                	push   %r12
     828:	55                   	push   %rbp
     829:	53                   	push   %rbx
     82a:	48 83 ec 38          	sub    $0x38,%rsp
     82e:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
     835:	00 00 
     837:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
     83c:	31 c0                	xor    %eax,%eax
     83e:	8b 07                	mov    (%rdi),%eax
     840:	44 8b 26             	mov    (%rsi),%r12d
     843:	48 85 d2             	test   %rdx,%rdx
     846:	0f 95 44 24 0f       	setne  0xf(%rsp)
     84b:	44 39 e0             	cmp    %r12d,%eax
     84e:	44 0f 4e e0          	cmovle %eax,%r12d
     852:	4d 63 e4             	movslq %r12d,%r12
     855:	4d 85 e4             	test   %r12,%r12
     858:	0f 8e be 00 00 00    	jle    91c <diff_reg+0xfc>
     85e:	49 89 fe             	mov    %rdi,%r14
     861:	49 89 f7             	mov    %rsi,%r15
     864:	49 89 d5             	mov    %rdx,%r13
     867:	bd 08 00 00 00       	mov    $0x8,%ebp
     86c:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%rsp)
     873:	00 
     874:	48 8d 5d f8          	lea    -0x8(%rbp),%rbx
     878:	48 c7 44 24 18 00 00 	movq   $0x0,0x18(%rsp)
     87f:	00 00 
     881:	48 c7 44 24 20 00 00 	movq   $0x0,0x20(%rsp)
     888:	00 00 
     88a:	48 8d 54 24 18       	lea    0x18(%rsp),%rdx
     88f:	48 89 de             	mov    %rbx,%rsi
     892:	4c 89 f7             	mov    %r14,%rdi
     895:	e8 00 00 00 00       	callq  89a <diff_reg+0x7a>
     89a:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
     89f:	48 89 de             	mov    %rbx,%rsi
     8a2:	4c 89 ff             	mov    %r15,%rdi
     8a5:	e8 00 00 00 00       	callq  8aa <diff_reg+0x8a>
     8aa:	4c 8b 4c 24 20       	mov    0x20(%rsp),%r9
     8af:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
     8b4:	4d 39 c1             	cmp    %r8,%r9
     8b7:	74 43                	je     8fc <diff_reg+0xdc>
     8b9:	4d 85 ed             	test   %r13,%r13
     8bc:	74 7c                	je     93a <diff_reg+0x11a>
     8be:	48 8d 43 07          	lea    0x7(%rbx),%rax
     8c2:	48 85 db             	test   %rbx,%rbx
     8c5:	48 0f 48 d8          	cmovs  %rax,%rbx
     8c9:	48 c1 fb 03          	sar    $0x3,%rbx
     8cd:	48 c1 e3 04          	shl    $0x4,%rbx
     8d1:	48 8b 8b 00 00 00 00 	mov    0x0(%rbx),%rcx
     8d8:	ba 00 00 00 00       	mov    $0x0,%edx
     8dd:	be 01 00 00 00       	mov    $0x1,%esi
     8e2:	4c 89 ef             	mov    %r13,%rdi
     8e5:	b8 00 00 00 00       	mov    $0x0,%eax
     8ea:	e8 00 00 00 00       	callq  8ef <diff_reg+0xcf>
     8ef:	48 89 e8             	mov    %rbp,%rax
     8f2:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%rsp)
     8f9:	00 
     8fa:	eb 11                	jmp    90d <diff_reg+0xed>
     8fc:	48 89 e8             	mov    %rbp,%rax
     8ff:	83 7c 24 08 00       	cmpl   $0x0,0x8(%rsp)
     904:	74 07                	je     90d <diff_reg+0xed>
     906:	80 7c 24 0f 00       	cmpb   $0x0,0xf(%rsp)
     90b:	74 17                	je     924 <diff_reg+0x104>
     90d:	48 83 c5 08          	add    $0x8,%rbp
     911:	49 39 c4             	cmp    %rax,%r12
     914:	0f 8f 5a ff ff ff    	jg     874 <diff_reg+0x54>
     91a:	eb 08                	jmp    924 <diff_reg+0x104>
     91c:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%rsp)
     923:	00 
     924:	8b 44 24 08          	mov    0x8(%rsp),%eax
     928:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
     92d:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
     934:	00 00 
     936:	74 11                	je     949 <diff_reg+0x129>
     938:	eb 0a                	jmp    944 <diff_reg+0x124>
     93a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%rsp)
     941:	00 
     942:	eb e0                	jmp    924 <diff_reg+0x104>
     944:	e8 00 00 00 00       	callq  949 <diff_reg+0x129>
     949:	48 83 c4 38          	add    $0x38,%rsp
     94d:	5b                   	pop    %rbx
     94e:	5d                   	pop    %rbp
     94f:	41 5c                	pop    %r12
     951:	41 5d                	pop    %r13
     953:	41 5e                	pop    %r14
     955:	41 5f                	pop    %r15
     957:	c3                   	retq   

0000000000000958 <get_reg_val>:
     958:	48 83 ec 18          	sub    $0x18,%rsp
     95c:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
     963:	00 00 
     965:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
     96a:	31 c0                	xor    %eax,%eax
     96c:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
     973:	00 
     974:	83 fe 0e             	cmp    $0xe,%esi
     977:	77 11                	ja     98a <get_reg_val+0x32>
     979:	c1 e6 03             	shl    $0x3,%esi
     97c:	89 f6                	mov    %esi,%esi
     97e:	48 89 e2             	mov    %rsp,%rdx
     981:	e8 00 00 00 00       	callq  986 <get_reg_val+0x2e>
     986:	48 8b 04 24          	mov    (%rsp),%rax
     98a:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
     98f:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
     996:	00 00 
     998:	74 05                	je     99f <get_reg_val+0x47>
     99a:	e8 00 00 00 00       	callq  99f <get_reg_val+0x47>
     99f:	48 83 c4 18          	add    $0x18,%rsp
     9a3:	c3                   	retq   

00000000000009a4 <set_reg_val>:
     9a4:	83 fe 0e             	cmp    $0xe,%esi
     9a7:	77 0a                	ja     9b3 <set_reg_val+0xf>
     9a9:	c1 e6 03             	shl    $0x3,%esi
     9ac:	89 f6                	mov    %esi,%esi
     9ae:	e8 00 00 00 00       	callq  9b3 <set_reg_val+0xf>
     9b3:	f3 c3                	repz retq 

00000000000009b5 <dump_reg>:
     9b5:	41 54                	push   %r12
     9b7:	55                   	push   %rbp
     9b8:	53                   	push   %rbx
     9b9:	48 83 ec 10          	sub    $0x10,%rsp
     9bd:	48 89 fd             	mov    %rdi,%rbp
     9c0:	49 89 f4             	mov    %rsi,%r12
     9c3:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
     9ca:	00 00 
     9cc:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
     9d1:	31 c0                	xor    %eax,%eax
     9d3:	bb 00 00 00 00       	mov    $0x0,%ebx
     9d8:	eb 29                	jmp    a03 <dump_reg+0x4e>
     9da:	48 89 d8             	mov    %rbx,%rax
     9dd:	48 c1 e0 04          	shl    $0x4,%rax
     9e1:	48 8b 88 00 00 00 00 	mov    0x0(%rax),%rcx
     9e8:	ba 00 00 00 00       	mov    $0x0,%edx
     9ed:	be 01 00 00 00       	mov    $0x1,%esi
     9f2:	48 89 ef             	mov    %rbp,%rdi
     9f5:	b8 00 00 00 00       	mov    $0x0,%eax
     9fa:	e8 00 00 00 00       	callq  9ff <dump_reg+0x4a>
     9ff:	48 83 c3 01          	add    $0x1,%rbx
     a03:	89 df                	mov    %ebx,%edi
     a05:	e8 00 00 00 00       	callq  a0a <dump_reg+0x55>
     a0a:	85 c0                	test   %eax,%eax
     a0c:	75 cc                	jne    9da <dump_reg+0x25>
     a0e:	48 89 ee             	mov    %rbp,%rsi
     a11:	bf 0a 00 00 00       	mov    $0xa,%edi
     a16:	e8 00 00 00 00       	callq  a1b <dump_reg+0x66>
     a1b:	bb 00 00 00 00       	mov    $0x0,%ebx
     a20:	eb 3a                	jmp    a5c <dump_reg+0xa7>
     a22:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
     a29:	00 
     a2a:	8d 34 dd 00 00 00 00 	lea    0x0(,%rbx,8),%esi
     a31:	89 f6                	mov    %esi,%esi
     a33:	48 89 e2             	mov    %rsp,%rdx
     a36:	4c 89 e7             	mov    %r12,%rdi
     a39:	e8 00 00 00 00       	callq  a3e <dump_reg+0x89>
     a3e:	48 8b 0c 24          	mov    (%rsp),%rcx
     a42:	ba 00 00 00 00       	mov    $0x0,%edx
     a47:	be 01 00 00 00       	mov    $0x1,%esi
     a4c:	48 89 ef             	mov    %rbp,%rdi
     a4f:	b8 00 00 00 00       	mov    $0x0,%eax
     a54:	e8 00 00 00 00       	callq  a59 <dump_reg+0xa4>
     a59:	83 c3 01             	add    $0x1,%ebx
     a5c:	89 df                	mov    %ebx,%edi
     a5e:	e8 00 00 00 00       	callq  a63 <dump_reg+0xae>
     a63:	85 c0                	test   %eax,%eax
     a65:	75 bb                	jne    a22 <dump_reg+0x6d>
     a67:	48 89 ee             	mov    %rbp,%rsi
     a6a:	bf 0a 00 00 00       	mov    $0xa,%edi
     a6f:	e8 00 00 00 00       	callq  a74 <dump_reg+0xbf>
     a74:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
     a79:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
     a80:	00 00 
     a82:	74 05                	je     a89 <dump_reg+0xd4>
     a84:	e8 00 00 00 00       	callq  a89 <dump_reg+0xd4>
     a89:	48 83 c4 10          	add    $0x10,%rsp
     a8d:	5b                   	pop    %rbx
     a8e:	5d                   	pop    %rbp
     a8f:	41 5c                	pop    %r12
     a91:	c3                   	retq   

0000000000000a92 <op_name>:
     a92:	0f b6 05 00 00 00 00 	movzbl 0x0(%rip),%eax        # a99 <op_name+0x7>
     a99:	83 ff 03             	cmp    $0x3,%edi
     a9c:	77 0a                	ja     aa8 <op_name+0x16>
     a9e:	89 ff                	mov    %edi,%edi
     aa0:	0f b6 04 fd 00 00 00 	movzbl 0x0(,%rdi,8),%eax
     aa7:	00 
     aa8:	f3 c3                	repz retq 

0000000000000aaa <compute_alu>:
     aaa:	83 ff 01             	cmp    $0x1,%edi
     aad:	74 27                	je     ad6 <compute_alu+0x2c>
     aaf:	48 8d 04 16          	lea    (%rsi,%rdx,1),%rax
     ab3:	83 ff 01             	cmp    $0x1,%edi
     ab6:	72 24                	jb     adc <compute_alu+0x32>
     ab8:	48 89 f0             	mov    %rsi,%rax
     abb:	48 21 d0             	and    %rdx,%rax
     abe:	83 ff 02             	cmp    $0x2,%edi
     ac1:	74 19                	je     adc <compute_alu+0x32>
     ac3:	48 31 f2             	xor    %rsi,%rdx
     ac6:	83 ff 03             	cmp    $0x3,%edi
     ac9:	b9 00 00 00 00       	mov    $0x0,%ecx
     ace:	48 89 c8             	mov    %rcx,%rax
     ad1:	48 0f 44 c2          	cmove  %rdx,%rax
     ad5:	c3                   	retq   
     ad6:	48 89 d0             	mov    %rdx,%rax
     ad9:	48 29 f0             	sub    %rsi,%rax
     adc:	f3 c3                	repz retq 

0000000000000ade <compute_cc>:
     ade:	41 54                	push   %r12
     ae0:	55                   	push   %rbp
     ae1:	53                   	push   %rbx
     ae2:	89 fb                	mov    %edi,%ebx
     ae4:	48 89 f5             	mov    %rsi,%rbp
     ae7:	49 89 d4             	mov    %rdx,%r12
     aea:	e8 00 00 00 00       	callq  aef <compute_cc+0x11>
     aef:	48 85 c0             	test   %rax,%rax
     af2:	40 0f 94 c6          	sete   %sil
     af6:	48 c1 e8 3f          	shr    $0x3f,%rax
     afa:	48 89 c7             	mov    %rax,%rdi
     afd:	85 db                	test   %ebx,%ebx
     aff:	74 07                	je     b08 <compute_cc+0x2a>
     b01:	83 fb 01             	cmp    $0x1,%ebx
     b04:	74 2b                	je     b31 <compute_cc+0x53>
     b06:	eb 48                	jmp    b50 <compute_cc+0x72>
     b08:	48 89 e8             	mov    %rbp,%rax
     b0b:	48 f7 d0             	not    %rax
     b0e:	48 c1 e8 3f          	shr    $0x3f,%rax
     b12:	4c 89 e2             	mov    %r12,%rdx
     b15:	48 c1 ea 3f          	shr    $0x3f,%rdx
     b19:	b9 00 00 00 00       	mov    $0x0,%ecx
     b1e:	38 d0                	cmp    %dl,%al
     b20:	74 33                	je     b55 <compute_cc+0x77>
     b22:	48 c1 ed 3f          	shr    $0x3f,%rbp
     b26:	40 38 ef             	cmp    %bpl,%dil
     b29:	0f 95 c1             	setne  %cl
     b2c:	0f b6 c9             	movzbl %cl,%ecx
     b2f:	eb 24                	jmp    b55 <compute_cc+0x77>
     b31:	4c 89 e2             	mov    %r12,%rdx
     b34:	48 c1 ea 3f          	shr    $0x3f,%rdx
     b38:	48 85 ed             	test   %rbp,%rbp
     b3b:	0f 9e c0             	setle  %al
     b3e:	38 d0                	cmp    %dl,%al
     b40:	0f 95 c1             	setne  %cl
     b43:	40 38 d7             	cmp    %dl,%dil
     b46:	0f 95 c0             	setne  %al
     b49:	0f b6 c0             	movzbl %al,%eax
     b4c:	21 c1                	and    %eax,%ecx
     b4e:	eb 05                	jmp    b55 <compute_cc+0x77>
     b50:	b9 00 00 00 00       	mov    $0x0,%ecx
     b55:	8d 04 b5 00 00 00 00 	lea    0x0(,%rsi,4),%eax
     b5c:	8d 14 3f             	lea    (%rdi,%rdi,1),%edx
     b5f:	09 d0                	or     %edx,%eax
     b61:	09 c8                	or     %ecx,%eax
     b63:	5b                   	pop    %rbx
     b64:	5d                   	pop    %rbp
     b65:	41 5c                	pop    %r12
     b67:	c3                   	retq   

0000000000000b68 <cc_name>:
     b68:	b8 00 00 00 00       	mov    $0x0,%eax
     b6d:	40 80 ff 07          	cmp    $0x7,%dil
     b71:	77 0c                	ja     b7f <cc_name+0x17>
     b73:	40 0f b6 ff          	movzbl %dil,%edi
     b77:	48 8b 04 fd 00 00 00 	mov    0x0(,%rdi,8),%rax
     b7e:	00 
     b7f:	f3 c3                	repz retq 

0000000000000b81 <stat_name>:
     b81:	b8 00 00 00 00       	mov    $0x0,%eax
     b86:	83 ff 05             	cmp    $0x5,%edi
     b89:	77 0a                	ja     b95 <stat_name+0x14>
     b8b:	89 ff                	mov    %edi,%edi
     b8d:	48 8b 04 fd 00 00 00 	mov    0x0(,%rdi,8),%rax
     b94:	00 
     b95:	f3 c3                	repz retq 

0000000000000b97 <new_state>:
     b97:	55                   	push   %rbp
     b98:	53                   	push   %rbx
     b99:	48 83 ec 08          	sub    $0x8,%rsp
     b9d:	89 fd                	mov    %edi,%ebp
     b9f:	bf 20 00 00 00       	mov    $0x20,%edi
     ba4:	e8 00 00 00 00       	callq  ba9 <new_state+0x12>
     ba9:	48 89 c3             	mov    %rax,%rbx
     bac:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
     bb3:	b8 00 00 00 00       	mov    $0x0,%eax
     bb8:	e8 00 00 00 00       	callq  bbd <new_state+0x26>
     bbd:	48 89 43 08          	mov    %rax,0x8(%rbx)
     bc1:	89 ef                	mov    %ebp,%edi
     bc3:	e8 00 00 00 00       	callq  bc8 <new_state+0x31>
     bc8:	48 89 43 10          	mov    %rax,0x10(%rbx)
     bcc:	c6 43 18 04          	movb   $0x4,0x18(%rbx)
     bd0:	48 89 d8             	mov    %rbx,%rax
     bd3:	48 83 c4 08          	add    $0x8,%rsp
     bd7:	5b                   	pop    %rbx
     bd8:	5d                   	pop    %rbp
     bd9:	c3                   	retq   

0000000000000bda <free_state>:
     bda:	53                   	push   %rbx
     bdb:	48 89 fb             	mov    %rdi,%rbx
     bde:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
     be2:	e8 00 00 00 00       	callq  be7 <free_state+0xd>
     be7:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
     beb:	e8 00 00 00 00       	callq  bf0 <free_state+0x16>
     bf0:	48 89 df             	mov    %rbx,%rdi
     bf3:	e8 00 00 00 00       	callq  bf8 <free_state+0x1e>
     bf8:	5b                   	pop    %rbx
     bf9:	c3                   	retq   

0000000000000bfa <copy_state>:
     bfa:	55                   	push   %rbp
     bfb:	53                   	push   %rbx
     bfc:	48 83 ec 08          	sub    $0x8,%rsp
     c00:	48 89 fd             	mov    %rdi,%rbp
     c03:	bf 20 00 00 00       	mov    $0x20,%edi
     c08:	e8 00 00 00 00       	callq  c0d <copy_state+0x13>
     c0d:	48 89 c3             	mov    %rax,%rbx
     c10:	48 8b 45 00          	mov    0x0(%rbp),%rax
     c14:	48 89 03             	mov    %rax,(%rbx)
     c17:	48 8b 7d 08          	mov    0x8(%rbp),%rdi
     c1b:	e8 00 00 00 00       	callq  c20 <copy_state+0x26>
     c20:	48 89 43 08          	mov    %rax,0x8(%rbx)
     c24:	48 8b 7d 10          	mov    0x10(%rbp),%rdi
     c28:	e8 00 00 00 00       	callq  c2d <copy_state+0x33>
     c2d:	48 89 43 10          	mov    %rax,0x10(%rbx)
     c31:	0f b6 45 18          	movzbl 0x18(%rbp),%eax
     c35:	88 43 18             	mov    %al,0x18(%rbx)
     c38:	48 89 d8             	mov    %rbx,%rax
     c3b:	48 83 c4 08          	add    $0x8,%rsp
     c3f:	5b                   	pop    %rbx
     c40:	5d                   	pop    %rbp
     c41:	c3                   	retq   

0000000000000c42 <diff_state>:
     c42:	41 55                	push   %r13
     c44:	41 54                	push   %r12
     c46:	55                   	push   %rbp
     c47:	53                   	push   %rbx
     c48:	48 83 ec 08          	sub    $0x8,%rsp
     c4c:	49 89 fc             	mov    %rdi,%r12
     c4f:	49 89 f5             	mov    %rsi,%r13
     c52:	48 89 d5             	mov    %rdx,%rbp
     c55:	48 8b 0f             	mov    (%rdi),%rcx
     c58:	4c 8b 06             	mov    (%rsi),%r8
     c5b:	4c 39 c1             	cmp    %r8,%rcx
     c5e:	74 32                	je     c92 <diff_state+0x50>
     c60:	48 85 d2             	test   %rdx,%rdx
     c63:	74 34                	je     c99 <diff_state+0x57>
     c65:	ba 00 00 00 00       	mov    $0x0,%edx
     c6a:	be 01 00 00 00       	mov    $0x1,%esi
     c6f:	48 89 ef             	mov    %rbp,%rdi
     c72:	b8 00 00 00 00       	mov    $0x0,%eax
     c77:	e8 00 00 00 00       	callq  c7c <diff_state+0x3a>
     c7c:	41 0f b6 44 24 18    	movzbl 0x18(%r12),%eax
     c82:	41 0f b6 55 18       	movzbl 0x18(%r13),%edx
     c87:	bb 01 00 00 00       	mov    $0x1,%ebx
     c8c:	38 c2                	cmp    %al,%dl
     c8e:	74 6d                	je     cfd <diff_state+0xbb>
     c90:	eb 25                	jmp    cb7 <diff_state+0x75>
     c92:	bb 00 00 00 00       	mov    $0x0,%ebx
     c97:	eb 05                	jmp    c9e <diff_state+0x5c>
     c99:	bb 01 00 00 00       	mov    $0x1,%ebx
     c9e:	41 0f b6 44 24 18    	movzbl 0x18(%r12),%eax
     ca4:	41 0f b6 55 18       	movzbl 0x18(%r13),%edx
     ca9:	38 d0                	cmp    %dl,%al
     cab:	74 50                	je     cfd <diff_state+0xbb>
     cad:	bb 01 00 00 00       	mov    $0x1,%ebx
     cb2:	48 85 ed             	test   %rbp,%rbp
     cb5:	74 46                	je     cfd <diff_state+0xbb>
     cb7:	41 b8 00 00 00 00    	mov    $0x0,%r8d
     cbd:	80 fa 07             	cmp    $0x7,%dl
     cc0:	77 0b                	ja     ccd <diff_state+0x8b>
     cc2:	0f b6 d2             	movzbl %dl,%edx
     cc5:	4c 8b 04 d5 00 00 00 	mov    0x0(,%rdx,8),%r8
     ccc:	00 
     ccd:	b9 00 00 00 00       	mov    $0x0,%ecx
     cd2:	3c 07                	cmp    $0x7,%al
     cd4:	77 0b                	ja     ce1 <diff_state+0x9f>
     cd6:	0f b6 c0             	movzbl %al,%eax
     cd9:	48 8b 0c c5 00 00 00 	mov    0x0(,%rax,8),%rcx
     ce0:	00 
     ce1:	ba 00 00 00 00       	mov    $0x0,%edx
     ce6:	be 01 00 00 00       	mov    $0x1,%esi
     ceb:	48 89 ef             	mov    %rbp,%rdi
     cee:	b8 00 00 00 00       	mov    $0x0,%eax
     cf3:	e8 00 00 00 00       	callq  cf8 <diff_state+0xb6>
     cf8:	bb 01 00 00 00       	mov    $0x1,%ebx
     cfd:	49 8b 75 08          	mov    0x8(%r13),%rsi
     d01:	49 8b 7c 24 08       	mov    0x8(%r12),%rdi
     d06:	48 89 ea             	mov    %rbp,%rdx
     d09:	e8 00 00 00 00       	callq  d0e <diff_state+0xcc>
     d0e:	85 c0                	test   %eax,%eax
     d10:	b8 01 00 00 00       	mov    $0x1,%eax
     d15:	0f 45 d8             	cmovne %eax,%ebx
     d18:	49 8b 75 10          	mov    0x10(%r13),%rsi
     d1c:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
     d21:	48 89 ea             	mov    %rbp,%rdx
     d24:	e8 00 00 00 00       	callq  d29 <diff_state+0xe7>
     d29:	85 c0                	test   %eax,%eax
     d2b:	b8 01 00 00 00       	mov    $0x1,%eax
     d30:	0f 45 d8             	cmovne %eax,%ebx
     d33:	89 d8                	mov    %ebx,%eax
     d35:	48 83 c4 08          	add    $0x8,%rsp
     d39:	5b                   	pop    %rbx
     d3a:	5d                   	pop    %rbp
     d3b:	41 5c                	pop    %r12
     d3d:	41 5d                	pop    %r13
     d3f:	c3                   	retq   

0000000000000d40 <cond_holds>:
     d40:	89 fa                	mov    %edi,%edx
     d42:	c0 ea 02             	shr    $0x2,%dl
     d45:	89 d1                	mov    %edx,%ecx
     d47:	83 e1 01             	and    $0x1,%ecx
     d4a:	89 f8                	mov    %edi,%eax
     d4c:	d0 e8                	shr    %al
     d4e:	83 fe 06             	cmp    $0x6,%esi
     d51:	77 09                	ja     d5c <cond_holds+0x1c>
     d53:	89 f6                	mov    %esi,%esi
     d55:	ff 24 f5 00 00 00 00 	jmpq   *0x0(,%rsi,8)
     d5c:	b8 00 00 00 00       	mov    $0x0,%eax
     d61:	c3                   	retq   
     d62:	31 c7                	xor    %eax,%edi
     d64:	09 d7                	or     %edx,%edi
     d66:	89 f8                	mov    %edi,%eax
     d68:	83 e0 01             	and    $0x1,%eax
     d6b:	c3                   	retq   
     d6c:	31 c7                	xor    %eax,%edi
     d6e:	89 f8                	mov    %edi,%eax
     d70:	83 e0 01             	and    $0x1,%eax
     d73:	c3                   	retq   
     d74:	0f b6 c1             	movzbl %cl,%eax
     d77:	c3                   	retq   
     d78:	89 c8                	mov    %ecx,%eax
     d7a:	83 f0 01             	xor    $0x1,%eax
     d7d:	0f b6 c0             	movzbl %al,%eax
     d80:	c3                   	retq   
     d81:	31 f8                	xor    %edi,%eax
     d83:	f7 d0                	not    %eax
     d85:	83 e0 01             	and    $0x1,%eax
     d88:	c3                   	retq   
     d89:	31 c7                	xor    %eax,%edi
     d8b:	f7 d7                	not    %edi
     d8d:	89 c8                	mov    %ecx,%eax
     d8f:	83 f0 01             	xor    $0x1,%eax
     d92:	21 c7                	and    %eax,%edi
     d94:	40 0f b6 c7          	movzbl %dil,%eax
     d98:	c3                   	retq   
     d99:	b8 01 00 00 00       	mov    $0x1,%eax
     d9e:	c3                   	retq   

0000000000000d9f <step_state>:
     d9f:	41 57                	push   %r15
     da1:	41 56                	push   %r14
     da3:	41 55                	push   %r13
     da5:	41 54                	push   %r12
     da7:	55                   	push   %rbp
     da8:	53                   	push   %rbx
     da9:	48 83 ec 38          	sub    $0x38,%rsp
     dad:	48 89 fb             	mov    %rdi,%rbx
     db0:	49 89 f5             	mov    %rsi,%r13
     db3:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
     dba:	00 00 
     dbc:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
     dc1:	31 c0                	xor    %eax,%eax
     dc3:	c6 44 24 16 00       	movb   $0x0,0x16(%rsp)
     dc8:	c6 44 24 17 00       	movb   $0x0,0x17(%rsp)
     dcd:	48 c7 44 24 18 00 00 	movq   $0x0,0x18(%rsp)
     dd4:	00 00 
     dd6:	4c 8b 27             	mov    (%rdi),%r12
     dd9:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
     ddd:	48 8d 54 24 16       	lea    0x16(%rsp),%rdx
     de2:	4c 89 e6             	mov    %r12,%rsi
     de5:	e8 00 00 00 00       	callq  dea <step_state+0x4b>
     dea:	85 c0                	test   %eax,%eax
     dec:	75 32                	jne    e20 <step_state+0x81>
     dee:	b8 03 00 00 00       	mov    $0x3,%eax
     df3:	4d 85 ed             	test   %r13,%r13
     df6:	0f 84 13 0b 00 00    	je     190f <step_state+0xb70>
     dfc:	48 8b 0b             	mov    (%rbx),%rcx
     dff:	ba 00 00 00 00       	mov    $0x0,%edx
     e04:	be 01 00 00 00       	mov    $0x1,%esi
     e09:	4c 89 ef             	mov    %r13,%rdi
     e0c:	b8 00 00 00 00       	mov    $0x0,%eax
     e11:	e8 00 00 00 00       	callq  e16 <step_state+0x77>
     e16:	b8 03 00 00 00       	mov    $0x3,%eax
     e1b:	e9 ef 0a 00 00       	jmpq   190f <step_state+0xb70>
     e20:	4d 8d 7c 24 01       	lea    0x1(%r12),%r15
     e25:	0f b6 44 24 16       	movzbl 0x16(%rsp),%eax
     e2a:	89 c5                	mov    %eax,%ebp
     e2c:	40 c0 ed 04          	shr    $0x4,%bpl
     e30:	44 0f b6 f5          	movzbl %bpl,%r14d
     e34:	83 e0 0f             	and    $0xf,%eax
     e37:	89 44 24 08          	mov    %eax,0x8(%rsp)
     e3b:	40 80 fd 0b          	cmp    $0xb,%bpl
     e3f:	77 0b                	ja     e4c <step_state+0xad>
     e41:	b8 5c 0c 00 00       	mov    $0xc5c,%eax
     e46:	48 0f a3 e8          	bt     %rbp,%rax
     e4a:	72 0c                	jb     e58 <step_state+0xb9>
     e4c:	41 83 fe 05          	cmp    $0x5,%r14d
     e50:	74 06                	je     e58 <step_state+0xb9>
     e52:	41 83 fe 0c          	cmp    $0xc,%r14d
     e56:	75 33                	jne    e8b <step_state+0xec>
     e58:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
     e5c:	48 8d 54 24 17       	lea    0x17(%rsp),%rdx
     e61:	4c 89 fe             	mov    %r15,%rsi
     e64:	e8 00 00 00 00       	callq  e69 <step_state+0xca>
     e69:	89 44 24 04          	mov    %eax,0x4(%rsp)
     e6d:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
     e72:	0f b6 44 24 17       	movzbl 0x17(%rsp),%eax
     e77:	41 89 c4             	mov    %eax,%r12d
     e7a:	41 c0 ec 04          	shr    $0x4,%r12b
     e7e:	45 0f b6 e4          	movzbl %r12b,%r12d
     e82:	83 e0 0f             	and    $0xf,%eax
     e85:	89 44 24 0c          	mov    %eax,0xc(%rsp)
     e89:	eb 16                	jmp    ea1 <step_state+0x102>
     e8b:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%rsp)
     e92:	00 
     e93:	c7 44 24 0c 0f 00 00 	movl   $0xf,0xc(%rsp)
     e9a:	00 
     e9b:	41 bc 0f 00 00 00    	mov    $0xf,%r12d
     ea1:	41 8d 46 fd          	lea    -0x3(%r14),%eax
     ea5:	83 f8 02             	cmp    $0x2,%eax
     ea8:	76 0f                	jbe    eb9 <step_state+0x11a>
     eaa:	41 83 fe 07          	cmp    $0x7,%r14d
     eae:	74 09                	je     eb9 <step_state+0x11a>
     eb0:	89 e8                	mov    %ebp,%eax
     eb2:	83 e0 fb             	and    $0xfffffffb,%eax
     eb5:	3c 08                	cmp    $0x8,%al
     eb7:	75 19                	jne    ed2 <step_state+0x133>
     eb9:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
     ebd:	48 8d 54 24 18       	lea    0x18(%rsp),%rdx
     ec2:	4c 89 fe             	mov    %r15,%rsi
     ec5:	e8 00 00 00 00       	callq  eca <step_state+0x12b>
     eca:	89 c0                	mov    %eax,%eax
     ecc:	49 83 c7 08          	add    $0x8,%r15
     ed0:	eb 05                	jmp    ed7 <step_state+0x138>
     ed2:	b8 01 00 00 00       	mov    $0x1,%eax
     ed7:	40 80 fd 0c          	cmp    $0xc,%bpl
     edb:	0f 87 f8 09 00 00    	ja     18d9 <step_state+0xb3a>
     ee1:	40 0f b6 ed          	movzbl %bpl,%ebp
     ee5:	ff 24 ed 00 00 00 00 	jmpq   *0x0(,%rbp,8)
     eec:	4c 89 3b             	mov    %r15,(%rbx)
     eef:	b8 01 00 00 00       	mov    $0x1,%eax
     ef4:	e9 16 0a 00 00       	jmpq   190f <step_state+0xb70>
     ef9:	83 7c 24 04 00       	cmpl   $0x0,0x4(%rsp)
     efe:	75 32                	jne    f32 <step_state+0x193>
     f00:	b8 03 00 00 00       	mov    $0x3,%eax
     f05:	4d 85 ed             	test   %r13,%r13
     f08:	0f 84 01 0a 00 00    	je     190f <step_state+0xb70>
     f0e:	48 8b 0b             	mov    (%rbx),%rcx
     f11:	ba 00 00 00 00       	mov    $0x0,%edx
     f16:	be 01 00 00 00       	mov    $0x1,%esi
     f1b:	4c 89 ef             	mov    %r13,%rdi
     f1e:	b8 00 00 00 00       	mov    $0x0,%eax
     f23:	e8 00 00 00 00       	callq  f28 <step_state+0x189>
     f28:	b8 03 00 00 00       	mov    $0x3,%eax
     f2d:	e9 dd 09 00 00       	jmpq   190f <step_state+0xb70>
     f32:	44 89 e7             	mov    %r12d,%edi
     f35:	e8 00 00 00 00       	callq  f3a <step_state+0x19b>
     f3a:	85 c0                	test   %eax,%eax
     f3c:	75 35                	jne    f73 <step_state+0x1d4>
     f3e:	b8 04 00 00 00       	mov    $0x4,%eax
     f43:	4d 85 ed             	test   %r13,%r13
     f46:	0f 84 c3 09 00 00    	je     190f <step_state+0xb70>
     f4c:	45 89 e0             	mov    %r12d,%r8d
     f4f:	48 8b 0b             	mov    (%rbx),%rcx
     f52:	ba 00 00 00 00       	mov    $0x0,%edx
     f57:	be 01 00 00 00       	mov    $0x1,%esi
     f5c:	4c 89 ef             	mov    %r13,%rdi
     f5f:	b8 00 00 00 00       	mov    $0x0,%eax
     f64:	e8 00 00 00 00       	callq  f69 <step_state+0x1ca>
     f69:	b8 04 00 00 00       	mov    $0x4,%eax
     f6e:	e9 9c 09 00 00       	jmpq   190f <step_state+0xb70>
     f73:	44 8b 74 24 0c       	mov    0xc(%rsp),%r14d
     f78:	44 89 f7             	mov    %r14d,%edi
     f7b:	e8 00 00 00 00       	callq  f80 <step_state+0x1e1>
     f80:	85 c0                	test   %eax,%eax
     f82:	75 35                	jne    fb9 <step_state+0x21a>
     f84:	b8 04 00 00 00       	mov    $0x4,%eax
     f89:	4d 85 ed             	test   %r13,%r13
     f8c:	0f 84 7d 09 00 00    	je     190f <step_state+0xb70>
     f92:	45 89 f0             	mov    %r14d,%r8d
     f95:	48 8b 0b             	mov    (%rbx),%rcx
     f98:	ba 00 00 00 00       	mov    $0x0,%edx
     f9d:	be 01 00 00 00       	mov    $0x1,%esi
     fa2:	4c 89 ef             	mov    %r13,%rdi
     fa5:	b8 00 00 00 00       	mov    $0x0,%eax
     faa:	e8 00 00 00 00       	callq  faf <step_state+0x210>
     faf:	b8 04 00 00 00       	mov    $0x4,%eax
     fb4:	e9 56 09 00 00       	jmpq   190f <step_state+0xb70>
     fb9:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
     fbd:	44 89 e6             	mov    %r12d,%esi
     fc0:	e8 00 00 00 00       	callq  fc5 <step_state+0x226>
     fc5:	48 89 c5             	mov    %rax,%rbp
     fc8:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
     fcd:	0f b6 7b 18          	movzbl 0x18(%rbx),%edi
     fd1:	8b 74 24 08          	mov    0x8(%rsp),%esi
     fd5:	e8 00 00 00 00       	callq  fda <step_state+0x23b>
     fda:	85 c0                	test   %eax,%eax
     fdc:	74 10                	je     fee <step_state+0x24f>
     fde:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
     fe2:	48 89 ea             	mov    %rbp,%rdx
     fe5:	8b 74 24 0c          	mov    0xc(%rsp),%esi
     fe9:	e8 00 00 00 00       	callq  fee <step_state+0x24f>
     fee:	4c 89 3b             	mov    %r15,(%rbx)
     ff1:	b8 01 00 00 00       	mov    $0x1,%eax
     ff6:	e9 14 09 00 00       	jmpq   190f <step_state+0xb70>
     ffb:	83 7c 24 04 00       	cmpl   $0x0,0x4(%rsp)
    1000:	75 32                	jne    1034 <step_state+0x295>
    1002:	b8 03 00 00 00       	mov    $0x3,%eax
    1007:	4d 85 ed             	test   %r13,%r13
    100a:	0f 84 ff 08 00 00    	je     190f <step_state+0xb70>
    1010:	48 8b 0b             	mov    (%rbx),%rcx
    1013:	ba 00 00 00 00       	mov    $0x0,%edx
    1018:	be 01 00 00 00       	mov    $0x1,%esi
    101d:	4c 89 ef             	mov    %r13,%rdi
    1020:	b8 00 00 00 00       	mov    $0x0,%eax
    1025:	e8 00 00 00 00       	callq  102a <step_state+0x28b>
    102a:	b8 03 00 00 00       	mov    $0x3,%eax
    102f:	e9 db 08 00 00       	jmpq   190f <step_state+0xb70>
    1034:	48 85 c0             	test   %rax,%rax
    1037:	75 32                	jne    106b <step_state+0x2cc>
    1039:	b8 04 00 00 00       	mov    $0x4,%eax
    103e:	4d 85 ed             	test   %r13,%r13
    1041:	0f 84 c8 08 00 00    	je     190f <step_state+0xb70>
    1047:	48 8b 0b             	mov    (%rbx),%rcx
    104a:	ba 00 00 00 00       	mov    $0x0,%edx
    104f:	be 01 00 00 00       	mov    $0x1,%esi
    1054:	4c 89 ef             	mov    %r13,%rdi
    1057:	b8 00 00 00 00       	mov    $0x0,%eax
    105c:	e8 00 00 00 00       	callq  1061 <step_state+0x2c2>
    1061:	b8 04 00 00 00       	mov    $0x4,%eax
    1066:	e9 a4 08 00 00       	jmpq   190f <step_state+0xb70>
    106b:	44 8b 74 24 0c       	mov    0xc(%rsp),%r14d
    1070:	44 89 f7             	mov    %r14d,%edi
    1073:	e8 00 00 00 00       	callq  1078 <step_state+0x2d9>
    1078:	85 c0                	test   %eax,%eax
    107a:	75 35                	jne    10b1 <step_state+0x312>
    107c:	b8 04 00 00 00       	mov    $0x4,%eax
    1081:	4d 85 ed             	test   %r13,%r13
    1084:	0f 84 85 08 00 00    	je     190f <step_state+0xb70>
    108a:	45 89 f0             	mov    %r14d,%r8d
    108d:	48 8b 0b             	mov    (%rbx),%rcx
    1090:	ba 00 00 00 00       	mov    $0x0,%edx
    1095:	be 01 00 00 00       	mov    $0x1,%esi
    109a:	4c 89 ef             	mov    %r13,%rdi
    109d:	b8 00 00 00 00       	mov    $0x0,%eax
    10a2:	e8 00 00 00 00       	callq  10a7 <step_state+0x308>
    10a7:	b8 04 00 00 00       	mov    $0x4,%eax
    10ac:	e9 5e 08 00 00       	jmpq   190f <step_state+0xb70>
    10b1:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
    10b5:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
    10ba:	8b 74 24 0c          	mov    0xc(%rsp),%esi
    10be:	e8 00 00 00 00       	callq  10c3 <step_state+0x324>
    10c3:	4c 89 3b             	mov    %r15,(%rbx)
    10c6:	b8 01 00 00 00       	mov    $0x1,%eax
    10cb:	e9 3f 08 00 00       	jmpq   190f <step_state+0xb70>
    10d0:	83 7c 24 04 00       	cmpl   $0x0,0x4(%rsp)
    10d5:	75 32                	jne    1109 <step_state+0x36a>
    10d7:	b8 03 00 00 00       	mov    $0x3,%eax
    10dc:	4d 85 ed             	test   %r13,%r13
    10df:	0f 84 2a 08 00 00    	je     190f <step_state+0xb70>
    10e5:	48 8b 0b             	mov    (%rbx),%rcx
    10e8:	ba 00 00 00 00       	mov    $0x0,%edx
    10ed:	be 01 00 00 00       	mov    $0x1,%esi
    10f2:	4c 89 ef             	mov    %r13,%rdi
    10f5:	b8 00 00 00 00       	mov    $0x0,%eax
    10fa:	e8 00 00 00 00       	callq  10ff <step_state+0x360>
    10ff:	b8 03 00 00 00       	mov    $0x3,%eax
    1104:	e9 06 08 00 00       	jmpq   190f <step_state+0xb70>
    1109:	48 85 c0             	test   %rax,%rax
    110c:	75 32                	jne    1140 <step_state+0x3a1>
    110e:	b8 04 00 00 00       	mov    $0x4,%eax
    1113:	4d 85 ed             	test   %r13,%r13
    1116:	0f 84 f3 07 00 00    	je     190f <step_state+0xb70>
    111c:	48 8b 0b             	mov    (%rbx),%rcx
    111f:	ba 00 00 00 00       	mov    $0x0,%edx
    1124:	be 01 00 00 00       	mov    $0x1,%esi
    1129:	4c 89 ef             	mov    %r13,%rdi
    112c:	b8 00 00 00 00       	mov    $0x0,%eax
    1131:	e8 00 00 00 00       	callq  1136 <step_state+0x397>
    1136:	b8 04 00 00 00       	mov    $0x4,%eax
    113b:	e9 cf 07 00 00       	jmpq   190f <step_state+0xb70>
    1140:	44 89 e7             	mov    %r12d,%edi
    1143:	e8 00 00 00 00       	callq  1148 <step_state+0x3a9>
    1148:	85 c0                	test   %eax,%eax
    114a:	75 35                	jne    1181 <step_state+0x3e2>
    114c:	b8 04 00 00 00       	mov    $0x4,%eax
    1151:	4d 85 ed             	test   %r13,%r13
    1154:	0f 84 b5 07 00 00    	je     190f <step_state+0xb70>
    115a:	45 89 e0             	mov    %r12d,%r8d
    115d:	48 8b 0b             	mov    (%rbx),%rcx
    1160:	ba 00 00 00 00       	mov    $0x0,%edx
    1165:	be 01 00 00 00       	mov    $0x1,%esi
    116a:	4c 89 ef             	mov    %r13,%rdi
    116d:	b8 00 00 00 00       	mov    $0x0,%eax
    1172:	e8 00 00 00 00       	callq  1177 <step_state+0x3d8>
    1177:	b8 04 00 00 00       	mov    $0x4,%eax
    117c:	e9 8e 07 00 00       	jmpq   190f <step_state+0xb70>
    1181:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1185:	e8 00 00 00 00       	callq  118a <step_state+0x3eb>
    118a:	85 c0                	test   %eax,%eax
    118c:	74 12                	je     11a0 <step_state+0x401>
    118e:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
    1192:	8b 74 24 0c          	mov    0xc(%rsp),%esi
    1196:	e8 00 00 00 00       	callq  119b <step_state+0x3fc>
    119b:	48 01 44 24 18       	add    %rax,0x18(%rsp)
    11a0:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
    11a4:	44 89 e6             	mov    %r12d,%esi
    11a7:	e8 00 00 00 00       	callq  11ac <step_state+0x40d>
    11ac:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    11b1:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
    11b5:	48 89 c2             	mov    %rax,%rdx
    11b8:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
    11bd:	e8 00 00 00 00       	callq  11c2 <step_state+0x423>
    11c2:	85 c0                	test   %eax,%eax
    11c4:	75 37                	jne    11fd <step_state+0x45e>
    11c6:	b8 03 00 00 00       	mov    $0x3,%eax
    11cb:	4d 85 ed             	test   %r13,%r13
    11ce:	0f 84 3b 07 00 00    	je     190f <step_state+0xb70>
    11d4:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
    11d9:	48 8b 0b             	mov    (%rbx),%rcx
    11dc:	ba 00 00 00 00       	mov    $0x0,%edx
    11e1:	be 01 00 00 00       	mov    $0x1,%esi
    11e6:	4c 89 ef             	mov    %r13,%rdi
    11e9:	b8 00 00 00 00       	mov    $0x0,%eax
    11ee:	e8 00 00 00 00       	callq  11f3 <step_state+0x454>
    11f3:	b8 03 00 00 00       	mov    $0x3,%eax
    11f8:	e9 12 07 00 00       	jmpq   190f <step_state+0xb70>
    11fd:	4c 89 3b             	mov    %r15,(%rbx)
    1200:	b8 01 00 00 00       	mov    $0x1,%eax
    1205:	e9 05 07 00 00       	jmpq   190f <step_state+0xb70>
    120a:	83 7c 24 04 00       	cmpl   $0x0,0x4(%rsp)
    120f:	75 32                	jne    1243 <step_state+0x4a4>
    1211:	b8 03 00 00 00       	mov    $0x3,%eax
    1216:	4d 85 ed             	test   %r13,%r13
    1219:	0f 84 f0 06 00 00    	je     190f <step_state+0xb70>
    121f:	48 8b 0b             	mov    (%rbx),%rcx
    1222:	ba 00 00 00 00       	mov    $0x0,%edx
    1227:	be 01 00 00 00       	mov    $0x1,%esi
    122c:	4c 89 ef             	mov    %r13,%rdi
    122f:	b8 00 00 00 00       	mov    $0x0,%eax
    1234:	e8 00 00 00 00       	callq  1239 <step_state+0x49a>
    1239:	b8 03 00 00 00       	mov    $0x3,%eax
    123e:	e9 cc 06 00 00       	jmpq   190f <step_state+0xb70>
    1243:	48 85 c0             	test   %rax,%rax
    1246:	75 32                	jne    127a <step_state+0x4db>
    1248:	b8 04 00 00 00       	mov    $0x4,%eax
    124d:	4d 85 ed             	test   %r13,%r13
    1250:	0f 84 b9 06 00 00    	je     190f <step_state+0xb70>
    1256:	48 8b 0b             	mov    (%rbx),%rcx
    1259:	ba 00 00 00 00       	mov    $0x0,%edx
    125e:	be 01 00 00 00       	mov    $0x1,%esi
    1263:	4c 89 ef             	mov    %r13,%rdi
    1266:	b8 00 00 00 00       	mov    $0x0,%eax
    126b:	e8 00 00 00 00       	callq  1270 <step_state+0x4d1>
    1270:	b8 04 00 00 00       	mov    $0x4,%eax
    1275:	e9 95 06 00 00       	jmpq   190f <step_state+0xb70>
    127a:	44 89 e7             	mov    %r12d,%edi
    127d:	e8 00 00 00 00       	callq  1282 <step_state+0x4e3>
    1282:	85 c0                	test   %eax,%eax
    1284:	75 35                	jne    12bb <step_state+0x51c>
    1286:	b8 04 00 00 00       	mov    $0x4,%eax
    128b:	4d 85 ed             	test   %r13,%r13
    128e:	0f 84 7b 06 00 00    	je     190f <step_state+0xb70>
    1294:	45 89 e0             	mov    %r12d,%r8d
    1297:	48 8b 0b             	mov    (%rbx),%rcx
    129a:	ba 00 00 00 00       	mov    $0x0,%edx
    129f:	be 01 00 00 00       	mov    $0x1,%esi
    12a4:	4c 89 ef             	mov    %r13,%rdi
    12a7:	b8 00 00 00 00       	mov    $0x0,%eax
    12ac:	e8 00 00 00 00       	callq  12b1 <step_state+0x512>
    12b1:	b8 04 00 00 00       	mov    $0x4,%eax
    12b6:	e9 54 06 00 00       	jmpq   190f <step_state+0xb70>
    12bb:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    12bf:	e8 00 00 00 00       	callq  12c4 <step_state+0x525>
    12c4:	85 c0                	test   %eax,%eax
    12c6:	74 12                	je     12da <step_state+0x53b>
    12c8:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
    12cc:	8b 74 24 0c          	mov    0xc(%rsp),%esi
    12d0:	e8 00 00 00 00       	callq  12d5 <step_state+0x536>
    12d5:	48 01 44 24 18       	add    %rax,0x18(%rsp)
    12da:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
    12de:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
    12e3:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
    12e8:	e8 00 00 00 00       	callq  12ed <step_state+0x54e>
    12ed:	89 c2                	mov    %eax,%edx
    12ef:	b8 03 00 00 00       	mov    $0x3,%eax
    12f4:	85 d2                	test   %edx,%edx
    12f6:	0f 84 13 06 00 00    	je     190f <step_state+0xb70>
    12fc:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
    1300:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
    1305:	44 89 e6             	mov    %r12d,%esi
    1308:	e8 00 00 00 00       	callq  130d <step_state+0x56e>
    130d:	4c 89 3b             	mov    %r15,(%rbx)
    1310:	b8 01 00 00 00       	mov    $0x1,%eax
    1315:	e9 f5 05 00 00       	jmpq   190f <step_state+0xb70>
    131a:	83 7c 24 04 00       	cmpl   $0x0,0x4(%rsp)
    131f:	75 32                	jne    1353 <step_state+0x5b4>
    1321:	b8 03 00 00 00       	mov    $0x3,%eax
    1326:	4d 85 ed             	test   %r13,%r13
    1329:	0f 84 e0 05 00 00    	je     190f <step_state+0xb70>
    132f:	48 8b 0b             	mov    (%rbx),%rcx
    1332:	ba 00 00 00 00       	mov    $0x0,%edx
    1337:	be 01 00 00 00       	mov    $0x1,%esi
    133c:	4c 89 ef             	mov    %r13,%rdi
    133f:	b8 00 00 00 00       	mov    $0x0,%eax
    1344:	e8 00 00 00 00       	callq  1349 <step_state+0x5aa>
    1349:	b8 03 00 00 00       	mov    $0x3,%eax
    134e:	e9 bc 05 00 00       	jmpq   190f <step_state+0xb70>
    1353:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
    1357:	44 89 e6             	mov    %r12d,%esi
    135a:	e8 00 00 00 00       	callq  135f <step_state+0x5c0>
    135f:	48 89 c5             	mov    %rax,%rbp
    1362:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
    1366:	44 8b 6c 24 0c       	mov    0xc(%rsp),%r13d
    136b:	44 89 ee             	mov    %r13d,%esi
    136e:	e8 00 00 00 00       	callq  1373 <step_state+0x5d4>
    1373:	49 89 c4             	mov    %rax,%r12
    1376:	48 89 c2             	mov    %rax,%rdx
    1379:	48 89 ee             	mov    %rbp,%rsi
    137c:	44 8b 74 24 08       	mov    0x8(%rsp),%r14d
    1381:	44 89 f7             	mov    %r14d,%edi
    1384:	e8 00 00 00 00       	callq  1389 <step_state+0x5ea>
    1389:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    138e:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
    1392:	48 89 c2             	mov    %rax,%rdx
    1395:	44 89 ee             	mov    %r13d,%esi
    1398:	e8 00 00 00 00       	callq  139d <step_state+0x5fe>
    139d:	4c 89 e2             	mov    %r12,%rdx
    13a0:	48 89 ee             	mov    %rbp,%rsi
    13a3:	44 89 f7             	mov    %r14d,%edi
    13a6:	e8 00 00 00 00       	callq  13ab <step_state+0x60c>
    13ab:	88 43 18             	mov    %al,0x18(%rbx)
    13ae:	4c 89 3b             	mov    %r15,(%rbx)
    13b1:	b8 01 00 00 00       	mov    $0x1,%eax
    13b6:	e9 54 05 00 00       	jmpq   190f <step_state+0xb70>
    13bb:	83 7c 24 04 00       	cmpl   $0x0,0x4(%rsp)
    13c0:	75 32                	jne    13f4 <step_state+0x655>
    13c2:	b8 03 00 00 00       	mov    $0x3,%eax
    13c7:	4d 85 ed             	test   %r13,%r13
    13ca:	0f 84 3f 05 00 00    	je     190f <step_state+0xb70>
    13d0:	48 8b 0b             	mov    (%rbx),%rcx
    13d3:	ba 00 00 00 00       	mov    $0x0,%edx
    13d8:	be 01 00 00 00       	mov    $0x1,%esi
    13dd:	4c 89 ef             	mov    %r13,%rdi
    13e0:	b8 00 00 00 00       	mov    $0x0,%eax
    13e5:	e8 00 00 00 00       	callq  13ea <step_state+0x64b>
    13ea:	b8 03 00 00 00       	mov    $0x3,%eax
    13ef:	e9 1b 05 00 00       	jmpq   190f <step_state+0xb70>
    13f4:	48 85 c0             	test   %rax,%rax
    13f7:	75 32                	jne    142b <step_state+0x68c>
    13f9:	b8 03 00 00 00       	mov    $0x3,%eax
    13fe:	4d 85 ed             	test   %r13,%r13
    1401:	0f 84 08 05 00 00    	je     190f <step_state+0xb70>
    1407:	48 8b 0b             	mov    (%rbx),%rcx
    140a:	ba 00 00 00 00       	mov    $0x0,%edx
    140f:	be 01 00 00 00       	mov    $0x1,%esi
    1414:	4c 89 ef             	mov    %r13,%rdi
    1417:	b8 00 00 00 00       	mov    $0x0,%eax
    141c:	e8 00 00 00 00       	callq  1421 <step_state+0x682>
    1421:	b8 03 00 00 00       	mov    $0x3,%eax
    1426:	e9 e4 04 00 00       	jmpq   190f <step_state+0xb70>
    142b:	0f b6 7b 18          	movzbl 0x18(%rbx),%edi
    142f:	8b 74 24 08          	mov    0x8(%rsp),%esi
    1433:	e8 00 00 00 00       	callq  1438 <step_state+0x699>
    1438:	85 c0                	test   %eax,%eax
    143a:	74 12                	je     144e <step_state+0x6af>
    143c:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    1441:	48 89 03             	mov    %rax,(%rbx)
    1444:	b8 01 00 00 00       	mov    $0x1,%eax
    1449:	e9 c1 04 00 00       	jmpq   190f <step_state+0xb70>
    144e:	4c 89 3b             	mov    %r15,(%rbx)
    1451:	b8 01 00 00 00       	mov    $0x1,%eax
    1456:	e9 b4 04 00 00       	jmpq   190f <step_state+0xb70>
    145b:	83 7c 24 04 00       	cmpl   $0x0,0x4(%rsp)
    1460:	75 32                	jne    1494 <step_state+0x6f5>
    1462:	b8 03 00 00 00       	mov    $0x3,%eax
    1467:	4d 85 ed             	test   %r13,%r13
    146a:	0f 84 9f 04 00 00    	je     190f <step_state+0xb70>
    1470:	48 8b 0b             	mov    (%rbx),%rcx
    1473:	ba 00 00 00 00       	mov    $0x0,%edx
    1478:	be 01 00 00 00       	mov    $0x1,%esi
    147d:	4c 89 ef             	mov    %r13,%rdi
    1480:	b8 00 00 00 00       	mov    $0x0,%eax
    1485:	e8 00 00 00 00       	callq  148a <step_state+0x6eb>
    148a:	b8 03 00 00 00       	mov    $0x3,%eax
    148f:	e9 7b 04 00 00       	jmpq   190f <step_state+0xb70>
    1494:	48 85 c0             	test   %rax,%rax
    1497:	75 32                	jne    14cb <step_state+0x72c>
    1499:	b8 03 00 00 00       	mov    $0x3,%eax
    149e:	4d 85 ed             	test   %r13,%r13
    14a1:	0f 84 68 04 00 00    	je     190f <step_state+0xb70>
    14a7:	48 8b 0b             	mov    (%rbx),%rcx
    14aa:	ba 00 00 00 00       	mov    $0x0,%edx
    14af:	be 01 00 00 00       	mov    $0x1,%esi
    14b4:	4c 89 ef             	mov    %r13,%rdi
    14b7:	b8 00 00 00 00       	mov    $0x0,%eax
    14bc:	e8 00 00 00 00       	callq  14c1 <step_state+0x722>
    14c1:	b8 03 00 00 00       	mov    $0x3,%eax
    14c6:	e9 44 04 00 00       	jmpq   190f <step_state+0xb70>
    14cb:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
    14cf:	be 04 00 00 00       	mov    $0x4,%esi
    14d4:	e8 00 00 00 00       	callq  14d9 <step_state+0x73a>
    14d9:	48 8d 50 f8          	lea    -0x8(%rax),%rdx
    14dd:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
    14e2:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
    14e6:	be 04 00 00 00       	mov    $0x4,%esi
    14eb:	e8 00 00 00 00       	callq  14f0 <step_state+0x751>
    14f0:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
    14f4:	4c 89 fa             	mov    %r15,%rdx
    14f7:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
    14fc:	e8 00 00 00 00       	callq  1501 <step_state+0x762>
    1501:	85 c0                	test   %eax,%eax
    1503:	75 37                	jne    153c <step_state+0x79d>
    1505:	b8 03 00 00 00       	mov    $0x3,%eax
    150a:	4d 85 ed             	test   %r13,%r13
    150d:	0f 84 fc 03 00 00    	je     190f <step_state+0xb70>
    1513:	4c 8b 44 24 20       	mov    0x20(%rsp),%r8
    1518:	48 8b 0b             	mov    (%rbx),%rcx
    151b:	ba 00 00 00 00       	mov    $0x0,%edx
    1520:	be 01 00 00 00       	mov    $0x1,%esi
    1525:	4c 89 ef             	mov    %r13,%rdi
    1528:	b8 00 00 00 00       	mov    $0x0,%eax
    152d:	e8 00 00 00 00       	callq  1532 <step_state+0x793>
    1532:	b8 03 00 00 00       	mov    $0x3,%eax
    1537:	e9 d3 03 00 00       	jmpq   190f <step_state+0xb70>
    153c:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    1541:	48 89 03             	mov    %rax,(%rbx)
    1544:	b8 01 00 00 00       	mov    $0x1,%eax
    1549:	e9 c1 03 00 00       	jmpq   190f <step_state+0xb70>
    154e:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
    1552:	be 04 00 00 00       	mov    $0x4,%esi
    1557:	e8 00 00 00 00       	callq  155c <step_state+0x7bd>
    155c:	48 89 c5             	mov    %rax,%rbp
    155f:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
    1563:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
    1568:	48 89 c6             	mov    %rax,%rsi
    156b:	e8 00 00 00 00       	callq  1570 <step_state+0x7d1>
    1570:	85 c0                	test   %eax,%eax
    1572:	75 35                	jne    15a9 <step_state+0x80a>
    1574:	b8 03 00 00 00       	mov    $0x3,%eax
    1579:	4d 85 ed             	test   %r13,%r13
    157c:	0f 84 8d 03 00 00    	je     190f <step_state+0xb70>
    1582:	49 89 e8             	mov    %rbp,%r8
    1585:	48 8b 0b             	mov    (%rbx),%rcx
    1588:	ba 00 00 00 00       	mov    $0x0,%edx
    158d:	be 01 00 00 00       	mov    $0x1,%esi
    1592:	4c 89 ef             	mov    %r13,%rdi
    1595:	b8 00 00 00 00       	mov    $0x0,%eax
    159a:	e8 00 00 00 00       	callq  159f <step_state+0x800>
    159f:	b8 03 00 00 00       	mov    $0x3,%eax
    15a4:	e9 66 03 00 00       	jmpq   190f <step_state+0xb70>
    15a9:	48 8d 55 08          	lea    0x8(%rbp),%rdx
    15ad:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
    15b1:	be 04 00 00 00       	mov    $0x4,%esi
    15b6:	e8 00 00 00 00       	callq  15bb <step_state+0x81c>
    15bb:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
    15c0:	48 89 03             	mov    %rax,(%rbx)
    15c3:	b8 01 00 00 00       	mov    $0x1,%eax
    15c8:	e9 42 03 00 00       	jmpq   190f <step_state+0xb70>
    15cd:	83 7c 24 04 00       	cmpl   $0x0,0x4(%rsp)
    15d2:	75 32                	jne    1606 <step_state+0x867>
    15d4:	b8 03 00 00 00       	mov    $0x3,%eax
    15d9:	4d 85 ed             	test   %r13,%r13
    15dc:	0f 84 2d 03 00 00    	je     190f <step_state+0xb70>
    15e2:	48 8b 0b             	mov    (%rbx),%rcx
    15e5:	ba 00 00 00 00       	mov    $0x0,%edx
    15ea:	be 01 00 00 00       	mov    $0x1,%esi
    15ef:	4c 89 ef             	mov    %r13,%rdi
    15f2:	b8 00 00 00 00       	mov    $0x0,%eax
    15f7:	e8 00 00 00 00       	callq  15fc <step_state+0x85d>
    15fc:	b8 03 00 00 00       	mov    $0x3,%eax
    1601:	e9 09 03 00 00       	jmpq   190f <step_state+0xb70>
    1606:	44 89 e7             	mov    %r12d,%edi
    1609:	e8 00 00 00 00       	callq  160e <step_state+0x86f>
    160e:	85 c0                	test   %eax,%eax
    1610:	75 35                	jne    1647 <step_state+0x8a8>
    1612:	b8 04 00 00 00       	mov    $0x4,%eax
    1617:	4d 85 ed             	test   %r13,%r13
    161a:	0f 84 ef 02 00 00    	je     190f <step_state+0xb70>
    1620:	45 89 e0             	mov    %r12d,%r8d
    1623:	48 8b 0b             	mov    (%rbx),%rcx
    1626:	ba 00 00 00 00       	mov    $0x0,%edx
    162b:	be 01 00 00 00       	mov    $0x1,%esi
    1630:	4c 89 ef             	mov    %r13,%rdi
    1633:	b8 00 00 00 00       	mov    $0x0,%eax
    1638:	e8 00 00 00 00       	callq  163d <step_state+0x89e>
    163d:	b8 04 00 00 00       	mov    $0x4,%eax
    1642:	e9 c8 02 00 00       	jmpq   190f <step_state+0xb70>
    1647:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
    164b:	44 89 e6             	mov    %r12d,%esi
    164e:	e8 00 00 00 00       	callq  1653 <step_state+0x8b4>
    1653:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    1658:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
    165c:	be 04 00 00 00       	mov    $0x4,%esi
    1661:	e8 00 00 00 00       	callq  1666 <step_state+0x8c7>
    1666:	48 8d 68 f8          	lea    -0x8(%rax),%rbp
    166a:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
    166e:	48 89 ea             	mov    %rbp,%rdx
    1671:	be 04 00 00 00       	mov    $0x4,%esi
    1676:	e8 00 00 00 00       	callq  167b <step_state+0x8dc>
    167b:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
    167f:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
    1684:	48 89 ee             	mov    %rbp,%rsi
    1687:	e8 00 00 00 00       	callq  168c <step_state+0x8ed>
    168c:	85 c0                	test   %eax,%eax
    168e:	75 35                	jne    16c5 <step_state+0x926>
    1690:	b8 03 00 00 00       	mov    $0x3,%eax
    1695:	4d 85 ed             	test   %r13,%r13
    1698:	0f 84 71 02 00 00    	je     190f <step_state+0xb70>
    169e:	49 89 e8             	mov    %rbp,%r8
    16a1:	48 8b 0b             	mov    (%rbx),%rcx
    16a4:	ba 00 00 00 00       	mov    $0x0,%edx
    16a9:	be 01 00 00 00       	mov    $0x1,%esi
    16ae:	4c 89 ef             	mov    %r13,%rdi
    16b1:	b8 00 00 00 00       	mov    $0x0,%eax
    16b6:	e8 00 00 00 00       	callq  16bb <step_state+0x91c>
    16bb:	b8 03 00 00 00       	mov    $0x3,%eax
    16c0:	e9 4a 02 00 00       	jmpq   190f <step_state+0xb70>
    16c5:	4c 89 3b             	mov    %r15,(%rbx)
    16c8:	b8 01 00 00 00       	mov    $0x1,%eax
    16cd:	e9 3d 02 00 00       	jmpq   190f <step_state+0xb70>
    16d2:	83 7c 24 04 00       	cmpl   $0x0,0x4(%rsp)
    16d7:	75 32                	jne    170b <step_state+0x96c>
    16d9:	b8 03 00 00 00       	mov    $0x3,%eax
    16de:	4d 85 ed             	test   %r13,%r13
    16e1:	0f 84 28 02 00 00    	je     190f <step_state+0xb70>
    16e7:	48 8b 0b             	mov    (%rbx),%rcx
    16ea:	ba 00 00 00 00       	mov    $0x0,%edx
    16ef:	be 01 00 00 00       	mov    $0x1,%esi
    16f4:	4c 89 ef             	mov    %r13,%rdi
    16f7:	b8 00 00 00 00       	mov    $0x0,%eax
    16fc:	e8 00 00 00 00       	callq  1701 <step_state+0x962>
    1701:	b8 03 00 00 00       	mov    $0x3,%eax
    1706:	e9 04 02 00 00       	jmpq   190f <step_state+0xb70>
    170b:	44 89 e7             	mov    %r12d,%edi
    170e:	e8 00 00 00 00       	callq  1713 <step_state+0x974>
    1713:	85 c0                	test   %eax,%eax
    1715:	75 35                	jne    174c <step_state+0x9ad>
    1717:	b8 04 00 00 00       	mov    $0x4,%eax
    171c:	4d 85 ed             	test   %r13,%r13
    171f:	0f 84 ea 01 00 00    	je     190f <step_state+0xb70>
    1725:	45 89 e0             	mov    %r12d,%r8d
    1728:	48 8b 0b             	mov    (%rbx),%rcx
    172b:	ba 00 00 00 00       	mov    $0x0,%edx
    1730:	be 01 00 00 00       	mov    $0x1,%esi
    1735:	4c 89 ef             	mov    %r13,%rdi
    1738:	b8 00 00 00 00       	mov    $0x0,%eax
    173d:	e8 00 00 00 00       	callq  1742 <step_state+0x9a3>
    1742:	b8 04 00 00 00       	mov    $0x4,%eax
    1747:	e9 c3 01 00 00       	jmpq   190f <step_state+0xb70>
    174c:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
    1750:	be 04 00 00 00       	mov    $0x4,%esi
    1755:	e8 00 00 00 00       	callq  175a <step_state+0x9bb>
    175a:	48 89 c5             	mov    %rax,%rbp
    175d:	48 8d 50 08          	lea    0x8(%rax),%rdx
    1761:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
    1765:	be 04 00 00 00       	mov    $0x4,%esi
    176a:	e8 00 00 00 00       	callq  176f <step_state+0x9d0>
    176f:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
    1773:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
    1778:	48 89 ee             	mov    %rbp,%rsi
    177b:	e8 00 00 00 00       	callq  1780 <step_state+0x9e1>
    1780:	85 c0                	test   %eax,%eax
    1782:	75 35                	jne    17b9 <step_state+0xa1a>
    1784:	b8 03 00 00 00       	mov    $0x3,%eax
    1789:	4d 85 ed             	test   %r13,%r13
    178c:	0f 84 7d 01 00 00    	je     190f <step_state+0xb70>
    1792:	49 89 e8             	mov    %rbp,%r8
    1795:	48 8b 0b             	mov    (%rbx),%rcx
    1798:	ba 00 00 00 00       	mov    $0x0,%edx
    179d:	be 01 00 00 00       	mov    $0x1,%esi
    17a2:	4c 89 ef             	mov    %r13,%rdi
    17a5:	b8 00 00 00 00       	mov    $0x0,%eax
    17aa:	e8 00 00 00 00       	callq  17af <step_state+0xa10>
    17af:	b8 03 00 00 00       	mov    $0x3,%eax
    17b4:	e9 56 01 00 00       	jmpq   190f <step_state+0xb70>
    17b9:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
    17bd:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
    17c2:	44 89 e6             	mov    %r12d,%esi
    17c5:	e8 00 00 00 00       	callq  17ca <step_state+0xa2b>
    17ca:	4c 89 3b             	mov    %r15,(%rbx)
    17cd:	b8 01 00 00 00       	mov    $0x1,%eax
    17d2:	e9 38 01 00 00       	jmpq   190f <step_state+0xb70>
    17d7:	83 7c 24 04 00       	cmpl   $0x0,0x4(%rsp)
    17dc:	75 32                	jne    1810 <step_state+0xa71>
    17de:	b8 03 00 00 00       	mov    $0x3,%eax
    17e3:	4d 85 ed             	test   %r13,%r13
    17e6:	0f 84 23 01 00 00    	je     190f <step_state+0xb70>
    17ec:	48 8b 0b             	mov    (%rbx),%rcx
    17ef:	ba 00 00 00 00       	mov    $0x0,%edx
    17f4:	be 01 00 00 00       	mov    $0x1,%esi
    17f9:	4c 89 ef             	mov    %r13,%rdi
    17fc:	b8 00 00 00 00       	mov    $0x0,%eax
    1801:	e8 00 00 00 00       	callq  1806 <step_state+0xa67>
    1806:	b8 03 00 00 00       	mov    $0x3,%eax
    180b:	e9 ff 00 00 00       	jmpq   190f <step_state+0xb70>
    1810:	48 85 c0             	test   %rax,%rax
    1813:	75 32                	jne    1847 <step_state+0xaa8>
    1815:	b8 04 00 00 00       	mov    $0x4,%eax
    181a:	4d 85 ed             	test   %r13,%r13
    181d:	0f 84 ec 00 00 00    	je     190f <step_state+0xb70>
    1823:	48 8b 0b             	mov    (%rbx),%rcx
    1826:	ba 00 00 00 00       	mov    $0x0,%edx
    182b:	be 01 00 00 00       	mov    $0x1,%esi
    1830:	4c 89 ef             	mov    %r13,%rdi
    1833:	b8 00 00 00 00       	mov    $0x0,%eax
    1838:	e8 00 00 00 00       	callq  183d <step_state+0xa9e>
    183d:	b8 04 00 00 00       	mov    $0x4,%eax
    1842:	e9 c8 00 00 00       	jmpq   190f <step_state+0xb70>
    1847:	44 8b 74 24 0c       	mov    0xc(%rsp),%r14d
    184c:	44 89 f7             	mov    %r14d,%edi
    184f:	e8 00 00 00 00       	callq  1854 <step_state+0xab5>
    1854:	85 c0                	test   %eax,%eax
    1856:	75 35                	jne    188d <step_state+0xaee>
    1858:	b8 04 00 00 00       	mov    $0x4,%eax
    185d:	4d 85 ed             	test   %r13,%r13
    1860:	0f 84 a9 00 00 00    	je     190f <step_state+0xb70>
    1866:	45 89 f0             	mov    %r14d,%r8d
    1869:	48 8b 0b             	mov    (%rbx),%rcx
    186c:	ba 00 00 00 00       	mov    $0x0,%edx
    1871:	be 01 00 00 00       	mov    $0x1,%esi
    1876:	4c 89 ef             	mov    %r13,%rdi
    1879:	b8 00 00 00 00       	mov    $0x0,%eax
    187e:	e8 00 00 00 00       	callq  1883 <step_state+0xae4>
    1883:	b8 04 00 00 00       	mov    $0x4,%eax
    1888:	e9 82 00 00 00       	jmpq   190f <step_state+0xb70>
    188d:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
    1891:	44 8b 74 24 0c       	mov    0xc(%rsp),%r14d
    1896:	44 89 f6             	mov    %r14d,%esi
    1899:	e8 00 00 00 00       	callq  189e <step_state+0xaff>
    189e:	48 89 c5             	mov    %rax,%rbp
    18a1:	48 89 c2             	mov    %rax,%rdx
    18a4:	48 03 54 24 18       	add    0x18(%rsp),%rdx
    18a9:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
    18ae:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
    18b2:	44 89 f6             	mov    %r14d,%esi
    18b5:	e8 00 00 00 00       	callq  18ba <step_state+0xb1b>
    18ba:	48 89 ea             	mov    %rbp,%rdx
    18bd:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
    18c2:	bf 00 00 00 00       	mov    $0x0,%edi
    18c7:	e8 00 00 00 00       	callq  18cc <step_state+0xb2d>
    18cc:	88 43 18             	mov    %al,0x18(%rbx)
    18cf:	4c 89 3b             	mov    %r15,(%rbx)
    18d2:	b8 01 00 00 00       	mov    $0x1,%eax
    18d7:	eb 36                	jmp    190f <step_state+0xb70>
    18d9:	b8 04 00 00 00       	mov    $0x4,%eax
    18de:	4d 85 ed             	test   %r13,%r13
    18e1:	74 2c                	je     190f <step_state+0xb70>
    18e3:	44 0f b6 44 24 16    	movzbl 0x16(%rsp),%r8d
    18e9:	48 8b 0b             	mov    (%rbx),%rcx
    18ec:	ba 00 00 00 00       	mov    $0x0,%edx
    18f1:	be 01 00 00 00       	mov    $0x1,%esi
    18f6:	4c 89 ef             	mov    %r13,%rdi
    18f9:	b8 00 00 00 00       	mov    $0x0,%eax
    18fe:	e8 00 00 00 00       	callq  1903 <step_state+0xb64>
    1903:	b8 04 00 00 00       	mov    $0x4,%eax
    1908:	eb 05                	jmp    190f <step_state+0xb70>
    190a:	b8 02 00 00 00       	mov    $0x2,%eax
    190f:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
    1914:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    191b:	00 00 
    191d:	74 05                	je     1924 <step_state+0xb85>
    191f:	e8 00 00 00 00       	callq  1924 <step_state+0xb85>
    1924:	48 83 c4 38          	add    $0x38,%rsp
    1928:	5b                   	pop    %rbx
    1929:	5d                   	pop    %rbp
    192a:	41 5c                	pop    %r12
    192c:	41 5d                	pop    %r13
    192e:	41 5e                	pop    %r14
    1930:	41 5f                	pop    %r15
    1932:	c3                   	retq   
