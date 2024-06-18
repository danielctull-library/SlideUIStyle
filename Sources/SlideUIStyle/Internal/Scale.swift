import SwiftUI

extension View {
    func measureScale(_ scale: Binding<Double>) -> some View {
        modifier(MeasureScale(scale: scale))
    }
}

private struct MeasureScale: ViewModifier {
    @Binding var scale: Double
    func body(content: Content) -> some View {
        content.measure { size in
            scale = size.height / 250
        }
    }
}

extension View {
    fileprivate func measure(_ action: @escaping (CGSize) -> Void) -> some View {
        modifier(Measure(perform: action))
    }
}

private struct Measure: ViewModifier {

    private struct SizeKey: PreferenceKey {
        static var defaultValue: CGSize { .zero }
        static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
            value = nextValue()
        }
    }

    let perform: (CGSize) -> Void

    func body(content: Content) -> some View {
        content
            .overlay {
                GeometryReader { geometry in
                    Color.clear.preference(key: SizeKey.self, value: geometry.size)
                }
            }
            .onPreferenceChange(SizeKey.self, perform: perform)
    }
}
