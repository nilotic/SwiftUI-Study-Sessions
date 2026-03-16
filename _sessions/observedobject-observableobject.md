---
title: "@ObservedObject,  @ObservableObject"
track: state
order: 290
summary: A short SwiftUI study on `@ObservedObject,  @ObservableObject`.
apple_docs:
- label: Observableobject
  url: https://developer.apple.com/documentation/combine/observableobject
- label: Observedobject
  url: https://developer.apple.com/documentation/swiftui/observedobject
homework:
- Build a simple view with `ObservedObject` and `ObservableObject`
homework_ko:
- ObservedObject, ObservableObject 만들어서 간단한 화면 만들어보기
---
### View

```swift
struct ContactsView: View {
    @ObservedObject private var data = ContactData()
    
    var body: some View {
        List(data.contacts, id: \.self) { contact in
            Text(contact)
                .onTapGesture {
                    data.select(contact: contact)
                }
        }
    }
}
```

### Data

```swift
final class ContactData: ObservableObject {
    @Published var contacts = ["A", "B", "C", "D", "E"]
    @Published var selectedContact = ""
    
    func select(contact: String) {
        selectedContact = contact
    }
}
```

![Screenshot 2023-11-14 at 4.39.34 PM]({{ '/assets/sessions/observedobject-observableobject/screenshot-2023-11-14-at-4-39-34-pm-ca0c53cd.png' | relative_url }})
