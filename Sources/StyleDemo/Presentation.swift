import SlideUI
import SlideUIStyle
import SwiftUI

@main
struct TheApp: App {
    var body: some Scene {
        Presentation {

            Slide {
                Text("Daniel Tull")
            } header: {
                Text("Creating a Design System with SwiftUI")
            } footer: {
                Text("Footer")
            } notes: {
                Text("Notes")
            }
            .slideStyle(.title)

            Slide(header: "Code") {
                Text("""
                    This is a block of text.
                    This is a block of text.
                    This is a block of text.
                    This is a block of text.
                    """)
            }

            Slide(header: "Code") {
                #Code {
                    struct Foo {
                        let string: String
                        let integer: Int
                    }

                    let _ = Foo(string: "string", integer: 1234)
                }
            }

            Slide(header: "Code Preview") {
                #Code {
                    Button("Press me!") {
                    }
                }
            }

            Slide(header: "Code Preview") {
                #Code {
                    Color.blue.frame(
                        width: 50,
                        height: 50
                    )
                }
            }

            Slide(header: "Code Preview") {
                #Code {
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.red)
                }
            }
        }
        .slideStyle(.content(alignment: .leading))
    }
}
