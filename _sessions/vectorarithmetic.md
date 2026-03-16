---
title: VectorArithmetic
track: animation
order: 410
summary: A short SwiftUI study on `VectorArithmetic`.
apple_docs:
- label: Vectorarithmetic
  url: https://developer.apple.com/documentation/swiftui/vectorarithmetic
- label: Swiftui Advanced Animation
  url: https://alexdremov.me/swiftui-advanced-animation/
homework:
- 나만의 VectorArithmetic 만들어 보기
---
### Shape

```swift
struct RadarChartShape: Shape {
    
    // MARK: - Value
    // MARK: Public
    var values: [Double]
    
    var animatableData: AnimatableVector {
        get { AnimatableVector(values: values) }
        set { values = newValue.values }
    }
    
    
    // MARK: - Function
    // MARK: Pubilc
    func path(in rect: CGRect) -> Path {
        guard values.count == 6 else { return Path() }
        var path = Path()
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let maxRadius = min(rect.width, rect.height) / 2
        
        for (i, degree) in stride(from: -90, to: 270, by: 60).enumerated() {
            let radians = CGFloat(Angle(degrees: Double(degree)).radians)
            let radius = maxRadius * values[i]
            
            if i == 0 {
                path.move(to: CGPoint(x: center.x + cos(radians) * radius, y: center.y + sin(radians) * radius))
            }
            
            path.addLine(to: CGPoint(x: center.x + cos(radians) * radius, y: center.y + sin(radians) * radius))
        }
        
        path.closeSubpath()
        return path
    }
}
```

### VectorArithmetic

```swift
struct AnimatableVector: VectorArithmetic {
    
    // MARK: - Value
    // MARK: Public
    static var zero: AnimatableVector {
        AnimatableVector(values: [0, 0, 0, 0, 0, 0])
    }
    
    var values: [Double]
    
    var magnitudeSquared: Double {
        values.reduce(0) { $0 + $1 * $1 }
    }

    
    // MARK: - Function
    // MARK: Public
    static func + (lhs: AnimatableVector, rhs: AnimatableVector) -> AnimatableVector {
        AnimatableVector(values: zip(lhs.values, rhs.values).map(+))
    }
    
    static func - (lhs: AnimatableVector, rhs: AnimatableVector) -> AnimatableVector {
        AnimatableVector(values: zip(lhs.values, rhs.values).map(-))
    }
   
    mutating func scale(by rhs: Double) {
        values = values.map { $0 * rhs }
    }
}
```

<video controls preload="metadata">
  <source src="{{ '/assets/sessions/vectorarithmetic/screen-recording-2025-03-27-at-2-12-41-pm-3266d95f.mov' | relative_url }}" type="video/quicktime">
</video>
