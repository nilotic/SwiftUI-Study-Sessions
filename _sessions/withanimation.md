---
title: WithAnimation
track: animation
order: 390
summary: A short SwiftUI study on `WithAnimation`.
apple_docs:
- label: How To Create An Explicit Animation
  url: https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-an-explicit-animation
- label: 'Withanimation( : :)'
  url: https://developer.apple.com/documentation/swiftui/withanimation(_:_:)
- label: SkeletonView
  url: https://github.com/thefarmersfront/kpds-ios/blob/f8d5672d52e495f68450b9a3454fd8c63a18cc0d/Sources/KPDS/Skeleton/SkeletonView.swift#L31
homework:
- Replace `.animation` with `withAnimation`
homework_ko:
- ".animation 대신 withAnimation 으로 변경해보기"
---
### Animation

```swift
struct ContentView: View {
    @State private var opacity = 1.0

    var body: some View {
        Button("Press here") {
            withAnimation {
                opacity -= 0.2
            }
        }
        .opacity(opacity)
    }
}
```
