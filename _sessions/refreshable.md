---
title: Refreshable
track: controls
order: 50
summary: A short SwiftUI study on `Refreshable`.
apple_docs:
- label: Refreshable(action:)
  url: https://developer.apple.com/documentation/swiftui/view/refreshable(action:)
- label: How To Enable Pull To Refresh
  url: https://www.hackingwithswift.com/quick-start/swiftui/how-to-enable-pull-to-refresh
homework:
- Apply `Refreshable`
---
### Refreshable

```swift
List(mailbox.conversations) { conversation in
    ConversationCell(conversation)
}
.refreshable {
    await mailbox.fetch()
}
```

<details markdown="1">
<summary>refreshable(action:)</summary>

```swift
nonisolated
func refreshable(action: @escaping () async -> Void) -> some View
```

</details>

<details markdown="1">
<summary>Recipes.swift</summary>

```swift
var body: some View {
    scrollView
        .refreshable {
            await Task { await data.refresh() }.value
        }
}
```

<table>
  <tr>
    <th><pre><code class="language-swift">await data.refresh()</code></pre></th>
    <th><pre><code class="language-swift"> await Task { 
      await data.refresh() 
 }.value</code></pre></th>
  </tr>
  <tr>
    <td><video controls preload="metadata"><source src="{{ '/assets/sessions/refreshable/simulator-screen-recording-iphone-11-pro-2024-11-07-at-13-25-07-716214dd.mp4' | relative_url }}" type="video/mp4"></video></td>
    <td><video controls preload="metadata"><source src="{{ '/assets/sessions/refreshable/simulator-screen-recording-iphone-11-pro-2024-11-07-at-13-29-58-eef0cca7.mp4' | relative_url }}" type="video/mp4"></video></td>
  </tr>
</table>

</details>
