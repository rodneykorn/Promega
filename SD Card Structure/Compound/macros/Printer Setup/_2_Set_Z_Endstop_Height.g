;_____________Set Z Endstop Height_____________
M291 P"Do you want to set the Z endstop height?" S3
M291 P"Setting Z endstop height, this will home the printer, heat the bed and nozzle and then give you further instructions." S0

M140 S60 ; Start heating bed to 60c
G10 P0 S150 ;turn on extruder
G10 P1 S150 ;turn on extruder
G10 P2 S150 ;turn on extruder

G28 ; Home all
G28 Z ; Home z
G28 Z ; Home z again

M190 S60 ; wait for heat bed to get to 60c

G1 Z200 ; move the bed to 200mm from the nozzle

G29 S2 ; Disable bed mesh
G29 S2 ; Disable bed mesh

G1 X200 Y200 Z20 F1500 ; center extruder and raise bed.

M564 S0 ; Disable movement boundaries.

;Beep 3 times
M300 S600 P250
G4 P401
M300 S600 P250
G4 P401
M300 S600 P250
G4 P401

M291 P"Slowly move the bed up until nozzle is touching. Press OK when done." S2 Z1

;Beep 3 times
M300 S600 P250
G4 P401
M300 S300 P250
G4 P401
M300 S600 P250
G4 P401

M291 P"Record the Z axis value displayed in the Machine Status..." S2
M291 P"If the value is 0, then skip to running the _3_Mesh_Bed.g macro..." S2
M291 P"Otherwise set the G92 Z value in machine_zendstop.g." S2
M291 P"If the recorded Z value is - (negative), ADD it to the current Z value." S2
M291 P"If the recorded Z value is + (positive), SUBTRACT it from the current Z value." S2
M291 P"Edit machine_axisdimension.g and set max Z to the next whole number above the new Z end stop set in machine_zendstop.g." S2
M291 P"After both files are saved run the _2_Set_Z_Endstop_Height.g macro again until no correction is needed" S2