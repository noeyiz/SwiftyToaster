# SwiftyToaster
A simple and effective toast message library for Swift!

<br>

## 📸 Screenshots
![SwiftyToaster Screenshots](https://github.com/noeyiz/SwiftyToaster/assets/116897060/870999fc-fb60-4c63-a5c4-63a7cd259ad2)

<br>

## 🛠️ Installation
### Swift Package Manager
```swift
dependencies: [
    .package(url: "https://github.com/noeyiz/SwiftyToaster.git", .upToNextMajor(from: "1.0.2"))
]
```

### CocoaPods
```
pod 'SwiftyToaster'
```

<br>

## 🚀 Usage
### Make Toast!
Create simple toast messages with just one line of code:

```swift
import SwiftyToaster

Toaster.shared.makeToast("Swifty Toaster")
```

### Duration
Control how long the toast message is displayed:

```swift
Toaster.shared.makeToast("Swifty Toaster", .short)   // 1.5 sec
Toaster.shared.makeToast("Swifty Toaster", .middle)  // 2.5 sec (Default)
Toaster.shared.makeToast("Swifty Toaster", .long)    // 3.5 sec
```

### Visual Type
Choose between round and square toast styles:

```swift
Toaster.shared.setToastType(.square)  // Square corners (Default)
Toaster.shared.setToastType(.round)   // Round corners
```

<br>

## ⚖️ LICENSE
**SwiftyToaster** is released under the MIT license. See LICENSE for details.
