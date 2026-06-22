# Conveyor Belt Monitoring and Counting System

## Overview

This project is an industrial conveyor belt simulation developed in **CODESYS** using **Structured Text (IEC 61131-3)** and **HMI Visualization**. The system demonstrates core PLC programming concepts, including motor control, emergency stop functionality, product detection, product counting, alarm management, and real-time monitoring through an HMI interface.

## Features

* Start and Stop conveyor control
* Emergency Stop (E-Stop) functionality
* Alarm handling and system reset
* Conveyor belt animation
* Product detection sensor simulation
* Sensor indicator lamp
* Product counting using R_TRIG (Rising Edge Trigger)
* Product counter reset function
* Real-time product count display
* Progress bar monitoring
* HMI visualization interface

## System Components

### Control Buttons

* Start Button
* Stop Button
* Emergency Stop
* Reset Button
* Counter Reset

### Indicators

* Green Lamp – Conveyor Running
* Red Lamp – Conveyor Stopped
* Alarm Lamp – Alarm Active
* Sensor Lamp – Product Detected

### Sensors

* Product Detection Sensor (BoxSensor)

### Counters

* Product Counter (BoxCount)

## Control Logic

### Emergency Stop Logic

When the Emergency Stop button is activated, the system enters Alarm Mode. The conveyor motor stops immediately, the alarm lamp turns on, and the system remains in a safe state until reset.

### Reset Logic

The Reset button clears the alarm condition and returns the system to normal operation.

### Conveyor Operation

* Start Button starts the conveyor motor.
* Stop Button stops the conveyor motor.

### Product Detection

A simulated photoelectric sensor detects products passing through the conveyor system. When a product is detected, the sensor indicator lamp is activated.

### Product Counting

The project uses an R_TRIG function block to ensure that each product is counted only once as it passes the sensor.

### Counter Reset

The Counter Reset function clears the product count and prepares the system for a new production cycle.

### Conveyor Animation

The BeltMove variable is used to create a conveyor movement animation within the HMI.

## Technologies Used

* CODESYS V3
* Structured Text (ST)
* IEC 61131-3
* PLC Programming
* HMI Visualization

## Project Objectives

This project was developed to improve practical skills in:

* PLC programming
* Industrial automation
* Sensor integration
* Alarm management
* HMI design
* Event-driven programming
* Conveyor system control and monitoring

## Future Improvements

* Automatic conveyor stop after reaching target quantity
* Multiple sensors
* Product sorting system
* Speed control
* SCADA integration
* Data logging and reporting

## Author

**Hashem Hashemnia**

Engineering Management Graduate | Automation Engineering Enthusiast

United Kingdom
