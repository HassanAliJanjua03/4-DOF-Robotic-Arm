#include <Servo.h>  // Include the Servo library

// Define the Servo objects for each motor
Servo servo1;
Servo servo2;
Servo servo3;
Servo servo4;

// Define the pins for each servo motor
const int servoPin1 = 9;
const int servoPin2 = 10;
const int servoPin3 = 11;
const int servoPin4 = 12;

// Define preset angles for each servo motor
int angle1 = 90;  // Angle for servo 1
int angle2 = 45;  // Angle for servo 2
int angle3 = 135; // Angle for servo 3
int angle4 = 180; // Angle for servo 4

void setup() {
  // Attach each servo to a pin
  servo1.attach(servoPin1);
  servo2.attach(servoPin2);
  servo3.attach(servoPin3);
  servo4.attach(servoPin4);
  
  // Move servos to preset angles
  servo1.write(angle1);
  servo2.write(angle2);
  servo3.write(angle3);
  servo4.write(angle4);
  
  // Set up the serial communication for debugging
  Serial.begin(9600);
  Serial.println("Servos moved to preset angles.");
}

void loop() {
  // The loop can be left empty if the servos should remain at preset angles
  // If you want to move the servos to new angles, you can add the code here
}
