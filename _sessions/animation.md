---
title: Animation
track: animation
order: 380
summary: A short SwiftUI study on `Animation`.
apple_docs:
- label: How To Create Basic Animations
  url: https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-basic-animations
- label: Animation
  url: https://developer.apple.com/documentation/swiftui/animation
- label: Cubic Bezier.com
  url: https://cubic-bezier.com/#.17,.67,.83,.67
homework:
- easeIn, easeOut, .easeInOut , .smooth , .snappy , .bouncy 다양한 Animation 만들어보기
---
```swift
struct ContentView: View {
    @State private var scale = 1.0

    var body: some View {
        Button("Press here") {
            scale += 1
        }
        .scaleEffect(scale)
        .animation(.linear, value: scale)
    }
}
```

<video controls preload="metadata">
  <source src="{{ '/assets/sessions/animation/how-to-create-basic-animations-1-dark-60b17a62.mp4' | relative_url }}" type="video/mp4">
</video>

![UWJEt.gif]({{ '/assets/sessions/animation/uwjet-869e6cb3.gif' | relative_url }})
