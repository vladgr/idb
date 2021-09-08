# PKB - Responsive Flutter Web / Desktop / Android / iOS

"Personal Knowledge Base" app written on Flutter.

## About project

This project was originally made on Django many years ago, then ported to React Web PWA and now I ported it to Flutter.

95% of time I use it on Desktop, so compiled it to Mac desktop app.

Also deployed Web PWA to server to use it on any other devices (phones, tablets). Web and Mac are ready for use, everything else is supported, but not tested. Most likely will work.

PKB has simple and comfortable UI that allows to find anything in few seconds.

I use this UI setup for more than 5 years since it was made on React and like it.

Features.

-   authentication
-   multi-users with admin access to share with your team members when needed
-   tags
-   items (notes)
-   quick search
-   keyboard shortcuts
-   uploading images and storing on AWS S3

## Json config that hidden in gitignore

assets/json/config.json

```
{
    "apiUrl": "https://<Your REST API Url>",
    "sentryDSN": "<Your sentry DNS to report errors>",
    "bucketUrl": "https://<your_bucket>.s3.amazonaws.com"
}
```

## Keyboard shortcuts

```
All shorcuts are listed in app_shortcuts.dart and self explanatory.
```

## To use project for yourself, you will need to implement own backend (simple REST API)

Backend models are matched to frontend models: user.dart, tag.dart, item.dart.

## Endpoints (see config.dart)

Login endpoint.

```
POST request.
Params: email, password
Response (200): token
```

User profile endpoint.

```
GET request.
Response (200): User model.
```

Users endpoint

```
GET request.
Response (200): List of User model.
```

Tags endpoint

```
GET request
Response (200): List of Tag model.
```

Items endpoint

```
GET request

Filter params:

search: string (search phrase)
user_id: int (filter by user)
tag_ids: string (comma separated tag ids)

Response (200): List of Item model.


POST request (create item)

Input params:

name: string
content: string
tag_ids: list of ints

Response (201): Created Item model.
```

Item detail endpoint

```
GET request
Response: Item model.

PATCH request (update item)

Input params:

content string
tag_ids: string (list of ints)

Response (200): Updated Item model.

DELETE request
Response (204)
```

Sign S3 upload (if you need working with images)
The endpoint is used to sign url for upload to S3

```
POST request

Input params:

filename: string
content_type: string

Response (200):

signed_url: url that will be used for uploading image to AWS S3.
upload_to: the path inside AWS S3 bucket where file will be stored.

https://<your_bucket>.s3.amazonaws.com/<this_is_the_path>

```

Items (notes) are stored in database on backend using markdown. Flutter app shows content as rendered HTML using `flutter_html` package. I do markdown to HTML convertion on backend using `markdown` Python library, but optionally you can do convertion on Flutter using `flutter_markdown` package.
