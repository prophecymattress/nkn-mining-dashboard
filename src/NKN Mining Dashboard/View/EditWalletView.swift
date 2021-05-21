import Foundation
import SwiftUI

struct EditWalletView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var viewModel: EditWalletViewModel = try! DashboardApp.container.resolve()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Benficiary Wallet Address")
                TextField("E.g. NKNGbVkogmgCmixCx8oy8J6n8a75S87GDSgC", text: $viewModel.address)
            }
            .navigationBarTitle(Text("Edit Wallet"))
            .navigationBarItems(
                trailing: Button(
                    action: {
                        self.viewModel.save()
                        self.presentationMode.wrappedValue.dismiss()
                    },
                    label: { Text("Done") })
            )
        }
    }
}
