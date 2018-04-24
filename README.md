# README
- Clone this repository
- Create database and run Migrations: rails db:create && rails db:migrate
- Start rails server: rails s
- Test it out: After you create some resources with the examples given below (or other valid examples,
you can go to http://localhost:3000/websites and start navigating the nested html tags.

EXAMPLES:

- Success
curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST -d '{"data": {"type":"websites", "attributes":{"url":"http://www.google.com"}}}' http://localhost:3000/websites

Should give you:

HTTP/1.1 200 OK
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/"ef099e6fd0da0f62fc15bf70528abd27"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7542f2ad-be2c-4302-a7b8-f9a3bd3921b1
X-Runtime: 1.063829
Transfer-Encoding: chunked

{ "url":"http://www.google.com was created successfully"}


-------------------
- Wrong format

curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST -d '{"data": {"type":"websites", "attributes":{"url":"www.google.com"}}}' http://localhost:3000/websites

Should give you:

HTTP/1.1 400 Bad Request
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: 25179cda-dbbf-4e73-b39e-88f682ba3875
X-Runtime: 0.028228
Transfer-Encoding: chunked

 {"error":"Your url is probably malformed (missing http://?) url: www.google.com"}

----------
- Resource not found

curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST -d '{"data": {"type":"websites", "attributes":{"url":"http://www.asdddsq12.com"}}}' http://localhost:3000/websites

Should give you:

HTTP/1.1 404 Not Found
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: 5ecfd62a-5590-4d85-80e8-a0489efe56d9
X-Runtime: 0.227681
Transfer-Encoding: chunked

 {"error":"The following error occured: Failed to open TCP connection to www.asdddsq12.com:80 (getaddrinfo: Name or service not known)"}

