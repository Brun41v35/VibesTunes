import SwiftUI

struct FeelingsButtonsView: View {

    var iconFeeling: String
    var title: String
    var backgroundButtonColor: Color
    var bottomButtonColor: Color

    var body: some View {

        ZStack {
            LinearGradient(colors: [backgroundButtonColor, bottomButtonColor],
                           startPoint: .top,
                           endPoint: .bottom)
            .frame(width: 150, height: 150)
            .clipShape(.buttonBorder)

            VStack(spacing: 10) {
                Text(iconFeeling)
                    .font(.system(size: 50))
                Text(title)
                    .tint(.white)
                    .font(.system(size: 20, weight: .semibold, design: .default))
            }
        }
    }
}

#Preview {
    FeelingsButtonsView(iconFeeling: "☺️",
                        title: "Text",
                        backgroundButtonColor: Color.gray,
                        bottomButtonColor: Color.blue)
}
