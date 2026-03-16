---
title: Stepper
track: controls
order: 140
summary: A short SwiftUI study on `Stepper`.
apple_docs:
- label: Stepper
  url: https://developer.apple.com/documentation/swiftui/stepper
- label: Swiftui Stepper Onincrement Ondecrement
  url: https://seons-dev.tistory.com/entry/SwiftUI-Stepper-onIncrement-onDecrement
homework:
- Build several stepper variations
---
```swift
struct ContentView: View {
    @State private var sleepAmount = 8.0
    
    var body: some View {
        Stepper(value: $sleepAmount) {
            Text("\(sleepAmount) hours")
        }
    }
}
```

![img]({{ '/assets/sessions/stepper/img-673cd415.gif' | relative_url }})

```swift
struct StepperView: View {
    @State private var value = 0
    
    var body: some View {
        Stepper(value: $value, in: 1...50, step: 5) {
            Text("Current: \(value) in \(range.description) " + "stepping by \(step)")
        }
    }
}
```

![SwiftUI-Stepper-value-step-range~dark@2x]({{ '/assets/sessions/stepper/swiftui-stepper-value-step-range-dark-2x-b39f3151.png' | relative_url }})

```swift
struct StepperView: View {
    @State private var value = 0
    let colors: [Color] = [.orange, .red, .gray, .blue, .green, .purple, .pink]

    var body: some View {
        Stepper {
            Text("Value: \(value) Color: \(colors[value].description)")

        } onIncrement: {
            value += 1

        } onDecrement: {
            value -= 1
        }
        .background(colors[value])
    }
}
```

![SwiftUI-Stepper-increment-decrement-closures~dark@2x]({{ '/assets/sessions/stepper/swiftui-stepper-increment-decrement-closures-dark-2x-62b0ac1d.png' | relative_url }})
