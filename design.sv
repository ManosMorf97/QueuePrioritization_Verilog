// Code your design here
module queue(
  input [1:0] New,
  input [1:0] Done,
  input [1:0] Reset,
  output [7:0] Current_Client,
  output [7:0] Total_Clients,
  output [1:0] Full);
  
  reg [7:0] Total_Clients_R;
  reg [7:0] Current_Client_R;
  assign Full=Total_Clients_R==7'b1100100;
  assign Current_Client=Current_Client_R;
  assign Total_Clients=Total_Clients_R;
  
  always@(posedge New) begin
    if(Total_Clients_R<7'b1100100)
      Total_Clients_R<=Total_Clients_R+7'b0000001;
  end
  
  always@(posedge Done)begin
    if(Current_Client_R<Total_Clients_R)
      Current_Client_R<=Current_Client_R+7'b0000001;
  end
  
  always@(posedge Reset)begin
    Current_Client_R<=7'b0000000;
    Total_Clients_R<=7'b0000000;
  end
  
  
endmodule

  
  