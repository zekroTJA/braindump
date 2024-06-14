DKIM = DomainKeys Identified Mail

# The Problem

Mail senders can impersonate a legitimate domain in the sender section of an email (aka domain spoofing).

# The Solution

- DKIM DNS record stored in the used domain’s DNS zone
- The sending mail server has a private and public key; the public key is stored in the DKIM DNS record
- All sent emails include a DKIM header signed with the private key of the mail server
- The received mail server can then check the signature of the DKIM mail header using the public key from the public DKIM record of the sending domain

## Example DKIM DNS record

| Name | Type                             | Content | TTL                                                                         |      |
| ---- | -------------------------------- | ------- | --------------------------------------------------------------------------- | ---- |
|      | big-email._domainkey.example.com | TXT     | v=DKIM1; p=76E629F05F709EF665853333EEC3F5ADE69A2362BECE40658267AB2FC3CB6CBE | 6000 |

# Resources

- [https://www.cloudflare.com/learning/ssl/what-is-domain-spoofing/](https://www.cloudflare.com/learning/ssl/what-is-domain-spoofing/)
- [https://www.cloudflare.com/learning/dns/dns-records/dns-dkim-record/](https://www.cloudflare.com/learning/dns/dns-records/dns-dkim-record/)