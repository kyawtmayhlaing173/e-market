import SwiftUI

struct StepperView: View {
    @State private var value = 0

    func incrementStep() {
        value += 1
    }

    func decrementStep() {
        value -= 1
    }

    var body: some View {
        Stepper {
            Text("\(value)").bold()
        } onIncrement: {
            incrementStep()
        } onDecrement: {
            decrementStep()
        }
        .padding(5)
    }
}

struct StepperView_Previews: PreviewProvider {
    static var previews: some View{
        StepperView()
    }
}
