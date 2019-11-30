# Scroll up TextField when keyboard shows

1. Put the UITextField in a UIScrollView
2. Register keyboard notifications for keyboard show/hide event in viewDidLoad
3. Adjust scroll view's content inset when keyboard shows
4. Reset the scroll view's content inset when keyboard hides

## 1. Put the UITextField in a UIScrollView

## 2. Register keyboard notifications for keyboard show/hide event in viewDidLoad

```text
- (void)viewDidLoad {
    [super viewDidLoad];

    // Register keyboard notifications for keyboard show/hide event in viewDidLoad
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
```

## 3. Adjust scroll view's content inset when keyboard shows

```text
- (void)keyboardWillShow:(NSNotification *)notification
{
    NSDictionary *info = [notification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
}
```

## 4. Reset the scroll view's content inset when keyboard hides

```text
- (void)keyboardWillHide:(NSNotification *)notification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
}
```

## Reference

* [How to make a UITextField move up when keyboard is present \| StackOverflow](http://stackoverflow.com/questions/1126726/how-to-make-a-uitextfield-move-up-when-keyboard-is-present)

