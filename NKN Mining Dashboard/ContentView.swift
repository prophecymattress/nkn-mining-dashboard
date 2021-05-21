import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NodeListView()
            RewardListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
