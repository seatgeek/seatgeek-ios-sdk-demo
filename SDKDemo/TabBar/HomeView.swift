import SwiftUI
import SeatGeekSDK

struct HomeView: View {
    @State private var showingSheet = false

    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                // Push
                NavigationLink(destination: SeatGeekView()) {
                    Text("Navigate to My Tickets")
                }

                // Present sheet
                Button("Show My Tickets Sheet") {
                    showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    SeatGeekView()
                }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    HomeView()
}
