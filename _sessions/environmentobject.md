---
title: "@EnvironmentObject"
track: state
order: 310
summary: A short SwiftUI study on `@EnvironmentObject`.
apple_docs:
- label: Environmentobject
  url: https://developer.apple.com/documentation/swiftui/environmentobject
- label: How To Use Environmentobject To Share Data Between Views
  url: https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-environmentobject-to-share-data-between-views
homework:
- Declare values with `@EnvironmentObject`
- Pass values with `.environmentObject`
---
### View

```swift
struct ContactsView: View {
    
    // MARK: - Value
    // MARK: Private
    @StateObject private var data = ContactData()
    
    
    // MARK: - View
    // MARK: Public
    var body: some View {
        NavigationView {
            List(data.contacts, id: \.self) { contact in
                Text(contact)
                    .onTapGesture {
                        data.select(contact: contact)
                    }
            }
            .sheet(isPresented: $data.isFilterPresented) {
                FilterView()
                    .environmentObject(data) // Data 통으로 연결!! 
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
    @Published var isFilterPresented = false
    
    func select(contact: String) {
        selectedContact = contact
        isFilterPresented = true
    }
}
```

  
  
  
**Filter**

```swift
struct FilterView: View {
    
    // MARK: - Value
    // MARK: Private
    @EnvironmentObject private var data: ContactData
    
    
    // MARK: - View
    // MARK: Public
    var body: some View {
        Text(data.selectedContact)
            .presentationDetents([.medium])
    }
}
```

![Screenshot 2023-11-24 at 10.41.35 AM]({{ '/assets/sessions/environmentobject/screenshot-2023-11-24-at-10-41-35-am-1939c4b7.png' | relative_url }})

<video controls preload="metadata">
  <source src="{{ '/assets/sessions/environmentobject/screen-recording-2023-11-24-at-10-37-40-am-75919542.mov' | relative_url }}" type="video/quicktime">
</video>
