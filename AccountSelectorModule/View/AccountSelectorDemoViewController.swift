#if DEBUG_MENU

import RxSwift
import RxCocoa
import UIKit

final class AccountSelectorDemoViewController: RefactoredBaseTableViewController<AccountSelectorDemoViewModel>,
                                               AccountSelectorModule,
                                               AccountSelectorDemoInput {

    private let builder = AccountSelectorDemoBuilder()
    private let disposeBag = DisposeBag()

    var onSelectAccountColor: ParameterClosure<SelectionItemData<AccountSelectorAccountColor>>?
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

        viewModel.rx.updateSignal
            .emit(with: self, onNext: { owner, _ in
                owner.reloadAccountSelectorSection()
            })
            .disposed(by: disposeBag)
    }

    override func localize() {
        super.localize()

        title = "Account selector"
    }

    override func configureAppearance() {
        super.configureAppearance()

        tableView.backgroundColor = .uiBackground
        tableView.allowsSelection = true
    }

    override func configureBarButtons() {
        super.configureBarButtons()

        setCloseButton(with: #selector(closeBarButtonTapped))
    }

    @objc private func closeBarButtonTapped() {
        onClose?()
    }

    private func configureTable() {
        let sections = builder.buildSections(with: viewModel, delegate: self)
        tableDirector.replace(withSections: sections)
    }

    private func reloadAccountSelectorSection() {
        let section = builder.buildAccountSelectorSection(with: viewModel)
        tableDirector.replaceSection(at: .zero, with: section)
        tableDirector.reload(sectionAtIndex: .zero)
    }

    func selectAccountColor() {
        let input: SelectionItemInput<AccountSelectorAccountColor> = (items: viewModel.cardColorListPickerItems,
                                                                      selectedItem: viewModel.cardColor)

        let output: ParameterClosure<ListPickerPresentableItem> = { [weak viewModel] color in
            if let color = color as? AccountSelectorAccountColor {
                viewModel?.cardColor = color
            }
        }

        let selectionData: SelectionItemData<AccountSelectorAccountColor> = (input: input, output: output)

        onSelectAccountColor?(selectionData)
    }
}

#endif
