import SwiftUI

struct GameView: View {
    
    var body: some View {
        VStack {
            generateRandomColorMatrix()
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}



