---
title: EditMode
track: controls
order: 520
summary: A short SwiftUI study on `EditMode`.
apple_docs:
- label: Editmode
  url: https://developer.apple.com/documentation/swiftui/editmode
homework:
- Sample 따라해 보기
---
```swift
  @State var editMode: EditMode = .inactive

  List {
        ForEach(items) { item in
            ItemView(data: item)
        }
        .onMove { IndexSet, Int in
                  
        }
        .onDelete { IndexSet in
          
        }
  }
  .environment(\.editMode, $editMode)
```

<video controls preload="metadata">
  <source src="{{ '/assets/sessions/editmode/screen-recording-2025-06-12-at-12-39-38-pm-ffb70b3f.mov' | relative_url }}" type="video/quicktime">
</video>
