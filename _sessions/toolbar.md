---
title: Toolbar
track: navigation
order: 260
summary: A short SwiftUI study on `Toolbar`.
apple_docs:
- label: Toolbars
  url: https://developer.apple.com/documentation/swiftui/toolbars
- label: Toolbar(content:) 5w0tj
  url: https://developer.apple.com/documentation/swiftui/view/toolbar(content:)-5w0tj
- label: How To Create A Toolbar And Add Buttons To It
  url: https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-a-toolbar-and-add-buttons-to-it
homework:
- Navigation Title 설정해보기
- Back Button, Close Button 만들어보기
---
### ToolbarItem

```swift

        NavigationView {
            ZStack {
                Color.cyan
                    .navigationTitle("이벤트 상세")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                dismiss()
                                
                            } label : {
                                Image(systemName: "xmark")
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                    }
            }
        }
```

![Simulator Screenshot - iPhone 15 Pro - 2023-10-25 at 10.28.58]({{ '/assets/sessions/toolbar/simulator-screenshot-iphone-15-pro-2023-10-25-at-10-28-58-75305ff3.png' | relative_url }})

### ToolbarItemGroup

```swift
        NavigationView {
            ZStack {
                Color.cyan
                    .navigationTitle("이벤트 상세")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        
                        
                        ToolbarItemGroup(placement: .topBarTrailing) {
                            Button {
                                dismiss()
                                
                            } label : {
                                Image(systemName: "square.and.arrow.up")
                                    .resizable()
                                    .scaledToFit()
                            }
                            
                            Button {
                                dismiss()
                                
                            } label : {
                                Image(systemName: "square.and.arrow.down.fill")
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                    }
            }
        }
```

![Simulator Screenshot - iPhone 15 Pro - 2023-10-25 at 10.28.43]({{ '/assets/sessions/toolbar/simulator-screenshot-iphone-15-pro-2023-10-25-at-10-28-43-b742f482.png' | relative_url }})
