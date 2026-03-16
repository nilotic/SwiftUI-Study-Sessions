---
title: VisualEffect
track: graphics
order: 630
summary: A short SwiftUI study on `VisualEffect`.
apple_docs:
- label: Visualeffect
  url: https://developer.apple.com/documentation/swiftui/visualeffect
- label: '10151'
  url: https://developer.apple.com/videos/play/wwdc2024/10151/
homework:
- Recreate the sample
- |-
  ```swift
  struct ContentView: View {
  var body: some View {
  return GeometryReader { geo in
  let containerWidth = geo.size.width
  ScrollView(.horizontal) {
  LazyHStack(spacing: 50) {
  ForEach(1..<18) { item in
  ZStack {
  Circle()
  .fill(.blue)
  .frame(width: 50, height: 50)
  Text("\(item)")
  }
  .visualEffect { content, proxy in
  let x = proxy.frame(in: .global).origin.x
  let centerXScreen = containerWidth / 2
  let distanceX = abs(centerXScreen - x)
  // 중심에서 멀어질수록 값이 줄어들도록 선형 매핑
  let scale = 2 - (distanceX / centerXScreen)
  let hueRotationDegrees = Angle.degrees((1 - distanceX) / -1.5)
  return content
  .scaleEffect(scale)
  .hueRotation(hueRotationDegrees)
  }
  .scrollTargetLayout()
  }
  }
  }
  .coordinateSpace(name: "scrollArea")
  }
  }
  ```
- |-
  <video controls preload="metadata">
  <source src="{{ '/assets/sessions/visualeffect/2025-10-16-6-39-09-21e96b1f.mov' | relative_url }}" type="video/quicktime">
  </video>
---
```swift
RoundedRectangle(cornerRadius: 24)
    .fill(.purple)
    .visualEffect({ content, proxy in
        content
            .hueRotation(Angle(degrees: proxy.frame(in: .global).origin.y / 10))
            
    })
```

![image-20250731-022600.png]({{ '/assets/sessions/visualeffect/image-20250731-022600-7364ae87.png' | relative_url }})

![image-20250731-022607.png]({{ '/assets/sessions/visualeffect/image-20250731-022607-017fc585.png' | relative_url }})
