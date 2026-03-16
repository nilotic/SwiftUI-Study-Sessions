---
title: PresentationBackground
track: navigation
order: 240
summary: A short SwiftUI study on `PresentationBackground`.
apple_docs:
- label: Presentationbackground( :)
  url: https://developer.apple.com/documentation/swiftui/view/presentationbackground(_:)?changes=_8
homework:
- Apply `presentationBackground`
---
```swift
struct ContentView: View {
    @State private var showSettings = false

    var body: some View {
        Button("View Settings") {
            showSettings = true
        }
        .sheet(isPresented: $showSettings) {
            SettingsView()
                .presentationBackground(.clear)
        }
    }
}
```
