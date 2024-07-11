import SwiftUI

struct FeelingsButtonsView: View {
    
    var iconFeeling: String
    var title: String
    var backgroundButtonColor: Color
    
    var body: some View {
        VStack(spacing: 10) {
            Text(iconFeeling)
            Text(title)
                .tint(.white)
                .font(.system(size: 20, weight: .semibold, design: .default))
        }
        .frame(width: 100, height: 100)
        .background(backgroundButtonColor)
        .clipShape(.buttonBorder)
    }
}

#Preview {
    FeelingsButtonsView(iconFeeling: "☺️",
                        title: "Text",
                        backgroundButtonColor: Color.gray)
}
