#if DEBUG_MENU

import RxSwift
import RxCocoa
import UIKit

final class PaymentAmountDemoViewController: RefactoredBaseTableViewController<PaymentAmountDemoViewModel>,
                                             BaseModule {

    private let builder = PaymentAmountDemoBuilder()
    private let disposeBag = DisposeBag()

    var onClose: VoidClosure?

    override var tableViewStyle: UITableView.Style {
        .grouped
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTable()
    }

    override func bindViews() {
        super.bindViews()

        viewModel.paymentAmountItemsRelay
            .subscribe(with: self, onNext: { owner, _ in
                owner.reloadPaymentAmountSection()
            })
            .disposed(by: disposeBag)
    }

    override func localize() {
        super.localize()

        title = "Payment Amount"
    }

    override func configureAppearance() {
        super.configureAppearance()

        tableView.backgroundColor = .uiBackground
        tableView.allowsSelection = false
    }

    override func configureBarButtons() {
        super.configureBarButtons()

        setCloseButton(with: #selector(closeBarButtonTapped))
    }

    @objc private func closeBarButtonTapped() {
        onClose?()
    }

    private func configureTable() {
        let sections = builder.buildSections(with: viewModel)
        tableDirector.replace(withSections: sections)
    }

    private func reloadPaymentAmountSection() {
        let section = builder.buildPaymentAmountSection(with: viewModel)
        tableDirector.replaceSection(at: .zero, with: section)
        tableDirector.reload(sectionAtIndex: .zero)
    }
}

#endif
