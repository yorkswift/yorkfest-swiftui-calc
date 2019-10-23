import SwiftUI

struct Key : View {
    
    @EnvironmentObject private var calculator : Calculator
    
    let label : String
    let type : KeyType
    
    var body: some View {
        
            Button(
                action:{
                    self.calculator.performOperation(key:self)
                }
            ){
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
        
        
        if(label == "."){ return Color(numberBackgroundColour) }
        
        switch type {
            case .function: return Color(functionBackgroundColour)
            case .number: return Color(numberBackgroundColour)
            case .operation: return Color(operationBackgroundColour)
        }
    
    }
    
}
