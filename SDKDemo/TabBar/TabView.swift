import SwiftUI
import SeatGeekSDK

struct TicketsTabView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        SeatGeek.configure()
        return SGKSDKMyTicketsController()
    }

    func updateUIViewController(_ viewController: UIViewController, context: Context) { }
}
