---
title: Transaction
track: animation
order: 640
summary: A short SwiftUI study on `Transaction`.
apple_docs:
- label: Transaction
  url: https://developer.apple.com/documentation/swiftui/transaction
- label: How To Override Animations With Transactions
  url: https://www.hackingwithswift.com/quick-start/swiftui/how-to-override-animations-with-transactions
homework:
- Recreate the sample
---
```swift
    Button("Toggle Zoom") {
        var transaction = Transaction(animation: .linear)
        transaction.disablesAnimations = true

        withTransaction(transaction) {
            isZoomed.toggle()
        }
    }
```

<video controls preload="metadata">
  <source src="{{ '/assets/sessions/transaction/how-to-override-animations-with-transactions-2-dark-69c5242e.mp4' | relative_url }}" type="video/mp4">
</video>

```swift

extension NotificationBannerModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .fullScreenCover(isPresented: $isPresented) {
                NotificationBanner()
            }
            .transaction { $0.disablesAnimations = true }
    }
}
```
