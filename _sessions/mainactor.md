---
title: "@MainActor"
track: concurrency
order: 360
summary: A short SwiftUI study on `@MainActor`.
apple_docs:
- label: Mainactor
  url: https://developer.apple.com/documentation/swift/mainactor
- label: How To Use Mainactor To Run Code On The Main Queue
  url: https://www.hackingwithswift.com/quick-start/concurrency/how-to-use-mainactor-to-run-code-on-the-main-queue
homework:
- Add `@MainActor` to the top of the class
- Add `@MainActor` to a function
- Add `@MainActor` only to a property
- Try `Task { @MainActor in }`
- Try `await MainActor.run { }`
homework_ko:
- "@MainActor 를 class 최상단에 추가해보기"
- "@MainActor 를 func 에 추가해보기"
- "@MainActor 를 var 변수에만 추가해보기"
- Task { @MainActor in 만들어 보기
- await MainActor.run { } 만들어 보기
---
### class 전체

```swift
@MainActor
class AccountViewModel: ObservableObject {
    @Published var username = "Anonymous"
    @Published var isAuthenticated = false
}
```

### func 만

```swift
    @MainActor
    func requestKakaoOAuthToken() async throws -> OAuthToken {
        
    }
```

  
  
**var 만**

```swift
    @MainActor
    var shortVersion: String {
        normalizedVersion.components(separatedBy: " ").first ?? ""
    }
```

### 특정 부분만

```swift
   func request() {
        Task {
            // TODO~~~~
        
            await MainActor.run {
               // Mainthread 에서 실행할 것들
            }
        }
    }
```

### Task 전체가 MainActor

```swift
   func requestKakaoLogIn() {
        Task { @MainActor in
            
        }
    }
```
