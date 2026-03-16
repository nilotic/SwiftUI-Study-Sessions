---
title: NavigationSplitView
track: navigation
order: 530
summary: A short SwiftUI study on `NavigationSplitView`.
apple_docs:
- label: Navigationsplitview
  url: https://developer.apple.com/documentation/swiftui/navigationsplitview
- label: Landmarks Building An App With Liquid Glass
  url: https://developer.apple.com/documentation/swiftui/landmarks-building-an-app-with-liquid-glass
homework:
- Sample 따라해 보기
---
### EditMode

```swift
var body: some View {
    NavigationSplitView {
        List(items) { item in
            Text(item)
        }
    } detail: {
        DetailView()
    }
}
```

<video controls preload="metadata">
  <source src="{{ '/assets/sessions/navigationsplitview/screen-recording-2025-06-12-at-1-54-06-pm-ca388b63.mov' | relative_url }}" type="video/quicktime">
</video>
