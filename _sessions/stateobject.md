---
title: "@StateObject"
track: state
order: 300
summary: A short SwiftUI study on `@StateObject`.
apple_docs:
- label: Stateobject
  url: https://developer.apple.com/documentation/swiftui/stateobject
homework:
- Replace `ObservedObject` with `StateObject`
---
### View

```swift
struct ContactsView: View {
    @StateObject private var data = ContactData()
    
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

![Screenshot 2023-11-14 at 4.39.34 PM]({{ '/assets/sessions/stateobject/screenshot-2023-11-14-at-4-39-34-pm-ca0c53cd.png' | relative_url }})
