import SwiftUI

struct FeelingsView: View {
    
    var body: some View {
        
        HStack {
            Button {
                print("Go to happy list")
            } label: {
                FeelingsButtonsView(iconFeeling: "☺️",
                                    title: "Happy",
                                    backgroundButtonColor: Color.green)
            }
            
            Button {
                print("Go to normal list")
            } label: {
                FeelingsButtonsView(iconFeeling: "😐",
                                    title: "Normal",
                                    backgroundButtonColor: Color.green)
            }
            
            Button {
                print("Go to sad list")
            } label: {
                FeelingsButtonsView(iconFeeling: "😢",
                                    title: "Triste",
                                    backgroundButtonColor: Color.green)
            }
        }
    }
}

#Preview {
    FeelingsView()
}
