import SwiftUI
import SeatGeekSDK

/// In UIViewControllerRepresentable, the UIViewController's navigation bar is managed by the SwiftUI NavigationView.
/// So, if SeatGeekView is embedded in a SwiftUI NavigationView, we need to ensure that SwiftUI is managing the navigation items properly.
/// Here's how we can ensure that the title and bar button items are configured in the SwiftUI layer, rather than only in the UIKit layer.
struct SeatGeekView: View {
    @State private var showingMoreOptions = false
    @State private var presenter = PresenterHolder()

    var body: some View {
        SeatGeekViewWrapper(presenter: presenter)
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
                    Button("Sign Out (End Web Session)") {
                        // Ending the web session presents a browser sheet, so the SDK needs a view controller to anchor it.
                        // SwiftUI has none, so we pass the SDK's own My Tickets controller, which is already on screen.
                        // A SwiftUI-friendly overload that doesn't need a view controller is coming in a future SDK release.
                        SeatGeek.logOut(from: presenter.controller, endingWebSession: true) { errorMessage in
                            if let errorMessage {
                                print("[Logout] Web session not ended: \(errorMessage)")
                            }
                        }
                    }
                }
            }
    }
}

/// Holds a weak reference to the SDK's My Tickets controller, so SwiftUI actions can present SDK UI from it.
final class PresenterHolder {
    weak var controller: UIViewController?
}

struct SeatGeekViewWrapper: UIViewControllerRepresentable {
    let presenter: PresenterHolder

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

        let controller = SGKSDKMyTicketsController()
        presenter.controller = controller
        return controller
    }

    func updateUIViewController(_ uiViewController: SGKSDKMyTicketsController, context: Context) { }
}

extension SeatGeekViewWrapper: AnalyticsListener {
    func eventFired(_ event: SeatGeekSDK.SDKAnalyticsEvent) {
        print("[Event] Name: \(event.name)")
        print("[Event] Attributes: \(event.attributes)")
    }
}
