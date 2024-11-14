import UIKit
import SeatGeekSDK

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 40
        stackView.translatesAutoresizingMaskIntoConstraints = false

        let navigateButton = UIButton(type: .system)
        navigateButton.setTitle("Navigate to My Tickets", for: .normal)
        navigateButton.addTarget(self, action: #selector(navigateToTickets), for: .touchUpInside)

        let presentButton = UIButton(type: .system)
        presentButton.setTitle("Show My Tickets Sheet", for: .normal)
        presentButton.addTarget(self, action: #selector(presentTicketsSheet), for: .touchUpInside)

        stackView.addArrangedSubview(navigateButton)
        stackView.addArrangedSubview(presentButton)

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        navigationItem.title = "Home"
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    @objc private func navigateToTickets() {
        let seatGeekVC = SGKSDKMyTicketsController()
        seatGeekVC.navigationItem.title = "SeatGeek"
        seatGeekVC.navigationItem.rightBarButtonItems = [
            seatGeekVC.transactionHistoryIconBarButtonItem(),
            seatGeekVC.moreOptionsIconBarButtonItem()
        ]
        navigationController?.pushViewController(seatGeekVC, animated: true)
    }

    @objc private func presentTicketsSheet() {
        let seatGeekVC = SGKSDKMyTicketsController()
        seatGeekVC.modalPresentationStyle = .pageSheet
        present(seatGeekVC, animated: true, completion: nil)
    }
}
