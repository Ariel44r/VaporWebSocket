import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }

    app.get("feature0") { req -> String in
        debugPrint(req.headers)
        return "Por acá se regresan los headers:\n\n\n\n\n\n \(req.headers)"
    }
}
