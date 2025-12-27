import Foundation
import Testing
@testable import CodexBarCore

@Suite
struct CopilotStatusProbeTests {
    @Test
    func parsesUsagePercentPlanAndLogin() throws {
        let html = """
        <html>
        <head>
        <title>Copilot</title>
        <meta name="user-login" content="octocat">
        </head>
        <body>
        <strong>GitHub Copilot Pro is active for your account</strong>
        <h3>Usage</h3>
        <div>
          <span data-view-component="true" class="mb-1 text-bold"> Premium requests </span>
          <div data-view-component="true"> 12.5% </div>
        </div>
        </body>
        </html>
        """

        let probe = CopilotStatusProbe()
        let snapshot = try probe.parseUsageHTML(html)

        #expect(snapshot.primary.usedPercent == 12.5)
        #expect(snapshot.plan == "Copilot Pro")
        #expect(snapshot.accountLogin == "octocat")
    }
}
