

import SwiftUI

struct WeatherButton: View {
    var title: String
    var backColor: Color
    var textColor: Color
    
    var body: some View {
        Text("Change Day Time")
            .frame(width: 280, height: 50)
            .background(backColor)
            .foregroundColor(textColor)
            .cornerRadius(10)
    }
}

