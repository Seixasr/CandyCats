import SwiftUI

struct ContentView: View {
    
    var progressRed = 0.1
    var progressBlue = 0.3
    var progressYellow = 0.4
    var progressGreen = 0.1
    
    @State var redPoints: Int = 0
    @State var bluePoints: Int = 0
    @State var yellowPoints: Int = 0
    @State var greenPoints: Int = 0
    
    var body: some View {
        VStack {
            generateRandomColorMatrix()
            .padding()
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



