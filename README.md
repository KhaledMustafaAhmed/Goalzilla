# GoalZilla - iOS Sports Tracking App

[![Platform](https://img.shields.io/badge/platform-iOS-blue.svg)](https://developer.apple.com/ios/)
[![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)](https://swift.org)

GoalZilla is a comprehensive sports tracking application for iOS that provides extensive coverage of sports, leagues, teams, and events through an intuitive tab-based interface. Stay updated with your favorite sports with features like offline access, multilingual support, and dark mode compatibility.

## 📱 Features

- **Comprehensive Sports Coverage**: Access information on various sports, leagues, teams, and events
- **Intuitive Tab-Based Navigation**: Easy-to-use interface for seamless sports browsing
- **Offline Access**: View previously loaded content without an internet connection
- **Multilingual Support**: Enjoy the app in multiple languages
- **Dark Mode**: Enhanced viewing experience in low-light environments
- **Real-Time Updates**: Powered by SportsDB API integration
  
## 📱 Demo
![Goalzilla_part_1](https://github.com/user-attachments/assets/420333be-c440-48f7-a1dd-80ea0c327fa6)


## 🛠️ Technologies Used

- Swift
- UIKit
- Alamofire for networking
- CoreData for local storage
- UserDefaults for app preferences
- SOLID design principles
- MVP architectural pattern
- XCTest for unit testing
- AutoLayout for responsive UI
- XIB Files for view components
- Reachability for network status monitoring

## ⚙️ Requirements

- iOS 14.0+
- Xcode 16.2+
- CocoaPods

## 📲 Installation

1. Clone the repository:
```bash
git clone https://github.com/abdelrahmanelshreif/Goalzilla.git
```
2. Navigate to the project directory:
```bash
cd Goalzilla
```
3.Install dependencies using CocoaPods:
```bash
pod install
```
4.Open the workspace file:
```bash
open Goalzilla.xcworkspace
```


## 🏗️ Architecture
GoalZilla follows the MVP (Model-View-Presenter) architectural pattern:

Model: Manages data, logic, and rules of the application
View: Displays information to users and handles user interaction
Presenter: Acts as a bridge between the Model and View
The app also implements SOLID principles to ensure maintainable, scalable code.

## 🔄 API Integration
GoalZilla integrates with the SportsDB API to provide real-time sports data. The app efficiently caches this data using CoreData to enable offline access.

## 🤝 Contributing
Contributions are welcome! If you'd like to contribute.
