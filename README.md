Postovani,

Na pocetku je neophodno uraditi samo composer install i nakon toga kopirati sve iz ".env.example" u ".env" file.
U samom root-u project-a postoji i baza sa svim podacima ukoliko je potrebna pod imaneom "projectland.sql".

Ovde cu takodje ostaviti i primere request-ova iz postmana kako bi Vam olaksao testiranje :

POSTMAN:
_______________________________________

Sortiranje i filtriranje :
GET

Body->raw(JSON)

/api/articles

{
    "sortByName" : "New articlee",
    "sortByPrice" : "up" || "down",
    "filterByCategory" : 4,
    "uloga" : "admin" || "prodavac" || "kupac"(OPCIONO)
}

{
    "sortByName" : "New articlee",
    "sortByDiscountPercentage" : "up" || "down",
    "filterByCategory" : 4,
    "uloga" : "admin" || "prodavac" || "kupac"(OPCIONO)
}
_______________________________________


Insert artikla :
POST

Body->form-data

/api/articles/

{
    "image" : FILE,
    "name" : "IME",
    "category_id" : 4(primer),
    "description" : "TEXT",
    "quantity" : 4(primer),
    "price" : 4(primer),
    "discount" : "admin",
    "uloga" : "up"
}
_______________________________________


Update artikla :
POST

Body->form-data

/api/articles/{id}

{
    "image" : FILE(ukoliko je nova slika) || Text(Ukoliko slika nije promenjena),
    "name" : "IME",
    "category_id" : 4(primer),
    "description" : "TEXT",
    "quantity" : 4(primer),
    "price" : 4(primer),
    "discount" : 4(primer),
    "uloga" : "admin"||"prodavac",
    "_method" : "PUT"
}
_______________________________________

Delete artikla :
DELETE

Body->raw(JSON)

/api/articles/{id}

{
    "uloga" : "admin"||"prodavac"||"kupac"
}

_______________________________________

Show artikla :
GET

Body->raw(JSON)

/api/articles/{id}

{
    "uloga" : "admin"||"prodavac"||"kupac"
}
_______________________________________

Purchase artikla :
POST

Body->raw(JSON)

/api/purchase

{
    "articles": [
        {
            "articleId": 16,
            "quantity": 3
        },
        {
            "articleId": 17,
            "quantity": 2
        },
        {
            "articleId": 18,
            "quantity": 3
        }
    ]
}
