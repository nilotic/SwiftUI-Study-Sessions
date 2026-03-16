---
title: MatchedGeometryEffect
track: animation
order: 420
summary: A short SwiftUI study on `MatchedGeometryEffect`.
apple_docs:
- label: How To Synchronize Animations From One View To Another With Matchedgeometryeffect
  url: https://www.hackingwithswift.com/quick-start/swiftui/how-to-synchronize-animations-from-one-view-to-another-with-matchedgeometryeffect
- label: Matchedgeometryeffect(id:in:properties:anchor:issource:)
  url: https://developer.apple.com/documentation/swiftui/view/matchedgeometryeffect(id:in:properties:anchor:issource:)
- label: '10041'
  url: https://developer.apple.com/videos/play/wwdc2020/10041/
homework:
- Recreate the sample
homework_ko:
- Sample 따라해 보기
---
```swift
struct ContentView: View {
    @State private var isFlipped = false

    var body: some View {
        VStack {
            if isFlipped {
                Circle()
                    .fill(.red)
                    .frame(width: 44, height: 44)
                    
                Text("Taylor Swift – 1989")
                    .font(.headline)
                    
            } else {
                Text("Taylor Swift – 1989")
                    .font(.headline)
                    
                Circle()
                    .fill(.blue)
                    .frame(width: 44, height: 44)
            }
        }
        .onTapGesture {
            withAnimation {
                isFlipped.toggle()
            }
        }
    }
}
```

<video controls preload="metadata">
  <source src="{{ '/assets/sessions/matchedgeometryeffect/how-to-synchronize-animations-from-one-view-to-another-with-matchedgeometryeffect-1-dark-3b2dcec4.mp4' | relative_url }}" type="video/mp4">
</video>

```swift
struct ContentView: View {
    @Namespace private var animation
    @State private var isFlipped = false

    var body: some View {
        VStack {
            if isFlipped {
                Circle()
                    .fill(.red)
                    .frame(width: 44, height: 44)
                    .matchedGeometryEffect(id: "Shape", in: animation)
                    
                Text("Taylor Swift – 1989")
                    .matchedGeometryEffect(id: "AlbumTitle", in: animation)
                    .font(.headline)
                    
            } else {
                Text("Taylor Swift – 1989")
                    .matchedGeometryEffect(id: "AlbumTitle", in: animation)
                    .font(.headline)
                    
                Circle()
                    .fill(.blue)
                    .frame(width: 44, height: 44)
                    .matchedGeometryEffect(id: "Shape", in: animation)
            }
        }
        .onTapGesture {
            withAnimation {
                isFlipped.toggle()
            }
        }
    }
}
```

<video controls preload="metadata">
  <source src="{{ '/assets/sessions/matchedgeometryeffect/how-to-synchronize-animations-from-one-view-to-another-with-matchedgeometryeffect-2-dark-19024ed7.mp4' | relative_url }}" type="video/mp4">
</video>

![IMG\_0185.PNG]({{ '/assets/sessions/matchedgeometryeffect/img-0185-2cfc3da8.png' | relative_url }})

<video controls preload="metadata">
  <source src="{{ '/assets/sessions/matchedgeometryeffect/matchedgeometryeffect-660b0cf9.mp4' | relative_url }}" type="video/mp4">
</video>

<video controls preload="metadata">
  <source src="{{ '/assets/sessions/matchedgeometryeffect/sample2-38739abb.mp4' | relative_url }}" type="video/mp4">
</video>

<video controls preload="metadata">
  <source src="{{ '/assets/sessions/matchedgeometryeffect/screen-recording-2024-04-18-at-10-47-08-am-ef12d0ae.mov' | relative_url }}" type="video/quicktime">
</video>

[CategorySample2.zip]({{ '/assets/sessions/matchedgeometryeffect/categorysample2-8eb7aca2.zip' | relative_url }})
