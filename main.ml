open Pwm 
let ()= 
lep gpio = initialize_pwm in 
Printf.printf "led Pwm controller \n";
Printf.printf "enter duty cycle (0-100)";
let rec loop ()= 

let input = read_line in 
let duty_cycle = int_of_string input in 
if duty_cycle >=0 && duty_cycle <=100 then begin 
Printf.printf " setting duty cycle %d%%\n "  duty_cycle ;
set_pwm gpio duty_cycle;
end else 
Printf.printf " invalid input between 0 and 100" 
loop ()
in 
loop ()
