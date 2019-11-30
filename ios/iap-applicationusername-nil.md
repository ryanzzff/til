# IAP applicationUsername is nil

We want to identify application user from AppStore user, as multiple application users can make payments using same AppStore account. We used `payment.applicationUsername` when making payment, and assume it will be returned from the `transaction` object after the payment success.

Unfortunately, this approach seems working in sandbox environment, but when we launch it on production, we found the applicationUsername returns nil from some of the transactions.

One of the cases that would cause the applicationUsername nil is when user make the first payment without credit card info. This first transaction will be failed, but after user entered the credit card info then continue the payment, another transaction is made without the applicationUsername

Currently I don't have any solution to this problem, but the workaround is: when the user verify the receipt, we would grant the payment to that user if the transaction is not granted to any other users before.

## References

* [What can I do to help combat fraud during purchase transactions? \| Apple Developer](https://developer.apple.com/library/content/technotes/tn2413/_index.html#//apple_ref/doc/uid/DTS40016228-CH1-TNTAG1-WHAT_CAN_I_DO_TO_HELP_COMBAT_FRAUD_DURING_PURCHASE_TRANSACTIONS_)
* [SKMutablePayment property: applicationUsername \| StackOverflow](https://stackoverflow.com/a/25768965/3869284)
* [In-App-Purchase Bug \| StackOverflow](https://stackoverflow.com/questions/34764970/in-app-purchase-bug)
* [SKPayment.applicationUsername is null \| Apple Developer Forum](https://forums.developer.apple.com/thread/14136)

