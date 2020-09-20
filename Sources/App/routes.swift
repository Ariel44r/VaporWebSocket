import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }

    app.get("feature0") { req -> [String] in
        let date = Date()
        debugPrint("")
        debugPrint("[new Request at: \(date.description(with: .current))]")
        let headerString: String = req.headers.map { "=> [\($0.name): \($0.value)]" }.reduce("", { $0 + $1 })
        return ["\(headerString)"]
    }
}
