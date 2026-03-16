---
title: Picker
track: controls
order: 130
summary: A short SwiftUI study on `Picker`.
apple_docs:
- label: How To Create A Picker And Read Values From It
  url: https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-a-picker-and-read-values-from-it
- label: Picker
  url: https://developer.apple.com/documentation/swiftui/picker
- label: Init( :systemimage:selection:content:) 4uaqe
  url: https://developer.apple.com/documentation/swiftui/picker/init(_:systemimage:selection:content:)-4uaqe
- label: '1086'
  url: https://ios-development.tistory.com/1086
homework:
- Build several picker variations
homework_ko:
- 여러 가지 Picker 만들어보기
---
```swift
struct ContentView: View {
    var colors = ["Red", "Green", "Blue", "Tartan"]
    @State private var selectedColor = "Red"

    var body: some View {
        VStack {
            Picker("Please choose a color", selection: $selectedColor) {
                ForEach(colors, id: \.self) {
                    Text($0)
                }
            }
            Text("You selected: \(selectedColor)")
        }
    }
}
```

![how-to-create-a-picker-and-read-values-from-it-1~dark@2x]({{ '/assets/sessions/picker/how-to-create-a-picker-and-read-values-from-it-1-dark-2x-5fc26398.png' | relative_url }})

### Styling Picker

```swift
Stack {
    Picker("Flavor", selection: $selectedFlavor) {
        ForEach(Flavor.allCases) { flavor in
            Text(flavor.rawValue.capitalized)
        }
    }
    Picker("Topping", selection: $selectedTopping) {
        ForEach(Topping.allCases) { topping in
            Text(topping.rawValue.capitalized)
        }
    }
}
.pickerStyle(.segmented)
```

![Picker-3-iOS~dark@2x]({{ '/assets/sessions/picker/picker-3-ios-dark-2x-3ccad665.png' | relative_url }})

![img]({{ '/assets/sessions/picker/img-673cd415.gif' | relative_url }})

![R1280x0]({{ '/assets/sessions/picker/r1280x0-8b14d960.png' | relative_url }})

![R1280x0-2]({{ '/assets/sessions/picker/r1280x0-2-c53f3547.png' | relative_url }})
