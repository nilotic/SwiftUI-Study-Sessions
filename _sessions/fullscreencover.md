---
title: FullScreenCover
track: navigation
order: 560
summary: A short SwiftUI study on `FullScreenCover`.
apple_docs:
- label: Fullscreencover(ispresented:ondismiss:content:)
  url: https://developer.apple.com/documentation/swiftui/view/fullscreencover(ispresented:ondismiss:content:)
- label: How To Display A Bottom Sheet
  url: https://www.hackingwithswift.com/quick-start/swiftui/how-to-display-a-bottom-sheet
homework:
- Recreate the sample
homework_ko:
- Sample 따라해 보기
---
### Sheet

```swift
struct FullScreenCoverPresentedOnDismiss: View {
  
  @State private var selectedItem = false  
  @State private var isPresenting = false
  
    var body: some View {
        Button("Present Full-Screen Cover") {
            isPresenting = true
        }
        .fullScreenCover(isPresented: $isPresenting)
            VStack {
                Text("A full-screen modal view.")
                    .font(.title)
              
                Text("Tap to Dismiss")
            }
        }
        .fullScreenCover(item: $selectedItem) { item in
             Detailview(item: item)         
        }
  }
```

![SwiftUI-FullScreenCoverIsPresented~dark@2x]({{ '/assets/sessions/fullscreencover/swiftui-fullscreencoverispresented-dark-2x-f55b53da.png' | relative_url }})
