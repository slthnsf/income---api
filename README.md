# Income API Documentation

## Authentication

### Login
Request:
- Method: POST
- Endpoint: `/user/login`
- Body:
```json
{
    "email": "admin@mail.com",
    "password": "admin123"
}
```
Response:
```json
{
    "iduser": 1,
    "username": "admin",
    "fullname": "Admin",
    "email": "admin@mail.com",
    "password": "admin123",
    "idstatus": 1,
    "idrole": 1,
    "otp": "axYbc",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZHVzZXIiOjEsInVzZXJuYW1lIjoiYWRtaW4iLCJmdWxsbmFtZSI6IkFkbWluIiwiZW1haWwiOiJhZG1pbkBtYWlsLmNvbSIsInBhc3N3b3JkIjoiYWRtaW4xMjMiLCJpZHN0YXR1cyI6MSwiaWRyb2xlIjoxLCJvdHAiOiJheFliYyIsImlhdCI6MTYzMDQ2MDI3MiwiZXhwIjoxNjMwNTAzNDcyfQ.bq3fS3eQUM2xsygGQNlMiOAB7kZawM_QRcBzknH3jfA"
}
```

## Financial Report

### Read Income
Request:
- Method: GET
- Endpoint: `/budget/income`
Response:
```json
{
    "total": 317000,
    "month": 128000,
    "day": 128000,
    "data": [
        {
            "date": "2021-08-09T15:15:49.000Z",
            "income": 20000
        },
        {
            "date": "2021-08-10T15:25:32.000Z",
            "income": 30000
        },
        {
            "date": "2021-08-12T08:12:45.000Z",
            "income": 10000
        },
        {
            "date": "2021-08-20T08:12:45.000Z",
            "income": 13000
        },
        {
            "date": "2021-08-21T08:08:36.000Z",
            "income": 60000
        },
        {
            "date": "2021-08-22T08:12:36.000Z",
            "income": 22000
        },
        {
            "date": "2021-08-24T08:12:36.000Z",
            "income": 34000
        },
        {
            "date": "2021-09-01T00:30:34.000Z",
            "income": 128000
        }
    ]
}
```

### Read Expense
Request:
- Method: GET
- Endpoint: `/budget/expenses`
Response:
```json
{
    "expenses": 190000,
    "month": 60000,
    "day": 60000,
    "data": [
        {
            "date": "2021-08-12T08:12:45.000Z",
            "expenses": 90000
        },
        {
            "date": "2021-08-14T08:12:45.000Z",
            "expenses": 40000
        },
        {
            "date": "2021-09-01T00:30:34.000Z",
            "expenses": 60000
        }
    ]
}
```

### Read Asset
Request:
- Method: GET
- Endpoint: `/budget/asset`
Response:
```json
{
    "asset": 8475000
}
```
