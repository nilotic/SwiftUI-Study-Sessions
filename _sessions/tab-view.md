---
title: TabView
track: navigation
order: 100
summary: A short SwiftUI study on `TabView`.
apple_docs:
- label: Tabview
  url: https://developer.apple.com/documentation/swiftui/tabview
- label: How To Create Scrolling Pages Of Content Using Tabviewstyle
  url: https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-scrolling-pages-of-content-using-tabviewstyle
homework:
- TabView 만들어보기
- PageView 만들어보기
---
```swift
TabView {
    ReceivedView()
        .badge(2)    // 2️⃣
        .tabItem {
            Label("Received", systemImage: "tray.and.arrow.down.fill")
        }
    SentView()
        .tabItem {
            Label("Sent", systemImage: "tray.and.arrow.up.fill")
        }
    AccountView()
        .badge("!")   // ❗️
        .tabItem {
            Label("Account", systemImage: "person.crop.circle.fill")
        }
}
```

![TabView-1~dark@2x]({{ '/assets/sessions/tab-view/tabview-1-dark-2x-fd2b3c6b.png' | relative_url }})

### PageView

```swift
TabView {
    Text("First")
    Text("Second")
    Text("Third")
    Text("Fourth")
}
.tabViewStyle(.page)
```

<video controls preload="metadata">
  <source src="{{ '/assets/sessions/tab-view/how-to-create-scrolling-pages-of-content-using-tabviewstyle-1-dark-7bd15540.mp4' | relative_url }}" type="video/mp4">
</video>

```swift
.indexViewStyle(.page(backgroundDisplayMode: .always))
```

<video controls preload="metadata">
  <source src="{{ '/assets/sessions/tab-view/how-to-create-scrolling-pages-of-content-using-tabviewstyle-2-dark-39f774c5.mp4' | relative_url }}" type="video/mp4">
</video>
