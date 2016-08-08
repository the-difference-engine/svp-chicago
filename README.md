This website is for Social Venture Partners (SVP) Chicago, a Chicagoland network of philanthropic-minded individuals who invest time, expertise, and money into nonprofits in the Chicago community that are both innovative and scalable.

Some of the main features found in this web application include: 

1.  Forms (LOI) and (RFP) that takes in the company applicant’s information 
2.  The ability for an Admin to add and/or edit questions in the forms
3.  A rating system used to rate applicants’ applications

Application details:

* Ruby version: 2.1.4 
* Rails version: 4.2.5 
* This is a Postgres database
* AngularJS is used on the front end

How to run app:

* `git clone https://github.com/difference-engine-svp/svp-chicago.git`
* `bundle`
* `rake db:create`
    * If your Postgres doesn't have root user, you will have to create one; reference the following website for help: 
        * http://www.postgresql.org/docs/9.1/static/app-createuser.html
        * Use `psql postgres` to access Postgres command line.
        * Type `\du` to see a list of users.
        * If you need to create a root user: `CREATE USER root;`
        * Then: `ALTER USER root CREATEDB;`
        * Other commands:
            * `CREATE DATABASE "svp-chicago_development";`
            * `GRANT ALL PRIVILEGES ON DATABASE "svp-chicago_development" to root;`
            * `ALTER DATABASE "svp-chicago_development" OWNER TO root;`
            * `\q` to quit.
* `rake db:migrate`
* `rake db:seed`
* Start the server: `rails s`
    * Sign up as a new user and run `rails console` in your terminal and run these commands:
        * `user = User.last`
        * `user.admin = true`
        * `user.super_admin = true`
        * `user.save`


Deployment instructions:

* git push qa qa:master
* git push demo demo:master
* git push prod master

    * As a new Heroku collaborator, use these commands to set up your git remotes:
        * QA: `heroku git:remote -a qa-YOUR-APP-NAME -r qa`
        * DEMO: `heroku git:remote -a demo-YOUR-APP-NAME -r demo`
        * PROD: `heroku git:remote -a prod-YOUR-APP-NAME -r prod`

