# Syntax
## Parameters
- bubblemask就是形参，parameter，在部件被实例化的时候传入
- localparam可以被认为是const变量，在实例化模块的整个生命周期中都是保持不变的
- `'define`就是#define, 直接字符串替换，所以也会出现与C语言中一样的优先级问题
- local parameter不能直接复写，但是可以用另一个parameter来定义这个local parameter
## Function
- 包含多个输入与一个输出
```verilog
function [automatic] [return_type] name ([port_list]);
	[statements]
endfunction
```
- 不能有时序成分(井号等待等等)
- 变量都是局部变量
## For
- for与C的循环方式基本上是相同的
- `generate for`具体是什么功能？？
## $random(i)
- random中可以设置种子
# Adder
### 行波加法器
- 就是从低位开始，把这一位的进位信号一级一级往前传，每一位的运算都需要完成上一位的运算。
- 运算会产生严重的门延时，运算速度很慢，GateDelay会与位数之间变成线性关系
## 超前进位加法器
- 当前位产生进位产生G信号(Generate)，直接向后看，将这个信号往后传递，如果G信号为0那么**还是要行波来计算？**
# Verilog Programming
## Generate Sentence
- 可以用于重复性的操作
- 需要先声明一个genvar类型的变量，这个变量仅仅**用于代码的生成**，而不会生成有效的电路，所以不会提高生成硬件的复杂度。
- genvar的递增仅支持`i = i + 1`，而不支持`i += 1 or i ++`
- 使用`generate与endgenerate`来包裹一整个generate语句块
```verilog
genvar i;
generate
	for (i = 0; i < 4; i = i + 1)begin
		assign b[i] = a[i];
	end
endgenerate
```
## integer 变量
- `initial`的作用是为**仿真测试平台**提供初始化与控制逻辑，可以用于初始化信号并生成激励信号。
- 仅会在仿真开始的时候执行一次，之后就不会重复执行，这与`always begin`语句之间存在区别。
- reg变量可以再initial块中进行赋值，用于描述寄存器或者触发器
- integer变量并不是genvar类型的变量
```verilog
integer i;
initial begin
	...
	for(i = 0; i < 8; i = i+1)begin
		data = i[3:0]
	end
	...
end
```
## 参数化编程
### 宏变量参数
- 可以宏定义一个参数
- `'define LEN 4`的意思就是对LEN进行宏定义，在后面调用宏定义的时候要`'LEN` 
### localparam 本地参数
- 类似于const变量，localparam只能提供参数的立即数，所以不会成为电路中的一部分
- 宏变量可以定义在module的内部也可以定义在module的外部，但是localparam只能定义在Module的内部
- `localparam LEN = 4`的意思就是在这一个module当中，LEN被定义为4
### param定义
- 可以在定义一个module的时候定义一个parameter VAR = DEFAULT_VAL
- 如果对该module进行实例化的时候可以选择传入这一参数或者不传入这一参数。
- 但是注意param的输入可以是**parameter, localparam**，但是不能是电路的输出。
- localparam与parameter的类型并不用事先确定，通过传入参数的参数类型进行动态确定即可
# Implementation
## 加法器
- 有两个信号，一个是P信号，一个是G信号，P信号的意思就是当前位得到的尾数结果，G信号就是当前位得到的进位结果（不考虑前一位的carry）
- ripple-carry adder就是行波进位加法器，就是依次使用前面一位的输出作为这一位的输入
- carry-lookahead加法器就是超前进位加法器。
- G信号的意思就是**生成信号**，表示模块内部是否会产生进位，传播信号P就是模块是否会将进位传递到下一个模块。
- **顶层的CLA模块并不需要处理加法的结果，而只用对P信号与G信号进行处理，负责进行超前进位**，而运算的结果由底层CLA模块进行直接输出。
### 信号的意义
- P信号的意思就是传播(Propagate)，也就是异或得到的结果。如果这一位**具有传播性**，也就是如果上一位的**Carry信号为1则这一个模块会把进位信号传递下去**。如果这一位不具有传播性，则不能够把这里的进位信号传递下去。
- G信号的意思就是生成(Generate)，也就是直接生成一个1信号。意思就是这一位的两个运算数已经足以产生1了。
## 仿真测试
- initial块中的$finish
### Adder电路实现
- Adder-Suber的意思就是加法减法器
### 随机测试
- 可以在initial块中使用`$random()`来提供32位的随机数，默认生成32位的随机数，如果对位宽有要求则可以对`$random()`进行索引拼接
### 差分测试difftest
- 对拍器电路(Phase Comparator Circuit)是一种用来比较两个信号相位关系的电路，检测两个信号之间的相位差
- 使用judge.v来检测正确性，使用Verilog算子进行实现
- 对拍器电路的效率并不重要，只用来考虑逻辑的正确性即可
### functions in verilog
- `{}`在verilog中的意思是拼接，假如a与b都是8bit的信号，那么`{a, b}`就会生成一个16bit的信号，在前面的a会被拼接在更高位
- function的声明参数表中只需要定义input即可
### testbench.v
- verilog中的模块是并行运行的，而不是顺序执行的
- always块并不是始终在运行，并不会卡住，只会在硬件行为上
- 返回的变量就是与函数同名的变量。
- function中不存在wire变量。
- 函数中额外的变量需要使用`reg`来进行声明
- functions中是按照C函数进行运算的，所以不能包含电路所特有的语法
- function传入的参数也可以是wire的输出
- function中并没有实际上的电路实验开销
- posedge描述信号的上升沿
- $dispaly只能用于always块与initial块当中
### block
- always块一般都是用来描述实际上的电路的，用来描述硬件逻辑等等，并行运行。
- initial块一般是用在testbench上的，用于初始化信号或者激励等等