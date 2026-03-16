---
title: ViewModifier
track: basics
order: 450
summary: A short SwiftUI study on `ViewModifier`.
apple_docs:
- label: Viewmodifier
  url: https://developer.apple.com/documentation/swiftui/viewmodifier
- label: Custom Modifiers
  url: https://www.hackingwithswift.com/books/ios-swiftui/custom-modifiers
homework:
- Build a custom view with `ViewModifier`
homework_ko:
- ViewModifier 만들어서 Custom View 만들어보기
---
### BorderedCaption .swift

```swift
struct BorderedCaption: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption2)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 1)
            )
            .foregroundColor(Color.blue)
    }
}
```

### ViewExtension.swift

```swift
extension View {
    func borderedCaption() -> some View {
        modifier(BorderedCaption())
    }
}
```

![SwiftUI-View-ViewModifier~dark@2x]({{ '/assets/sessions/viewmodifier/swiftui-view-viewmodifier-dark-2x-09c6690f.png' | relative_url }})

### View.swift

```swift
Image(systemName: "bus")
    .resizable()
    .frame(width:50, height:50)

Text("Downtown Bus")
    .borderedCaption()
```
