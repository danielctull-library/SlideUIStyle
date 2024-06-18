import SlideUI
import SwiftUI
import XcodeCodeHighlighting

extension SlideStyle where Self == ContentSlideStyle {

    public static func content(alignment: Alignment) -> Self {
        Self(alignment: alignment)
    }
}

public struct ContentSlideStyle: SlideStyle {

    let alignment: Alignment

    struct SlideWrapper: View {

        let alignment: Alignment
        let configuration: SlideConfiguration
        @Environment(\.scale) var scale

        var body: some View {
            VStack {

                configuration.header
                    .font(.system(size: scale * 24, weight: .light, design: .rounded))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.orange)

                configuration.content
                    .font(.system(size: scale * 18, weight: .light, design: .rounded))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)

                configuration.footer
                    .font(.system(size: scale * 12, weight: .light, design: .rounded))
            }
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(scale * 18)
            .codeStyle(.fitting(idealSize: scale * 14))
            .codeHighlighting(.xcodeClassicLight)
        }
    }

    public func makeBody(configuration: Configuration) -> some View {
        Scale {
            SlideWrapper(alignment: alignment, configuration: configuration)
        }
        .foregroundColor(.black)
        .background(.white)
    }
}

// MARK: - FontMultiplier

struct FontMultiplier<Content: View>: View {

    let content: (CGFloat) -> Content

    var body: some View {
        GeometryReader { proxy in
            content(proxy.size.height / 1000)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

// MARK: - Scale

fileprivate struct ScaleKey: EnvironmentKey {
    static var defaultValue: Double = 1
}

extension EnvironmentValues {
    var scale: Double {
        get { self[ScaleKey.self] }
        set { self[ScaleKey.self] = newValue }
    }
}

struct Scale<Content: View>: View {

    @ViewBuilder let content: () -> Content

    var body: some View {
        GeometryReader { proxy in
            content().environment(\.scale, proxy.size.height / 300)
        }
    }
}
