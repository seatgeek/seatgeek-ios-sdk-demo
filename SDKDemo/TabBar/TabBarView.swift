import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            // Displays a view with two options: either navigate by pushing the SeatGeek view onto the navigation stack, or present the SeatGeek view.
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "1.square.fill")
                }

            // Displays the SeatGeek view embedded as a child view controller within the parent view controller.
            TicketsChildView()
                .tabItem {
                    Label("Child", systemImage: "2.square.fill")
                }

            // Displays the SeatGeek view embedded within a UINavigationController.
            TicketsNavigationView()
                .tabItem {
                    Label("Nav", systemImage: "3.square.fill")
                }

            // Displays the SeatGeek view as a plain view
            TicketsTabView()
                .tabItem {
                    Label("Tab", systemImage: "4.square.fill")
                }
        }
    }
}

#Preview {
    TabBarView()
}
