import Foundation
import SwiftUI

struct NodeCellView: View {
    @ObservedObject var viewModel: NodeViewModel
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    TextField("", text: $viewModel.name)
                        .disabled(true)
                        .textCase(.uppercase)
                        .font(Font.system(.headline))
                    TextField("", text: $viewModel.ipAddress)
                        .disabled(true)
                        .foregroundColor(.gray)
                }
                Spacer()
                ZStack {
                    Circle()
                        .stroke(Color.gray, lineWidth: 3)
                        .foregroundColor(Color.green)
                    TextField("", text: $viewModel.miningStatusEmoji)
                        .disabled(true)
                        .font(Font.system(.title))
                        .multilineTextAlignment(.center)
                }
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
            }
        }
        .padding()
    }
}

struct NodeCellView_Previews: PreviewProvider {
    class PreviewNodeApi: NodeApi {
        func getNodeState(_ ipAddress: String, completion: @escaping (NodeStateResponseBody?) -> Void) {
            completion(nil)
        }
    }
    
    static var previews: some View {
        NodeCellView(
            viewModel: NodeViewModel(name: "UK South", ipAddress: "1.1.1.1", nodeApi: PreviewNodeApi()))
    }
}
