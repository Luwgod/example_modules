#if DEBUG_MENU

final class DesignSystemDemoFlowFactory {
    func makeDesignSystemDemoModule() -> DesignSystemDemoModule {
        DesignSystemDemoModuleAssembly.makeModule()
    }

    func makeColorsModule() -> BaseModule {
        ColorsModuleAssembly.makeModule()
    }

    func makeInsetsModule() -> BaseModule {
        InsetsModuleAssembly.makeModule()
    }

    func makeFontsModule() -> BaseModule {
        FontsModuleAssembly.makeModule()
    }

    func makePaymentAmountModule() -> BaseModule {
        PaymentAmountModuleAssembly.makeModule()
    }

    func makeButtonsBlockModule() -> BaseModule {
        ButtonsBlockModuleAssembly.makeModule()
    }

    func makeAccountSelectorModule() -> BaseModule {
        AccountSelectorDemoModuleAssembly.makeModule()
    }
    
    func makeFieldButtonsModule() -> BaseModule {
        FieldButtonsDemoModuleAssembly.makeModule()
    }
}

#endif
