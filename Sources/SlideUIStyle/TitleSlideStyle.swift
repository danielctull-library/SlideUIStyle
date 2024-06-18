import SlideUI
import SwiftUI

extension SlideStyle where Self == TitleSlideStyle {
    static var title: Self { Self() }
}

struct TitleSlideStyle: SlideStyle {

    func makeBody(configuration: Configuration) -> some View {
        FontMultiplier { multiplier in

            VStack(spacing: multiplier * 50) {

                configuration.header
                    .font(.system(size: multiplier * 100, weight: .light, design: .rounded))
                    .foregroundColor(.orange)

                configuration.content
                    .font(.system(size: multiplier * 70, weight: .light, design: .rounded))

                configuration.footer
                    .font(.system(size: multiplier * 50, weight: .light, design: .rounded))
                    .padding(multiplier * 50)
            }
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(multiplier * 50)
        }
        .foregroundColor(.black)
        .background(.white)
    }
}
