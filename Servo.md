```
# -*- coding: utf-8 -*-

import serial
import time
import speech_recognition as sr

import sys
reload(sys)
sys.setdefaultencoding('utf8')

arduino = serial.Serial('/dev/tty.wchusbserial1410', 9600)
time.sleep(2)
arduino.write("0")

r = sr.Recognizer()

with sr.Microphone() as source:
	while True:
		audio = r.listen(source)
		try:
			USER_VOICE = r.recognize_google(audio, language="ru")
			print "Debug USER_VOICE= %s" % USER_VOICE

			if "кошка" in USER_VOICE:
				arduino.write("15")

			if "собака" in USER_VOICE:
				arduino.write("150")

			if "корова" in USER_VOICE:
				arduino.write("90")

		except sr.UnknownValueError:
			print "please repeat..."
```

Result:

[![Watch the video](http://www.thepaper.gr/wp-content/uploads/2013/11/new-youtube.jpg)](https://www.youtube.com/watch?v=-1hSse9iyks)
