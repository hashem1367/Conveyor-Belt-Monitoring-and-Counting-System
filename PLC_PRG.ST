PROGRAM PLC_PRG
VAR
    StartButton : BOOL := FALSE;
    StopButton : BOOL := FALSE;
    EmergencyStop : BOOL := FALSE;
    ResetButton : BOOL := FALSE;

    ConveyorMotor : BOOL := FALSE;
	BoxSensor : BOOL := FALSE;
	BeltMove : INT := 0;
    GreenLamp : BOOL := FALSE;
    RedLamp : BOOL := TRUE;
	AlarmActive : BOOL := FALSE;
    AlarmLamp : BOOL := FALSE;
	
	BoxCount : INT := 0;
	SensorTrigger : R_TRIG;
	SensorLamp : BOOL := FALSE;
	CounterReset : BOOL := FALSE;
	
END_VAR



(* Emergency Stop *)

IF EmergencyStop THEN
    AlarmActive := TRUE;
END_IF;


(* Reset *)

IF ResetButton THEN
    AlarmActive := FALSE;
    AlarmLamp := FALSE;
END_IF;


(* Alarm Mode *)

IF AlarmActive THEN

    ConveyorMotor := FALSE;

    GreenLamp := FALSE;
    RedLamp := TRUE;
    AlarmLamp := TRUE;

ELSE

    AlarmLamp := FALSE;

(* Start Conveyor *)
IF StartButton THEN
    ConveyorMotor := TRUE;
    StartButton := FALSE;
END_IF;

(* Stop Conveyor *)
IF StopButton THEN
    ConveyorMotor := FALSE;
    StopButton := FALSE;
END_IF;
   
IF BoxSensor AND ConveyorMotor THEN
    SensorLamp := TRUE;
ELSE
    SensorLamp := FALSE;
END_IF;

(* Product Counter *)
SensorTrigger(CLK := BoxSensor);

IF SensorTrigger.Q THEN
    BoxCount := BoxCount + 1;
END_IF;

(* Counter Reset *)
IF CounterReset THEN
    BoxCount := 0;
    BoxSensor := FALSE;
END_IF;

////////////////////////////


    (* Lamp Status *)

    IF ConveyorMotor THEN
        GreenLamp := TRUE;
        RedLamp := FALSE;

    ELSE

        GreenLamp := FALSE;
        RedLamp := TRUE;

    END_IF;

END_IF;

IF ConveyorMotor THEN

    BeltMove := BeltMove + 1;

    IF BeltMove > 120 THEN
        BeltMove := 0;
    END_IF;
END_IF;