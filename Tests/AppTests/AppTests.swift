@testable import App
import XCTVapor

final class AppTests: XCTestCase {
    func testHelloWorld() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)

        try app.test(.GET, "hello") { res in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, "Hello, world!")
        }
    }
    
    func testFeature0() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)

        try app.test(.GET, "feature0") { res in
            debugPrint(res.status)
            XCTAssertEqual(res.status, .ok)
//            XCTAssertEqual(res.body.string, "Hello, world!")
        }
    }
}
