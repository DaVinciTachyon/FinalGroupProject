# Backend

## Set Up

1. Install docker and docker-compose.
2. Add `.env` file.
```
DB_CONNECT=mongodb://monitorDB:27017/<Database Name>
PORT=8080
ADMIN_TOKEN_SECRET=<Random String>
MONITOR_TOKEN_SECRET=<Random String>
```
3. Run the command `docker-compose up --build` (if this fails run `sudo docker-compose up --build`).
    The server will be running on `localhost:8080/`.
4. To stop the server, press `ctrl + C`.

## API Specification

### POST /api/forms/

#### Request

Header: { auth-token }

Body is defined in `models/Form.js`

#### Response

Status 200

Status 400
Body: { error }

### GET /api/forms/

#### Request

Header: { auth-token }

#### Response

Status 200
Body: { forms: [] }

### GET /api/monitors/

#### Request

Header: { auth-token }

#### Response

Status 200
Body: { monitors: [] }

### POST /api/administrator/register/

#### Request

Body is defined in `./validation.js - administrator.register`

#### Response

Status 200

Status 400
Body: { error }

### POST /api/administrator/login/

#### Request

Body is defined in `./validation.js - administrator.login`

#### Response

Status 200
Body: { token }

Status 400
Body: { error }

### POST /api/administrator/update/name/

#### Request

Body: {
    email,
    name
}

#### Response

Status 200

Status 400
Body: { error }

### POST /api/administrator/update/password/

#### Request

Body: {
    email,
    password
}

#### Response

Status 200

Status 400
Body: { error }


### POST /api/administrator/deactivate/

#### Request

Body: { email }

#### Response

Status 200

Status 400
Body: { error }

### POST /api/administrator/activate/

#### Request

Body: { email }

#### Response

Status 200

Status 400
Body: { error }

### POST /api/monitor/register/

#### Request

Body is defined in `./validation.js - monitor.register`

#### Response

Status 200

Status 400
Body: { error }

### POST /api/monitor/login/

#### Request

Body is defined in `./validation.js - monitor.login`

#### Response

Status 200
Body: { token }

Status 400
Body: { error }

### POST /api/monitor/update/name/

#### Request

Body: {
    name,
    macAddress
}

#### Response

Status 200

Status 400
Body: { error }

### POST /api/monitor/update/password/

#### Request

Body: {
    password,
    macAddress
}

#### Response

Status 200

Status 400
Body: { error }

### POST /api/monitor/update/macAddress/

#### Request

Body: {
    macAddress,
    newMacAddress
}

#### Response

Status 200

Status 400
Body: { error }

### POST /api/monitor/deactivate/

#### Request

Body: { macAddress }

#### Response

Status 200

Status 400
Body: { error }

### POST /api/monitor/activate/

#### Request

Body: { macAddress }

#### Response

Status 200

Status 400
Body: { error }

### POST /api/notes/

#### Request

Header: { auth-token }

Body is defined in `models/Note.js`

#### Response

Status 200

Status 400
Body: { error }

### GET /api/notes/

#### Request

Header: { auth-token }

#### Response

Status 200
Body: { notes }

Status 400
Body: { error }

### POST /api/notes/edit/

#### Request

Header: { auth-token }

Body: {
    _id,
    content,
    editDate
}

#### Response

Status 200

Status 400
Body: { error }

### POST /api/notes/delete/

#### Request

Header: { auth-token }

Body: { _id }

#### Response

Status 200

Status 400
Body: { error }