---
title: ShaderLibrary
track: graphics
order: 490
summary: A short SwiftUI study on `ShaderLibrary`.
apple_docs:
- label: '09 Metal'
  url: https://alexanderlogan.co.uk/blog/wwdc23/09-metal
- label: Applying Metal Shader To Text In Swiftui
  url: https://augmentedcode.io/2023/08/07/applying-metal-shader-to-text-in-swiftui/
- label: Shadertoy Start
  url: https://greentec.github.io/shadertoy-start/
- label: Aodblxw1zg
  url: https://www.desmos.com/calculator/aodblxw1zg
- label: Lphnjm3g27
  url: https://www.desmos.com/calculator/lphnjm3g27
- label: Pl585ejqgh
  url: https://www.desmos.com/calculator/pl585ejqgh
homework:
- Run the demo
- '<a href="/assets/sessions/shaderlibrary/swiftuishader-e98edeb4.zip">SwiftUIShader.zip</a>'
homework_ko:
- Demo 실행해 보기
- "[SwiftUIShader.zip]({{ '/assets/sessions/shaderlibrary/swiftuishader-e98edeb4.zip'
  | relative_url }})"
---
```swift
struct ContentView: View {
    
    // MARK: - Value
    // MARK: Private
    private let startDate = Date().timeIntervalSince1970
    
    
    // MARK: - View
    // MARK: Public
    var body: some View {
        TimelineView(.animation) { context in
            Text("Hello, world!")
                .font(.system(size: 110, weight: .bold))
                .foregroundStyle(ShaderLibrary.gradientEffect(.boundingRect, .float(context.date.timeIntervalSince1970 - startDate)))
        }
    }
}
```

**Shader.metal**

```swift
#include <metal_stdlib>
using namespace metal;

// Graident Effect Shader
[[[ stitchable ]] half4 gradientEffect(float2 position, float4 bounds, float seconds) {
    // Linear Gradient Colors
    // Alpha 는 필요 없으므로 float3를 통해 RGB 만 처리한다
    vector_float3 startColor = vector_float3(0.5, 0.39, 0.9);   // Color(red: 0.5, green: 0.39, blue: 0.9, alpha: 1)
    vector_float3 endColor = vector_float3(0.81, 0.51, 0.79);   // Color(red: 0.81, green: 0.51, blue: 0.79, alpha: 1)
    
    
    // StartColor - EndColor 의 차이를 Delta 라고 정의
    // Red    0.5  ~ 0.81   = 0.31
    // Green  0.39 ~ 0.51   = 0.11
    // Blue   0.9  ~ 0.79   = -0.11
    
    // Detal 값은 Start - End 의 차이만을 가지고 있다. (0.31, 0.11, -0.11)
    vector_float3 deltaColor = endColor - startColor;
    
    // 계산을 편하게 하기 위해서 화면의 좌표를 0~1 의 값으로 전환합니다. (Normalise coordinates)
    // 숫자 100 에 따라서 정규화 되는 비율이 달라집니다. 예를 들어, 작은 폰트에선 숫자를 작게 해야 그라데이션이 이쁘게 나오고 큰폰트는 숫자를 크게 해야 이쁘게 나옵니다.
    // 폰트가 크면 화면에서 차지하는 영역도 크기 때문에 그에 맞게 비율을 잘 조절해줘야 그라데이션이 잘 나옵니다.
    // vector_float2 uv = position / 100;   
    
    // 그래서 아래 처럼 자동으로 비율을 계산하도록 합니다. 
    vector_float2 uv = position / bounds.zw;

    // 이제 Time 값을 주어서 값이 실시간으로 변하게 합니다.
    // 이렇게 하면 움직이는 Animation 을 줄 수 있습니다. cos 그래프는 -1 ~ 1을 왔다갔다 하기 때문에  무한히 증가하는 값을 -1 ~ 1 에서만 값이 왔다 갔다 하도록 변환시키기 좋습니다.
    // 아래 공식을 Red 값만 예를 든다면 0.5(start) + (0 - 0.31)(Delta) * cos(시간 * 좌표)
    // 이렇게 하면 값이 시간에 따라 빨강은 0.5 ~ 0.81 값 사이를 왔다 갔다 합니다.
    // 동일한 방법으로 Green, Blue 도 처리합니다.
    vector_float3 color = startColor + deltaColor * (1 + cos(seconds + uv.xyx)) / 2;
    return half4(color.x, color.y, color.z, 1);
}
```

![Screenshot 2024-05-02 at 11.37.49 AM]({{ '/assets/sessions/shaderlibrary/screenshot-2024-05-02-at-11-37-49-am-a3df1c5c.png' | relative_url }})

![Screenshot 2024-05-09 at 2.01.14 PM]({{ '/assets/sessions/shaderlibrary/screenshot-2024-05-09-at-2-01-14-pm-a617d4ed.png' | relative_url }})

![Screenshot 2024-05-09 at 6.32.56 PM]({{ '/assets/sessions/shaderlibrary/screenshot-2024-05-09-at-6-32-56-pm-2655727a.png' | relative_url }})

<video controls preload="metadata">
  <source src="{{ '/assets/sessions/shaderlibrary/5098053288261366952-2024-04-29-10-53-07-bacfe9c1.mp4' | relative_url }}" type="video/mp4">
</video>

<video controls preload="metadata">
  <source src="{{ '/assets/sessions/shaderlibrary/demo-ab74c183.mov' | relative_url }}" type="video/quicktime">
</video>
