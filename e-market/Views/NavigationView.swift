import SwiftUI

struct NavView: View {
    @State var isActive : Bool = false

    var body: some View {
        NavigationView {
            NavigationLink(
                destination: NavView2(rootIsActive: self.$isActive),
                isActive: self.$isActive
            ) {
                Text("Hello, World!")
            }
            .isDetailLink(false)
            .navigationBarTitle("Root")
        }
    }
}

struct NavView2: View {
    @Binding var rootIsActive : Bool

    var body: some View {
        NavigationLink(destination: NavView3(shouldPopToRootView: self.$rootIsActive)) {
            Text("Hello, World #2!")
        }
        .isDetailLink(false)
        .navigationBarTitle("Two")
    }
}

struct NavView3: View {
    @Binding var shouldPopToRootView : Bool

    var body: some View {
        VStack {
            Text("Hello, World #3!")
            Button (action: { self.shouldPopToRootView = false } ){
                Text("Pop to root")
            }
        }.navigationBarTitle("Three")
    }
}

struct NavView_Previews: PreviewProvider {
    static var previews: some View {
        NavView()
    }
}
