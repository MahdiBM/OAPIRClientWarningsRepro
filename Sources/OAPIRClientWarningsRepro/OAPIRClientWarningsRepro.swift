import OpenAPIRuntime
import Foundation

actor Middleware: ClientMiddleware {
    func intercept(
        _ request: Request,
        baseURL: URL,
        operationID: String,
        /// Need to add `@Sendable`. Code-completion won't.
        next: @Sendable (Request, URL) async throws -> Response
    ) async throws -> Response {
        try await next(request, baseURL)
    }
}
