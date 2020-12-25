// ---------------------------------------------------------------------------
// Example NewPing library sketch that pings 2 sensors 20 times a second.
// ---------------------------------------------------------------------------

#include <NewPing.h>

#define SONAR_NUM 2      // Number of sensors.
#define MAX_DISTANCE 20 // Maximum distance (in cm) to ping.

int sensorPin = A0; // select the input pin for LDR
int sensorValue = 0; // variable to store the value coming from the sensor

NewPing sonar[SONAR_NUM] = {   // Sensor object array.
  NewPing(2, 3, MAX_DISTANCE), // Each sensor's trigger pin, echo pin, and max distance to ping. 
  NewPing(4, 5, MAX_DISTANCE), 
  
};

void setup() {
  Serial.begin(9600); // Open serial monitor at 115200 baud to see ping results.
}

void loop() { 
   sensorValue = analogRead(sensorPin); // read the value from the sensor
  for (uint8_t i = 0; i < SONAR_NUM; i++) { // Loop through each sensor and display results.
    delay(50); // Wait 50ms between pings (about 20 pings/sec). 29ms should be the shortest delay between pings.
    //Serial.print(i);
    Serial.print(sonar[i].ping_cm());
    Serial.print("-");
    }
    Serial.print(sensorValue);
  Serial.println();
}
