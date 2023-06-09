Silva-Backend
===

## API documentation

**User endpoints :**

|Endpoint|Method|Parameters|Description|
|--------|------|----------|-----------|
|**/signup**|POST|`user[email]` `user[password]`|User signup|
|**/login**|POST|`user[email]` `user[password]`|User login|
|**/password**|POST|`user[email]`|Password recover request|
|**/password**|PATCH|`user[reset_password_token]` `user[password]` `user[password_confirmation]`|Password change request|
|**/current_user**|PATCH|Bearer token|Current user object|
