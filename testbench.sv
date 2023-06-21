// Code your testbench here
// or browse Examples
module testbench;
  integer i;
  reg [1:0] New_R;
  reg [1:0] Done_R;
  reg [1:0] Reset_R;
  reg [7:0] Current_Client_R;
  reg [7:0] Total_Clients_R;
  
  wire [1:0] New_W;
  wire [1:0] Done_W;
  wire [1:0] Reset_W;
  wire [7:0] Current_Client_W;
  wire [7:0] Total_Clients_W;
  wire [1:0] Full_W;
  
  
  
  queue Q(New_W,Done_W,Reset_W,Current_Client_W,Total_Clients_W,Full_W);
  
  assign New_W=New_R;
  assign Done_W=Done_R;
  assign Reset_W=Reset_R;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,testbench);
    Reset_R<=1'b1;
      $display("New=%b Total_Clients=%b Current_Client=%b",New_W,Total_Clients_W,Current_Client_W);
    #0.5 Reset_R<=1'b0;
    for(i=0; i<102; i++)begin
      New_R=1'b1;
     $display("New=%b Total_Clients=%b Current_Client=%b",New_W,Total_Clients_W,Current_Client_W);
      #0.5Done_R=1'b0;
      #0.5Reset_R=1'b0;
      #0.5New_R=1'b0;
      #0.6$display("New=%b Total_Clients=%b Current_Client=%b",New_W,Total_Clients_W,Current_Client_W);
    end
	$display("Full Clients,Lets serve them");
    for(i=0; i<102; i++)begin
      Done_R=1'b1;
     $display("Done=%b Total_Clients=%b Current_Client=%b",Done_W,Total_Clients_W,Current_Client_W);
      #0.5Done_R=1'b0;
      #0.5Reset_R=1'b0;
      #0.5New_R=1'b0;
     #0.6$display("Done=%b Total_Clients=%b Current_Client=%b",Done_W,Total_Clients_W,Current_Client_W);
    end
	$display("All are served");
    Reset_R=1'b1;
    #0.5$display("New=%b Total_Clients=%b Current_Client=%b",New_W,Total_Clients_W,Current_Client_W);
    $finish;
  end

  
  
endmodule
