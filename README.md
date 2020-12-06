# Scriber
HackDuke 2020

## How to Run
The application code is in .\lib\main.dart.  

***How to get Google Firebase API Key***  
inside of ```android >> app```, add a ```google-services.json``` with the API keys to use Firebase.  
To generate this file, make a Firebase app through Firebase and activate the ImageTextRecognition API with the following steps:  
1. create a project through Firebase that has the ImageTextRecognition API activated.  
2. create app
3. get google-services.json

***Run in terminal with***  
```$ flutter doctor``` for information about installing additional components  
```$ flutter emulators``` to check your available emulators  
```$ flutter emulators --launch <emulator id>``` to chose one to use  
```$ flutter devices``` to identify the device you are using (not needed)  
```$ flutter run``` to run main.dart on your emulated device or physical device 

## How Our App Works
Doctors turn on Scriber when surveying patients for FHIR medical record data. Instead of having to multitask and record while listening to their patient, doctors can focus solely on the patient and let Scriber record the information and fill in the records. This saves time and manpower in the medical field. 

## Technologies Used
- Flutter
- Google OCR (Firebase)
- Firebase ML Vision library
- Speech-to-text library from [csdcorp](https://pub.dev/packages/speech_to_text) installed through [pub.dev](https://flutter.dev/docs/development/packages-and-plugins/using-packages)
- FHIR API

## Contributions
Akhil Talasila: Firebase, image, transitions, textio, viewRecords  
Ivy Wang: Login, mainpage  
Jeff:   
Luke Chen: Speech, speech JSON store, transitions  
Thao Moua: Speech, Trello  

## Sources
https://api.dart.dev/stable/2.10.4/index.html
https://flutter.dev/docs/cookbook/navigation/navigation-basics
https://pub.dev/packages/speech_to_text

## To-do
- Edit/delete records
- Convert to FHIR
- Enable login
- Extra languages
