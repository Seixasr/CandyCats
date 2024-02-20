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
            //Criar a matriz
//            HStack{
//                
//                CircularProgressBarView(progress: Double(redPoints)/20, circleColor: Color.red)
//                    .frame(width: 50, height: 50)
//                    .padding()
//                CircularProgressBarView(progress: Double(bluePoints)/20, circleColor: Color.blue)
//                    .frame(width: 50, height: 50)
//                    .padding()
//                CircularProgressBarView(progress: Double(yellowPoints)/20, circleColor: Color.yellow)
//                    .frame(width: 50, height: 50)
//                    .padding()
//                CircularProgressBarView(progress: Double(greenPoints)/20, circleColor: Color.green)
//                    .frame(width: 50, height: 50)
//                    .padding()
//                
//            }
            generateRandomColorMatrix()
            .padding()
            
            
        }
    }
}

//Criar 4 tipos de peças
struct CircularProgressBarView: View{
    private let progress: Double
    private let circleColor: Color
        
    init(progress: Double, circleColor: Color) {
            self.progress = progress
            self.circleColor = circleColor
        }
    
    var body: some View{
        ZStack{
            Circle()
                .stroke(Color.gray.opacity(0.2), style: StrokeStyle(lineWidth: 10, lineCap: .round))

            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(circleColor, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .animation(.easeInOut)
                .rotationEffect(Angle(degrees: -90))
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



