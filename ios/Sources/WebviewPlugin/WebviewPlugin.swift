import Capacitor
import Foundation

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(WebviewPlugin)
public class WebviewPlugin: CAPPlugin, CAPBridgedPlugin {
    public let jsName = "Webview"
    public let identifier = "WebviewPlugin"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "echo", returnType: CAPPluginReturnPromise)
    ]
    private let implementation = Webview()

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }
    @objc override public func load() {
        self.bridge?.webView?.scrollView.bounces = true
    }
}
