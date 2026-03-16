---
title: Path
track: graphics
order: 250
summary: A short SwiftUI study on `Path`.
apple_docs:
- label: Path
  url: https://developer.apple.com/documentation/swiftui/path
- label: Creating Custom Paths With Swiftui
  url: https://www.hackingwithswift.com/books/ios-swiftui/creating-custom-paths-with-swiftui
- label: Bézier Curve
  url: https://en.wikipedia.org/wiki/B%C3%A9zier_curve
- label: Cubic Bezier.com
  url: https://cubic-bezier.com/#.17,.67,.81,.45
homework:
- Build a `Path`
---
```swift
    Path { path in
        path.move(to: CGPoint(x: 200, y: 100))

        path.addLine(to: CGPoint(x: 100, y: 300))

        path.addArc(center: CGPoint(x: 20, y: 20), 
                    radius: 20, 
                    startAngle: Angle(degrees: 180),
                    endAngle: Angle(degrees: 270), 
                    clockwise: false)

        path.addCurve(to: CGPoint(x: 10, y: 10), 
                      control1: CGPoint(x: 30, y: 30), 
                      control2: CGPoint(x: 50, y: 50))
    }
   .fill(.blue)

// .stroke(.blue, lineWidth: 10)

// .stroke(.blue, style: StrokeStyle(lineWidth: 10, 
                                     lineCap: .round, 
                                     lineJoin: .round))
```

### Bezier Curve

<video controls preload="metadata">
  <source src="{{ '/assets/sessions/path/screen-recording-2024-10-21-at-2-34-14-pm-76d956c6.mov' | relative_url }}" type="video/quicktime">
</video>

<details markdown="1">
<summary>Curves</summary>

<table>
  <tr>
    <th><p><strong>Linear </strong></p></th>
    <th><p><strong>Quadratic </strong></p></th>
    <th><p><strong>Cubic</strong></p></th>
  </tr>
  <tr>
    <td><img src="{{ '/assets/sessions/path/bezier-1-big-fb097dec.gif' | relative_url }}" alt="Bézier_1_big"></td>
    <td><img src="{{ '/assets/sessions/path/bezier-2-big-a1fdaa26.gif' | relative_url }}" alt="Bézier_2_big"></td>
    <td><img src="{{ '/assets/sessions/path/bezier-3-big-5cf36267.gif' | relative_url }}" alt="Bézier_3_big"></td>
  </tr>
</table>

<table>
  <tr>
    <th><p><strong>Higher-order </strong></p></th>
  </tr>
  <tr>
    <td><img src="{{ '/assets/sessions/path/bezier-4-big-ef8197a2.gif' | relative_url }}" alt="Bézier_4_big"><img src="{{ '/assets/sessions/path/bezier-4-big-ef8197a2.gif' | relative_url }}" alt="Bézier_4_big"></td>
  </tr>
</table>

</details>

<details markdown="1">
<summary>Paul de Casteljau</summary>

#### De Casteljau's algorithm

  
[De Casteljau's algorithm](https://en.wikipedia.org/wiki/De_Casteljau%27s_algorithm)

![image-20241024-012004.png]({{ '/assets/sessions/path/image-20241024-012004-fcbd31a1.png' | relative_url }})

</details>

<details markdown="1">
<summary>Pierre Bézier</summary>

![images.jpeg]({{ '/assets/sessions/path/images-0777c42d.jpeg' | relative_url }})

![renault-16txa-2.gif]({{ '/assets/sessions/path/renault-16txa-2-7d4fbbd4.gif' | relative_url }})

![renault-16-ts-1970-3d-model-rigged-obj-3ds-fbx-c4d.jpg]({{ '/assets/sessions/path/renault-16-ts-1970-3d-model-rigged-obj-3ds-fbx-c4d-2c8c1fe7.jpg' | relative_url }})

</details>
