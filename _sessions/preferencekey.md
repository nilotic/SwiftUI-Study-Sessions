---
title: PreferenceKey
track: state
order: 460
summary: A short SwiftUI study on `PreferenceKey`.
apple_docs:
- label: Preferencekey
  url: https://developer.apple.com/documentation/swiftui/preferencekey
- label: What Is Preferencekey In Swiftui 3a3f0056b147
  url: https://medium.com/@fatihcyln/what-is-preferencekey-in-swiftui-3a3f0056b147
homework:
- Recreate the sample
homework_ko:
- Sample 따라해 보기
---
![1\*88ocgBi3trG7myZnfnlAKQ]({{ '/assets/sessions/preferencekey/1-88ocgbi3trg7myznfnlakq-1fb14a70.webp' | relative_url }})

### FramePreferenceKey.swift

```swift
struct FramePreferenceKey: PreferenceKey {
    
    static var defaultValue: CGRect = .zero
  
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {}
}
```

### ViewExtension.swift

```swift
extension View {
    
    func frame(perform: @escaping (CGRect) -> Void) -> some View {
        background(
            GeometryReader {
                Color.clear
                    .preference(key: FramePreferenceKey.self, value: $0.frame(in: .global))
            }
        )
        .onPreferenceChange(FramePreferenceKey.self) { value in
            perform(value)
        }
    }
}
```

### View.swift

```swift
    VStack(spacing: 0) {
        titleView
        datesView
        summaryView
        dividerView
    }
    .frame {
        data.contentsHeight = $0.size.height
    }
```
