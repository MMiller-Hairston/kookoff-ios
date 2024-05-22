import SwiftUI

struct HomeView: View { // TODO: Rename to ContestsView
    @EnvironmentObject var authManager: AuthManager
    
    @State private var showLoginSheet = false
    
    var contests = [
        Contest(id: "1", name: "Sunday Breakfast", imageUrl: "swiftui-button"),
        Contest(id: "2", name: "Steak & Eggs", imageUrl: "swiftui-button"),
        Contest(id: "3", name: "Potato Side Dish", imageUrl: "swiftui-button"),
        Contest(id: "4", name: "Delicious Salad", imageUrl: "swiftui-button"),
        Contest(id: "4", name: "Weekday Brunch", imageUrl: "swiftui-button"),
    ]
    
    var body: some View {
        VStack {
            HStack {
                if authManager.authState == .signedIn {
                    Text(authManager.user?.displayName ?? "")
                                .font(.headline)
                } else {
                    Text("Sign in to save your data").font(.headline)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(12)
            .padding(.horizontal)
            
            NavigationView {
                VStack(alignment: .leading) {
                    CardView(image: "flutter-app", title: "Order one phone,\n get one free!")
                    Spacer()
                }.navigationTitle("Contests")
            }
        }
    }
    
    func signOut() {
        Task {
            do {
                try await authManager.signOut()
            }
            catch {
                print("SignOutError: \(error)")
            }
        }
    }
}

#Preview {
    HomeView().environmentObject(AuthManager())
}
