---
title: NavigationDestination
track: navigation
order: 570
summary: A short SwiftUI study on `NavigationDestination`.
apple_docs:
- label: Navigationdestination(for:destination:)
  url: https://developer.apple.com/documentation/swiftui/view/navigationdestination(for:destination:)
- label: Navigationdestination(item:destination:)
  url: https://developer.apple.com/documentation/swiftui/view/navigationdestination(item:destination:)
- label: Navigationdestination(ispresented:destination:)
  url: https://developer.apple.com/documentation/swiftui/view/navigationdestination(ispresented:destination:)
homework:
- Recreate the sample
homework_ko:
- Sample 따라해 보기
---
```swift
NavigationStack {
    List {
        NavigationLink("Mint", value: Color.mint)
        NavigationLink("Pink", value: Color.pink)
        NavigationLink("Teal", value: Color.teal)
    }
    .navigationDestination(for: Color.self) { color in
        ColorDetail(color: color)
    }
}
```

```swift
@State private var item: Color?

NavigationStack {
    List {
        Button("Mint") { item = .mint }
        Button("Pink") { item = .pink }
        Button("Teal") { item = .teal }
    }
    .navigationDestination(item: $item) { color in
        ColorDetail(color: color)
    }
}
```

```swift
@State private var isPresented = false
@State private var color: Color = .clear

NavigationStack {
    VStack {
        Button("Show details") {
            color = .red
            isPresented = true
        }
    }
    .navigationDestination(isPresented: $isPresented) {
        ColorDetail(color: color)
    }
}
```
