---
title: TextField
track: controls
order: 180
summary: A short SwiftUI study on `TextField`.
apple_docs:
- label: Textfield
  url: https://developer.apple.com/documentation/swiftui/textfield
- label: Swiftui Multiline Textfield
  url: https://sarunw.com/posts/swiftui-multiline-textfield/
homework:
- Build a `TextField`
---
```swift
@State private var username = ""
@FocusState private var emailFieldIsFocused = false

var body: some View {
    TextField("User name (email address)", text: $username)
    .focused($emailFieldIsFocused)
    .onSubmit {
        validate(name: username)
    }
    .textInputAutocapitalization(.never)
    .disableAutocorrection(true)
    .border(.secondary)

    Text(username)
        .foregroundColor(emailFieldIsFocused ? .red : .blue)
}
```

![SwiftUI-TextField-echoText~dark@2x]({{ '/assets/sessions/textfield/swiftui-textfield-echotext-dark-2x-7d81b5db.png' | relative_url }})

```swift
struct MultilineTextFieldExample: View {
    @State var address = ""
    var body: some View {        
        TextField("Address", text: $address, axis: .vertical)

            .textFieldStyle(.roundedBorder)
            .padding()
    }
}
```

![swiftui-multiline-textfield-axis-vertical]({{ '/assets/sessions/textfield/swiftui-multiline-textfield-axis-vertical-5bbdd474.gif' | relative_url }})
