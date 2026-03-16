---
title: Mask
track: graphics
order: 220
summary: A short SwiftUI study on `Mask`.
apple_docs:
- label: How To Mask One View With Another
  url: https://www.hackingwithswift.com/quick-start/swiftui/how-to-mask-one-view-with-another
- label: How To Render Text With Color Gradient In Swiftui
  url: https://sarunw.com/posts/how-to-render-text-with-color-gradient-in-swiftui/
- label: 'Mask(alignment: :)'
  url: https://developer.apple.com/documentation/swiftui/view/mask(alignment:_:)
homework:
- Apply `Mask`
---
### Mask

```swift
Text("Hello World")
    .padding()
    .foregroundStyle(.white)
    .font(.largeTitle)
    .mask(
        LinearGradient(gradient: Gradient(colors: [.white, .red, .black]), startPoint: .leading, endPoint: .trailing)
    )
```

![how-to-mask-one-view-with-another-1~dark]({{ '/assets/sessions/mask/how-to-mask-one-view-with-another-1-dark-9f60b8a8.webp' | relative_url }})
