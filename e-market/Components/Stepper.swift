import SwiftUI

struct StepperView: View {
    @State var quantity: Int
    
    init(quantity: Int) {
        self.quantity = quantity
    }
    
    func incrementStep() {
        quantity += 1
    }
    
    func decrementStep() {
        if quantity > 0 {
            quantity -= 1
        }
    }
    
    var body: some View {
        Stepper {
            Text("\(quantity)").bold()
        } onIncrement: {
            incrementStep()
        } onDecrement: {
            decrementStep()
        }
        .padding(5)
    }
}
