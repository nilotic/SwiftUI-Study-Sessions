---
title: TimelineView
track: animation
order: 190
summary: A short SwiftUI study on `TimelineView`.
apple_docs:
- label: Timelineview
  url: https://developer.apple.com/documentation/swiftui/timelineview
- label: Swiftui Animations Part4
  url: https://swiftui-lab.com/swiftui-animations-part4/
homework:
- Build a simple `TimelineView`
---
```swift
struct ManyFaces: View {
    static let emoji = ["😀", "😬", "😄", "🙂", "😗", "🤓", "😏", "😕", "😟", "😎", "😜", "😍", "🤪"]
    
    var body: some View {
        TimelineView(.periodic(from: .now, by: 0.2)) { timeline in

            HStack(spacing: 120) {
                let randomEmoji = ManyFaces.emoji.randomElement() ?? ""
            
                Text(randomEmoji)
                    .font(.largeTitle)
                    .scaleEffect(4.0)
                
                SubView()
            }
        }
    }
    
    struct SubView: View {
        let date: Date
        
        var body: some View {}
            let randomEmoji = ManyFaces.emoji.randomElement() ?? ""
    
            Text(randomEmoji)
                .font(.largeTitle)
                .scaleEffect(4.0)
        }
    }
}
```

![emojis-changing-two.gif]({{ '/assets/sessions/timelineview/emojis-changing-two-6fca5459.gif' | relative_url }})

### Combining TimelineView with Traditional Animations

```swift
struct Metronome: View {
    let bpm: Double = 60 // beats per minute
    
    var body: some View {
        TimelineView(.periodic(from: .now, by: 60 / bpm)) { timeline in
            MetronomeBack()
                .overlay(MetronomePendulum(bpm: bpm, date: timeline.date))
                .overlay(MetronomeFront(), alignment: .bottom)
        }
    }
}
```

<video controls preload="metadata">
  <source src="{{ '/assets/sessions/timelineview/metronome-f28f735b.mp4' | relative_url }}" type="video/mp4">
</video>

### Custom TimelineScheduler

```swift
struct CyclicTimelineSchedule: TimelineSchedule {
    let timeOffsets: [TimeInterval]
    
    func entries(from startDate: Date, mode: TimelineScheduleMode) -> Entries {
        Entries(last: startDate, offsets: timeOffsets)
    }
    
    struct Entries: Sequence, IteratorProtocol {
        var last: Date
        let offsets: [TimeInterval]
        
        var idx: Int = -1
        
        mutating func next() -> Date? {
            idx = (idx + 1) % offsets.count
            last = last.addingTimeInterval(offsets[idx])
            return last
        }
    }
}
```

![beating-heart.gif]({{ '/assets/sessions/timelineview/beating-heart-0e7a1468.gif' | relative_url }})

### KeyFrame Animations

```swift
struct KeyFrame {
    let offset: TimeInterval    
    let rotation: Double
    let yScale: Double
    let y: CGFloat
    let animation: Animation?
}

let keyframes = [
    // Initial state, will be used once. Its offset is useless and will be ignored
    KeyFrame(offset: 0.0, rotation: 0, yScale: 1.0, y: 0, animation: nil),

    // Animation keyframes
    KeyFrame(offset: 0.2, rotation:   0, yScale: 0.5, y:  20, animation: .linear(duration: 0.2)),
    KeyFrame(offset: 0.4, rotation:   0, yScale: 1.0, y: -20, animation: .linear(duration: 0.4)),
    KeyFrame(offset: 0.5, rotation: 360, yScale: 1.0, y: -80, animation: .easeOut(duration: 0.5)),
    KeyFrame(offset: 0.4, rotation: 360, yScale: 1.0, y: -20, animation: .easeIn(duration: 0.4)),
    KeyFrame(offset: 0.2, rotation: 360, yScale: 0.5, y:  20, animation: .easeOut(duration: 0.2)),
    KeyFrame(offset: 0.4, rotation: 360, yScale: 1.0, y: -20, animation: .linear(duration: 0.4)),
    KeyFrame(offset: 0.5, rotation:   0, yScale: 1.0, y: -80, animation: .easeOut(duration: 0.5)),
    KeyFrame(offset: 0.4, rotation:   0, yScale: 1.0, y: -20, animation: .easeIn(duration: 0.4)),
]
```

![jumping-emoji-1.gif]({{ '/assets/sessions/timelineview/jumping-emoji-1-276ade4d.gif' | relative_url }})
