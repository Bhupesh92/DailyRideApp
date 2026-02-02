import SwiftUI

struct ProfileView: View {

    @StateObject private var viewModel: ProfileViewModel
    let onLogout: () -> Void

    init(
        viewModel: ProfileViewModel,
        onLogout: @escaping () -> Void
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.onLogout = onLogout
    }

    var body: some View {
        VStack(spacing: 24) {

            VStack(spacing: 8) {
                Text(viewModel.userName)
                    .font(.title)
                    .bold()

                Text(viewModel.email)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Divider()

            Button("Edit Profile") {
                // Future: EditProfile flow
            }

            Button("Ride History") {
                // Future: History flow
            }

            Button("Logout") {
                Task {
                    await viewModel.logout()
                    onLogout()
                }
            }
            .foregroundColor(.red)
            .accessibilityIdentifier("logout_button")

            Spacer()
        }
        .padding()
        .navigationTitle("Profile")
        .onAppear {
            Task {
                await viewModel.loadProfile()
            }
        }
    }
}

