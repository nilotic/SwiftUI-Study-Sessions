---
title: GlassEffectID
track: graphics
order: 680
summary: A short SwiftUI study on `GlassEffectID`.
apple_docs:
- label: Glasseffectid( :in:)
  url: https://developer.apple.com/documentation/swiftui/view/glasseffectid(_:in:)?changes=_2
- label: Landmarks Building An App With Liquid Glass
  url: https://developer.apple.com/documentation/SwiftUI/Landmarks-Building-an-app-with-Liquid-Glass
homework:
- Recreate the sample
---
```swift
 // Adds an identifier to the button for animation.
  Button {
                   
  } label: {
      ToggleBadgesLabel(isExpanded: isExpanded)
          .frame(width: 44, height: 44)
  }
  .glassEffectID("togglebutton", in: namespace)
```

<table>
  <tr>
    <th><p>glassEffectID (OFF)</p></th>
    <th><p>glassEffectID  (ON)</p></th>
  </tr>
  <tr>
    <td><video controls preload="metadata"><source src="{{ '/assets/sessions/glasseffectid/2025-11-13-5-19-42-7203b8e9.mov' | relative_url }}" type="video/quicktime"></video></td>
    <td><video controls preload="metadata"><source src="{{ '/assets/sessions/glasseffectid/2025-11-13-5-20-04-9fa7d314.mov' | relative_url }}" type="video/quicktime"></video></td>
  </tr>
</table>
