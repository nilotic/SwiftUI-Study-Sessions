---
title: "@ScaledMetric"
track: adaptivity
order: 330
summary: A short SwiftUI study on `@ScaledMetric`.
apple_docs:
- label: Scaledmetric
  url: https://developer.apple.com/documentation/swiftui/scaledmetric
- label: What Is The Scaledmetric Property Wrapper
  url: https://www.hackingwithswift.com/quick-start/swiftui/what-is-the-scaledmetric-property-wrapper
- label: Init(wrappedvalue:relativeto:)
  url: https://developer.apple.com/documentation/swiftui/scaledmetric/init(wrappedvalue:relativeto:)?changes=__9
homework:
- ScaledMetric 사용하여 Dynamic Type 대응해보기
---
```swift
struct ContentView: View {
    @ScaledMetric var imageSize = 100.0

    var body: some View {
        Image(systemName: "cloud.sun.bolt.fill")
            .resizable()
            .frame(width: imageSize, height: imageSize)
    }
}
```

### ScaledMetric

```swift
@ScaledMetric(relativeTo: .largeTitle) var imageSize = 100.0
```

![image-20250324-095016.png]({{ '/assets/sessions/scaledmetric/image-20250324-095016-92324f9d.png' | relative_url }})
