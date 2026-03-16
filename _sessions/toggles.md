---
title: Toggles
track: controls
order: 120
summary: A short SwiftUI study on `Toggles`.
apple_docs:
- label: Toggle
  url: https://developer.apple.com/documentation/swiftui/toggle
- label: Togglestyle
  url: https://developer.apple.com/documentation/SwiftUI/ToggleStyle
- label: '1085'
  url: https://ios-development.tistory.com/1085
- label: Custom Swiftui Toggle Styles 1b41959cf975
  url: https://betterprogramming.pub/custom-swiftui-toggle-styles-1b41959cf975
homework:
- 여러 가지 Toggle 만들어보기
---
### Toggle

```swift
@State private var vibrateOnRing = false

var body: some View {
    VStack {
        Toggle(isOn: $vibrateOnRing) {
            Text("Vibrate on Ring")
        }

        Toggle("Vibrate on Ring", 
                systemImage: "dot.radiowaves.left.and.right", 
                isOn: $vibrateOnRing)

        Toggle("Vibrate on Ring", isOn: $vibrateOnRing)

    }   
    .toggleStyle(.switch)
}
```

![R1280x0]({{ '/assets/sessions/toggles/r1280x0-8b14d960.png' | relative_url }})

### ToggleStyle

```swift
Toggle(isOn: self.$toggle2On) {
  Text("(.automatic style) @Published Toggle: \(String(self.toggle2On))")
}
.toggleStyle(.automatic)

Toggle(isOn: self.$toggle3On) {
  Text("(.button style) @Published Toggle: \(String(self.toggle3On))")
}
.toggleStyle(.button)

Toggle(isOn: self.$toggle4On) {
  Text("(.switch style) @Published Toggle: \(String(self.toggle4On))")
}
.toggleStyle(.switch)
```

![img-2]({{ '/assets/sessions/toggles/img-2-5d435efe.gif' | relative_url }})

![0\*JiwAY79OEpCH\_olt]({{ '/assets/sessions/toggles/0-jiway79oepch-olt-73017b70.webp' | relative_url }})
