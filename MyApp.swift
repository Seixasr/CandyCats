import SwiftUI

@main
struct MyApp: App {
    
    init() {
        let cfURL = Bundle.main.url(forResource: "sobear-yq3ma", withExtension: "otf")!
        CTFontManagerRegisterFontsForURL(cfURL as CFURL, CTFontManagerScope.process, nil)
     }
    
    var body: some Scene {
        WindowGroup {
            MenuView()
        }
    }
}
