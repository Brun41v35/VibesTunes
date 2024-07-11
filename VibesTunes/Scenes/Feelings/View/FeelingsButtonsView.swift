import SwiftUI

struct FeelingsButtonsView: View {

    var iconFeeling: String
    var title: String
    var backgroundButtonColor: Color

    var body: some View {
        VStack(spacing: 10) {
            Text(iconFeeling)
                .font(.system(size: 50))
            Text(title)
                .tint(.white)
                .font(.system(size: 20, weight: .semibold, design: .default))
        }
        .frame(width: 150, height: 150)
        .background(backgroundButtonColor)
        .clipShape(.buttonBorder)
    }
}

#Preview {
    FeelingsButtonsView(iconFeeling: "☺️",
                        title: "Text",
                        backgroundButtonColor: Color.gray)
}
