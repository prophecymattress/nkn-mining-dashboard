import Foundation
import SwiftUI

struct RewardCellView : View {
    @ObservedObject var viewModel: RewardViewModel
    
    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.doesRelativeDateFormatting = true
        
        return dateFormatter
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(self.viewModel.signingNodeName ?? "Unknown")
                    .textCase(.uppercase)
                    .font(Font.system(.headline))
                Text(self.viewModel.date, style: .date)
            }
            Spacer()
            Text("\(self.viewModel.amount, specifier: "%.2f") NKN")
                .font(Font.system(.headline))
        }
        .padding()
    }
}

struct RewardCellView_Previews: PreviewProvider {
    static var previews: some View {
        RewardCellView(viewModel: RewardViewModel(id: 1, date: Date().addingTimeInterval(-5), amount: 11, signingNodeName: "US East"))
    }
}
