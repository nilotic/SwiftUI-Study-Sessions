---
title: AnimatableData
track: animation
order: 400
summary: A short SwiftUI study on `AnimatableData`.
apple_docs:
- label: Swiftui Animations Part1
  url: https://swiftui-lab.com/swiftui-animations-part1/
- label: Animatabledata Swift.associatedtype
  url: https://developer.apple.com/documentation/swiftui/animatable/animatabledata-swift.associatedtype
homework:
- Recreate the demo
homework_ko:
- 데모 따라해 보기
---
### Shape

```swift
struct PolygonShape: Shape {
    var sides: Int
    
    func path(in rect: CGRect) -> Path {        
        // hypotenuse
        let h = Double(min(rect.size.width, rect.size.height)) / 2.0
        
        // center
        let c = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)
        
        var path = Path()
        let extra: Int = Double(sides) != Double(Int(sides)) ? 1 : 0

        for i in 0..<Int(sides) + extra {
            let angle = (Double(i) * (360.0 / Double(sides))) * Double.pi / 180

            // Calculate vertex
            let pt = CGPoint(x: c.x + CGFloat(cos(angle) * h), y: c.y + CGFloat(sin(angle) * h))
            
            if i == 0 {
                path.move(to: pt) // move to first vertex
            } else {
                path.addLine(to: pt) // draw line to next vertex
            }
        }
        
        path.closeSubpath()        
        return path
    }
}
```

![image-20240127-043105.png]({{ '/assets/sessions/animatabledata/image-20240127-043105-78f112b4.png' | relative_url }})

```swift
PolygonShape(sides: 3).stroke(Color.blue, lineWidth: 3)
PolygonShape(sides: 4).stroke(Color.purple, lineWidth: 4)
```

### AnimatableData

```swift
struct PolygonShape: Shape {
    var sides: Double

    var animatableData: Double {
        get { return sides }
        set { sides = newValue }
    }

    ...
}
```

<video controls preload="metadata">
  <source src="{{ '/assets/sessions/animatabledata/rpreplay-final1706330541-0d826672.mov' | relative_url }}" type="video/quicktime">
</video>
