---
title: Mesh Gradient
track: graphics
order: 210
summary: A short SwiftUI study on `Mesh Gradient`.
apple_docs:
- label: Meshgradient
  url: https://developer.apple.com/documentation/SwiftUI/MeshGradient
homework:
- Mesh Gradient 만들어보기
---
### MeshGradient

```swift
private let points: [SIMD2<Float>] = [[0, 0], [1, 0], [0, 1], [1, 1]]
private let colors: [Color] = [.red, .indigo, .purple, .pink]

Image(systemName: "bubbles.and.sparkles.fill")
    .font(.system(size: 144, weight: .black))
    .foregroundStyle(MeshGradient(width: 2, height: 2, points: points, colors: colors))
```

![image-20250324-100037.png]({{ '/assets/sessions/mesh-gradient/image-20250324-100037-a6791c36.png' | relative_url }})

### Animation

<video controls preload="metadata">
  <source src="{{ '/assets/sessions/mesh-gradient/screen-recording-2025-03-25-at-10-24-03-pm-9e1d96e3.mov' | relative_url }}" type="video/quicktime">
</video>

<video controls preload="metadata">
  <source src="{{ '/assets/sessions/mesh-gradient/screen-recording-2025-03-27-at-12-54-01-pm-85e202a7.mov' | relative_url }}" type="video/quicktime">
</video>
