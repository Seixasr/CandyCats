import SwiftUI

struct ContentView: View {
    
    init() {
        generateRandomColorMatrix()
    }
    
    var body: some View {
        VStack {
            //Criar a matriz
            generateRandomColorMatrix()
            .padding()
        }
    }
}

//Criar 4 tipos de peças



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



