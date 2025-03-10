import SwiftUI
import SeatGeekSDK

/// In UIViewControllerRepresentable, the UIViewController's navigation bar is managed by the SwiftUI NavigationView.
/// So, if SeatGeekView is embedded in a SwiftUI NavigationView, we need to ensure that SwiftUI is managing the navigation items properly.
/// Here's how we can ensure that the title and bar button items are configured in the SwiftUI layer, rather than only in the UIKit layer.
struct SeatGeekView: View {
    @State private var showingMoreOptions = false

    var body: some View {
        SeatGeekViewWrapper()
            .navigationTitle("SeatGeek")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    showingMoreOptions = true
                } label: {
                    Image(systemName: "ellipsis")
                }
                .confirmationDialog("More", isPresented: $showingMoreOptions, titleVisibility: .hidden) {
                    Button("Transaction History") {
                        SeatGeek.openTransactionHistory()
                    }
                    Button("Sign Out") {
                        SeatGeek.logOut()
                    }
                }
            }
    }
}

struct SeatGeekViewWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> SGKSDKMyTicketsController {
        SeatGeek.configure()

        // Set a listener to handle analytics.
        SeatGeek.setAnalyticsListener(self)

        // Set a callbacks object to handle type-safe user actions.
        var callbacks = SDKActionCallbacks()
        callbacks.authenticationCanceled = {
            print("[Action] Authentication canceled")
        }
        SeatGeek.setActionCallbacks(callbacks)

        return SGKSDKMyTicketsController()
    }

    func updateUIViewController(_ uiViewController: SGKSDKMyTicketsController, context: Context) { }
}

extension SeatGeekViewWrapper: AnalyticsListener {
    func eventFired(_ event: SeatGeekSDK.SDKAnalyticsEvent) {
        print("[Event] Name: \(event.name)")
        print("[Event] Attributes: \(event.attributes)")
    }
}
