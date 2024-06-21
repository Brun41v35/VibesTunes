import SwiftUI

struct FeelingsButtonsView: View {
    var body: some View {
        VStack(spacing: 10) {
            Button {
                print("Button Happy")
            } label: {
                Text("Feliz")
                    .frame(width: 280, height: 50)
                    .background(Color.green)
                    .tint(.white)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .clipShape(.buttonBorder)
            }

            Button {
                print("Button Normal")
            } label: {
                Text("Normal")
                    .frame(width: 280, height: 50)
                    .background(Color.blue)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .tint(.white)
                    .clipShape(.buttonBorder)
            }

            Button {
                print("Button Sad")
            } label: {
                Text("Triste")
                    .frame(width: 280, height: 50)
                    .background(Color.red)
                    .tint(.white)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .clipShape(.buttonBorder)
            }
        }
    }
}

#Preview {
    FeelingsButtonsView()
}
