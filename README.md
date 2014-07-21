README TIY Durham Weekend 7 HW
------------------------------
A simple site which lists congressional representatives for a user entered address

To Use
------------------------------
- With Ruby and Rails installed
- Clone repository
- cd into cloned directory
- run "rake db:create db:migrate" in command line
- add a secrets.yml file to /config. Place your sunlight foundation api key in secrets.yml and name it in accordance with request_representatives method in the locations controller
- run "rails server" in command line
- navigate to localhost:3000

To Do
------------------------------
- Refactor show template


  Pull out code which accesses API and parses json to separate class
- Change show template to look nicer.


  Display full title and party name when displaying representatives
