# bitXor

问题描述：

```c
//1
/* 
 * bitXor - x^y using only ~ and & 
 *   Example: bitXor(4, 5) = 1
 *   Legal ops: ~ &
 *   Max ops: 14
 *   Rating: 1
 */
int bitXor(int x, int y) {
  return 2;
}
```

要求只用`取反~`和  `与运算&` 完成 `亦或^`

开始想简单了`~(x&y)`



```
按照我们的算法：
如果是正常数据：
1000 0001
0011 1101
那么是没有问题的
```

但如果该数用到补码：-2147483648

给出了报错：

```
给出了报错：-2147483648 ^ -2147483648
同样 如果取~(~x&~y) 也会报如上错误
~(10000000000000000000000000000000&10000000000000000000000000000000) = 01111111111111111111111111111111
~(01111111111111111111111111111111&01111111111111111111111111111111) = 10000000000000000000000000000000
显然是不对的 因为多出的一位补码会影响
所以需要再与 原数据取反的与运算的取反（ps:有点绕）再做与运算
也就是：~(x&y)&~(~x&~y)
```

exp:

```c
int bitXor(int x, int y){
	return ~(x&y)&~(~x&~y);
}
```



# tmin

题目描述：

```c
/* 
 * tmin - return minimum two's complement integer 
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 4
 *   Rating: 1
 */
int tmin(void) {

  return 2;

}
```

要求是取对2补码的最小int值

~~一开始没看懂题目（雾~~

很简单，留出一个符号位为1 其余用0补充就可 

exp：

```c
int tmin(void) {
  return 1<<31;
}
```



# isTmax

问题描述：

```c
//2
/*
 * isTmax - returns 1 if x is the maximum, two's complement number,
 *     and 0 otherwise 
 *   Legal ops: ! ~ & ^ | +
 *   Max ops: 10
 *   Rating: 1
 */
int isTmax(int x) {
  return 2;
}
```

判断是否是补码的最大值

只允许使用`! ~ & ^ | +`



exp:

```c
int isTmax(int x) { // x=1111=-1 
    int i = x+1; //i=0000=0 
  	x = x + i; // x=1111=-1
    x = ~x; // x=0000
    i = !i; // i=1
    x = x + i // x = 0000
    return !x; // 1
}
```

```c
int isTmax(int x) { // x=1000=-8
    int i = x+1; //i=1001=-7 
  	x = x + i; // x=1000=-8
    x = ~x; // x=0111
    i = !i; // i=1
    x = x + i // x = 1000
    return !x; // 0
}
```



# allOddBits

题目要求

```c
/* 
 * allOddBits - return 1 if all odd-numbered bits in word set to 1
 *   where bits are numbered from 0 (least significant) to 31 (most significant)
 *   Examples allOddBits(0xFFFFFFFD) = 0, allOddBits(0xAAAAAAAA) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 2
 */
int allOddBits(int x) {
  return 2;
}
```

只允许 `! ~ & ^ | + << >>`

判断所有奇数位是否都为1，这里的奇数指的是位的阶级是2的几次幂。

![image-20210331122438857](C:\Users\de'l'l\AppData\Roaming\Typora\typora-user-images\image-20210331122438857.png)

![image-20210331122458180](C:\Users\de'l'l\AppData\Roaming\Typora\typora-user-images\image-20210331122458180.png)

0x5555满足条件

掩码操作 构造奇数位全为1的二进制数 然后对x和这个数取& 这样如果满足条件，对应奇数位的1不会发生变化，然后与i进行亦或 如果是0的话说明该数奇数位仍为1 满足条件 取逻辑反1 否则取0

exp:

```c
int allOddBits(int x) {   //if x=0101010101010101
    int i=0xAAAA+(0xAAAA<<16); //i=0xAAAAAAAA
	x = x&i; // 10101010101010100000000000000000
    x ^= i;  // 00000000000000001111111111111111
    return !x; // 0
}
```





# negate

问题描述：

```c
/* 
 * negate - return -x 
 *   Example: negate(1) = -1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 5
 *   Rating: 2
 */
int negate(int x) {
  return 2;
}
```

只允许使用`!~&^|+ << >>` 

对一个数取反 

![image-20210331131601186](C:\Users\de'l'l\AppData\Roaming\Typora\typora-user-images\image-20210331131601186.png)

![image-20210331131615039](C:\Users\de'l'l\AppData\Roaming\Typora\typora-user-images\image-20210331131615039.png)

0000 1010 = ~(1111 0101)

so显而易见

exp:

```c
int negate(int x) {
  return ~x+1;
}
```







# isAsciiDigit

问题描述：

```c
//3
/* 
 * isAsciiDigit - return 1 if 0x30 <= x <= 0x39 (ASCII codes for characters '0' to '9')
 *   Example: isAsciiDigit(0x35) = 1.
 *            isAsciiDigit(0x3a) = 0.
 *            isAsciiDigit(0x05) = 0.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 15
 *   Rating: 3
 */
int isAsciiDigit(int x) {
  return 2;
}
```

只使用`!~&^|+ << >>` 判断是否在ascii码0-9的区间

00110000 - 00111001

通过判断`x-0x30`和`0x39-x`的符号位

exp:

```c
int isAsciiDigit(int x) { // 0x30 = 00110000
    int min,max;
    min=0x30;
    max=0x39;// =00111001 ~max+1 = 1111111111111111111111111111111111111111111111111111111111000111
    
  	return (!((x+(~min+1))>>31))&(!((max+(~x+1))>>31));
}
```





# conditional

问题描述：

```c
/* 
 * conditional - same as x ? y : z 
 *   Example: conditional(2,4,5) = 4
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 16
 *   Rating: 3
 */
int conditional(int x, int y, int z) {
  return 2;
}
```

只允许`! ~ & ^ | + << >>`实现三目运算 

从结果想，如果x为0 即构造`(0&y)|(-1&z)`否则构造`(-1&y)|(0&z)`

这样只要构造出一个0(00000000000) 和 -1(1111111111111)就行了

exp:

```c
int conditional(int x, int y, int z) {
  return ((~(~!x+1))&y)|((~!x+1)&z);
}
```





# isLessOrEqual

问题描述：

```c
/* 
 * isLessOrEqual - if x <= y  then return 1, else return 0 
 *   Example: isLessOrEqual(4,5) = 1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 24
 *   Rating: 3
 */
int isLessOrEqual(int x, int y) {
  return 2;
}
```

只允许`! ~ & ^ | + << >>`实现判断小于等于

两种情况 符号相同或不相同

相同则通过差值判断 否则直接通过符号位判断

exp:

```c
int isLessOrEqual(int x, int y) {
    int y_x = y+(~x+1);
    int y_x_sign = y_x>>31&1;
    int sign_x = x&(1<<31);
    int sign_y = y&(1<<31);
    int bit_xor = sign_x^sign_y;
    int sign_xor = (bit_xor>>31)&1;
    return ((!sign_xor)&(!y_x_sign))|((sign_xor)&(sign_x>>31));
}
```





# logicalNeg

问题描述：

```c
//4
/* 
 * logicalNeg - implement the ! operator, using all of 
 *              the legal operators except !
 *   Examples: logicalNeg(3) = 0, logicalNeg(0) = 1
 *   Legal ops: ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 4 
 */
int logicalNeg(int x) {
  return 2;
}
```

只允许`~ & ^ | + << >>`实现逻辑反操作





exp:

```c
int logicalNeg(int x) {
  	return ((x|(~x+1))>>31)+1;
}
```



# howManyBits

问题描述：

```
/* howManyBits - return the minimum number of bits required to represent x in
 *             two's complement
 *  Examples: howManyBits(12) = 5
 *            howManyBits(298) = 10
 *            howManyBits(-5) = 4
 *            howManyBits(0)  = 1
 *            howManyBits(-1) = 1
 *            howManyBits(0x80000000) = 32
 *  Legal ops: ! ~ & ^ | + << >>
 *  Max ops: 90
 *  Rating: 4
 */
int howManyBits(int x) {
  return 0;
}
```

只允许使用`! ~ & ^ | + << >>`

求出一个数用补码表示最少需要几位





exp:

```c
int howManyBits(int x) {
	int b0,b1,b2,b4,b8,b16;
    int sign = x>>31;
    x = (~sign&x)|(~x&sign);
    
    b16 = (x>>16)<<4;
    x = x>>b16;
    b8 = (x>>8)<<3;
    x = x>>b8;
    b4 = (x>>4)<<2;
    x = x>>b4;
    b2 = (x>>2)<<1;
    x = x>>b2;
    b1 = x>>1;
    x = x>>b1;
    b0 = x;
    a
  	return b0+b1+b2+b4+b8+b16+1;
}
```



# floatScale2

(开始 人都傻了)

先学基础 

https://blog.csdn.net/qq_28215385/article/details/78315945

问题描述：

```c
//float
/* 
 * floatScale2 - Return bit-level equivalent of expression 2*f for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representation of
 *   single-precision floating point values.
 *   When argument is NaN, return argument
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
unsigned floatScale2(unsigned uf) {
  return 2;
}
```

完成2*浮点数

存在四种情况，0 ，极小值，极大值 ，NAN 对应的浮点数指数部分分别为0，0，255，255

对于0，极小值，只要注意下符号位即可，也就是对数值*2，然后再加上符号位

对于指数为255的数，我们只需要返回本身即可（因为2*无穷大 = 无穷大 and 2 *NAN = NAN）

其他的数，只要将二进制位左移一位，如果左移之后指数部分达到了255，也就是无穷大，直接返回无穷大

否则直接返回



exp:

```c
unsigned floatScale2(unsigned uf) {
  int exp = (uf&0x7f800000)>>23; //01111111100000000000000000000000
  int sign = uf&(1<<31);
  if(exp==0) return uf<<1|sign;
  if(exp==255) return uf;
  exp++;
  if(exp==255) return 0x7f800000|sign;
  return (exp<<23)|(uf&0x807fffff); //10000000011111111111111111111111
}
```





# floatFloat2Int

问题描述:

```c
/* 
 * floatFloat2Int - Return bit-level equivalent of expression (int) f
 *   for floating point argument f.
 *   Argument is passed as unsigned int, but
 *   it is to be interpreted as the bit-level representation of a
 *   single-precision floating point value.
 *   Anything out of range (including NaN and infinity) should return
 *   0x80000000u.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
int floatFloat2Int(unsigned uf) {
  return 2;
}
```

将浮点型转为整型

先考虑临界情况，如果浮点数的指数部分大于31或者小于0，则直接返回0x80000000 或者 0，因为不在整型范围内

除此之外，判断指数部分是否大于23，

​	if >23: 说明小数部分全在小数点左边 需要左移

​	else: 反之 在右边 需要右移 然后补上符号位



exp:

```c
int floatFloat2Int(unsigned uf) {
  int TMIN = 1 << 31;
  int exp = ((uf >> 23) & 0xFF) - 127;
  // Out of range
  if (exp > 31)
    return TMIN;
  if (exp < 0)
    return 0;
  int frac = (uf & 0x007fffff) | 0x00800000;
  // Left shift or right shift
  int f = (exp > 23) ? (frac << (exp - 23)) : (frac >> (23 - exp));
  // Sign
  return (uf & TMIN) ? -f : f;
}
```





# floatPower2

问题描述：

```c
/* 
 * floatPower2 - Return bit-level equivalent of the expression 2.0^x
 *   (2.0 raised to the power x) for any 32-bit integer x.
 *
 *   The unsigned value that is returned should have the identical bit
 *   representation as the single-precision floating-point number 2.0^x.
 *   If the result is too small to be represented as a denorm, return
 *   0. If too large, return +INF.
 * 
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. Also if, while 
 *   Max ops: 30 
 *   Rating: 4
 */
unsigned floatPower2(int x) {
    return 2;
}
```

实现2.0的x次方 

x+127取得x指数阶码，判断指数阶码是否在范围内，在的话直接左移23位

否则返回相应的值 `0 or 0x7f800000`



exp:

```c
unsigned floatPower2(int x) {
  int exp = x + 127;
  // 0
  if (exp <= 0)
    return 0;
  // INF
  if (exp >= 0xFF)
    return 0x7f800000;
  return exp << 23;
}
```





# 总结：

前面几个lab还是比较简单的，但是到了半程以后，接触到了许多位移知识，还有很多小知识点，花费了较长的时间，包括浮点数，感觉到基础知识 还有 方法选择上还是相当狭隘，这点需要再练习，希望能有机会二刷吧...