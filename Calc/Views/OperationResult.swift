import SwiftUI

struct OperationResult: View {

    @EnvironmentObject private var calculator : Calculator
    
    var body: some View {
          
        VStack {
            
            Spacer()
            
            Text("\(calculator.result,specifier: "%g")")
                .font(.system(size: 70))
                .fontWeight(.light)
                .multilineTextAlignment(.trailing)
                .lineLimit(1)
                .padding()
                .foregroundColor(Color.white)
            
        }.frame(maxWidth: .infinity, minHeight: 100, alignment: .trailing)
        .background(Color(backgroundColour))
        
    }
    
}

struct OperationResult_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
        OperationResult().environmentObject(Calculator(startWith: -1))
            
        OperationResult().environmentObject(Calculator(startWith: 3.14159265359))
            
        OperationResult().environmentObject(Calculator(startWith: 99999999))
            
        
        }
    }
}

