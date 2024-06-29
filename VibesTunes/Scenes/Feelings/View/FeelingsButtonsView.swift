import SwiftUI

struct FeelingsButtonsView: View {

    var title: String
    var backgroundButtonColor: Color

    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundButtonColor)
            .tint(.white)
            .font(.system(size: 20, weight: .bold, design: .default))
            .clipShape(.buttonBorder)
    }
}

#Preview {
    FeelingsButtonsView(title: "Text",
                        backgroundButtonColor: Color.gray)
}
