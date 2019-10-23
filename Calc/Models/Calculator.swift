
import Combine
import SwiftUI

final class Calculator: ObservableObject {
    
    @Published var result : Double = 0
    
    func performOperation(key: Key) {
       
        switch key.type {
            case .function:
                
                 result = 0
            
                //result * -1
            
                 //result / 100
            
            case .number:
                
                result = Double(key.label)!
                  
            case .operation:
                
               result = result * result
                // save to stack
  
        }
    }
    
    init(startWith initial:Double) {
        self.result = initial
    }
    
}
