---
title: Sheet
track: navigation
order: 550
summary: A short SwiftUI study on `Sheet`.
apple_docs:
- label: Sheet(ispresented:ondismiss:content:)
  url: https://developer.apple.com/documentation/swiftui/view/sheet(ispresented:ondismiss:content:)
- label: How To Display A Bottom Sheet
  url: https://www.hackingwithswift.com/quick-start/swiftui/how-to-display-a-bottom-sheet
homework:
- Recreate the sample
---
```swift
struct ShowLicenseAgreement: View {
    
    @State private var isPresented = false
    
    var body: some View {
        Button("Show") {
            isPresented = true
        }
        .sheet(isPresented: $isPresented) {
             Text("License Agreement")
        }
    }
}
```

![SwiftUI-View-SheetIsPresentingContent~dark@2x]({{ '/assets/sessions/sheet/swiftui-view-sheetispresentingcontent-dark-2x-479a3fa0.png' | relative_url }})

```swift
struct ShowLicenseAgreement: View {
    
    @State private var isPresented = false
    
    var body: some View {
        Button("Show") {
            isPresented = true
        }
        .sheet(isPresented: $isPresented) {
             Text("License Agreement")
                 .presentationDetents([.medium, .large])
                 .presentationDetents([.fraction(0.15)])
                 .presentationDetents([.height(300)])

                  // Indicator
                 .presentationDragIndicator(.hidden)
        }
    }
}
```

![swiftui\_shopping\_app\_sheet\_presentationDetents.jpg]({{ '/assets/sessions/sheet/swiftui-shopping-app-sheet-presentationdetents-25a3c78c.jpg' | relative_url }})
