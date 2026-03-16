---
title: VStack
track: layout
order: 30
summary: A short SwiftUI study on `VStack`.
apple_docs:
- label: Vstack
  url: https://developer.apple.com/documentation/swiftui/vstack
homework:
- alignment 에 있는 3가지 케이스 만들어보기
- AppStore Cell 따라해보기
---
```swift
var body: some View {
    VStack(alignment: .leading, spacing: 10) {
        ForEach(1...10, id: \.self) {
            Text("Item \($0)")
        }
    }
}
```

### Alignment, Spacing

- [https://developer.apple.com/documentation/swiftui/alignment](https://developer.apple.com/documentation/swiftui/alignment)

- [https://developer.apple.com/documentation/swiftui/vstacklayout/spacing/](https://developer.apple.com/documentation/swiftui/vstacklayout/spacing/)

  ![hvxv7aqr9u591.jpg]({{ '/assets/sessions/vstack/hvxv7aqr9u591-jpg-e663b647.webp' | relative_url }})

### CornerRadius

- [https://developer.apple.com/documentation/swiftui/view/cornerradius(\_:antialiased:)](https://developer.apple.com/documentation/swiftui/view/cornerradius(_:antialiased:))

  ```swift
  Text("Rounded Corners")
      .frame(width: 175, height: 75)
      .foregroundColor(Color.white)
      .background(Color.black)
      .cornerRadius(25)
  ```

![SwiftUI-View-cornerRadius@2x]({{ '/assets/sessions/vstack/swiftui-view-cornerradius-2x-351ba2a5.png' | relative_url }})
