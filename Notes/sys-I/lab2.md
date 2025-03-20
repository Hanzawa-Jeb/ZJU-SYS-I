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
- 