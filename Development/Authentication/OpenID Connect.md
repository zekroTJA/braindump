OpenID Connect (or short **OIDC** is a standard built on top of OAuth2 for user **authentication**.

# Flow

1. Navigate to the login page using the `client_id`, `redirect_url` and `scopes`. Scopes for that manner must include `openid` as well as the [OpenID standardized scopes](https://openid.net/specs/openid-connect-core-1_0.html#StandardClaims) separated by spaces. *Auth0 Example: [https://auth0.com/docs/api/authentication?http#login*](https://auth0.com/docs/api/authentication?http#login*)
2. Retrieving an access code which the can be exchanged in a `/token`. This endpoint responds with an access and refresh token as well as an identity token formatted as JWT containing the requested user information. *Auth0 Example: [https://auth0.com/docs/api/authentication?http#get-token*](https://auth0.com/docs/api/authentication?http#get-token*)
3. After that, the token can be validated using the JWT signature. The public keys can be fetched via this endpoint: `{address}/.well-known/jwks.json` Or alternatively, the path to the JWKS can be found here: `{address]/.well-known/openid-configuration` Auth0 Example: [https://auth0.com/docs/secure/tokens/json-web-tokens/validate-json-web-tokens](https://auth0.com/docs/secure/tokens/json-web-tokens/validate-json-web-tokens)

# Resources

- [https://youtu.be/PsbIGfvX900](https://youtu.be/PsbIGfvX900)
- [https://auth0.com/docs/get-started/apis/scopes/openid-connect-scopes](https://auth0.com/docs/get-started/apis/scopes/openid-connect-scopes)
- [https://auth0.com/docs/secure/tokens/json-web-tokens/validate-json-web-tokens](https://auth0.com/docs/secure/tokens/json-web-tokens/validate-json-web-tokens)
- [https://github.com/Keats/jsonwebtoken/blob/master/examples/auth0.rs](https://github.com/Keats/jsonwebtoken/blob/master/examples/auth0.rs)