SPF = Sender Policy Framework

# The Problem: Sender Address Forgery

Senders of E-Mails are able to enter any sender address into an E-Mail without being the actual sender sending the E-Mail.

# The Solution

- SPFv1 protects the _envelope sender address_ (aka _return-path_), which is used during the transport from mail-server to mail-server to return a message on failed delivery.
- Allows the owner of a domain a mail sending policy containing e.g. which mail servers are used
- The domain owner publishes the policy in an SPF record in the domain’s DNS zone
- The receiving mail server checks the SPF record against the server from which a message was received

## Example Policy entry:

```
example.net.  TXT  "v=spf1 mx a:pluto.example.net include:aspmx.googlemail.com -all"
```

|v=spf1|SPF version 1|
    |---|---|
    |mx|the incoming mail servers (MXes) of the domain are authorized to also send mail for [example.net](http://example.net)|
    |a:pluto.example.net|the machine [pluto.example.net](http://pluto.example.net) is authorized, too|
    |include:aspmx.googlemail.com|everything considered legitimate by [gmail.com](http://gmail.com) is legitimate for [example.net](http://example.net), too|
    |-all|all other machines are not authorized|

# Resources

- [http://www.open-spf.org/Introduction/](http://www.open-spf.org/Introduction/)
- [http://www.open-spf.org/SPF_Record_Syntax/](http://www.open-spf.org/SPF_Record_Syntax/)
- [https://www.rfc-editor.org/rfc/rfc7208](https://www.rfc-editor.org/rfc/rfc7208)