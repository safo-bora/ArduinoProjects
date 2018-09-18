# ArduinoProjects (LCD) + Bonus (Song)
My customised scripts for projects with Arduino

Source: http://cyberasylum.janithw.com/arduino-and-python-serial-connection-with-lcd/

Note:
You can use this uno script if you want to maintain LCD from python.


```
#include <LiquidCrystal.h>

LiquidCrystal lcd(8, 9, 4, 5, 6, 7);

void setup() {
  Serial.begin(9600);
  lcd.begin(16, 2);
  lcd.print("Start!");
             }

void loop() {
    if (Serial.available()) { 
        delay(100); 
        lcd.clear();

        while  (Serial.available() > 0) {
        
          int incomingByte = Serial.read();
          lcd.write(incomingByte);
        }
    }
}
```

Example of using with Python:
```
# -*- coding: utf-8 -*-

import speech_recognition as sr
import os
import serial
import time
import pyttsx3

r = sr.Recognizer()
s = serial.Serial("/dev/tty.wchusbserial1410", 9600)

time.sleep(2)

speak_man = pyttsx3.init(debug=True)
speak_man.setProperty('rate', 180)
voices = speak_man.getProperty('voices')

with sr.Microphone() as source:
    TEXT = "Hi! My name is Bob!"
    print(TEXT)
    s.write(str.encode(TEXT))
    speak_man.say(TEXT.decode())
    speak_man.runAndWait()

    for i in range(5):
        audio = r.listen(source, phrase_time_limit=2)
        try:

            USER_VOICE = r.recognize_google(audio, language="en")
            print "Debug USER_VOICE= %s" % USER_VOICE

            if "how are you" in USER_VOICE:
                s.flushOutput()
                ANSWER = "Good! I am good!"
                s.write(ANSWER)
                speak_man.say(ANSWER.decode())
                speak_man.runAndWait()

            elif "music" in USER_VOICE:
                s.flushOutput()
                s.write("Song!!!")
                os.system('afplay {}'.format("arduino/test/RagnBoneMan–human.mp3"))

        except sr.UnknownValueError:
            print "please repeat..."
            
```

Result:

[![Watch the video](http://www.thepaper.gr/wp-content/uploads/2013/11/new-youtube.jpg)](https://www.youtube.com/watch?v=lRlz21P4zXc)
