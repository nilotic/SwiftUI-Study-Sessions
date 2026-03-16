---
title: Slider
track: controls
order: 150
summary: A short SwiftUI study on `Slider`.
apple_docs:
- label: Slider
  url: https://developer.apple.com/documentation/swiftui/slider
homework:
- Build several slider variations
---
```swift
@State private var value = 50.0

var body: some View {
    VStack {
        Slider(value: $value)

        Slider(value: $value, in: 0...100) { editing in

        }
        
        Text("\(value)")
    }
}
```

![SwiftUI-Slider-simple~dark@2x]({{ '/assets/sessions/slider/swiftui-slider-simple-dark-2x-558a1422.png' | relative_url }})

```swift
@State private var value = 50.0
@State private var isEditing = false

var body: some View {
    Slider(value: $value, in: 0...100, step: 5) {
        Text("Speed")

    } minimumValueLabel: {
        Text("0")

    } maximumValueLabel: {
        Text("100")

    } onEditingChanged: { editing in
        isEditing = editing
    }

    Text("\(speed)")
        .foregroundColor(isEditing ? .red : .blue)
}
```

![SwiftUI-Slider-withStepAndLabels~dark@2x]({{ '/assets/sessions/slider/swiftui-slider-withstepandlabels-dark-2x-0b636b31.png' | relative_url }})
