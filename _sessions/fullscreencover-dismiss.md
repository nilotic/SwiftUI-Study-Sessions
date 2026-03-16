---
title: fullScreenCover, dismiss
track: navigation
order: 90
summary: A short SwiftUI study on `fullScreenCover, dismiss`.
apple_docs:
- label: Fullscreencover(ispresented:ondismiss:content:)
  url: https://developer.apple.com/documentation/swiftui/view/fullscreencover(ispresented:ondismiss:content:)
- label: How To Present A Full Screen Modal View Using Fullscreencover
  url: https://www.hackingwithswift.com/quick-start/swiftui/how-to-present-a-full-screen-modal-view-using-fullscreencover
- label: Dismiss
  url: https://developer.apple.com/documentation/swiftui/environmentvalues/dismiss
homework:
- Present a modal view
- Close the view using `dismiss`
---
### fullScreenCover

```swift
struct ContentView: View {
    @State private var isPresented = false

    var body: some View {
        Button("Present!") {
            isPresented.toggle()
        }
        .fullScreenCover(isPresented: $isPresented, content: FullScreenModalView())
    }
}
```

```swift
struct FullScreenModalView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Color.primary.edgesIgnoringSafeArea(.all)
            Button("Dismiss Modal") {
                dismiss()
            }
        }
    }
}
```

<video controls preload="metadata">
  <source src="{{ '/assets/sessions/fullscreencover-dismiss/how-to-present-a-full-screen-modal-view-using-fullscreencover-1-dark-7bebf16d.mp4' | relative_url }}" type="video/mp4">
</video>

### dismiss

```swift
struct FullScreenModalView: View {

    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button("Dismiss Modal") {
            dismiss()
        }
    }
}
```
