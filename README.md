This website is for Social Venture Partners (SVP) Chicago, a Chicagoland network of philanthropic-minded individuals who invest time, expertise, and money into nonprofits in the Chicago community that are both innovative and scalable.

Some of the main features found in this web application include: 

1.  A form (LOI) that takes in the company applicant’s information 
2.  The ability for an Admin to add and/or edit questions in the form
3.  A rating system used to rate applicants’ LOI

Application details:
* Ruby version: 2.1.4 
* Rails version: 4.2.5 
* This is a Postgres database
* AngularJS is used on the front end

How to run app:

* git clone https://github.com/difference-engine-svp/svp-chicago.git
* bundle
* rake db:create
    * If your Postgres doesn't have root user, you will have to create one; reference the following website for help: 
        * http://www.postgresql.org/docs/9.1/static/app-createuser.html
* rake db:migrate
* start the server

Deployment instructions
* git push qa qa:master
* git push demo demo:master
* git push prod master

