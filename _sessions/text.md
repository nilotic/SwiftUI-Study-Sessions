---
title: Text
track: basics
order: 160
summary: A short SwiftUI study on `Text`.
apple_docs:
- label: Init( :format:)
  url: https://developer.apple.com/documentation/swiftui/text/init(_:format:)?ref=createwithswift.com
- label: Formatstyle
  url: https://developer.apple.com/documentation/foundation/formatstyle
- label: Init( :image:) 73eec
  url: https://developer.apple.com/documentation/swiftui/label/init(_:image:)-73eec
- label: How To Insert Images Into Text
  url: https://www.hackingwithswift.com/quick-start/swiftui/how-to-insert-images-into-text
homework:
- Localized Key 로 바로 Text 그리기
- Format Style 용해서 Text 활용해 보기
---
### Text(_:format:)

```swift

struct ContentView: View {

    var body: some View {
        // 72,30 £
        Text(72.3, format: .currency(code: "GBP"))
    }
}
```

```swift

struct ContentView: View {

    var body: some View {
        // 3,000원
        Text(price, format: .koreanCurrency)
    }
}
```

### FormatStyle

```swift

@available(iOS 15, *)
struct KoreanCurrencyFormatStyle: FormatStyle {
    
    func format(_ value: Int) -> String {
        "\(value.formatted(.number))원"
    }
}

@available(iOS 15, *)
extension FormatStyle where Self == KoreanCurrencyFormatStyle {
    
    static var koreanCurrency: KoreanCurrencyFormatStyle {
        KoreanCurrencyFormatStyle()
    }
}
```

### Text(stringLiteral:)

```swift

struct ContentView: View {

    var body: some View {
        Text("localizedKey")
    }
}
```

### Text(_ image: Image)

```swift

Text("Hello ") + Text(Image(systemName: "star")) + Text(" World!")
```

![how-to-insert-images-into-text-1~dark@2x]({{ '/assets/sessions/text/how-to-insert-images-into-text-1-dark-2x-2a66d8b8.webp' | relative_url }})

```swift

(Text("Hello ") + Text(Image(systemName: "star")) + Text(" World!"))
    .foregroundStyle(.blue)
    .font(.largeTitle)
```

![how-to-insert-images-into-text-2~dark@2x]({{ '/assets/sessions/text/how-to-insert-images-into-text-2-dark-2x-44aa164f.webp' | relative_url }})

```swift

Text("Goodbye ") + Text(Image(systemName: "star")) + Text(" World!")
    .foregroundStyle(.blue)
    .font(.largeTitle)
```

![how-to-insert-images-into-text-3~dark@2x]({{ '/assets/sessions/text/how-to-insert-images-into-text-3-dark-2x-d4336e46.webp' | relative_url }})
