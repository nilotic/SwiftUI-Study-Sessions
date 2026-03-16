---
title: Gradient
track: graphics
order: 200
summary: A short SwiftUI study on `Gradient`.
apple_docs:
- label: How To Render A Gradient
  url: https://www.hackingwithswift.com/quick-start/swiftui/how-to-render-a-gradient
homework:
- Gradient 만들어보기
---
### LinearGradient

```swift
Text("Hello World")
    .padding()
    .foregroundStyle(.white)
    .font(.largeTitle)
    .background(
        LinearGradient(gradient: Gradient(colors: [.white, .red, .black]), startPoint: .leading, endPoint: .trailing)
    )
```

![how-to-render-a-gradient-3~dark@2x]({{ '/assets/sessions/gradient/how-to-render-a-gradient-3-dark-2x-13e58241.webp' | relative_url }})

### RadialGradient

```swift
Circle()
    .fill(
        RadialGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple]), center: .center, startRadius: 50, endRadius: 100)
    )
    .frame(width: 200, height: 200)
```

![how-to-render-a-gradient-4~dark@2x]({{ '/assets/sessions/gradient/how-to-render-a-gradient-4-dark-2x-a0e4affb.webp' | relative_url }})

### AngluarGradient

```swift
Circle()
    .fill(
        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
    )
    .frame(width: 200, height: 200)
```

![how-to-render-a-gradient-5~dark@2x]({{ '/assets/sessions/gradient/how-to-render-a-gradient-5-dark-2x-3631ff84.webp' | relative_url }})

```swift
Circle()
    .strokeBorder(
        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center, startAngle: .zero, endAngle: .degrees(360)),
        lineWidth: 50
    )
    .frame(width: 200, height: 200)
```

![how-to-render-a-gradient-6~dark@2x]({{ '/assets/sessions/gradient/how-to-render-a-gradient-6-dark-2x-33c8f81a.webp' | relative_url }})
