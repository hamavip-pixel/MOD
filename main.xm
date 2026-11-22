#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

static UIWindow *HAMAWindow = nil;
static BOOL HAMAMenuVisible = NO;

@interface HAMAOverlayController : UIViewController
@end

@implementation HAMAOverlayController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.clearColor;

    UIButton *bubble = [UIButton buttonWithType:UIButtonTypeSystem];
    bubble.frame = CGRectMake(18, 155, 58, 58);
    bubble.layer.cornerRadius = 29;
    bubble.backgroundColor = [UIColor colorWithRed:0.78 green:0.03 blue:0.15 alpha:0.96];
    bubble.layer.borderWidth = 1.5;
    bubble.layer.borderColor = [UIColor colorWithRed:1 green:0.40 blue:0.48 alpha:1].CGColor;
    bubble.layer.shadowColor = UIColor.redColor.CGColor;
    bubble.layer.shadowOpacity = 0.55;
    bubble.layer.shadowRadius = 12;
    [bubble setTitle:@"H⚡" forState:UIControlStateNormal];
    [bubble setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    bubble.titleLabel.font = [UIFont boldSystemFontOfSize:19];
    [bubble addTarget:self action:@selector(toggleMenu) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bubble];

    [self buildPanel];
}

- (void)buildPanel {
    UIView *panel = [[UIView alloc] initWithFrame:CGRectMake(88, 145, 270, 360)];
    panel.tag = 707;
    panel.backgroundColor = [UIColor colorWithRed:0.075 green:0.025 blue:0.045 alpha:0.97];
    panel.layer.cornerRadius = 18;
    panel.layer.borderWidth = 1;
    panel.layer.borderColor = [UIColor colorWithRed:0.85 green:0.12 blue:0.25 alpha:1].CGColor;
    panel.layer.shadowColor = UIColor.blackColor.CGColor;
    panel.layer.shadowOpacity = 0.45;
    panel.layer.shadowRadius = 18;
    panel.hidden = YES;
    [self.view addSubview:panel];

    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(16, 13, 235, 30)];
    title.text = @"HAMA⚡VIP";
    title.textColor = [UIColor colorWithRed:1 green:0.36 blue:0.44 alpha:1];
    title.font = [UIFont boldSystemFontOfSize:21];
    [panel addSubview:title];

    UILabel *subtitle = [[UILabel alloc] initWithFrame:CGRectMake(17, 42, 235, 18)];
    subtitle.text = @"VISUAL CONTROL CENTER";
    subtitle.textColor = [UIColor colorWithWhite:0.72 alpha:1];
    subtitle.font = [UIFont systemFontOfSize:9 weight:UIFontWeightSemibold];
    subtitle.text = [subtitle.text stringByAppendingString:@"  •  UI DEMO"];
    [panel addSubview:subtitle];

    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(15, 68, 240, 1)];
    line.backgroundColor = [UIColor colorWithRed:0.42 green:0.08 blue:0.15 alpha:1];
    [panel addSubview:line];

    NSArray *items = @[
        @[@"HOME", @"Menu preview and app information"],
        @[@"ESP RADAR", @"Visual placeholder only"],
        @[@"AIMBOT", @"Visual placeholder only"],
        @[@"MEMORY", @"No memory access"],
        @[@"SETTINGS", @"Appearance and interface"]
    ];

    CGFloat y = 82;
    for (NSArray *item in items) {
        UIView *row = [[UIView alloc] initWithFrame:CGRectMake(13, y, 244, 43)];
        row.backgroundColor = [UIColor colorWithRed:0.20 green:0.035 blue:0.075 alpha:0.85];
        row.layer.cornerRadius = 9;
        [panel addSubview:row];

        UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(10, 4, 130, 18)];
        name.text = item[0];
        name.textColor = UIColor.whiteColor;
        name.font = [UIFont boldSystemFontOfSize:11];
        [row addSubview:name];

        UILabel *detail = [[UILabel alloc] initWithFrame:CGRectMake(10, 22, 220, 14)];
        detail.text = item[1];
        detail.textColor = [UIColor colorWithWhite:0.70 alpha:1];
        detail.font = [UIFont systemFontOfSize:8];
        [row addSubview:detail];

        UISwitch *toggle = [[UISwitch alloc] initWithFrame:CGRectZero];
        toggle.transform = CGAffineTransformMakeScale(0.65, 0.65);
        toggle.onTintColor = [UIColor colorWithRed:0.82 green:0.04 blue:0.18 alpha:1];
        toggle.on = NO;
        toggle.tag = 800 + (NSInteger)y;
        toggle.center = CGPointMake(222, 21);
        [row addSubview:toggle];
        y += 49;
    }

    NSString *version = [NSBundle.mainBundle objectForInfoDictionaryKey:@"CFBundleShortVersionString"] ?: @"Unknown";
    NSString *build = [NSBundle.mainBundle objectForInfoDictionaryKey:@"CFBundleVersion"] ?: @"Unknown";
    UILabel *appInfo = [[UILabel alloc] initWithFrame:CGRectMake(15, 333, 240, 18)];
    appInfo.text = [NSString stringWithFormat:@"APP VERSION  %@  •  BUILD %@", version, build];
    appInfo.textColor = [UIColor colorWithRed:1 green:0.57 blue:0.64 alpha:1];
    appInfo.font = [UIFont systemFontOfSize:8 weight:UIFontWeightMedium];
    appInfo.adjustsFontSizeToFitWidth = YES;
    [panel addSubview:appInfo];
}

- (void)toggleMenu {
    UIView *panel = [self.view viewWithTag:707];
    panel.hidden = !panel.hidden;
    HAMAMenuVisible = !panel.hidden;
}

@end

static void HAMAInstallOverlay(void) {
    if (HAMAWindow != nil || !UIApplication.sharedApplication) return;

    UIWindowScene *activeScene = nil;
    if (@available(iOS 13.0, *)) {
        for (UIScene *scene in UIApplication.sharedApplication.connectedScenes) {
            if (scene.activationState == UISceneActivationStateForegroundActive &&
                [scene isKindOfClass:UIWindowScene.class]) {
                activeScene = (UIWindowScene *)scene;
                break;
            }
        }
    }

    if (@available(iOS 13.0, *)) {
        if (activeScene) {
            HAMAWindow = [[UIWindow alloc] initWithWindowScene:activeScene];
        }
    }
    if (!HAMAWindow) {
        HAMAWindow = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    }

    HAMAWindow.frame = UIScreen.mainScreen.bounds;
    HAMAWindow.windowLevel = UIWindowLevelAlert + 1;
    HAMAWindow.backgroundColor = UIColor.clearColor;
    HAMAWindow.rootViewController = [HAMAOverlayController new];
    HAMAWindow.hidden = NO;
}

%hook UIApplication
- (void)applicationDidBecomeActive:(UIApplication *)application {
    %orig;
    dispatch_async(dispatch_get_main_queue(), ^{
        HAMAInstallOverlay();
    });
}
%end

%ctor {
    @autoreleasepool {
        dispatch_async(dispatch_get_main_queue(), ^{
            HAMAInstallOverlay();
        });
    }
}
