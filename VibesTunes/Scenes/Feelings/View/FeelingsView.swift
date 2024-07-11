import SwiftUI

struct FeelingsView: View {

    var body: some View {

        ZStack {

            LinearGradient(colors: [.orange, .blue],
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()

            VStack(spacing: 20) {
                Button {
                    print("Go to happy list")
                } label: {
                    FeelingsButtonsView(iconFeeling: "☺️",
                                        title: "Happy",
                                        backgroundButtonColor: Color.green,
                                        bottomButtonColor: Color.orange)
                }

                Button {
                    print("Go to normal list")
                } label: {
                    FeelingsButtonsView(iconFeeling: "😐",
                                        title: "Normal",
                                        backgroundButtonColor: Color.orange,
                                        bottomButtonColor: Color.blue)
                }

                Button {
                    print("Go to sad list")
                } label: {
                    FeelingsButtonsView(iconFeeling: "😢",
                                        title: "Sad",
                                        backgroundButtonColor: Color.red,
                                        bottomButtonColor: Color.orange)
                }
            }
        }
    }
}

#Preview {
    FeelingsView()
}
