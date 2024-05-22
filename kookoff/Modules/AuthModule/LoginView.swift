import AuthenticationServices
import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                
                Spacer()
                
                // Mark: - Anonymous
                // Hide `Skip` button if user is anonymous.
                if authManager.authState == .signedOut {
                    Button {
                        signInAnonymously()
                    } label: {
                        Text("Skip")
                            .font(.body.bold())
                            .frame(width: 280, height: 45, alignment: .center)
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    func signInAnonymously() {
        Task {
            do {
                let result = try await authManager.signInAnonymously()
            }
            catch {
                print("SignInAnonymouslyError: \(error)")
            }
        }
    }
}

#Preview {
    LoginView().environmentObject(AuthManager())
}

