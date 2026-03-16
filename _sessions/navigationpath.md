---
title: NavigationPath
track: navigation
order: 580
summary: A short SwiftUI study on `NavigationPath`.
apple_docs:
- label: Navigationpath
  url: https://developer.apple.com/documentation/swiftui/navigationpath
homework:
- Recreate the sample
---
```swift

import SwiftUI

struct NavigationPathTestView: View {
    
    // MARK: - Value
    // MARK: Private
    @State private var path = [Int]()
    
    
    // MARK: - View
    // MARK: Public
    var body: some View {
        NavigationStack(path: $path) {
            contentView
                .toolbar { toolbarItem }
        }
    }
    
    
    // MARK: Private
    private var contentView: some View {
        List(1..<10) {
            NavigationLink("\($0)", value: $0)
        }
        .navigationDestination(for: Int.self) { item in
            Text("\(item)")
        }
    }
    
    private var toolbarItem: some ToolbarContent {
        ToolbarItem {
            Menu {
                singleSectionMenu
                multipleSectionMenu
           
            } label: {
                Image(systemName: "ellipsis")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            }
        }
    }
    
    private var singleSectionMenu: some View {
        Section {
            Button {
                path = [1]
                
            } label: {
                Label("1", systemImage: "rectangle.portrait.and.arrow.right.fill")
            }
        }
    }
    
    private var multipleSectionMenu: some View {
        Section {
            Button {
                path = [2, 4, 6]
        
            } label: {
                Label("2,4,6", systemImage: "arrow.right.page.on.clipboard")
            }
                
            Button(role: .destructive) {
                path = [1, 2, 3, 4, 5]
                
                Task {
                    try await Task.sleep(nanoseconds: 2_000_000_000)
                    path = [3]
                }
                
            } label: {
                Label("1~5 → 3", systemImage: "inset.filled.lefthalf.arrow.left.rectangle")
            }
        }
    }
}

#if DEBUG
#Preview {
    NavigationPathTestView()
}
#endif
```

<video controls preload="metadata">
  <source src="{{ '/assets/sessions/navigationpath/screen-recording-2025-07-30-at-4-46-50-pm-ca52b328.mov' | relative_url }}" type="video/quicktime">
</video>
