import UIKit
import SeatGeekSDK

class ChildViewController: UIViewController {
    private let childViewController = SGKSDKMyTicketsController()

    override func viewDidLoad() {
        super.viewDidLoad()

        add(child: childViewController)
        setupLayout()
    }

    private func add(child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    private func setupLayout() {
        childViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            childViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            childViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            childViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            childViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
