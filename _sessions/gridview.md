---
title: GridView
track: layout
order: 110
summary: A short SwiftUI study on `GridView`.
apple_docs:
- label: Griditem
  url: https://developer.apple.com/documentation/swiftui/griditem
- label: Mastering Grids In Swiftui
  url: https://swiftwithmajid.com/2020/07/08/mastering-grids-in-swiftui/
- label: How To Position Views In A Grid Using Lazyvgrid And Lazyhgrid
  url: https://www.hackingwithswift.com/quick-start/swiftui/how-to-position-views-in-a-grid-using-lazyvgrid-and-lazyhgrid
- label: Lazyhgrid
  url: https://developer.apple.com/documentation/swiftui/lazyhgrid
- label: Lazyvgrid
  url: https://developer.apple.com/documentation/swiftui/lazyvgrid
- label: Impossible Grids
  url: https://swiftui-lab.com/impossible-grids/
homework:
- Build a product-list layout with `LazyVGrid`
---
### GridItem

```swift
struct GridItemDemo: View {
    let rows = [
        GridItem(.fixed(30), spacing: 1),
        GridItem(.fixed(60), spacing: 10),
        GridItem(.fixed(90), spacing: 20),
        GridItem(.fixed(10), spacing: 50)
    ]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 5) {
                ForEach(0...300, id: \.self) { _ in
                    Color.red.frame(width: 30)
                    Color.green.frame(width: 30)
                    Color.blue.frame(width: 30)
                    Color.yellow.frame(width: 30)
                }
            }
        }
    }
}
```

![GridItem-1-iOS~dark@2x]({{ '/assets/sessions/gridview/griditem-1-ios-dark-2x-2e08d6b4.png' | relative_url }})

### Sample

![Screenshot 2023-08-22 at 5.25.31 PM]({{ '/assets/sessions/gridview/screenshot-2023-08-22-at-5-25-31-pm-002a951d.png' | relative_url }})

![Screenshot 2023-08-22 at 5.26.27 PM]({{ '/assets/sessions/gridview/screenshot-2023-08-22-at-5-26-27-pm-7c42173e.png' | relative_url }})

![Screenshot 2023-08-22 at 5.26.30 PM]({{ '/assets/sessions/gridview/screenshot-2023-08-22-at-5-26-30-pm-32d4cbd9.png' | relative_url }})

![Screenshot 2023-08-22 at 5.26.33 PM]({{ '/assets/sessions/gridview/screenshot-2023-08-22-at-5-26-33-pm-bff78eaa.png' | relative_url }})

### LazyHGrid, LazyVGrid

```swift
struct HorizontalSmileys: View {
    let rows = [GridItem(.fixed(30)), GridItem(.fixed(30))]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows) {
                ForEach(0x1f600...0x1f679, id: \.self) { value in
                    Text(String(format: "%x", value))
                    Text(emoji(value))
                        .font(.largeTitle)
                }
            }
        }
    }

    private func emoji(_ value: Int) -> String {
        guard let scalar = UnicodeScalar(value) else { return "?" }
        return String(Character(scalar))
    }
}
```

![LazyHGrid-1-iOS~dark@2x]({{ '/assets/sessions/gridview/lazyhgrid-1-ios-dark-2x-9e9e1565.png' | relative_url }})

```swift
struct VerticalSmileys: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
         ScrollView {
             LazyVGrid(columns: columns) {
                 ForEach(0x1f600...0x1f679, id: \.self) { value in
                     Text(String(format: "%x", value))
                     Text(emoji(value))
                         .font(.largeTitle)
                 }
             }
         }
    }

    private func emoji(_ value: Int) -> String {
        guard let scalar = UnicodeScalar(value) else { return "?" }
        return String(Character(scalar))
    }
}
```

![LazyVGrid-1-iOS~dark@2x]({{ '/assets/sessions/gridview/lazyvgrid-1-ios-dark-2x-4ba8495f.png' | relative_url }})
