import AuthenticationServices
import GoogleSignInSwift
import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                
                Spacer()
                
                GoogleSignInButton {
                    Task {
                        await signInWithGoogle()
                    }
                }
                .frame(width: 280, height: 45, alignment: .center)
                
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
    
    func signInWithGoogle() async {
        do {
            guard let user = try await GoogleSignInManager.shared.signInWithGoogle() else { return }
            
            let result = try await authManager.googleAuth(user)
            if let result = result {
                print("GoogleSignInSuccess: \(result.user.uid)")
                dismiss()
            }
        }
        catch {
            print("GoogleSignInError: failed to sign in with Google. \(error)")
            return
        }
    }
}

#Preview {
    LoginView().environmentObject(AuthManager())
}

