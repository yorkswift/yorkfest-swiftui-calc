
import SwiftUI

struct CalculatorView: View {
    
   // @State var calculator : Calculator.default
    
    var body: some View {
        VStack(spacing: 1) {
            
            Text("0")
                .font(.system(size: 70))
                .fontWeight(.light)
                .padding()
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity, minHeight: 200, alignment: .trailing)

            
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
                Key(label: ".", type: .number)
                Key(label: "=", type: .operation)
            }
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(Color(backgroundColour))
        .edgesIgnoringSafeArea(.all)
    }
}
struct Key: View {
    
    //@Environment var calculator = Calculator()
    
    var label : String
    var type : KeyType
    
    var body: some View {
        Button(action: {
            
        }) {
        Text(label)
            .font(.title)
            .fontWeight(.semibold)
            .foregroundColor(Color.white)
            .padding()
            .frame(minWidth: minWidth(), maxWidth: .infinity, maxHeight: .infinity)
            .background(backgroundColour())
        }
    
    }
    
    func minWidth() -> CGFloat? {
        
        if(label != "0"){ return nil }
        
        return UIScreen.main.bounds.width / 2
        
    }
    
    func backgroundColour() -> Color {
        switch type {
            case .function: return Color(functionBackgroundColour)
            case .number: return Color(numberBackgroundColour)
            case .operation: return Color(operationBackgroundColour)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}

enum KeyType {
    case function
    case operation
    case number
}

let backgroundColour = #colorLiteral(red: 0.15, green: 0.20, blue: 0.26, alpha: 1.0)
let functionBackgroundColour = #colorLiteral(red: 0.23, green: 0.28, blue: 0.33, alpha: 1.0)
let numberBackgroundColour = #colorLiteral(red: 0.36, green: 0.40, blue: 0.43, alpha: 1.0)
let operationBackgroundColour = #colorLiteral(red: 0.99, green: 0.62, blue: 0.15, alpha: 1.0)
