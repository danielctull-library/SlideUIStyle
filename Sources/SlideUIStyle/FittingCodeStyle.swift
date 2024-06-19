import SlideUI
import SwiftUI

extension CodeStyle where Self == FittingCodeStyle {

    static func fitting(
        idealSize: CGFloat,
        weight: Font.Weight = .regular,
        design: Font.Design = .monospaced
    ) -> Self {
        fitting(idealSize: idealSize) {
            .system(size: $0, weight: weight, design: design)
        }
    }

    static func fitting(idealSize: CGFloat, font: @escaping (CGFloat) -> Font) -> Self {
        FittingCodeStyle(idealSize: idealSize, font: font)
    }
}

struct FittingCodeStyle: CodeStyle {
    fileprivate let idealSize: CGFloat
    fileprivate let font: (CGFloat) -> Font

    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 0) {
            ViewThatFits(range: 3...max(4, idealSize)) { size in
                configuration.code
                    .lineSpacing(size / 8)
                    .font(font(size))
            }
            Spacer()
            configuration.preview
                .font(nil)
                .foregroundColor(nil)
            Spacer()
        }
    }
}

extension ViewThatFits {

    /// Provides a variant of ViewThatFits that fits the content of the largest
    /// size in the given range.
    ///
    /// - Parameters:
    ///   - range: The range of sizes to evaluate.
    ///   - content: Content for the given size.
    public init<C: View, Size: BinaryFloatingPoint>(
        range: ClosedRange<Size>,
        @ViewBuilder content: @escaping (Size) -> C
    ) where Content == ReversedRangeView<C, Size> {
        self.init {
            ReversedRangeView(range: range, content: content)
        }
    }
}

public struct ReversedRangeView<Content: View, Bound: BinaryFloatingPoint>: View {

    private let range: ClosedRange<Int>
    private let content: (Bound) -> Content

    init(range: ClosedRange<Bound>, content: @escaping (Bound) -> Content) {
        self.range = (Int(ceil(range.lowerBound))...Int(floor(range.upperBound)))
        self.content = content
    }

    public var body: some View {
        ForEach(range.reversed(), id: \.self) { size in
            content(Bound(size))
        }
    }
}
