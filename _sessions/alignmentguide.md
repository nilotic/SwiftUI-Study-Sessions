---
title: AlignmentGuide
track: layout
order: 590
summary: A short SwiftUI study on `AlignmentGuide`.
apple_docs:
- label: Alignmentguide( :computevalue:) 6y3u2
  url: https://developer.apple.com/documentation/swiftui/view/alignmentguide(_:computevalue:)-6y3u2
- label: Listrowseparatorleading
  url: https://developer.apple.com/documentation/swiftui/horizontalalignment/listrowseparatorleading
homework:
- Recreate the sample
homework_ko:
- Sample 따라해 보기
---
```swift
VStack {
    Text("Today's Weather")
        .font(.title)
        .border(.gray)

    HStack {
        Text("🌧")
            .alignmentGuide(VerticalAlignment.center) { _ in -20 }
            .border(.gray)
      
        Text("Rain & Thunderstorms")
            .border(.gray)
      
        Text("⛈")
            .alignmentGuide(VerticalAlignment.center) { _ in 20 }
            .border(.gray)
    }
}
```

![SwiftUI-View-VAlignmentGuide@2x]({{ '/assets/sessions/alignmentguide/swiftui-view-valignmentguide-2x-7f29a23d.png' | relative_url }})

### Dimension vs Offset vs Padding

```swift

HStack(alignment: .top) {
    Text("A")
        .alignmentGuide(.top) { dimension in
            dimension[.bottom]    // A만 아래쪽 기준으로 정렬
        }
        
    Text("B")
        .offset(x: 20)  // Layout 에 영향을 주지않음. 
                        // 원래 위치는 그대로 유지되고, 보이는 위치만 다름
                        // Animation 등에 사용

    Text("C")
        .padding(.leading, 20)    // 부모의 따라 Layout 이 변경                        
}
```

### listRowSeparatorLeading

```swift

  ForEach(data.recipes) {
      RecipeItemView(data: $0)
  }
  .listSectionSeparator(.hidden)
  .alignmentGuide(.listRowSeparatorLeading) { _ in 0 }
```

<table>
  <tr>
    <th><p><strong>Before</strong></p></th>
    <th><p><strong>After</strong></p></th>
  </tr>
  <tr>
    <td><img src="{{ '/assets/sessions/alignmentguide/screenshot-2025-07-24-at-2-48-33-pm-23664a0f.png' | relative_url }}" alt="Screenshot 2025-07-24 at 2.48.33 PM"></td>
    <td><img src="{{ '/assets/sessions/alignmentguide/screenshot-2025-07-24-at-2-48-55-pm-901a4ae6.png' | relative_url }}" alt="Screenshot 2025-07-24 at 2.48.55 PM"></td>
  </tr>
</table>
