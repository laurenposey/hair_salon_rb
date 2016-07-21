# _EPICODUS INDEPENDENT PROJECT | Hair Salon_

#### _Hair Salon, 15 July 2016_

#### By _**Lauren Posey**_

## Description

_An application to help a hair salon keep track of what clients are assigned to which stylists._

## Specifications
#### RESTful Routing:

Behavior  | Route | Method | Process
------------- | ------------- | ------------- | -------------
Homepage | / | GET | User requests page. Server renders template.
List all stylist | /stylists | GET | User requests page. Server collects all stylists and returns page to display them.
Show single instance of stylist| /stylists/:id | GET | User requests single instance of stylist. Server uses stylist id to find it and returns a page to display the selected stylist
New stylist form | /stylists/new | GET | User requests to add stylist. Server returns a page with a form that will let the user add a stylist
Create stylist when form is submitted | /stylists | POST | User submits the form. The server grabs the attributes submitted through the form and uses them to create a new object. The server returns the stylists page with the new stylist displayed.
Update a stylist form | /stylist/:id/edit | GET | User requests to update stylist. Server returns the page with a form that will let the user update the stylist.
Update database when stylist edit form is submitted | /stylist/:id | PATCH | User submits the form. The server grabs the attributes submitted through the form and uses them to update the stylist with the id in the URL. The server returns the stylist page.
Add a client to a stylist | /stylist/:id/clients | POST | User submits the form. Server grabs the attributes submitted through the form and uses them to create a new client object. The server returns the stylist page with the new  client displayed.
Update a client on a stylist list of clients | /clients/:id/edit | GET | User requests to update client. Server returns the client edit page that will let the user update the client's information
Update database when client edit  form is submitted | /clients/:id | PATCH | User submits the form. The server grabs the attributes submitted through the form and uses them to update the client with the matching id in the URL. The server returns the clients page.
Delete the stylist resource from the database | /stylists/:id/edit | DELETE | User submits a delete form. Server grabs the id for the stylist from the params and found in the URL, finds the stylist with the matching id and destroys it in the database
Delete the client resource from the database | /clients/:id/edit | DELETE | User submits a delete from. Server grabs the id for the clients from the params and found in the URL. It finds the client with that id and destroys it in the database.




## Setup/Installation Requirements

* _Establish an internet connection_
* _Open a web browser_
* _In terminal run $ bundle_
* _In terminal run $ ruby app.rb_
* _In second terminal window run $ postgres_
* _In third terminal window run $ psql_
* _In psql terminal window run #CREATE DATABASE hair_salon;_
* _In psql terminal window run #CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);_
* _In psql terminal window run #CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);_
* _In psql terminal window run #CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;_


## Known Bugs

 _None_

## Support and contact details

_If you run into any issues or have questions, ideas, or concerns, please feel free to contact Lauren at <a href="mailto:mrslaurenposey@gmail.com">mrslaurenposey@gmail.com</a>._

## Technologies Used

* _Ruby_
* _Sinatra_
* _Heroku_

### License

*MIT License*

Copyright (c) 2016 **_Lauren Posey_**

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
