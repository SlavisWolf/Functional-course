
import SwiftUI
import PlaygroundSupport


struct Texts: View {
    
    var body: some View {
        VStack {
            Text("Hi")
            Text("how")
            Text("are")
            Text("you?")
        }
    }
}

@resultBuilder
struct TextBuilder {
    
    static func buildBlock(_ components: String...) -> String {
        components.joined(separator: "\n")
    }
}

func makeText(@TextBuilder _ content: () -> String) -> String {
    content()
}

let text = makeText {
    "My"
    "name"
    "is"
    "Ralph"
}
.uppercased()


print(text)


PlaygroundPage.current.setLiveView(Texts() )
