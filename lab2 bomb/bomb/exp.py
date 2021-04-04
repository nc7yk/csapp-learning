from pwn import *
context(arch='amd64',endian='el',os='linux')
context.log_level='debug'
p = process("./bomb")
p.sendlineafter("which to blow yourself up. Have a nice day!\n",'Border relations with Canada have never been better.') # 1
gdb.attach(p,'b *0x04011F5\n')
p.sendlineafter("How about the next one?\n",'1 2 4 8 16 32') # 2
p.sendlineafter("That's number 2.  Keep going!\n", '0 207') # 3
p.sendlineafter("Halfway there!\n", "7 0") # 4
p.sendlineafter("So you got that one.  Try this one.\n", "IONEFG") # 5
p.sendlineafter("Good work!  On to the next...\n", "4 3 2 1 6 5")
p.interactive()
