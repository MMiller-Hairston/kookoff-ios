import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        VStack {
            HomeView()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthManager())
}
