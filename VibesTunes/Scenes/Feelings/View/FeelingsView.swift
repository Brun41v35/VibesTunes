import SwiftUI

struct FeelingsView: View {

    var body: some View {

        VStack {
            Button {
                print("Go to happy list")
            } label: {
                FeelingsButtonsView(title: "Feliz",
                                    backgroundButtonColor: Color.green)
            }

            Button {
                print("Go to normal list")
            } label: {
                FeelingsButtonsView(title: "Normal",
                                    backgroundButtonColor: Color.blue)
            }

            Button {
                print("Go to sad list")
            } label: {
                FeelingsButtonsView(title: "Triste",
                                    backgroundButtonColor: Color.red)
            }
        }
    }
}

#Preview {
    FeelingsView()
}
