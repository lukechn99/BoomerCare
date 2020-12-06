# Scriber
HackDuke 2020

## How to Run
Run ```flutter doctor``` for information about installing additional components.  
In order to run your application, type:
```
  $ cd .
  $ flutter run
```
Your application code is in .\lib\main.dart.  

Run in terminal with
```$ flutter emulators``` to check your available emulators  
```$ flutter emulators --launch <emulator id>``` to chose one to use  
```$ flutter devices``` to identify the device you are using (not needed)  
```$ flutter run``` to run main.dart on your emulated device

## How Our App Works
Doctors turn on Scriber when surveying patients for FHIR medical record data. Instead of having to multitask and record while listening to their patient, doctors can focus solely on the patient and let Scriber record the information and fill in the records. This saves time and manpower in the medical field. 

## Technology Used
- Flutter
- Google OCR
- Speech-to-text library from [csdcorp](https://pub.dev/packages/speech_to_text) installed through [pub.dev](https://flutter.dev/docs/development/packages-and-plugins/using-packages)
- FHIR API

## Contributions
Akhil: Firebase  
Ivy: Login  
Jeff:  
Luke: Speech  
Thao: Speech  