---
title: DynamicTypeSize
track: adaptivity
order: 340
summary: A short SwiftUI study on `DynamicTypeSize`.
apple_docs:
- label: Dynamictypesize
  url: https://developer.apple.com/documentation/swiftui/dynamictypesize
- label: Dynamictypesize
  url: https://developer.apple.com/documentation/swiftui/environmentvalues/dynamictypesize
- label: How To Specify The Dynamic Type Sizes A View Supports
  url: https://www.hackingwithswift.com/quick-start/swiftui/how-to-specify-the-dynamic-type-sizes-a-view-supports
homework:
- Use `dynamicTypeSize` to support Dynamic Type
---
```swift
struct ContentView: View {
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    var body: some View {
        Image(systemName: "cloud.sun.bolt.fill")
            .resizable()
            .frame(width: dynamicTypeSize == .small ? 10 : 40, 
                   height: dynamicTypeSize == .small ? 10 : 40)
    }
}
```

```swift
VStack {
    Text("This will stay small")
        .dynamicTypeSize(.small)

    Text("This won't go above large")
        .dynamicTypeSize(...(.large))
  
    Text("This will scale within a range")
        .dynamicTypeSize(.large...(.xxxLarge))
  
    Text("This will scale to any size")
}
```

![image-20250325-133346.png]({{ '/assets/sessions/dynamictypesize/image-20250325-133346-82e596fd.png' | relative_url }})
