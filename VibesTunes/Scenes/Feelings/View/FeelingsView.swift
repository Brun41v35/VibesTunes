import SwiftUI

struct FeelingsView: View {

    var body: some View {
        VStack(spacing: 50) {
            Text("Como você está se sentindo ?")
                .font(.system(size: 30, weight: .bold))
                .multilineTextAlignment(.center)
            FeelingsButtonsView()
        }
    }
}

#Preview {
    FeelingsView()
}
