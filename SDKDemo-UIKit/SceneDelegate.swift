import UIKit
import SeatGeekSDK

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }

        window = UIWindow(windowScene: windowScene)

        SeatGeek.configure()

        // Set a listener to handle analytics.
        SeatGeek.setAnalyticsListener(self)

        // Set a callbacks object to handle type-safe user actions.
        var callbacks = SDKActionCallbacks()
        callbacks.authenticationCanceled = {
            print("[Action] Authentication canceled")
        }
        SeatGeek.setActionCallbacks(callbacks)

        let tabBarController = UITabBarController()

        // Displays a view controller with two options: either navigate by pushing the SeatGeek VC onto the navigation stack, or present the SeatGeek VC.
        let homeVC = UINavigationController(rootViewController: HomeViewController())

        // Displays the SeatGeek VC embedded as a child VC within the parent VC.
        let childVC = ChildViewController()

        // Displays the SeatGeek VC embedded within a UINavigationController.
        let seatGeekVC = SGKSDKMyTicketsController()
        let navVC = UINavigationController(rootViewController: seatGeekVC)
        seatGeekVC.navigationItem.rightBarButtonItem = seatGeekVC.transactionHistoryIconBarButtonItem()
        seatGeekVC.navigationItem.title = "SeatGeek"

        // Displays the SeatGeek VC as a plain VC.
        let tabVC = SGKSDKMyTicketsController()

        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "1.square.fill"), tag: 0)
        childVC.tabBarItem = UITabBarItem(title: "Child", image: UIImage(systemName: "2.square.fill"), tag: 1)
        navVC.tabBarItem = UITabBarItem(title: "Nav", image: UIImage(systemName: "3.square.fill"), tag: 2)
        tabVC.tabBarItem = UITabBarItem(title: "Tab", image: UIImage(systemName: "4.square.fill"), tag: 3)

        tabBarController.viewControllers = [
            homeVC,
            childVC,
            navVC,
            tabVC
        ]

        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

}

extension SceneDelegate: AnalyticsListener {
    func eventFired(_ event: SeatGeekSDK.SDKAnalyticsEvent) {
        print("[Event] Name: \(event.name)")
        print("[Event] Attributes: \(event.attributes)")
    }
}
