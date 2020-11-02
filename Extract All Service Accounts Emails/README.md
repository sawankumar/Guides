<h1 align="center">🔥 Extract Service Accounts Emails</h1> 

<hr>

> ## Extract All Service Accounts Emails

## Windows :-

1.Open powershell in accounts folder and run - 

```
(Select-String -Path *json -Pattern 'client_email').Line | Set-Content AllSAEmails.txt
```

## Linux :-

```
grep -oPh '"client_email": "\K[^"]+' *.json > emails.txt
```

This will save all the e-mails in a `AllSAEmails.txt` file.