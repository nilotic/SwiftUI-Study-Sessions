---
title: MatchedTransitionSource
track: animation
order: 510
summary: A short SwiftUI study on `MatchedTransitionSource`.
apple_docs:
- label: Matchedtransitionsource(id:in:configuration:)
  url: https://developer.apple.com/documentation/swiftui/view/matchedtransitionsource(id:in:configuration:)
homework:
- Sample 따라해 보기
---
<video controls preload="metadata">
  <source src="{{ '/assets/sessions/matchedtransitionsource/simulator-screen-recording-iphone-16-pro-2025-06-05-at-11-11-42-0fdcd3fd.mp4' | relative_url }}" type="video/mp4">
</video>

<video controls preload="metadata">
  <source src="{{ '/assets/sessions/matchedtransitionsource/simulator-screen-recording-iphone-16-pro-2025-06-05-at-11-11-00-35d672dc.mp4' | relative_url }}" type="video/mp4">
</video>

```swift
@Namespace private var recommendSection

NavigationLink {
    RecommendRecipesView(section: data)
        .navigationTransition(.zoom(sourceID: data.item.id, in: recommendSection))
    
} label: {
    RecommendItemView(data: data.item)
}
.matchedTransitionSource(id: data.item.id, in: recommendSection)
```
