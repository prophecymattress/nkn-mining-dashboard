import Foundation
import SwiftUI

struct NodeListView : View {
    @ObservedObject var viewModel: NodeListViewModel = try! DashboardApp.container.resolve()
    
    @State var showAddNodeView = false
    
    var body: some View {
        NavigationView {
            List(self.viewModel.nodes, id: \.id) { node in
                NodeCellView(viewModel: node)
            }
            .navigationBarTitle(Text("Nodes"))
            .navigationBarItems(
                trailing: Button(
                    action: { self.showAddNodeView.toggle() },
                    label: { Image(systemName: "plus") })
                    .sheet(
                        isPresented: $showAddNodeView,
                        onDismiss: { self.viewModel.refresh() }) {
                        AddNodeView()
                    }
            )
        }
        .tabItem {
            Image(systemName: "waveform.path.ecg")
        }
        .onAppear {
            self.viewModel.refresh()
        }
    }
}
