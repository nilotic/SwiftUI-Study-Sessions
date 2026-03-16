---
title: "@Environment"
track: state
order: 320
summary: A short SwiftUI study on `@Environment`.
apple_docs:
- label: Environmentkey
  url: https://developer.apple.com/documentation/swiftui/environmentkey
- label: Environmentvalues
  url: https://developer.apple.com/documentation/swiftui/environmentvalues/
- label: Environment( :)
  url: https://developer.apple.com/documentation/realitykit/model3d/environment(_:)/
homework:
- Create custom `@EnvironmentKey` / `EnvironmentValues`
- Use `.environment` to pass only the values you need
---
### Key

```swift
struct SelectedContactKey: EnvironmentKey {
    
    static let defaultValue = ""
}
```

### Value

```swift
extension EnvironmentValues {
    
    var selectedContact: String {
        get { self[SelectedContactKey.self] }
        set { self[SelectedContactKey.self] = newValue }
    }
}
```

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
                    // 특정 값만 연결
                    .environment(\.selectedContact, data.selectedContact)
                   

                   // Data 통으로 연결!!
                   // .environmentObject(data) 
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
    // 필요한 값만 연결
    @Environment(\.selectedContact) private var selectedContact

    // Data 통으로 연결
    // @EnvironmentObject private var data: ContactData
    
    
    // MARK: - View
    // MARK: Public
    var body: some View {
        // 간단해짐
        Text(selectedContact)   
            .presentationDetents([.medium])

      // Text(data.selectedContact)
    }
}
```

![Screenshot 2023-11-24 at 10.41.35 AM]({{ '/assets/sessions/environment/screenshot-2023-11-24-at-10-41-35-am-1939c4b7.png' | relative_url }})

<video controls preload="metadata">
  <source src="{{ '/assets/sessions/environment/screen-recording-2023-11-24-at-10-37-40-am-75919542.mov' | relative_url }}" type="video/quicktime">
</video>
