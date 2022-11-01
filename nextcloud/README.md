Home deployment
===============

## Some notes

I haven't installed the database in this pod because the application connects
to another database in another host.

To run it you must
- create the database in the database server
  ```
  create Database nextcloud;
  ```
- grant permission to the user in this subnet
  ```
  Grant All Privileges ON nextcloud.* to 'nextcloud'@'%' Identified By 'YOUR_PASSWORD'; 
  ```

Don't forget to rename SECRET.yaml to secret.yaml and change the values
