# CraftBin Website

The CraftBin website uses MongoDB for saving documents, CarrierWave for uploading files, and Devise for authentication.


### Running
To set up Mongoid, the MongoDB ORM, you must add the `config/mongoid.yml` file with your database information. A template can be created with
`$ rails g mongoid:config`


If you want to be able to receive confirmation emails from Devise, you must set up the `config/mail.yml` file with your
smtp information. An example can be found at `config/mail_example.yml`