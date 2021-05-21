import Foundation
import SwiftUI

struct AddNodeView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: AddNodeViewModel = try! DashboardApp.container.resolve()
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Name")
                    TextField("E.g. My Node 1", text: $viewModel.name)
                }
                HStack {
                    Text("IP address")
                    TextField("E.g. 1.2.3.4", text: $viewModel.ipAddress)
                }
            }
            .padding()
            .navigationBarTitle(Text("Add Node"))
            .navigationBarItems(
                trailing: Button(
                    action: { self.viewModel.tryAdd { success in
                        if (success) {
                            self.presentationMode.wrappedValue.dismiss()
                        } else {
                            self.showingAlert = true
                        }
                    } },
                    label: { Text("Add") })
                    .disabled(viewModel.name.isEmpty || viewModel.ipAddress.isEmpty)
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text(
                                "Unable to add node"),
                              message: Text("The node couldn't be added.  Please check the IP address and make sure the node is online."),
                              dismissButton: .default(Text("OK")))
                    }
            )
        }
    }
}

struct AddNodeView_Previews: PreviewProvider {
    static var previews: some View {
        AddNodeView()
    }
}
