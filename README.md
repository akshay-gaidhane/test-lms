
# LMS

This is simple lms consisting 3 role

Admin user should be created from backend
The other two will be created from UI


## Installation

It requires 
``` ruby 2.7.0```
and ``` rails 6.1.4```

Install the dependencies and devDependencies and start the server.

```sh
cd test-lms
rake db:create
rake d:migrate
rails s
```

For Admin creation run below command from rails console

```sh
rails c
User.create(email: 'test@admin.com', password: 'admin@123', role: 'admin')
```

