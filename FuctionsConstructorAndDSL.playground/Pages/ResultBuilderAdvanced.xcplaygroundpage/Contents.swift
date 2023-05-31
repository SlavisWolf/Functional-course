

@resultBuilder
struct TextBuilder {
    
    static func buildBlock(_ components: String...) -> String {
        let nonEmpty = components.filter({ !$0.isEmpty } )
        return nonEmpty.joined(separator: "\n")
    }
    
    static func buildOptional(_ component: String?) -> String {
        component ?? ""
    }
    
    static func buildEither(first component: String) -> String {
        component
    }
    
    static func buildEither(second component: String) -> String {
        component
    }
    
    static func buildArray(_ components: [String]) -> String {
        components.joined(separator: "-")
    }
}

func makeText(@TextBuilder _ content: () -> String) -> String {
    content()
}

let semaphore = false
let value = 5
let texts = ["Make", "Spain", "an", "empire", "again!", "🇪🇸🇪🇸🇪🇸"]

let text = makeText {
    "My"
    "name"
    if semaphore {
        "Yeahhhh"
    }
    "is"
    switch value {
    case 0: "zero"
    case 1: "one"
    case 2: "two"
    default: ""
    }
    "Ralph"
    makeText {
        "I'm"
        "an embedded"
        "string!!"
    }
    "Now"
    "Party"
    for value in texts {
        value
    }
    
}
.uppercased()


print(text)
