import SwiftUI

struct FeelingsButtonsView: View {

    var iconFeeling: String
    var title: String
    var backgroundButtonColor: Color
    var bottomButtonColor: Color

    @State var isAnimating = false

    var body: some View {

        ZStack {
            LinearGradient(colors: [Color.red, Color.orange],
                           startPoint: isAnimating ? .topTrailing : .bottomLeading,
                           endPoint: isAnimating ? .bottomTrailing : .center)
            .animation(.easeInOut(duration: 1)
                .repeatForever(autoreverses: true), value: isAnimating)
            .frame(width: 150, height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .blur(radius: 8)

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

            .onAppear {
                isAnimating.toggle()
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
