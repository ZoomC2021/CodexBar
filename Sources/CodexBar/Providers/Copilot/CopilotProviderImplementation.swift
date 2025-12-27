import CodexBarCore
import Foundation

struct CopilotProviderImplementation: ProviderImplementation {
    let id: UsageProvider = .copilot
    let style: IconStyle = .codex

    func makeFetch(context: ProviderBuildContext) -> @Sendable () async throws -> UsageSnapshot {
        {
            let probe = CopilotStatusProbe()
            let snap = try await probe.fetch()
            return snap.toUsageSnapshot()
        }
    }
}
