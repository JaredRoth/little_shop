## Little Shop

Small "store" for distributing digital media. First rails project and built in two weeks, so it lacks a number of features like payment processing. As customers checkout, they are sent a download link to their email address. We utilized AWS and Paperclip for file storage/management.

### Setup

To get the project running on your machine, clone and bundle. We use postgresql, so make sure that's installed and up and running and then run `rake db:setup`

At this point, you have a functional, but basically empty project with one admin user. (See `seeds.rb`) To add more admins, use the console.

Tests are simply run via `rspec`
