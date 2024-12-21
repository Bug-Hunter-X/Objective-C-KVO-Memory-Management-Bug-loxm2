// Correct implementation in KVOSolution.m
@implementation MyClass
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addObserver:self forKeyPath:@"someProperty" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self removeObserver:self forKeyPath:@"someProperty"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"someProperty"]) {
        // Handle changes
    }
}
@end
//Always remove observer in dealloc as well for robustness
- (void)dealloc {
    [self removeObserver:self forKeyPath:@"someProperty"];
    [super dealloc];
}