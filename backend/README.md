# Telleo REST-API Documentation

## CONFIG VARS
To run the application you need the following config variables: 
```ts
  const env = {
    PORT: process.env.PORT,
    REFRESH_TOKEN_SECRET: process.env.REFRESH_TOKEN_SECRET,
    ACCESS_TOKEN_SECRET: process.env.ACCESS_TOKEN_SECRET,
    DB_CONNECTION: process.env.DB_CONNECTION,
    ACCESS_TOKEN_EXPIRES_IN: process.env.ACCESS_TOKEN_EXPIRES_IN,
  };
```

## API Key
Append the api key to every request as a query parameter (not needed as of now)
For example:
```
url/path/to/something?apiKey={key}
```
## Authorization
Provide your current token in the authorization header like so:
```json
"authorization": "BEARER {token}"
```
When a valid token is required and it is not given or it is invalid a 403 HTTP-Error is returned

## Endpoints
### Auth
#### Basic endpoint
``/auth``
#### Sign in (POST)
##### Endpoint
`/signin`
##### Body
- Email
- Password
##### Authorization
- No token needed
##### Error Codes
- 102
- 200
- 202
##### Response
```json
{
    "error": false,
    "user": {
        "name": {name},
        "uid": {uid},
        "email": {email},
        "profilePictureUrl": {profilePictureUrl}
    },
    "tokens": {
        "accessToken": {accessToken},
        "refreshToken": {refreshToken}
    }
}
```
#### Sign up (POST)
##### Endpoint
`/signup`
##### Body
- Email (valid email)
- Password (8 characters or longer)
##### Authorization
- No token needed
##### Error Codes
- 102
- 201
- 203
- 204
##### Response
```json
{
    "error": false,
    "user": {
        "name": {name},
        "uid": {uid},
        "email": {email},
        "profilePictureUrl": {profilePictureUrl}
    },
    "tokens": {
        "accessToken": {accessToken},
        "refreshToken": {refreshToken}
    }
}
```

#### Refresh access token (POST)
##### Endpoint
`/token`
##### Body
- refreshToken
##### Authorization
- No token needed
##### Error Codes
- 102
- 206
##### Response
```json
{
    "error": false,
    "accessToken": "{token}"
}
```

### Api
#### Basic endpoint
``/api``
#### Users
##### Get one by email (GET)
##### Endpoint
`/users/email/{email}`
##### Body
- none
##### Authorization
- A valid token is needed
##### Error codes
- 205
- 300
##### Response
```json
{
    "error": false,
    "user": {
        "name": {name},
        "uid": {uid},
        "email": {email},
        "profilePictureUrl": {profilePictureUrl}
    },
}
```

##### Get one by token (GET)
##### Endpoint
`/users/token/{token}`
##### Body
- none
##### Authorization
- A valid token is needed
##### Error codes
- 205
- 300
##### Response
```json
{
    "error": false,
    "user": {
        "name": {name},
        "uid": {uid},
        "email": {email},
        "profilePictureUrl": {profilePictureUrl}
    },
}
```
##### Get all(GET)
##### Endpoint
`/users`
##### Body
- none
##### Authorization
- A valid token is needed
##### Error codes
- 205
##### Response
```json
{
    "error": false,
    "users": [
        {
        "name": {name},
        "uid": {uid},
        "email": {email},
        "profilePictureUrl": {profilePictureUrl}
        },
    ...
    ],
}
```

##### Search users(GET)
##### Endpoint
`/search/{query}`
##### Body
- none
##### Authorization
- A valid token is needed
##### Error codes
- 102
##### Response
```json
{
    "error": false,
    "users": [
        {
        "name": {name},
        "uid": {uid},
        "email": {email},
        "profilePictureUrl": {profilePictureUrl}
        },
    ...
    ],
}
```

#### Chats

##### Get chats(GET)
##### Endpoint
`/chats/{uid}`
##### Body
- none
##### Authorization
- A valid token is needed
##### Error codes
- 102
- 103
##### Response
```json
{
    "error": false,
    "chats": [
        {
        "users": [users (see above)],
        "id": {id},
        "messages": [
            {
                sender: string,
                content: string
            }
        ],
        },
    ...
    ],
}
```

##### Create chat(POST)
##### Endpoint
`/create`
##### Body
- users: string[]
##### Authorization
- A valid token is needed
##### Error codes
- 102
- 103
- 300
- 401
- 402
##### Response
```json
{
    "error": false,
    "chat": {
        "users": [users (see above)],
        "id": {id},
        "messages": [
            {
                sender: string,
                content: string
            }
        ]
        },
}
```

## Error Codes
### General
- 100: Route not found
- 101: Internal server error
- 102: Missing property
- 103: Bad property

### Auth
- 200: Wrong password
- 201: Enail already in use
- 202: Email not found
- 203: Invalid email
- 204: Invalid password
- 205: Token expired
- 206: Invalid refresh token

### Users
- 300: User not found

### Chats
- 400: Chat not found
- 401: Chat already exists
- 402: Invalid number of users
