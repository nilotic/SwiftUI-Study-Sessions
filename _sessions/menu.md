---
title: Menu
track: controls
order: 500
summary: A short SwiftUI study on `Menu`.
apple_docs:
- label: Menu
  url: https://developer.apple.com/documentation/swiftui/menu
homework:
- Recreate the sample
---
```swift
Menu("Actions") {
    Button("Duplicate", action: duplicate)
    Button("Delete…", action: delete)
}
```

### Submenu

![Screenshot 2025-05-29 at 1.29.28 PM]({{ '/assets/sessions/menu/screenshot-2025-05-29-at-1-29-28-pm-8913ebb7.png' | relative_url }})

![Screenshot 2025-05-29 at 1.29.34 PM]({{ '/assets/sessions/menu/screenshot-2025-05-29-at-1-29-34-pm-9c09edac.png' | relative_url }})

```swift
Menu("Actions") {
    Button("Duplicate", action: duplicate)
    Button("Rename", action: rename)
    Button("Delete…", action: delete)

    // 2-Depth 가능
    Menu("Copy") {
        Button("Copy", action: copy)
        Button("Copy Formatted", action: copyFormatted)
        Button("Copy Library Path", action: copyPath)
    }
}
```

### Section

![Screenshot 2025-05-29 at 1.20.43 PM]({{ '/assets/sessions/menu/screenshot-2025-05-29-at-1-20-43-pm-ac9ed8a2.png' | relative_url }})

```swift
Menu {
    Section {
        Button {
            data.update(editMode: .move)
            
        } label: {
            Label("Order", systemImage: "arrow.up.arrow.down")
        }
    }

    // Section 으로 나눌 수 있음
    Section {
        Button(role: .destructive) {
            data.update(editMode: .delete)
    
        } label: {
            Label("Remove...", systemImage: "trash")
        }
        
        Button {
    
        } label: {
            Label("Add to a Step", systemImage: "text.badge.plus")
        }
    }

} label: {
    Image(systemName: "ellipsis.circle.fill")
        .resizable()
        .scaledToFit()
        .frame(width: 28, height: 28)
        .symbolRenderingMode(.palette)
        .foregroundStyle(.accent, .background2)
}
```

### Primary Action

```swift
Menu {
    Button(action: addCurrentTabToReadingList) {
        Label("Add to Reading List", systemImage: "eyeglasses")
    }
    
    Button(action: bookmarkAll) {
        Label("Add Bookmarks for All Tabs", systemImage: "book")
    }
    
    Button(action: show) {
        Label("Show All Bookmarks", systemImage: "books.vertical")
    }
    
} label: {
    Label("Add Bookmark", systemImage: "book")
    
} primaryAction: {
    addBookmark()   // Default 는 Add-Action, Long Press 같은 걸 했을 때, Menu 뜸
}
```

### Styling Menu

```swift
Menu("Editing") {
    Button("Set In Point", action: setInPoint)
    Button("Set Out Point", action: setOutPoint)
}
.menuStyle(EditingControlsMenuStyle())
```
