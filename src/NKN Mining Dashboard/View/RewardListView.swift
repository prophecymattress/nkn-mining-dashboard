import Foundation
import SwiftUI

struct RewardListView : View {
    @ObservedObject var viewModel: RewardsListViewModel = try! DashboardApp.container.resolve()
    
    @State var showEditWalletView = false
    
    var body: some View {
        NavigationView {
            List(self.viewModel.rewards, id: \.id) { reward in
                RewardCellView(viewModel: reward)
            }
            .navigationBarTitle(Text("Rewards"))
            .navigationBarItems(
                trailing: Button(
                    action: { self.showEditWalletView.toggle() },
                    label: { Image(systemName: "gear") })
                    .sheet(
                        isPresented: $showEditWalletView,
                        onDismiss: { self.viewModel.refresh() }) {
                        EditWalletView()
                    }
            )
        }
        .tabItem {
            Image(systemName: "creditcard")
        }
        .onAppear {
            self.viewModel.refresh()
        }
    }
}
