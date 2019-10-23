
import SwiftUI

struct CalculatorView: View {
    
    @EnvironmentObject private var calculator : Calculator
    
    var body: some View {
        
        VStack(spacing: 1) {
            
            OperationResult()

            HStack(spacing: 1) {
                Key(label: "AC", type: .function)
                Key(label: "±", type: .function)
                Key(label: "%", type: .function)
                Key(label: "÷", type: .operation)
            }
            
            HStack(spacing: 1) {
                Key(label: "7", type: .number)
                Key(label: "8", type: .number)
                Key(label: "9", type: .number)
                Key(label: "×", type: .operation)
            }
            
            HStack(spacing: 1) {
                Key(label: "4", type: .number)
                Key(label: "5", type: .number)
                Key(label: "6", type: .number)
                Key(label: "-", type: .operation)
            }
            
            HStack(spacing: 1) {
                Key(label: "1", type: .number)
                Key(label: "2", type: .number)
                Key(label: "3", type: .number)
                Key(label: "+", type: .operation)
            }
            
            HStack(spacing: 1) {
                Key(label: "0", type: .number)
                Key(label: ".", type: .function)
                Key(label: "=", type: .operation)
            }
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(Color(backgroundColour))
        .edgesIgnoringSafeArea(.all)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView().environmentObject(Calculator(startWith: 0))
    
    }
}
