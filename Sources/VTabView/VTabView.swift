//
//  Created by Lorenzo Fiamingo on 04/11/20.
//
import SwiftUI

/// A view that switches between multiple child views using interactive user
/// interface elements.
///
/// To create a user interface with tabs, place views in a `TabView` and apply
/// the ``View/tabItem(_:)`` modifier to the contents of each tab. The following
/// creates a tab view with three paged vertical tabs:
///
///     VTabView {
///         Text("The First Tab")
///             .tabItem {
///                 Image(systemName: "square.fill")
///                 Text("First")
///             }
///         Text("Another Tab")
///             .tabItem {
///                 Image(systemName: "circle.fill")
///                 Text("Second")
///             }
///         Text("The Last Tab")
///             .tabItem {
///                 Image(systemName: "triangle.fill")
///                 Text("Third")
///             }
///     }
///     .font(.headline)
///     .tabViewStyle(PageTabViewStyle())
///
/// Tab views only support tab items of type ``Text``, ``Image``, or an image
/// followed by text. Passing any other type of view results in a visible but
/// empty tab item.
@available(iOS 14.0, *)
public struct VTabView<Content, SelectionValue>: View where Content: View, SelectionValue: Hashable {
    
    private var selection: Binding<SelectionValue>?
    
    private var indexPosition: IndexPosition
    
    private var content: () -> Content
    
    /// Creates an instance that selects from content associated with
    /// `Selection` values.
    public init(selection: Binding<SelectionValue>?, indexPosition: IndexPosition = .leading, @ViewBuilder content: @escaping () -> Content) {
        self.selection = selection
        self.indexPosition = indexPosition
        self.content = content
    }
    
    private var flippingAngle: Angle {
        switch indexPosition {
        case .leading:
            return .degrees(0)
        case .trailing:
            return .degrees(180)
        }
    }
    
    public var body: some View {
        GeometryReader { proxy in
            TabView(selection: selection) {
                Group {
                    content()
                }
                .frame(width: proxy.size.width, height: proxy.size.height)
                .rotationEffect(.degrees(-90))
                .rotation3DEffect(flippingAngle, axis: (x: 1, y: 0, z: 0))
            }
            .frame(width: proxy.size.height, height: proxy.size.width)
            .rotation3DEffect(flippingAngle, axis: (x: 1, y: 0, z: 0))
            .rotationEffect(.degrees(90), anchor: .topLeading)
            .offset(x: proxy.size.width)
        }
    }
    
    public enum IndexPosition {
        case leading
        case trailing
    }
}

@available(iOS 14.0, *)
extension VTabView where SelectionValue == Int {
    
    public init(indexPosition: IndexPosition = .leading, @ViewBuilder content: @escaping () -> Content) {
        self.selection = nil
        self.indexPosition = indexPosition
        self.content = content
    }
}
