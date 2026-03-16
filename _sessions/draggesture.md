---
title: DragGesture
track: controls
order: 650
summary: A short SwiftUI study on `DragGesture`.
apple_docs:
- label: Draggesture
  url: https://developer.apple.com/documentation/SwiftUI/DragGesture
- label: How To Override Animations With Transactions
  url: https://www.hackingwithswift.com/quick-start/swiftui/how-to-override-animations-with-transactions
homework:
- Recreate the sample
---
```swift
   DragGesture()
            .onChanged { isDragging = true }
            .onEnded { isDragging = false }
```

<video controls preload="metadata">
  <source src="{{ '/assets/sessions/draggesture/simulator-screen-recording-iphone-16-pro-2025-11-05-at-17-05-49-c98cb277.mov' | relative_url }}" type="video/quicktime">
</video>

```swift
@MainActor 
@inlinable 
@preconcurrency 
public func updating<State>(_ state: GestureState<State>,
                            body: @escaping (Self.Value, inout State, inout Transaction) -> Void) -> GestureStateGesture<Self, State>
```

```swift

DragGesture(minimumDistance: 0)
   .updating($offsetState) { currentState, gestureState, transaction in
       gestureState = currentState.translation
           data.update(translation: gestureState, sticker: sticker, isEnded: false)
       }
       .onEnded {
           data.update(translation: $0.translation, sticker: sticker, isEnded: true)
       }
```
