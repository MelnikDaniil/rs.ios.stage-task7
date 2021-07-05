#import "XIBViewController.h"

//new colors
@interface UIColor (CustomColors)
+(UIColor * _Nullable) rsBlack;
+(UIColor * _Nullable) rsBlackCoral;
+(UIColor * _Nullable) rsTurquoiseGreen;
+(UIColor * _Nullable) rsVenetianRed;
+(UIColor * _Nullable) rsLittleBoyBlue;
+(UIColor * _Nullable) rsWhite;
@end

//implementation of new colors
@implementation UIColor (CustomColors)
+(UIColor * _Nullable) rsBlack               { return [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0]; }
+(UIColor * _Nullable) rsBlackCoral     { return [UIColor colorWithRed:0.298 green:0.361 blue:0.408 alpha:1.0]; }
+(UIColor * _Nullable) rsTurquoiseGreen { return [UIColor colorWithRed:0.569 green:0.780 blue:0.694 alpha:1.0]; }
+(UIColor * _Nullable) rsVenetianRed    { return [UIColor colorWithRed:0.761 green:0.004 blue:0.078 alpha:1.0]; }
+(UIColor * _Nullable) rsLittleBoyBlue  { return [UIColor colorWithRed:0.502 green:0.643 blue:0.929 alpha:1.0]; }
+(UIColor * _Nullable) rsWhite               { return [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]; }
@end

//viewcontroller
@interface XIBViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *RSSchoolLabel;
@property (weak, nonatomic) IBOutlet UITextField *loginTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *authorizeButton;
@end

@interface XIBViewController (KeyboardHandling)
-(void)hideWhenTappedAround;
@end



@implementation XIBViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self hideWhenTappedAround];
    
    self.loginTextField.delegate = self;
    self.loginTextField.layer.borderColor = UIColor.rsBlackCoral.CGColor;
    self.loginTextField.layer.borderWidth = 1.5;
    self.loginTextField.layer.cornerRadius = 5.0;
    
    self.passwordTextField.delegate = self;
    self.passwordTextField.layer.borderColor = UIColor.rsBlackCoral.CGColor;
    self.passwordTextField.layer.borderWidth = 1.5;
    self.passwordTextField.layer.cornerRadius = 5.0;
    
    //button
    self.authorizeButton.layer.cornerRadius = 10;
    [self.authorizeButton setTitleColor:UIColor.rsLittleBoyBlue forState:UIControlStateNormal];
    self.authorizeButton.layer.borderWidth = 2.0;
    self.authorizeButton.layer.borderColor = UIColor.rsLittleBoyBlue.CGColor;
    [self.authorizeButton setImage:[UIImage imageNamed:@"user"] forState:UIControlStateNormal];
    [self.authorizeButton setImage:[UIImage imageNamed:@"user"] forState:UIControlStateDisabled];
    [self.authorizeButton setImage:[UIImage imageNamed:@"user-filled"] forState:UIControlStateHighlighted];
   
    
    
     //button actions
    [self.authorizeButton addTarget:self
                             action:@selector(authorizeButtonTapped:)
                   forControlEvents:(UIControlEventTouchUpInside)];
}
//when return is clicked go away mister keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField {

    if (textField == _loginTextField) {
        return [self.passwordTextField becomeFirstResponder];
    }

    return [self.view endEditing:true];
}

//returning of color when edit
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    if (textField == _loginTextField) {
        return  self.loginTextField.layer.borderColor = UIColor.rsBlackCoral.CGColor;
    } else {
        return  self.passwordTextField.layer.borderColor = UIColor.rsBlackCoral.CGColor;
    }

    return YES;
}

//staff with button when ckicked
-(void) authorizeButtonTapped:(UIButton *) sender {
    self.authorizeButton.alpha = 0.2;
    NSString *textOfLoginField = self.loginTextField.text;
    NSString *textOfPasswordField = self.passwordTextField.text;
    
    if ([textOfLoginField isEqual: @"username"]) {
        self.loginTextField.layer.borderColor = UIColor.rsTurquoiseGreen.CGColor;
    } else {
        self.loginTextField.layer.borderColor = UIColor.rsVenetianRed.CGColor;
    }
    
    if ([textOfPasswordField isEqual: @"password"]) {
        self.passwordTextField.layer.borderColor = UIColor.rsTurquoiseGreen.CGColor;
    } else {
        self.passwordTextField.layer.borderColor = UIColor.rsVenetianRed.CGColor;
    }
    
    if ([textOfLoginField isEqual: @"username"] && [textOfPasswordField isEqual: @"password"]) {
        self.loginTextField.enabled = NO;
        self.loginTextField.alpha = 0.5;
        self.passwordTextField.enabled = NO;
        self.passwordTextField.alpha = 0.5;
        self.authorizeButton.enabled = NO;
        return;
    }
    
    
    self.authorizeButton.alpha = 1.0;
}

@end

// keyboard
@implementation XIBViewController (KeyboardHandling)
-(void)hideWhenTappedAround {
    UIGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                        action:@selector(hide)];
    [self.view addGestureRecognizer:gesture];
}

-(void) hide {
    [self.view endEditing:true];
}



@end
