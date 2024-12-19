module mips(
	clk,
	rst,
	Interrupt,
	out1,
	out2
	);
	input 					clk,rst,Interrupt;
	output wire [31:0] 		out1,out2;

	wire 		[5:0] 		opcode,func;
	wire 		[1:0]		RegDst,Jmp;
	wire 					return,DataC,Regwrite,AluSrc,AluSrc1,Branch,NBranch,MemRead,MemWrite,MemtoReg;
	wire 		[3:0]		AluOperation;

	controller CU(.return(return),.clk(clk),.rst(rst),.opcode(opcode),.func(func),.RegDst(RegDst),.Jmp(Jmp),
	              .DataC(DataC),.Regwrite(Regwrite),.AluSrc(AluSrc),.AluSrc1(AluSrc1),.Branch(Branch),.NBranch(NBranch),.MemRead(MemRead),.MemWrite(MemWrite),
				  .MemtoReg(MemtoReg),.AluOperation(AluOperation));

	data_path DP(.Interrupt(Interrupt),.return(return),.clk(clk),.rst(rst),.RegDst(RegDst),.Jmp(Jmp),.DataC(DataC),.RegWrite(Regwrite),.AluSrc(AluSrc),.AluSrc1(AluSrc1)
				, .Branch(Branch),.NBranch(NBranch),.MemRead(MemRead),.MemWrite(MemWrite),.MemtoReg(MemtoReg),.AluOperation(AluOperation),
		         .func(func),.opcode(opcode),.out1(out1),.out2(out2));
endmodule