---
title: GeometryReader
track: layout
order: 230
summary: A short SwiftUI study on `GeometryReader`.
apple_docs:
- label: Geometryreader
  url: https://developer.apple.com/documentation/swiftui/geometryreader
- label: Understanding Frames And Coordinates Inside Geometryreader
  url: https://www.hackingwithswift.com/books/ios-swiftui/understanding-frames-and-coordinates-inside-geometryreader
homework:
- Use `GeometryReader`
homework_ko:
- GeometryReader 활용해 보기
---
```swift
struct ContentView: View {

    var body: some View {
        GeometryReader { proxy in
            Text("Hello, World!")
                .frame(width: proxy.size.width / 2)
        }
    }
}
```

![Screenshot 2023-10-19 at 4.08.51 PM]({{ '/assets/sessions/geometryreader/screenshot-2023-10-19-at-4-08-51-pm-faed8dda.png' | relative_url }})
