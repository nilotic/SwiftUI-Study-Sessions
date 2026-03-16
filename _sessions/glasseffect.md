---
title: GlassEffect
track: graphics
order: 670
summary: A short SwiftUI study on `GlassEffect`.
apple_docs:
- label: Glasseffect( :in:)
  url: https://developer.apple.com/documentation/swiftui/view/glasseffect(_:in:)
- label: Landmarks Building An App With Liquid Glass
  url: https://developer.apple.com/documentation/SwiftUI/Landmarks-Building-an-app-with-Liquid-Glass
homework:
- Recreate the sample
homework_ko:
- Sample 따라해 보기
---
```swift
Text("Hello, World!")
    .font(.title)
    .padding()
    .glassEffect()
```

![image.png]({{ '/assets/sessions/glasseffect/image-c2ca448d.png' | relative_url }})

```swift
  Text("Hello, World!")
      .font(.title)
      .padding()
      .glassEffect(.regular, in: .rect(cornerRadius: 20))
```

[스크린샷 2025-11-13 오후 5.22.55.heic]({{ '/assets/sessions/glasseffect/2025-11-13-5-22-55-e101343c.heic' | relative_url }})
