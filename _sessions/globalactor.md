---
title: "@GlobalActor"
track: concurrency
order: 370
summary: A short SwiftUI study on `@GlobalActor`.
apple_docs:
- label: Globalactor
  url: https://developer.apple.com/documentation/swift/globalactor
- label: 9 Global Actors
  url: https://www.kodeco.com/books/modern-concurrency-in-swift/v1.0/chapters/9-global-actors
- label: How To Use Mainactor And Globalactor D5fd3794903d
  url: https://blog.devgenius.io/how-to-use-mainactor-and-globalactor-d5fd3794903d
homework:
- "@GlobalActor 를 사용하여 나만의 Actor 만들기"
- 나만의 Actor 로 func 에 선언해 보기
---
![Screenshot 2024-01-09 at 7.02.24 AM]({{ '/assets/sessions/globalactor/screenshot-2024-01-09-at-7-02-24-am-db01319f.png' | relative_url }})

![Screenshot 2024-01-09 at 7.03.07 AM]({{ '/assets/sessions/globalactor/screenshot-2024-01-09-at-7-03-07-am-9a9d84c3.png' | relative_url }})

  
  
**Global Actor .swift**

```swift
public protocol GlobalActor {

}
```

###

**MainActor .swift**

```swift
@globalActor
final public actor MainActor : GlobalActor {

}
```

### UserActor

```swift
@globalActor actor UserActor {
    static var shared = UserActor()
}
```

### Global Actor 활용

```swift
@MainActor
final class UserData {

    // 사진 불러오는 API 통신를 UserActor 에서 실행하도록 함
    @UserActor
    func reqquestProfilePhoto() async {
        print("Fetch the profile photo done on Thread: \(Thread.current)")
        
        await updateProfilePhoto()
    }

    func updateProfilePhoto() {
        print("Update the profile photo done on Thread: \(Thread.current)")
    }
}
```

> Fetch the profile photo done on Thread: GlobalUpdate the profile photo done on Thread: Main
