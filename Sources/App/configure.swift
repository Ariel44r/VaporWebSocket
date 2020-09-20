import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // register routes
    let binAddress = BindAddress.hostname("0.0.0.0", port: 8080)
    app.http.server.configuration = .init(address: binAddress)
    configureTLS(app)
    try routes(app)
}

public func configureTLS(_ app: Application) {
    let keyPath = "/Users/arielramirez/Documents/development/Vapor/Config/serverkey.pem"
    let certPath = "/Users/arielramirez/Documents/development/Vapor/Config/servercert.pem"
    try? app.http.server.configuration.tlsConfiguration = .forServer(certificateChain: [
        .certificate(.init(
            file: certPath,
            format: .pem
        ))
    ], privateKey: .file(keyPath))
}
