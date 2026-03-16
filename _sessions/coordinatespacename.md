---
title: CoordinateSpaceName
track: layout
order: 480
summary: A short SwiftUI study on `CoordinateSpaceName`.
apple_docs:
- label: Coordinatespace(name:)
  url: https://developer.apple.com/documentation/swiftui/view/coordinatespace(name:)
- label: Coordinatespace( :)
  url: https://developer.apple.com/documentation/swiftui/view/coordinatespace(_:)
- label: Understanding Frames And Coordinates Inside Geometryreader
  url: https://www.hackingwithswift.com/books/ios-swiftui/understanding-frames-and-coordinates-inside-geometryreader
homework:
- Recreate the sample
homework_ko:
- Sample 따라해 보기
---
```swift
    ScrollView(.vertical, showsIndicators: false) {
        RefreshView(coordinateSpaceName: "scrollView")
    }
    .coordinateSpace(name: "scrollView")
```

RefreshView.swift

```swift
struct RefreshView: View {
    
    let coordinateSpaceName: String
    
    var body: some View {
        GeometryReader { proxy in
            if proxy.frame(in: .named(coordinateSpaceName)).midY > 50 {
               
            } 
        }
    }
```
