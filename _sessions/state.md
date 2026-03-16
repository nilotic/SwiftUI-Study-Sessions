---
title: "@State"
track: state
order: 270
summary: A short SwiftUI study on `@State`.
apple_docs:
- label: State
  url: https://developer.apple.com/documentation/swiftui/state
homework:
- 다양한 Type 의 State 만들어보기 ( Ex. String, Int, Float, Enum )
---
```swift
struct PlayButton: View {
    @State private var isPlaying = false

    var body: some View {
        Button(isPlaying ? "Pause" : "Play") {
            isPlaying.toggle()
        }
    }
}
```
