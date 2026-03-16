---
title: Transition
track: animation
order: 430
summary: A short SwiftUI study on `Transition`.
apple_docs:
- label: How To Add And Remove Views With A Transition
  url: https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-and-remove-views-with-a-transition
- label: Transition( :) 5h5h0
  url: https://developer.apple.com/documentation/swiftui/view/transition(_:)-5h5h0
- label: How To Create A Custom Transition
  url: https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-a-custom-transition
homework:
- Sample 따라해 보기
---
```swift
struct ContentView: View {
    @State private var showDetails = false

    var body: some View {
        VStack {
            Button("Press to show details") {
                withAnimation {
                    showDetails.toggle()
                }
            }

            if showDetails {
                Text("Details go here.")
            }
        }
    }
}
```

<video controls preload="metadata">
  <source src="{{ '/assets/sessions/transition/how-to-add-and-remove-views-with-a-transition-1-dark-5826f4ba.mp4' | relative_url }}" type="video/mp4">
</video>

```swift
struct ContentView: View {
    @State private var showDetails = false

    var body: some View {
        VStack {
            Button("Press to show details") {
                withAnimation {
                    showDetails.toggle()
                }
            }

            if showDetails {
                // Moves in from the bottom
                Text("Details go here.")
                    .transition(.move(edge: .bottom))

                // Moves in from leading out, out to trailing edge.
                Text("Details go here.")
                    .transition(.slide)

                // Starts small and grows to full size.
                Text("Details go here.")
                    .transition(.scale)
            }
        }
    }
}
```

<video controls preload="metadata">
  <source src="{{ '/assets/sessions/transition/how-to-add-and-remove-views-with-a-transition-2-dark-4091f52c.mp4' | relative_url }}" type="video/mp4">
</video>

### KPDS

```swift

struct AlertView: View {
    
    var body: some View {
        ZStack {
          
        }
        .transition(.opacity)
    }
}
```

![Screenshot 2024-03-10 at 11.31.23 AM]({{ '/assets/sessions/transition/screenshot-2024-03-10-at-11-31-23-am-336be61a.png' | relative_url }})

### Custom Transition

```swift
struct ScaledCircle: Shape {
    // This controls the size of the circle inside the
    // drawing rectangle. When it's 0 the circle is
    // invisible, and when it’s 1 the circle fills
    // the rectangle.
    var animatableData: Double

    func path(in rect: CGRect) -> Path {
        let maximumCircleRadius = sqrt(rect.width * rect.width + rect.height * rect.height)
        let circleRadius = maximumCircleRadius * animatableData

        let x = rect.midX - circleRadius / 2
        let y = rect.midY - circleRadius / 2

        let circleRect = CGRect(x: x, y: y, width: circleRadius, height: circleRadius)

        return Circle().path(in: circleRect)
    }
}

// A general modifier that can clip any view using a any shape.
struct ClipShapeModifier<T: Shape>: ViewModifier {
    let shape: T

    func body(content: Content) -> some View {
        content.clipShape(shape)
    }
}

// A custom transition combining ScaledCircle and ClipShapeModifier.
extension AnyTransition {
    static var iris: AnyTransition {
        .modifier(
            active: ClipShapeModifier(shape: ScaledCircle(animatableData: 0)),
            identity: ClipShapeModifier(shape: ScaledCircle(animatableData: 1))
        )
    }
}

// An example view move showing and hiding a red
// rectangle using our transition.
struct ContentView: View {
    @State private var isShowingRed = false

    var body: some View {
        ZStack {
            Color.blue
                .frame(width: 200, height: 200)

            if isShowingRed {
                Color.red
                    .frame(width: 200, height: 200)
                    .transition(.iris)
                    .zIndex(1)
            }
        }
        .padding(50)
        .onTapGesture {
            withAnimation(.easeInOut) {
                isShowingRed.toggle()
            }
        }
    }
}
```

<video controls preload="metadata">
  <source src="{{ '/assets/sessions/transition/how-to-create-a-custom-transition-1-dark-794f4aa1.mp4' | relative_url }}" type="video/mp4">
</video>
