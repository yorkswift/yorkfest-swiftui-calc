
import Combine
import SwiftUI

final class Calculator: ObservableObject {
    
    @Published var result : Double = 0
    
    var operands : (Double?, Double?) = (nil,nil)
    var operation : Operation? = nil
    
    var lastOperation : Operation? = nil
    
    func performOperation(key: Key) {
       
        switch key.type {
            case .function:
                
                 result = 0
                 operands = (nil,nil)
                 lastOperation = nil
            
                //result * -1
            
                //result / 100
            
            case .number:
                
                result = (result * 10) + Double(key.label)!

            case .operation:
                
                if(key.label == Operation.equals.rawValue){
                     
                    if(lastOperation != Operation.equals){
                        operands.1 = result
                        lastOperation = Operation.equals
                    } else {
                        operands.0 = result
                    }
                    performEquals()
                    
                } else {
                    
                    switch key.label {
                    case Operation.divide.rawValue:
                        
                        operation = Operation.divide
       
                    case Operation.times.rawValue:
                        
                        operation = Operation.times

                    case Operation.minus.rawValue:
                        
                        operation = Operation.minus
      
                    case Operation.add.rawValue:
                        
                        operation = Operation.add
                        
                    case Operation.equals.rawValue: break
                    default: break
                        
                    }
                    
                    operands.0 = result
                    result = 0
                    lastOperation = operation
                
            }
  
        }
    }
    
    init(startWith initial:Double) {
        self.result = initial
    }
    
    private func performEquals(){
        
         print("performEquals : \(operands)")
        
        if let leftOperand = operands.0, let rightOperand = operands.1, let currentOperation = operation {
            
            print("performEquals : \(leftOperand) \(currentOperation) \(rightOperand) ")
            
            switch currentOperation {
            case .divide:
                
                if(rightOperand > 0){
                    result = leftOperand / rightOperand
                }
                break;
                
            case .times:
                
                result = leftOperand * rightOperand
                
            break;
            case .minus:
                
                result = leftOperand - rightOperand
               
            break;
            case .add:
                
                result = leftOperand + rightOperand
            
            break;
            case .equals: break;
                
            }
        
        }
        
    }
    
}

enum KeyFunction {
    case clear
    case negative
    case percentage
    case decimal
}

enum Operation : String {
    case divide = "÷"
    case times = "×"
    case minus = "-"
    case add = "+"
    case equals = "="
}

