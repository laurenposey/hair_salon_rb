# _EPICODUS INDEPENDENT PROJECT | Hair Salon_

#### _Hair Salon, 15 July 2016_

#### By _**Lauren Posey**_

## Description

_An application to help a hair salon keep track of what clients are assigned to which stylists._

## Specifications

Behavior  | Input Example | Output Example
------------- | ------------- | -------------
User can add stylist to the database and stylist name shows in browser.|"Katie"|"Katie"
User can add client to he database and client's name shows up in browser.|"Bessie"|"Bessie"
User can assign client to a stylist|stylist: "Katie" client: "Bessie"|stylist: "Katie" client: "Bessie"
User can click on stylist's name and see all of that stylists clients|click event|Katie's clients: Bessie

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

_PROJECT IS INCOMPLETE:_
* _app.rb is empty_
* _Specs Stylist#clients and Stylist#update not passing_
* _No integration specs_
* _No use of RESTful routing_

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
