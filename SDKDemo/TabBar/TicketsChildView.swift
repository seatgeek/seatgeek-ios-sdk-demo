import SwiftUI
import SeatGeekSDK

struct TicketsChildView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        SeatGeek.configure()
        let seatGeekVC = SGKSDKMyTicketsController()
        let vc = UIViewController()
        vc.addChild(seatGeekVC)
        vc.view.addSubview(seatGeekVC.view)
        seatGeekVC.didMove(toParent: vc)
        return vc
    }

    func updateUIViewController(_ viewController: UIViewController, context: Context) { }
}
