/*
This module is the major module
*/
module timer
    #( parameter CLOCK_FREQ = 32'd50_000_000 
    ) 
    (input clk, input rst_n, input sensor, output [5:0] o_seconds, 
		output reg led0, output [5:0] o_minutes, output [4:0] o_hours);
	
	localparam ONE_SECOND = CLOCK_FREQ - 1; 
	
	// Internal logic 
   reg [5:0] seconds_cnt;      // 0-59 seconds
	reg [5:0] minutes_cnt;      // 0-59 minutes
	reg [4:0] hours_cnt;        // 0-23 hours 
	reg [31:0] counter_1sec;    
   reg paused = 0;            
   reg sensor_last = 0;        
    
	always @(posedge clk or negedge rst_n) begin
		 if (!rst_n) begin
			  paused <= 0;
			  sensor_last <= 0;
			  led0 <= 0;
		 end else if (sensor != sensor_last) begin
			  paused <= ~paused; 
			  sensor_last <= sensor;
			  led0 <= ~paused; 
		 end
	end

	
	
	 always @(posedge clk)
	 begin
		  if(!rst_n) begin
				counter_1sec <= 0;
				seconds_cnt  <= 0;
				minutes_cnt  <= 0;
				hours_cnt    <= 0;
		  end else if (!paused && counter_1sec < ONE_SECOND) begin
				counter_1sec <= counter_1sec + 1'b1;
		  end else if (!paused && counter_1sec == ONE_SECOND) begin
				counter_1sec <= 0;
				if (seconds_cnt == 6'd59) begin
					 seconds_cnt <= 0;
					 if (minutes_cnt == 6'd59) begin
						  minutes_cnt <= 0;
						  if (hours_cnt == 5'd23) begin
								hours_cnt <= 0;
						  end else begin
								hours_cnt <= hours_cnt + 1'b1;
						  end
					 end else begin
						  minutes_cnt <= minutes_cnt + 1'b1;
					 end
				end else begin
					 seconds_cnt <= seconds_cnt + 1'b1;
				end
		  end
	 end

	 assign o_seconds = seconds_cnt;
	 assign o_minutes = minutes_cnt;
	 assign o_hours   = hours_cnt;
		 
endmodule