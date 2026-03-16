---
title: NavigationView
track: navigation
order: 70
summary: A short SwiftUI study on `NavigationView`.
apple_docs:
- label: Building Lists And Navigation
  url: https://developer.apple.com/tutorials/swiftui/building-lists-and-navigation
homework:
- Add `NavigationView`
- Add `NavigationTitle`
- Use `NavigationLink` to move to a detail view
- '<a href="/assets/sessions/navigation-view/web-edca3d80.zip">Web.zip</a>'
homework_ko:
- NavigationView 추가하기
- NavigationTitle 추가하기
- NavigationLink 이용해서 상세화면으로 이동하는 거 해보기
- "[Web.zip]({{ '/assets/sessions/navigation-view/web-edca3d80.zip' | relative_url
  }})"
---
```swift
struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List(landmarks) { landmark in
                LandmarkRow(landmark: landmark)
            }
        }
    }
}
```

![Screenshot 2023-07-07 at 4.45.50 PM]({{ '/assets/sessions/navigation-view/screenshot-2023-07-07-at-4-45-50-pm-1fb0f79c.png' | relative_url }})

### Navigation

```swift
struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List(landmarks) { landmark in
                LandmarkRow(landmark: landmark)
            }
            .navigationTitle("Landmarks")
        }
    }
}
```

![Screenshot 2023-07-07 at 4.46.03 PM]({{ '/assets/sessions/navigation-view/screenshot-2023-07-07-at-4-46-03-pm-93172744.png' | relative_url }})

### NavigationLink

- [Building Lists and Navigation](https://developer.apple.com/tutorials/swiftui/building-lists-and-navigation)

- [NavigationLink](https://developer.apple.com/documentation/swiftui/navigationlink)

  ```swift

  struct LandmarkList: View {
      var body: some View {
          NavigationView {
              List(landmarks) { landmark in

                  // 상세 화면으로 이동
                  NavigationLink {
                      Text("Detail")

                  } label: {
                      LandmarkRow(landmark: landmark)
                  }
              }
              .navigationTitle("Landmarks")
          }
      }
  }
  ```

  ```swift
   NavigationLink(destination: DetailView(detail: data.detail),
                  isActive: $data.isDetailViewActive) {   // View 전환 Trigger

          ItemView()   // Cell
  }
  ```
