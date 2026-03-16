---
title: Inspector
track: navigation
order: 540
summary: A short SwiftUI study on `Inspector`.
apple_docs:
- label: Inspector(ispresented:content:)
  url: https://developer.apple.com/documentation/swiftui/view/inspector(ispresented:content:)
- label: Presenting An Inspector With Swiftui
  url: https://www.createwithswift.com/presenting-an-inspector-with-swiftui/
- label: Introduction To Swiftuis Inspector
  url: https://blog.ravn.co/introduction-to-swiftuis-inspector/
homework:
- Recreate the sample
---
![createwithswift.com-presenting-an-inspector-with-swiftui.jpg]({{ '/assets/sessions/inspector/createwithswift-com-presenting-an-inspector-with-swiftui-24c492b6.jpg' | relative_url }})

  
  
iOS 17.0, iPadOS 17.0, Mac Catalyst 17.0, macOS 14.0+

```swift
struct ShapeEditor: View {
    @State var presented = false

    var body: some View {
        MyEditorView()
            .inspector(isPresented: $presented) {
                TextTraitsInspectorView()
            }
    }
```

![createwithswift.com-presenting-an-inspector-with-swiftUI-01.png]({{ '/assets/sessions/inspector/createwithswift-com-presenting-an-inspector-with-swiftui-01-b7c302f5.png' | relative_url }})

![blog2.png]({{ '/assets/sessions/inspector/blog2-43837530.png' | relative_url }})

![Navigating-the-New-Frontiers-with-SwiftUI-Structural-APIs--2-.png]({{ '/assets/sessions/inspector/navigating-the-new-frontiers-with-swiftui-structural-apis-2-e51dcf6f.png' | relative_url }})
