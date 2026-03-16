---
title: Actor
track: concurrency
order: 350
summary: A short SwiftUI study on `Actor`.
apple_docs:
- label: Swift Actors
  url: https://www.swiftbysundell.com/articles/swift-actors/
- label: Swift Actor 뿌시기 249aee2b732d
  url: https://sujinnaljin.medium.com/swift-actor-%EB%BF%8C%EC%8B%9C%EA%B8%B0-249aee2b732d
homework:
- Code 복사해서 Actor 만들어 보기
---
<video controls preload="metadata">
  <source src="{{ '/assets/sessions/actor/123123-2793d8de.mov' | relative_url }}" type="video/quicktime">
</video>

### Actor

```swift
class UserStorage {
    private var users = [User.ID: User]()

    func store(_ user: User) {
        users[user.id] = user
    }

    func user(withID id: User.ID) -> User? {
        users[id]
    }
}
```

### Queue

```swift
class UserStorage {
    private var users = [User.ID: User]()
    private let queue = DispatchQueue(label: "UserStorage.sync")

    func store(_ user: User) {
        // ------- //
        queue.async {
            self.users[user.id] = user
        }
    }

    func loadUser(withID id: User.ID, handler: @escaping (User?) -> Void) {
        // ------- //
        queue.async {
            handler(self.users[id])
        }
    }
}
```

  
  
**Actor**

```swift
// -- //
actor UserStorage {
    private var users = [User.ID: User]()

    func store(_ user: User) {
        users[user.id] = user
    }

    func user(withID id: User.ID) -> User? {
        users[id]
    }
}
```

```swift
class UserLoader {
    private let storage: UserStorage
    private let urlSession: URLSession
    private let decoder = JSONDecoder()

    init(storage: UserStorage, urlSession: URLSession = .shared) {
        self.storage = storage
        self.urlSession = urlSession
    }

    func loadUser(withID id: User.ID) async throws -> User {
        // ------ //
        if let storedUser = await storage.user(withID: id) {  
            return storedUser
        }

        let url = URL.forLoadingUser(withID: id)
        let (data, _) = try await urlSession.data(from: url)
        let user = try decoder.decode(User.self, from: data)
        
        // ------- //
        await storage.store(user)

        return user
    }
}
```
