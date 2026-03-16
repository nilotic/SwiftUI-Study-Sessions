---
title: HStack
track: layout
order: 20
summary: A short SwiftUI study on `HStack`.
apple_docs:
- label: Hstack
  url: https://developer.apple.com/documentation/swiftui/hstack
homework:
- Build the three alignment cases
---
```swift
var body: some View {
    HStack(alignment: .top, spacing: 10) {
        ForEach(1...5, id: \.self) {
            Text("Item \($0)")
        }
    }
}
```

![SwiftUI-HStack-simple~dark@2x]({{ '/assets/sessions/hstack/swiftui-hstack-simple-dark-2x-360341ab.png' | relative_url }})

### Alignment, Spacing

- [Alignment](https://developer.apple.com/documentation/swiftui/alignment)

- [HStackLayout.spacing](https://developer.apple.com/documentation/swiftui/hstacklayout/spacing/)

  ![b20cmaqr9u591.jpg]({{ '/assets/sessions/hstack/b20cmaqr9u591-jpg-57d800c6.webp' | relative_url }})
