---
title: ZStack, Alignment, Frame
track: layout
order: 10
summary: A short SwiftUI study on `ZStack, Alignment, Frame`.
apple_docs:
- label: Zstack
  url: https://developer.apple.com/documentation/swiftui/zstack
homework:
- Build the nine alignment cases
homework_ko:
- alignment 에 있는 9가지 케이스 만들어보기
---
### ZStack

```swift
let colors: [Color] =
    [.red, .orange, .yellow, .green, .blue, .purple]

var body: some View {
    ZStack {
        ForEach(0..<colors.count) {
            Rectangle()
                .fill(colors[$0])
                .frame(width: 100, height: 100)
                .offset(x: CGFloat($0) * 10.0,
                        y: CGFloat($0) * 10.0)
        }
    }
}
```

![SwiftUI-ZStack-offset-rectangles~dark@2x]({{ '/assets/sessions/zstack-alignment-frame/swiftui-zstack-offset-rectangles-dark-2x-69236930.png' | relative_url }})

### Alignment

- [Alignment](https://developer.apple.com/documentation/swiftui/alignment)

  ![zstack-explained-with-images-v0-5wf25nhbi9391.jpg copy]({{ '/assets/sessions/zstack-alignment-frame/zstack-explained-with-images-v0-5wf25nhbi9391-jpg-copy-b481735f.png' | relative_url }})

  ![m4h03nhbi9391]({{ '/assets/sessions/zstack-alignment-frame/m4h03nhbi9391-c5a3bb3d.jpg' | relative_url }})

  ![hu4x9ohbi9391]({{ '/assets/sessions/zstack-alignment-frame/hu4x9ohbi9391-97f033e1.jpg' | relative_url }})

### Frame

- [frame(width:height:alignment:)](https://developer.apple.com/documentation/swiftui/view/frame(width:height:alignment:))

  ```swift
  Color.purple
      .frame(width: 200, height: 100)
  ```

![SwiftUI-View-frame-1@2x]({{ '/assets/sessions/zstack-alignment-frame/swiftui-view-frame-1-2x-f296e408.png' | relative_url }})

### ZStack Animation

<video controls preload="metadata">
  <source src="{{ '/assets/sessions/zstack-alignment-frame/zstack-animation-45d726bf.mp4' | relative_url }}" type="video/mp4">
</video>
