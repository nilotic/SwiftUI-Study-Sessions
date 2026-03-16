---
title: ViewBuilder
track: basics
order: 470
summary: A short SwiftUI study on `ViewBuilder`.
apple_docs:
- label: Viewbuilder
  url: https://developer.apple.com/documentation/swiftui/viewbuilder
- label: Viewbuilder
  url: https://www.avanderlee.com/swiftui/viewbuilder/
homework:
- Recreate the sample
homework_ko:
- Sample 따라해 보기
---
```swift
struct SampleView: View {
   @State private var isProgressing = false
    
    var body: some View {
        ZStack {
           Color.cyan
 
           if isProgressing { 
               ProgressView()
           }
        }
    }
}
```

```swift
struct SampleView: View {
   @State private var isProgressing = false
    
    var body: some View {
        ZStack {
           Color.cyan
           progressView
        }
    }
    
    // Error: Function declares an opaque return type

    @ViewBuilder
    private var progressView: some View {
       if isProgressing { 
           ProgressView()
       }
    }
}
```
