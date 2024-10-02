open Lwt.Infix
open Gpio 
let pwm_pin =18 
let intialize_pwm ()= 
let gpio = Gpio.open_pin pwm_pin in 
Gpio.set_mode gpio Output 
;
gpio
let set_pwm gpio duty_cycle= 
let period =1000
let high_time =(duty_cycle*period)/100 in 
let low_time = period - high_time  in 
let rec loop ()= 
Gpio.digital_wire gpio High
Lwt_unix.sleep (float_of_int high_time /.1000.0) >>= fun () -> 
Gpio.digital_wire gpio Low 
Lwt_unix.sleep(float_of_int low_time /.1000.0)>>= fun () -> 
loop ()

in
 Lwt_main.run (loop())
