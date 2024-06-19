import SlideUI
import SwiftUI
import XcodeCodeHighlighting

extension SlideStyle where Self == ContentSlideStyle {

    public static func content(alignment: Alignment = .leading) -> Self {
        Self(alignment: alignment)
    }
}

public struct ContentSlideStyle: SlideStyle {

    @Environment(\.presentationSize.scale) private var scale
    let alignment: Alignment

    public func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.header
                .font(.system(size: 24 * scale, weight: .light, design: .rounded))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.orange)

            configuration.content
                .font(.system(size: 18 * scale, weight: .light, design: .rounded))
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)

            configuration.footer
                .font(.system(size: 12 * scale, weight: .light, design: .rounded))
        }
        .multilineTextAlignment(.leading)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(8 * scale)
        .codeStyle(.fitting(idealSize: 16 * scale))
        .codeHighlighting(.xcodeClassicLight)
        .foregroundColor(.black)
        .background(.white)
    }
}
