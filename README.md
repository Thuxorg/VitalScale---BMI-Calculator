# VitalScale---BMI-Calculator

A full Functional modern, beautifully designed BMI (Body Mass Index) calculator built with Flutter. Track your body metrics with clinical precision and get personalized health insights.

# **📸 Screenshots**
<div align="center"> <table> <tr> <td align="center"><b>Welcome Screen</b></td> <td align="center"><b>Calculator</b></td> <td align="center"><b>Result Screen</b></td> </tr> <tr> <td><img src="https://github.com/Thuxorg/VitalScale---BMI-Calculator/blob/main/screenshots/welcome.PNG" width="200" alt="Welcome Screen"/></td> <td><img src="https://github.com/Thuxorg/VitalScale---BMI-Calculator/blob/main/screenshots/calculator.PNG" width="200" alt="Calculator"/></td> <td><img src="https://github.com/Thuxorg/VitalScale---BMI-Calculator/blob/main/screenshots/result.PNG" width="200" alt="Result"/></td> </tr> </table> </div>

# ✨ Features

# 🎯 Core Features

**BMI Calculation** - Accurate BMI calculation using standard formula

**Multiple Inputs** - Height, Weight, Age, and Gender selection

**Unit Toggle** - Switch between Metric (cm/kg) and Imperial (in/lb)

**Live Preview** - See estimated BMI as you adjust values

**BMI Categories** - Automatically classify BMI into:

Underweight (< 18.5)

Normal (18.5 - 24.9)

Overweight (25.0 - 29.9)

Obese (≥ 30.0)


 # 📊 Result Screen
 
**Visual Display** - Circular progress indicator showing BMI

**Health Status** - Personalized health status based on BMI

**Recommendations** - Tailored health advice for your BMI category

**Share Result** - Share your BMI results with friends and family


# 🎨 UI/UX
Modern Design - Clean, minimal, and professional interface

Material Design 3 - Follows latest Material Design guidelines

Responsive - Works on all screen sizes

Smooth Animations - Fluid transitions and interactions



# 🚀 Quick Start


**Option 1:** Run on FlutLab.io (Recommended)

FlutLab.io is a free online Flutter IDE that requires no setup.

# **Step-by-Step Setup:**

1. **Visit FlutLab.io**

https://flutlab.io

2. **Create a New Project**

Click "Create New Project"

3. **Select "Flutter Application"**

Choose "Stateless App"

4. **Name your project: vital_scale**

5. **Click "Create"**


# **Replace the Code**

Open lib/main.dart in the editor

Delete all existing code

Copy the entire code from main.dart

Paste it into lib/main.dart

Update pubspec.yaml

Open pubspec.yaml

**Replace with the minimal configuration: below **

" name: vital_scale
description: A simple BMI calculator application.
version: 1.0.0+1

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.1

flutter:
  uses-material-design: true "

 # ** Run the App**

Click the **"Run"** button (▶️) in the toolbar

**Wait** for the build to complete

The app will open in the built-in emulator


**Option 2: Run Locally**

Prerequisites
Flutter SDK (Latest Stable)

Android Studio / VS Code

Android Emulator / iOS Simulator

Installation
Clone the Repository

bash
git clone https://github.com/thuxorg/vital_scale.git

cd vital_scale

Install Dependencies

bash
flutter pub get
Run the App

bash
flutter run
Build APK

bash
flutter build apk --release

#📁 Project Structure

vital_scale/
├── lib/
│   └── main.dart          # Complete application code
├── assets/                # App assets (optional)
│   └── logo/
├── screenshots/           # App screenshots
├── pubspec.yaml           # Project dependencies
└── README.md              # This file

#🎯 How to Use

**Welcome Screen**
Click "Get Started" to begin

**Calculator Screen**
Select Gender - Tap Male or Female

Adjust Height - Drag the slider

Set Weight - Use +/- buttons

Set Age - Use +/- buttons

Choose Units - Tap Metric or Imperial

Preview BMI - See live estimate

Calculate - Tap "Calculate BMI"

**Result Screen**
View your BMI score and category

Read health status and advice

Get personalized recommendations

**Recalculate** - Go back to calculator

**Share** - Share results (coming soon)

# 🏷️ BMI Categories

Category	BMI Range	Color

Severe Underweight	< 16.0	Blue

Underweight	16.0 - 18.4	Blue

Normal	18.5 - 24.9	Green

Overweight	25.0 - 29.9	Orange

Obese Class I	30.0 - 34.9	Red

Obese Class II	35.0 - 39.9	Red

Obese Class III	> 40.0	Dark Red

# 🛠️ Tech Stack

Framework: Flutter 3.0+

Language: Dart 3.0+

UI: Material Design 3

State Management: StatefulWidget with setState

Platforms: Android, iOS, Web

# 🎨 Color Scheme

**Color	Hex	Usage**

Primary	#006B5C	Main theme color

Underweight	#42A5F5	BMI < 18.5

Normal	#66BB6A	BMI 18.5 - 24.9

Overweight	#FFA726	BMI 25.0 - 29.9

Obese	#EF5350	BMI 30.0 - 34.9

Obese Severe	#C62828	BMI > 40.0

# 🤝 Contributing

Contributions are welcome! Here's how you can help:

Fork the repository

Create a feature branch: git checkout -b feature/amazing-feature

Commit your changes: git commit -m 'Add amazing feature'

Push to the branch: git push origin feature/amazing-feature

Open a Pull Request


# ** License**
This project is licensed under the MIT License - see the LICENSE file for details.

**👨‍💻 Author**
Athumani Mlenga

GitHub: @Thuxorg

Twitter: @athumanimlenga

# **🙏 Acknowledgments**

Flutter Team for the amazing framework

Material Design for the design system

All contributors and testers

# **📞 Support**
For support, email athumanimlenga@gmail.com or open an issue on GitHub.


# **📊 Project Status**

✅ Welcome Screen

✅ BMI Calculator

✅ Result Screen

✅ Gender Selection

✅ Height Slider

✅ Weight Controls

✅ Age Controls

✅ Unit Toggle

✅ Live BMI Preview

✅ BMI Categories

✅ Health Recommendations

✅ Share Results (Coming Soon)

⬜ Dark Mode (Coming Soon)

⬜ History Tracking (Coming Soon)

⬜ Profile Management (Coming Soon)


# Made with ❤️ using Flutter

# 🚀 Quick Links
FlutLab.io - Online Flutter IDE

Flutter Documentation

Dart Language Tour

# 📦 Download APK
You can download the latest APK from the Releases page.


# 🔧 Troubleshooting

**Common Issues:**

Build fails on FlutLab.io

Check that pubspec.yaml is correct

Run flutter clean and flutter pub get

Make sure uses-material-design: true is set

App doesn't respond to interactions

Make sure you're using setState correctly

Check that state variables are properly updated

Overflow errors

The app is designed for mobile screens

Use the emulator or resize your browser window


# 🌐 Live Demo
Try the app live on FlutLab.io:
https://flutlab.io/sandbox/e5416d36-a5d7-4ac7-8bce-bd796fb6666d

Live Demo

Happy Coding! 🎉

This README was generated with ❤️ for the VitalScale project  by Athumani Mlenga.

