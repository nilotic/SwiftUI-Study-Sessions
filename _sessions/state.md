---
title: "@State"
track: state
order: 270
summary: A short SwiftUI study on `@State`.
apple_docs:
- label: State
  url: https://developer.apple.com/documentation/swiftui/state
homework:
- Build `State` with several types (e.g. `String`, `Int`, `Float`, `Enum`)
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
