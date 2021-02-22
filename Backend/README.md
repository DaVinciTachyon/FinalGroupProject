# Backend

## Set Up

1. Install docker and docker-compose.
2. Run the command `docker-compose up --build` (if this fails run `docker-compose up --build`).
    The server will be running on `localhost:8080/`.
3. To stop the server, press `ctrl + C`.

## API Specification

### POST /api/forms/

#### Request

Body is defined in `models/Form.js`

#### Response

Status 200

Status 400
Body: { error }

### GET /api/forms/

#### Request

#### Response

Status 200
Body: { forms: [] }

### GET /api/monitors/

#### Request

#### Response

Status 200
Body: { monitors: [] }

### POST /api/register/administrator/

#### Request

Body is defined in `./validation.js - administrator.register`

#### Response

Status 200

Status 400
Body: { error }

### POST /api/login/administrator/

#### Request

Body is defined in `./validation.js - administrator.login`

#### Response

Status 200
Body: { token }

Status 400
Body: { error }

### POST /api/register/monitor/

#### Request

Body is defined in `./validation.js - monitor.register`

#### Response

Status 200

Status 400
Body: { error }

### POST /api/login/monitor/

#### Request

Body is defined in `./validation.js - monitor.login`

#### Response

Status 200
Body: { token }

Status 400
Body: { error }