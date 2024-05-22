import SwiftUI
import FirebaseAuth
import FirebaseCore

struct HomeView: View { // TODO: Rename to ContestsView
    @EnvironmentObject var authManager: AuthManager
    
    @State private var showLoginSheet = false
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 16) {
                VStack(alignment: .leading) {
                    if authManager.authState == .signedIn {
                        Text(authManager.user?.displayName ?? "Name placeholder")
                            .font(.headline)
                        
                        Text(authManager.user?.email ?? "Email@placeholder.com")
                            .font(.subheadline)
                    } else {
                        Text("Sign-in to save your data")
                            .font(.headline)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)
                .padding(.horizontal)
                
                Spacer()
                
                HStack {
                    Button {
                        if authManager.authState == .signedOut {
                            showLoginSheet = true
                        } else {
                            signOut()
                        }
                    } label: {
                        Text(authManager.authState != .signedOut ? "Sign out" : "Sign-in")
                            .font(.body.bold())
                            .frame(width: 150, height: 45, alignment: .center)
                            .foregroundStyle(Color(.yellow))
                            .background(Color(.blue))
                            .cornerRadius(10)
                    }
                }
                
    //            NavigationView {
    //                VStack(alignment: .leading) {
    //                    CardView(image: "flutter-app", title: "Order one phone,\n get one free!")
    //                    Spacer()
    //                }.navigationTitle("Contests")
    //            }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Welcome")
            .sheet(isPresented: $showLoginSheet) {
                LoginView()
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
    HomeView().environmentObject({
        let auth = AuthManager()
        return auth
    }())
}
