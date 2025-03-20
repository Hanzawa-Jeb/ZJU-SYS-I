### More Bit-wise Operations:
- ~: 取反
- ^: 异或
- >>: 如果是unsigned那么是logical rightshift, 如果是int那么是arithmetic rightshift
### Complement Codes
- 原码中的第一位如果是0的话就是正数，如果是1的话就是负数
- **补码到原码 与 原码到补码的操作都是：如果是正数，那么不用任何改变，如果是负数，那么就将除了符号位的部分全部取反后加一**
- 最大补码值与最小补码值的绝对值会差一，最小补码值的绝对值会更大。
- unsigned的数后面会有一个U后缀，在进行比较的时候，如果其中有一个signed value,那么另一个将会自动cast到unsigned value
- 补码运算的溢出位可以直接丢弃，不必保留也可以保证计算的正确性。
- `(int)`会将unsigned转化为signed, `(unsigned)`会将int转化为unsigned.
- Inverse Code(反码)就是**如果是正数，那么保持不变，如果是负数，那么对value part按位取反。**
- unsigned与signed如果**bit-wise representation**是一样的时候，那么如果是负数，值会差$2^n$。
- 在unsigned与signed的转化过程中，**Bit-Pattern是没有区别的，但是被reinterpreted**了。->解码的方式不同
- ==两个补码相加的结果默认就是补码==。
- ==补码加法可以直接==drop off MSB(进位)
- 补码**取反再加一可以得到自己的相反数**
- 注意原码和补码**表达正数的时候是完全一样的！！** 
- ==最小的整数是不能取相反数的，如果取了那就是它本身==
### Representation of Floating Numbers
- 在小数的表达过程中，权重值从4, 2, 1到0.5， 0.25， 0.125等等。
- 由三个部分构成， s, exponent, frac。
- S是0的时候为正数，1的时候为负数。
- frac（significand or mantissa）一般是一个在1.0-2.0之间的浮点数，叫做有效数
- Single Precision的小数一共有32bits, 而Double Precision的小数一共有64bits
- $-2^{n-1}=100000 ...$是直接定义得来的，比如说在四位表达法中就是1000就是-8，在八位表达法中10000000就是-128
#### Exponent与Frac详解
- 如果Exponent位**不是全零也不是全一，则说明这是一个Normalized Value**.
- 真正使用的Exponent值E应该等于Exp - Bias. Exp按照Unsigned Values 解码，默认减去$Bias Value=2^{k-1}-1$（k是exponent的位数）
- Significand Code->$1.SignificandBits...$ 
- Significand Bits全为0的时候Significand就是1.0, 全为1的时候就是$2.0 - \epsilon$ 
- exp = 000的时候，如果**frac = 0，那么代表0**，如果**frac!=0，那么代表是接近零的数**。**此时E = -bias + 1**，而不能是-bias.(保证平滑性)
- exp = 111...的时候，如果frac = 0，则说明是无限大，如果frac不等于0，则说明是该数不存在。
- ==所以最小的可能exp值就是-bias + 1==，不可能比这个还要小。
### Floating Point in C
- 如果是从double/float到int，那么就直接截断小数部分
- int->double 就是准确的转换
- int->float可能会出现round现象，因为float不能表达全部的int,但是**Double可以准确表达全部int**.
- 如果一个数字是NaN,那么NaN == NaN是不成立的。
- NaN >= 0这个结论是不正确的。所以**NaN * NaN  > 0也不一定是正确的。** 
- **(d + f) - d == f** 也是不一定正确的。可能f会非常小但是d非常大
### Right Shift & Left Shift
- 如果是Logically Rightshift，逻辑右移则说明不用考虑符号位，左边补零即可
- 如果是Arithmetically Rightshift, 则说明是算数右移，补的数字就是符号位的数字。
- 但是如果是左移就没有区别，都是在最右边填充0.
### Unsigned and Signed Integers in C
- C语言中当有符号整数与无符号整数混合运算的时候会统一转化为无符号的量。
- 但是将一个unsigned类型的变量赋值给int变量是没有问题的。
- `sizeof()`返回的是`size_t`类型的变量，是一个`unsigned`变量，而且是以字节数为单位而不是Bit数为单位的。
- 