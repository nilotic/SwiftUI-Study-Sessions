---
title: LazyHStack, LazyVStack
track: layout
order: 80
summary: A short SwiftUI study on `LazyHStack, LazyVStack`.
apple_docs:
- label: Lazyhstack
  url: https://developer.apple.com/documentation/swiftui/lazyhstack
- label: Lazyvstack
  url: https://developer.apple.com/documentation/swiftui/lazyvstack
homework:
- Build `List`, `ScrollView + VStack`, and `ScrollView + LazyVStack` with items from `0...1000`
- 'Implement pagination with items from `0...1000` (hint: `LazyVStack`)'
homework_ko:
- 0…1000 으로 - List - [ScrollView + VStack]- [ScrollView + LazyVStack] 만들어보기
- '0…1000 으로- Pagination 구현해보기 (hint: LazyVStack)'
---
### LazyHStack

```swift
ScrollView(.horizontal) {
    LazyHStack(alignment: .top, spacing: 10) {
        ForEach(1...100, id: \.self) {
            Text("Column \($0)")
        }
    }
}
```

### LazyVStack

```swift
ScrollView {
    LazyVStack(alignment: .leading) {
        ForEach(1...100, id: \.self) {
            Text("Row \($0)")
        }
    }
}
```
