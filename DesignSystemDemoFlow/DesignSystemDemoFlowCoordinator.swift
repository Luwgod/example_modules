#if DEBUG_MENU

import TICoordinatorKit

final class DesignSystemDemoFlowCoordinator: BaseCoordinator {
    private let router: StackRoutable
    private let moduleFactory: DesignSystemDemoFlowFactory

    init(router: StackRoutable, moduleFactory: DesignSystemDemoFlowFactory = .init()) {
        self.router = router
        self.moduleFactory = moduleFactory
    }

    override func start() {
        showDesignSystemDemoModule()
    }
}

private extension DesignSystemDemoFlowCoordinator {
    typealias Element = DesignSystemDemoViewModel.DesignSystemElement

    func showDesignSystemDemoModule() {
        let module = moduleFactory.makeDesignSystemDemoModule()

        module.onClose = { [weak self] in
            self?.router.popModule()
            self?.finishFlow()
        }

        module.onOpenElement = { [weak self] element in
            self?.showModuleForElement(element)
        }

        router.push(module)
    }

    func showModuleForElement(_ element: Element) {
        let module: BaseModule

        switch element {
        case .insets:
            module = moduleFactory.makeInsetsModule()

        case .colors:
            module = moduleFactory.makeColorsModule()

        case .fonts:
            module = moduleFactory.makeFontsModule()

        case .standardButton:
            startStandardButtonDemoFlow()
            return

        case .paymentAmount:
            module = moduleFactory.makePaymentAmountModule()

        case .buttonsBlock:
            startButtonsBlockDemoFlow()
            return

        case .accountSelector:
            startAccountSelectorDemoFlow()
            return
            
        case .fieldButtons:
            module = moduleFactory.makeFieldButtonsModule()
        }

        module.onClose = { [weak self] in
            self?.router.popModule()
        }

        router.push(module)
    }

    func startStandardButtonDemoFlow() {
        let coordinator = StandardButtonDemoFlowCoordinator(router: router)
        bindTo(coordinator).start()
    }

    func startButtonsBlockDemoFlow() {
        let coordinator = ButtonsBlockDemoFlowCoordinator(router: router)
        bindTo(coordinator).start()
    }

    func startAccountSelectorDemoFlow() {
        let coordinator = AccountSelectorDemoFlowCoordinator(router: router)
        bindTo(coordinator).start()
    }
}

#endif
