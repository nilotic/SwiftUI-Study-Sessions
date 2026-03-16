---
title: List
track: layout
order: 40
summary: A short SwiftUI study on `List`.
apple_docs:
- label: List
  url: https://developer.apple.com/documentation/swiftui/list
- label: Identifiable
  url: https://developer.apple.com/documentation/Swift/Identifiable
homework:
- Use `List` to build a table-view style layout
- Build a `List` using an identifier
---
```swift
var body: some View {
    List {
        Text("A List Item")
        Text("A Second List Item")
        Text("A Third List Item")
    }
}
```

![List-1-iOS~dark@2x]({{ '/assets/sessions/list/list-1-ios-dark-2x-1c624334.png' | relative_url }})

### Identifiable

```swift
struct Ocean: Identifiable {
    let name: String
    let id = UUID()
}

private var oceans = [
    Ocean(name: "Pacific"),
    Ocean(name: "Atlantic"),
    Ocean(name: "Indian"),
    Ocean(name: "Southern"),
    Ocean(name: "Arctic")
]

var body: some View {
    List(oceans) {
        Text($0.name)
    }
}
```

![List-2-iOS~dark@2x]({{ '/assets/sessions/list/list-2-ios-dark-2x-73c26379.png' | relative_url }})
