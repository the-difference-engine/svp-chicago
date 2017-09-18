# SVP Chicago App

### Introduction:

This website is for Social Venture Partners (SVP) Chicago, a Chicagoland network of philanthropic-minded individuals who invest time, expertise, and money into nonprofits in the Chicago community that are both innovative and scalable.

### Some of the main features found in this web application include:

1.  Forms (Letter of Interest - LOI) and (Request for Proposal - RFP) that takes in the company applicant’s information
2.  The ability for an Admin to add and/or edit questions in the forms
3.  A rating system used to rate applicants’ applications

### Application details:

* Ruby version: 2.1.4
* Rails version: 4.2.5
* This is a Postgres database
* AngularJS is used on the front end
* Hosted on Heroku
* AWS used for images
* Answers - used for answers to the LOI form
* Attachments - the documents uploaded to an RFP
* Challenges - text fields for rankings, and full time employees, for LOI
* Dashboard - default page that displays different content depeneding on user, admin, or superadmin
* Emails - used to send invitations to submit an RFP if their LOI has been approved and to send rejection emails if their LOI has not been approved
* FTES - used for the full time employee question on the LOI form
* Invite maxes - a number that can be set by the superadmin that designates how many yeses an admin can give to applications
* Invited LOIs - the status assigned to applicants who have approved LOIs and have been invited to submit an RFP
* Landings - accessed by clicking the Home button on the nav bar, provides information on SVP and the process.
* LOIS - used for the LOI form
* Questions - these are the questions on the LOI form that have been created in the seed file. A superadmin has the capability to edit these questions.
* Ratings - admins have the ability to rate the LOIS
* RFP Answers - the answers to the RFP questions
* RFP Questions - these are the questions on the RFP form that have been created in the seed file. A superadmin has the capability to edit these questions. 
* RFP Ratings - admins have the ability to rate the RFPs
* RFP Sections - creates the sections of the RFP, such as Contact Information and Organization.
* RFPs - the RFP form
* Sections - creates the sections of the LOI
* Subanswers - Answers to the subquestions
* Subquestions - For RFP questions that have question type multiple input, allowing the user to dynamically add more information to their responses
* User_notifier - 
* Users - users can access via My Applications, super-admins can access to manage all users


### Installing:

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
* `rails s`

* Sign up as a new user and run `rails console` in your terminal and run these commands:
       * `user = User.last`
       * `user.admin = true`
       * `user.super_admin = true`
       * `user.save`

### Deployment instructions:

* git push qa qa:master
* git push demo demo:master
* git push prod master
   * As a new Heroku collaborator, use these commands to set up your git remotes:
       * QA: `heroku git:remote -a qa-YOUR-APP-NAME -r qa`
       * DEMO: `heroku git:remote -a demo-YOUR-APP-NAME -r demo`
       * PROD: `heroku git:remote -a prod-YOUR-APP-NAME -r prod`
