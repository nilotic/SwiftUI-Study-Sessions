---
title: ScrollTargetBehavior
track: layout
order: 60
summary: A short SwiftUI study on `ScrollTargetBehavior`.
apple_docs:
- label: Scrolltargetbehavior
  url: https://developer.apple.com/documentation/swiftui/scrolltargetbehavior
homework:
- Set a target with `scrollTargetLayout`
- Use `scrollTargetBehavior(.viewAligned)`
---
```swift
ScrollView {
    LazyHStack {
        ForEach(items) { item in
            ItemView(item)
        }
    }
    .scrollTargetLayout()
}
.scrollTargetBehavior(.viewAligned)
```

<video controls preload="metadata">
  <source src="{{ '/assets/sessions/scrolltargetbehavior/screen-recording-2024-06-24-at-6-37-51-pm-3e162c0a.mov' | relative_url }}" type="video/quicktime">
</video>
