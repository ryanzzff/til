# Verify SSH passphrase/Show associated public key of the private key

```
ssh-keygen -y -f <private_key>
ssh-keygen -y -f ~/.ssh/id_rsa
```

The associated public key will be shown if the entered passphrase is correct.

# References

- https://stackoverflow.com/questions/4411457/how-do-i-verify-check-test-validate-my-ssh-password/23666831#23666831