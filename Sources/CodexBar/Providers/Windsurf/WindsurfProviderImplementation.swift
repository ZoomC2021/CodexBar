import CodexBarCore
import CodexBarMacroSupport

@ProviderImplementationRegistration
struct WindsurfProviderImplementation: ProviderImplementation {
    let id: UsageProvider = .windsurf
    let style: IconStyle = .windsurf
}
