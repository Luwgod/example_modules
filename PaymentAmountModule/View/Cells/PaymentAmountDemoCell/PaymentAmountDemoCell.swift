#if DEBUG_MENU

import UbrdDesignSystem
import TableKit
import LeadKit

final class PaymentAmountDemoCell: BaseRxTableViewCell {

    private let paymentAmountView = PaymentAmountView()

    override func addViews() {
        contentView.addSubview(paymentAmountView)
    }

    override func configureLayout() {
        paymentAmountView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension PaymentAmountDemoCell: ConfigurableCell {
    func configure(with viewModel: PaymentAmountDemoCellModel) {
        paymentAmountView.configure(with: viewModel.paymentAmountModel)
    }
}

#endif
