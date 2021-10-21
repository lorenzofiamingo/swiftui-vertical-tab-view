# VerticalTabView 🔝
`VTabView` is a native way to display paged vertical content in SwiftUI. 

To work it makes use of the new iOS 14 `TabView` `PageTabViewStyle`.

## Usage

Use like any other TabView:

```swift
import VTabView

VTabView {
    Text("The First Tab")
        .tabItem {
            Image(systemName: "square.fill")
        }
    Text("Another Tab")
        .tabItem {
            Image(systemName: "circle.fill")
        }
    Text("The Last Tab")
        .tabItem {
            Image(systemName: "triangle.fill")
        }
}
.tabViewStyle(PageTabViewStyle())
```

You can also move index to the right
```swift
VTabView(indexPosition: .trailing) {
    ...
}
.tabViewStyle(PageTabViewStyle())
```
or remove it
```swift
VTabView {
    ...
}
.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
```

## Limitation

`TabView` bounces in all directions by default. 

`VTabView` is meant to be used with `.tabViewStyle(PageTabViewStyle())` but you can also use `DefaultTabViewStyle`. 
Only remember that tab items will not have the orientation you would probably like to obtain. 
A workaround for this would be in tabItem to not use `Text` but only an `Image` correctly transformed.

## Installation

1. In Xcode, open your project and navigate to **File** → **Swift Packages** → **Add Package Dependency...**
2. Paste the repository URL (`https://github.com/lorenzofiamingo/SwiftUI-VerticalTabView`) and click **Next**.
3. Click **Finish**.

## Another projects

[SharedObject 🍱](https://github.com/lorenzofiamingo/SwiftUI-SharedObject)
[CachedAsyncImage 🗃️](https://github.com/lorenzofiamingo/SwiftUI-CachedAsyncImage)

You can also move index to the right
