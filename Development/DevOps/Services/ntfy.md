A notification server which can push notifications to any devices simply over a REST API.

GitHub Repository: https://github.com/binwiederhier/ntfy
Docs: https://docs.ntfy.sh/

## User and Access Management

```bash
# Create a new user
ntfy user add <username>

# Set access of user to topics
# Mode can be rw, ro, wo, ...
ntfy access <uername> <topic> <mode>

# Add an access token for a user
ntfy token add <username>

# Change user password
ntfy user change-pass <username>

# Delete user
ntfy user remove <username>
```

## Send Notifications

In the Docs: https://docs.ntfy.sh/publish/

```
POST /<topic>
Title: <title>
Priority: <priority>
Tags: <tags>

Message as text.
```

### Authorization

Is done via the `Authorization` header and can either be the username/password combination using basic auth or a user token using `Bearer` auth.

> ⚠️ **IMPORTANT**: When using the `Authorization` header, the type (`Basic` or `Bearer`) is case sensitive! Lowercase `basic` or `bearer` will not work!