# lec4-1
- Shannon's Law可以降低Fan in的信号数量，可以处理在硬件中对**输入数量不能太多的要求**。具体定理是剥离出了一个独立的信号。
- 真值表是唯一的，但是逻辑电路实现是不唯一的。
- Minterm: 最小项，逻辑值的乘积，Maxterm：最大项，逻辑值的加法。->**唯一的触发状态**
- Minterm更加重要。
- 表达一个真值表可以用POS(**针对输出为0的式子**)或者SOP(**针对输出为1的式子**)
- POS与SOP的Canonical Form是唯一的，但是简化后(Standard Forms)不唯一
- Maxterm $M_n$, Minterm $m_n$ 中的下标就是输入变量XYZ所对应的逻辑值的二进制。
- 简化的作用是降低错误率，降低功耗
### Karnaugh Maps(卡诺图)
- 任何变量 = 1的两列或者两行都必须相邻，例如数字组合排列只能是$00\rightarrow 01 \rightarrow 11 \rightarrow 10$ 
- 卡诺图中要尽量画更大的格子（更少的格子数量）来表示逻辑关系，如果格子太小了那么定位项就会更长。
- Implicant就是一个逻辑表达式，由literals组成。
- Prime Implicant: 不能被其他的implicant所完全覆盖，所以就是一个自蕴含项，不能通过移除变量进一步**简化成为另一个该逻辑函数的Implicant.** 
- Essential Prime Implicant：内部有**仅被蕴含一次的项**，所以这个Prime Implicant是必须要存在的(essential)
- **注意点**
	- 每一个 1 都必须**至少被蕴含一次**
	- 一个circle可以**跨越边界**，因为最左侧与最右侧实际上是连续的。（上下左右四个边界都是可以被跨越的）
	- 一些'don't care cases如果在不影响结果的时候可以被划进来以**达到简化计算的目的。**
	- 一般都采用SOP方法。
- Pushing Bubbles: 在一个或门或者与门中，可以将泡泡（取反）从左边推到右边或者从右边推到左边，同时需要改变门的类型，比如与门改成或门，或门改成与门。
### Cost
- Literal Cost就是有几条条输入（几个Literal Value回实际被用到）比如说AB + AC就有4个输入。
- Gate Cost 就是 Literal Cost + Gate Number，但是Gate Number并不会计入最后一次的门个数？
- GN就是Gate Cost + 非门（反相器）的个数
# lec4-2
- Minterm Encoding & Maxterm Encoding->分别挑选为1的触发项与为0的触发项
- Canonical Form唯一的，就是SOP或者POS，化简之后就可变为Standard Form
- Gate Input Cost一般都不会计算最后一步的常数项（最后输出前的最后一个门）
- SOP与POS是symmetric的，需要衡量哪一种方案的cost更优
- 如果出现同一个inverter信号，那么并不会改变最后的GN计数
# Combinational Logic Design
## Intro to Verilog HDL
- CPU：适应能力最强
- GPU：并发计算更强
- FPGA：逻辑门可编辑
- ASIC：为特定目标设计（Application-Specific）
## Logic Design Flow
- dut: Device Under Test
- Synthesis:将电路模块拼接，先进行Parsing(分解)，再进行多级Synthesizing，然后再进行工艺上的映射
- Physical Design: 在物理空间上排布门，随后进行连接，再进行Static Timing Analysis ASIC->Layout File之后就可生产, FPGA->bitstream file就可以改变FPGA的电路连接
- ASIC: Tape Out流片就是完成了生产 FPGA: Download Bitstream File就可以开始使用
### Lexical Conventions of Verilog
#### Number Specifications
- all the keywords are lowercase
- 开机可能处于Unknown的状态,这一个状态需要被定义
- High-Impedance:高阻抗 -> 需要描述好这种存在的情况
- Sized Numbers:
	- `<size>'<base><number>`标准表达方式(size 为 bit单位)
	- 比如4'b0001，比如12'habc
	- Unknown Value: x , High-impedence value: z
- Size of x, z
	- hex的时候占4bit
	- octal占3bit
	- binary占1bit
- Extending MSB:
	- 当size比给定的值更大的时候
	- 如果MSB是x，那么前面用x来填满
	- 如果MSB是z，那么前面用z填满
	- 其他情况下，用0来填满
- Negative Numbers
	- 符号要放在`<size>`前面
	- 使用Complement Code来存储
- Strings
	- 采用双引号包裹
- 转义标识符
	- \开头
#### Basic Syntax
- 