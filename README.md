README TIY Durham Weekend 7 HW
------------------------------
A simple site which lists congressional representatives for a user entered address

To Use
------------------------------
- With both Ruby and Rails installed
- Clone repository
- cd into cloned directory
- run "rake db:create db:migrate" in command line
- add a secrets.yml file to /config. You can replace the information in
secrets.example.yml and rename it. You must place your activated sunlight
foundation api key in secrets.yml under development and name it in accordance
with the request_representatives method in the locations controller
- run "rails server" in command line
- navigate to localhost:3000

To Do
------------------------------
- Change locations#show template to look nicer.


  Display full title and party name when displaying representatives
