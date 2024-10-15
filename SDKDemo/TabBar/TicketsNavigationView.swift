import SwiftUI
import SeatGeekSDK

struct TicketsNavigationView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        SeatGeek.configure()
        let seatGeekVC = SGKSDKMyTicketsController()
        let navVC = UINavigationController(rootViewController: seatGeekVC)
        seatGeekVC.navigationItem.rightBarButtonItem = seatGeekVC.transactionHistoryIconBarButtonItem()
        seatGeekVC.navigationItem.title = "SeatGeek"
        return navVC
    }

    func updateUIViewController(_ viewController: UIViewController, context: Context) { }
}
