---
title: ScrollTransition
track: animation
order: 620
summary: A short SwiftUI study on `ScrollTransition`.
apple_docs:
- label: Visualeffect
  url: https://developer.apple.com/documentation/swiftui/visualeffect
- label: Swiftui Infinite Scrolling Slideshow Image Carousel 739244177bef
  url: https://blog.stackademic.com/swiftui-infinite-scrolling-slideshow-image-carousel-739244177bef
homework:
- Sample 따라해 보기
---
```swift
Text(item.title)
    .background(item.background)
    .padding(.horizontal, 20)
    .scrollTransition { content, phase in
        content
          .scaleEffect(y: phase.isIdentity ? 1 : 0.7)
    }
```

![1\*uP6RFzconJOK5XwBYuhXZw]({{ '/assets/sessions/scrolltransition/1-up6rfzconjok5xwbyuhxzw-9d7b991f.gif' | relative_url }})

<video controls preload="metadata">
  <source src="{{ '/assets/sessions/scrolltransition/m2-res-854p-15018a2b.mp4' | relative_url }}" type="video/mp4">
</video>

![swiftui-scrollview-3drotation.gif]({{ '/assets/sessions/scrolltransition/swiftui-scrollview-3drotation-5f6ad5de.gif' | relative_url }})

![swiftui-scrollview-opacity.gif]({{ '/assets/sessions/scrolltransition/swiftui-scrollview-opacity-abcf181a.gif' | relative_url }})
