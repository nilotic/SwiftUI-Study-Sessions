---
title: "@Binding"
track: state
order: 280
summary: A short SwiftUI study on `@Binding`.
apple_docs:
- label: Binding
  url: https://developer.apple.com/documentation/swiftui/binding
homework:
- Parent, Child View 만들어서 @Binding 으로 값 넘겨보기
---
### Parent

```swift
struct PlayerView: View {
    @State private var isPlaying = false

    var body: some View {
        PlayButton(isPlaying: $isPlaying)
    }
}
```

### Child

```swift
struct PlayButton: View {
    @Binding var isPlaying: Bool

    var body: some View {
        Button(isPlaying ? "Pause" : "Play") {
            isPlaying.toggle()
        }
    }
}
```

![Screenshot 2023-11-09 at 10.12.29 AM]({{ '/assets/sessions/binding/screenshot-2023-11-09-at-10-12-29-am-c6221066.png' | relative_url }})
