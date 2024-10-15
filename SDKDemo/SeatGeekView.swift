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
                Button("Log Out", action: {
                    SeatGeek.logOut()
                })
            }
    }
}

struct SeatGeekViewWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> SGKSDKMyTicketsController {
        SeatGeek.configure()
        return SGKSDKMyTicketsController()
    }

    func updateUIViewController(_ uiViewController: SGKSDKMyTicketsController, context: Context) { }
}
