## Basic Semi Conductors
- nMOS, pMOS就是PNP, NPN(可以这么认为)，但是其实原理并不一样。pMOS高电压导通，nMOS低电压导通
- Buffer Gate: 两个非门相连接，是有源器件，可以增强输出的电压
- Transimission Gate: 不会增强信号。
## Boolean Algebra
- 与DM相同
- Dual Expression: 对偶表达式，将全部的+号换成×号，将×号换成＋号，保证前后的运算顺序与优先级不改变，把1换成0。
- self-dual->变换前与变换后的式子等价。
- Distributive Law: $X(Y+Z) = XY + XZ, X + YZ = (X+Y)(X+Z)$
## Logic Functions
- 2 Representations for Logic Functions: 
	- Truth Table -> unique representation but **multi-ways for implementation**
	- Waveform -> not so intuitive
- Complement Function -> use an **inverter first** and then Use ***De-Morgan Laws*** multiple times to derive the function
- Minterm: The **Product** of logic variables, and **there is only one kind of assignment that makes it True**. ==POM==
- Maxterm: The **SUM** of logic variables, only **one assignment** that makes it **false**. ==SOM==
- **In Most Cases**, we use POM, because the **triggering state of POM is 1**.
### Canonical Form: 
- $f(x, y, z) = m1 + m2 + m3$， in which m1, m2, m3 are the conditions that let $f == 1$ ,and **m1, m2, m3** are the **POMs of Logical Variables.** -> **Canonical POM Form**
- $f(x, y, z) = m1 * m2 * m3$, in which m1, m2, m3 are the conditions that let **f == 0** ,and m1, m2, m3 are ***THE SOMs of Logcial Variables***.