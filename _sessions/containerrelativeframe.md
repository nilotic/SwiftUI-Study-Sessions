---
title: ContainerRelativeFrame
track: layout
order: 600
summary: A short SwiftUI study on `ContainerRelativeFrame`.
apple_docs:
- label: 'Containerrelativeframe( :alignment: :)'
  url: https://developer.apple.com/documentation/swiftui/view/containerrelativeframe(_:alignment:_:)
- label: Container Relative Frames In Swiftui
  url: https://swiftwithmajid.com/2025/01/28/container-relative-frames-in-swiftui/
homework:
- Sample 따라해 보기
---
```swift
struct ContentView: View {
    
  var body: some View {
        Text("Hello, World!")
            .containerRelativeFrame([.horizontal], alignment: .leading)
            .background(Color.pink)
    }
}
```

![image-20250731-020347.png]({{ '/assets/sessions/containerrelativeframe/image-20250731-020347-ce35b23d.png' | relative_url }})

```swift
struct ContentView: View {

    var body: some View {
        LazyHStack(spacing: 0) {
            ForEach(0..<10) { _ in
                Color.random
                    .containerRelativeFrame(.horizontal, count: 3, span: 1, spacing: 0)
             }
        }
    }
}
```

![image-20250731-020522.png]({{ '/assets/sessions/containerrelativeframe/image-20250731-020522-71833938.png' | relative_url }})
