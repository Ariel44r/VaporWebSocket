import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // register routes
    app.http.server.configuration.hostname = "192.168.100.28"
    app.http.server.configuration.port = 8000
    try routes(app)
}
