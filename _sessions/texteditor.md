---
title: TextEditor
track: controls
order: 170
summary: A short SwiftUI study on `TextEditor`.
apple_docs:
- label: Texteditor
  url: https://developer.apple.com/documentation/swiftui/texteditor
- label: How To Create Multi Line Editable Text With Texteditor
  url: https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-multi-line-editable-text-with-texteditor
homework:
- TextEditor 만들어보기
---
```swift

struct ContentView: View {
    @State private var profileText = "Enter your bio"

    var body: some View {
          TextEditor(text: $profileText)
             .foregroundStyle(.secondary)
             .padding(.horizontal)
    }
}
```

![how-to-create-multi-line-editable-text-with-texteditor-1~dark copy]({{ '/assets/sessions/texteditor/how-to-create-multi-line-editable-text-with-texteditor-1-dark-copy-12b16d50.jpg' | relative_url }})
