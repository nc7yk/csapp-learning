# Arch lab

## Y86-64指令集：

- mov：
  - irmov，rrmov，mrmov，rmmov四种 
  - 前面两个字符分别代表赋值的起点终点
  - i指的是立即数 r指的是寄存器 m指的是内存地址 立即数不能直接赋给内存
- 四个整数操作：
  - addq，subq，xorq和andq 分别进行 +，-，亦或，与运算
  - 只允许对寄存器操作 同时会设置三个标志码 ZF SF和OF分别代表零，符号，溢出 
- 七个跳转：
  - jmp，jle，jl，je，jne，jge，jg基本跟x86-64差不多
  - https://blog.csdn.net/wq57885/article/details/80700032?utm_medium=distribute.pc_relevant.none-task-blog-baidujs_title-0&spm=1001.2101.3001.4242
- 六个条件传送指令：
  - cmovle、cmovl、cmove、cmovne、cmovge、cmovg
  - 寄存器操作 只有条件码满足条件才进行操作
- call：
  - 返回地址入栈 然后jmp到目标地址 ret从这样的指令中返回
- pushq popq:
  - 入栈出栈
- halt：
  - 停止命令执行 在X86中对应hlt



### 指令对应的编码

![image-20210501134227607](C:\Users\de'l'l\AppData\Roaming\Typora\typora-user-images\image-20210501134227607.png)

![image-20210501134501119](C:\Users\de'l'l\AppData\Roaming\Typora\typora-user-images\image-20210501134501119.png)

![image-20210501134541496](C:\Users\de'l'l\AppData\Roaming\Typora\typora-user-images\image-20210501134541496.png)



## part A:

做题之前 先更改下文件：

/sim/Makefile：

注释掉：

```
#GUIMODE=-DHAS_GUI
#TKLIBS=-L/usr/lib -ltk -ltcl
#TKINC=-isystem /usr/include/tcl8.5
```

![image-20210501124238425](C:\Users\de'l'l\AppData\Roaming\Typora\typora-user-images\image-20210501124238425.png)

然后 : `make clean;make`

检测 : `./yas 对应题目.ys ./yis 对应题目.yo` 

### 1：

题目要求：

```
将sum_list中的代码翻译成X86-64格式:
long sum_list(list_ptr ls)
{
    long val = 0;
    while (ls) {
	val += ls->val;
	ls = ls->next;
    }
    return val;
}
```

链表求和操作

测试数据：

```
# Sample linked list
.align 8
ele1:
.quad 0x00a
.quad ele2
ele2:
.quad 0x0b0
.quad ele3
ele3:
.quad 0xc00
.quad 0
```



书上存在例题4.3

![image-20210501103118758](C:\Users\de'l'l\AppData\Roaming\Typora\typora-user-images\image-20210501103118758.png)

参考写的exp:

```
	.pos 0
	irmovq stack, %rsp
    call main
    halt

#Array of 3 elements
	.align 8
ele1:
	.quad 0x00a
	.quad ele2
ele2:
	.quad 0x0b0
	.quad ele3
ele3:
	.quad 0xc00
	.quad 0

main:
	irmovq ele1,%rdi        
	call sum_list
	ret

sum_list:
	irmovq $0,%rax
	jmp test
loop:
	mrmovq 0(%rdi),%rdx
	addq %rdx,%rax  # ls = ls->next;
	mrmovq 8(%rdi),%rdx
	rrmovq %rdx,%rdi
test:
	andq %rdi,%rdi  # val += ls->val;
	jne loop        
	ret

	.pos 0x100
stack:
```



### 2：

题目要求：

```
递归求和:
long rsum_list(list_ptr ls)
{
    if (!ls)
	return 0;
    else {
	long val = ls->val;
	long rest = rsum_list(ls->next);
	return val + rest;
    }
}
```

测试数据：

```
# Sample linked list
.align 8
ele1:
.quad 0x00a
.quad ele2
ele2:
.quad 0x0b0
.quad ele3
ele3:
.quad 0xc0e'x'p0
.quad 0
```





exp:

```
	.pos 0
	irmovq stack, %rsp
    call main
    halt

	.align 8
ele1:
	.quad 0x00a
	.quad ele2
ele2:
	.quad 0x0b0
	.quad ele3
ele3:
	.quad 0xc00
	.quad 0
	
rsum_list:
	pushq %r12  #callee-save registers, save it because we will change it
	xorq %rax,%rax
	andq %rdi,%rdi
	je RETURN
	mrmovq 0(%rdi), %r12 #store the node value in %rsi
	mrmovq 8(%rdi), %rdi #replace %rdi with the node pointer
	call rsum_list
	addq %r12, %rax
RETURN:
	popq %r12
	ret

main:
	irmovq ele1, %rdi
	call rsum_list
	ret

	.pos 0x400
stack:
```



### 3：

题目要求：

```
数组复制：
long copy_block(long *src, long *dest, long len)
{
    long result = 0;
    while (len > 0) {
	long val = *src++;
	*dest++ = val;
	result ^= val;
	len--;
    }
    return result;
}
```

将src中的值复制到dest中 然后将每个数的进行异或

```
result = src[0] -> result = result ^ src[1] ... ....
```

测试数据：

```
.align 8
# Source block
src:
.quad 0x00a
.quad 0x0b0
.quad 0xc00
# Destination block
dest:
.quad 0x111
.quad 0x222
.quad 0x333
```



exp:

```
	.pos 0
	irmovq stack, %rsp
    call main
    halt
    
    .align 8
# Source block
src:
	.quad 0x00a
	.quad 0x0b0
	.quad 0xc00
# Destination block
dest:
	.quad 0x111
	.quad 0x222
	.quad 0x333
	
main:
	irmovq $src,%rdi
	irmovq $dest,%rsi
	irmovq $3,%rdx
	call copy_block
    ret
    
copy_block:
	pushq %r12
	pushq %r13
    irmovq $0,%rax  # result = 0
	irmovq $1,%r12 # 自减
	irmovq $8,%r13 # 链表
	jmp loop
loop:
	pushq %rcx
	mrmovq 0(%rdi),%rcx
	addq %r13,%rdi  # src++
	rmmovq %rcx,%rsi  # *dest = val;
	addq %r12,%rsi  # dest++
	xorq %rcx,%rax
	subq %12,%rdx
	
loop2:
	andq %rdx,%rdx
	jg loop
	popq %r13
	popq %r12
	ret
	
    .pos 0x300
stack:
```

结果：

![image-20210501153031801](C:\Users\de'l'l\AppData\Roaming\Typora\typora-user-images\image-20210501153031801.png)



## part B:

![image-20210501153601105](C:\Users\de'l'l\AppData\Roaming\Typora\typora-user-images\image-20210501153601105.png)

这个部分是为处理器增加一个iaddq指令,参考课本的图4.18,很容易写出iaddq对应的各个阶段

```
fetch:
icode:ifun <- M1[PC]
rA:rB <- M1[PC+1]
valC <- M8[PC+2]
valP <- PC+10

decode:
valB <- R[rB]

execute:
valE <-  valB OP valC
set CC

memory:
NONE

write back:
R[rB] <- valE

PC update:
PC <- valP
```

所以直接对照着修改对应的，也就是OPQ的地方都加一个IIADDQ



但是在做之前先要修改下`./seq/Makefile`文件和安装一些需要的库

![image-20210505233452111](C:\Users\de'l'l\AppData\Roaming\Typora\typora-user-images\image-20210505233452111.png)

```
➜  seq git:(master) ✗ sudo apt-get install tcl tcl-dev tk tk-dev
➜  seq git:(master) ✗ make
```



exp:

```
# This is fanese-myk 's CSAPP Arch Lab
# The five steps of iaddq:
# fetch: icode:ifun = M1[PC] rA:rB = M1[PC] valC = M8[PC+2] valP = PC + 10
# decode: valB = R[rB]
# execute: valE = valC + valB; set CC
# memory:
# write back: R[rB] = valE
# PC updated: PC = valP

#/* $begin seq-all-hcl */
####################################################################
#  HCL Description of Control for Single Cycle Y86-64 Processor SEQ   #
#  Copyright (C) Randal E. Bryant, David R. O'Hallaron, 2010       #
####################################################################

## Your task is to implement the iaddq instruction
## The file contains a declaration of the icodes
## for iaddq (IIADDQ)
## Your job is to add the rest of the logic to make it work

####################################################################
#    C Include's.  Don't alter these                               #
####################################################################

quote '#include <stdio.h>'
quote '#include "isa.h"'
quote '#include "sim.h"'
quote 'int sim_main(int argc, char *argv[]);'
quote 'word_t gen_pc(){return 0;}'
quote 'int main(int argc, char *argv[])'
quote '  {plusmode=0;return sim_main(argc,argv);}'

####################################################################
#    Declarations.  Do not change/remove/delete any of these       #
####################################################################

##### Symbolic representation of Y86-64 Instruction Codes #############
wordsig INOP 	'I_NOP'
wordsig IHALT	'I_HALT'
wordsig IRRMOVQ	'I_RRMOVQ'
wordsig IIRMOVQ	'I_IRMOVQ'
wordsig IRMMOVQ	'I_RMMOVQ'
wordsig IMRMOVQ	'I_MRMOVQ'
wordsig IOPQ	'I_ALU'
wordsig IJXX	'I_JMP'
wordsig ICALL	'I_CALL'
wordsig IRET	'I_RET'
wordsig IPUSHQ	'I_PUSHQ'
wordsig IPOPQ	'I_POPQ'
# Instruction code for iaddq instruction
wordsig IIADDQ	'I_IADDQ'

##### Symbolic represenations of Y86-64 function codes                  #####
wordsig FNONE    'F_NONE'        # Default function code

##### Symbolic representation of Y86-64 Registers referenced explicitly #####
wordsig RRSP     'REG_RSP'    	# Stack Pointer
wordsig RNONE    'REG_NONE'   	# Special value indicating "no register"

##### ALU Functions referenced explicitly                            #####
wordsig ALUADD	'A_ADD'		# ALU should add its arguments

##### Possible instruction status values                             #####
wordsig SAOK	'STAT_AOK'	# Normal execution
wordsig SADR	'STAT_ADR'	# Invalid memory address
wordsig SINS	'STAT_INS'	# Invalid instruction
wordsig SHLT	'STAT_HLT'	# Halt instruction encountered

##### Signals that can be referenced by control logic ####################

##### Fetch stage inputs		#####
wordsig pc 'pc'				# Program counter
##### Fetch stage computations		#####
wordsig imem_icode 'imem_icode'		# icode field from instruction memory
wordsig imem_ifun  'imem_ifun' 		# ifun field from instruction memory
wordsig icode	  'icode'		# Instruction control code
wordsig ifun	  'ifun'		# Instruction function
wordsig rA	  'ra'			# rA field from instruction
wordsig rB	  'rb'			# rB field from instruction
wordsig valC	  'valc'		# Constant from instruction
wordsig valP	  'valp'		# Address of following instruction
boolsig imem_error 'imem_error'		# Error signal from instruction memory
boolsig instr_valid 'instr_valid'	# Is fetched instruction valid?

##### Decode stage computations		#####
wordsig valA	'vala'			# Value from register A port
wordsig valB	'valb'			# Value from register B port

##### Execute stage computations	#####
wordsig valE	'vale'			# Value computed by ALU
boolsig Cnd	'cond'			# Branch test

##### Memory stage computations		#####
wordsig valM	'valm'			# Value read from memory
boolsig dmem_error 'dmem_error'		# Error signal from data memory


####################################################################
#    Control Signal Definitions.                                   #
####################################################################

################ Fetch Stage     ###################################

# Determine instruction code
word icode = [
	imem_error: INOP;
	1: imem_icode;		# Default: get from instruction memory
];

# Determine instruction function
word ifun = [
	imem_error: FNONE;
	1: imem_ifun;		# Default: get from instruction memory
];

bool instr_valid = icode in 
	{ INOP, IHALT, IRRMOVQ, IIRMOVQ, IRMMOVQ, IMRMOVQ, IIADDQ,
	       IOPQ, IJXX, ICALL, IRET, IPUSHQ, IPOPQ };

# Does fetched instruction require a regid byte?
bool need_regids =
	icode in { IRRMOVQ, IOPQ, IPUSHQ, IPOPQ, IIADDQ,
		     IIRMOVQ, IRMMOVQ, IMRMOVQ };

# Does fetched instruction require a constant word?
bool need_valC =
	icode in { IIRMOVQ, IRMMOVQ, IMRMOVQ, IJXX, ICALL, IIADDQ };

################ Decode Stage    ###################################

## What register should be used as the A source?
word srcA = [
	icode in { IRRMOVQ, IRMMOVQ, IOPQ, IPUSHQ  } : rA;
	icode in { IPOPQ, IRET } : RRSP;
	1 : RNONE; # Don't need register
];

## What register should be used as the B source?
word srcB = [
	icode in { IOPQ, IRMMOVQ, IMRMOVQ, IIADDQ  } : rB;
	icode in { IPUSHQ, IPOPQ, ICALL, IRET } : RRSP;
	1 : RNONE;  # Don't need register
];

## What register should be used as the E destination?
word dstE = [
	icode in { IRRMOVQ } && Cnd : rB;
	icode in { IIRMOVQ, IOPQ, IIADDQ } : rB;
	icode in { IPUSHQ, IPOPQ, ICALL, IRET } : RRSP;
	1 : RNONE;  # Don't write any register
];

## What register should be used as the M destination?
word dstM = [
	icode in { IMRMOVQ, IPOPQ } : rA;
	1 : RNONE;  # Don't write any register
];

################ Execute Stage   ###################################

## Select input A to ALU
word aluA = [
	icode in { IRRMOVQ, IOPQ } : valA;
	icode in { IIRMOVQ, IRMMOVQ, IMRMOVQ, IIADDQ} : valC;
	icode in { ICALL, IPUSHQ } : -8;
	icode in { IRET, IPOPQ } : 8;
	# Other instructions don't need ALU
];

## Select input B to ALU
word aluB = [
	icode in { IRMMOVQ, IMRMOVQ, IOPQ, ICALL, 
		      IPUSHQ, IRET, IPOPQ, IIADDQ } : valB;
	icode in { IRRMOVQ, IIRMOVQ } : 0;
	# Other instructions don't need ALU
];

## Set the ALU function
word alufun = [
	icode == IOPQ : ifun;
	1 : ALUADD;
];

## Should the condition codes be updated?
bool set_cc = icode in { IOPQ, IIADDQ };

################ Memory Stage    ###################################

## Set read control signal
bool mem_read = icode in { IMRMOVQ, IPOPQ, IRET };

## Set write control signal
bool mem_write = icode in { IRMMOVQ, IPUSHQ, ICALL };

## Select memory address
word mem_addr = [
	icode in { IRMMOVQ, IPUSHQ, ICALL, IMRMOVQ } : valE;
	icode in { IPOPQ, IRET } : valA;
	# Other instructions don't need address
];

## Select memory input data
word mem_data = [
	# Value from register
	icode in { IRMMOVQ, IPUSHQ } : valA;
	# Return PC
	icode == ICALL : valP;
	# Default: Don't write anything
];

## Determine instruction status
word Stat = [
	imem_error || dmem_error : SADR;
	!instr_valid: SINS;
	icode == IHALT : SHLT;
	1 : SAOK;
];

################ Program Counter Update ############################

## What address should instruction be fetched at

word new_pc = [
	# Call.  Use instruction constant
	icode == ICALL : valC;
	# Taken branch.  Use instruction constant
	icode == IJXX && Cnd : valC;
	# Completion of RET instruction.  Use value from stack
	icode == IRET : valM;
	# Default: Use incremented PC
	1 : valP;
];
#/* $end seq-all-hcl */
```





## part C：

