import SlideUI
import SwiftUI

extension SlideStyle where Self == TitleSlideStyle {
    public static var title: Self { Self() }
}

public struct TitleSlideStyle: SlideStyle {

    @Environment(\.presentationSize.scale) private var scale

    public func makeBody(configuration: Configuration) -> some View {
        VStack(spacing: scale) {

            configuration.header
                .font(.system(size: 32 * scale, weight: .light, design: .rounded))
                .foregroundColor(.orange)

            configuration.content
                .font(.system(size: 24 * scale, weight: .light, design: .rounded))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay {
            configuration.footer
                .font(.system(size: 16 * scale, weight: .light, design: .rounded))
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .multilineTextAlignment(.center)
        .padding(8 * scale)
        .foregroundColor(.black)
        .background(.white)
    }
}
