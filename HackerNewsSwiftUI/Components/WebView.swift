import SwiftUI
import WebKit

struct WebView: UIViewControllerRepresentable {
    let url: URL
    let webView = WKWebView()
    @Binding var showLoader: Bool

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> WebViewViewController {
        let webViewViewController = WebViewViewController()
        let request = URLRequest(url: url)
        webViewViewController.webView.load(request)
        webViewViewController.webView.navigationDelegate = context.coordinator
        return webViewViewController
    }

    func updateUIViewController(_ viewController: WebViewViewController, context: Context) {
        let request = URLRequest(url: url)
        viewController.webView.load(request)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView

        init(_ parent: WebView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.showLoader = false
        }
    }
}


class WebViewViewController: UIViewController {
    lazy var webView: WKWebView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(webView)
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
