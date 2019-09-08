PoC for STF deployment on a single machine
===========
# Installation

* install docker
* install docker-compose
* clone this repo

# Usage
Stf is designed to distributed deployed but its modules is too much for a common use case.

There are four services in main docker-compose after we merge most modules:

1. nginx
2. rethinkdb
3. migrate (one-shot, stop after completion)
4. app (including most modules except for provider and adb)

Provider module(along with adb) is separated in case multiple providers.

To start main service in one machine:
`docker-compose up -d --build`

Then start provider:
`cd provider`
`start-provider.sh`

You can execute `start-provider.sh` multiple times to start multiple provider/adb instances. And then use `stop-provider.sh` to shutdown instances one by one accordingly. This is mainly prepared for using one adb for exactly one phone to separate adb instaces in case `abd kill-server` making all devices test-case stop




# Original Usage
choose an IP your deployment should use, usually that will be the IP of your host.  
choose a secret to be used for inter-service authentication.  
Update the `.env` file accordingly

Run `docker-compose up -d --build`  
Point your browser to the IP you chose,  
login by providing any username and valid e-mail.


A little write-up on this setup:  
https://medium.com/@nikosch86/getting-started-with-automated-in-house-testing-on-android-smartphones-using-stf-dafecee4a8ee  
If you clap it will make me happy :)
