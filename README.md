[![Build Status](https://travis-ci.com/cyberplanner/booking_manager.svg?token=2GwpjbQN1QM2GpxTtmcG&branch=master)](https://travis-ci.com/cyberplanner/booking_manager)

# Booking Manager

#### Babylon Ruby Tech Test
----
A simple command line program made with Ruby that allows booking appointment with one of two doctors using a dataset sourced from the provided json file.

## Usage Instructions :

* Clone the repo:

```
$ git clone git@github.com:cyberplanner/booking_manager.git
```

* Navigate inside the app's directory:

```
$ cd booking_manager
```
* Run bundler:

```
$ bundle install
```
* Run the app:

```
$ ./availability.rb *time*
```
#### Usage notes :
* You might need to change the app's premessions to excute it:
```
$ chmod u+x availability.rb
```

## Testing :
* You can run the test suite from the root directory@
```
$ rspec
```
* Travis CI was used for continuous integration.


## Specifications :

* The app accepts time as an argument (eg: 12:40) and returns a confirmation message with the time of the booking, as per instructions' examples.
![alt text](http://i66.tinypic.com/2s7tnd5.jpg "booking an appointment")

* If the time slot provided in the the argument is not available the app books the next time slot available.

* the same time slot could be booked if one of the two doctors is available.

* Users can not book an appointment outside working hours (08:00AM ~ 15:00PM), as per instructions.
![alt text](http://i67.tinypic.com/rm8w1j.jpg "Error 1")
* If the user did not provide time as argument the app prints an error message instructing the user to provide the time.
![alt text](http://i65.tinypic.com/1zee9o9.jpg "Error 2")

----
#### Thanks for checking out my code, feedback is welcomed and appreciated.
----
