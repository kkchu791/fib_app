# Fib App - Backend Web Challenge

Get the next or previous number of your current fibonacci number.

------------------

Live site can be found here: [fib_client](https://fib-client.surge.sh)

### Setup backend instructions

```
$ cd fib_api
$ bundle install
$ rails s -p 3001

```

### Fib_App API Documentation

Built with `rswag` gem.

[fib_api documentation](https://fib-api.herokuapp.com/api-docs/index.html)

### Running tests

```
$ cd fib_api
$ rspec spec
```

### Setup frontend instructions

```
$ cd fib_client
$ yarn install
$ yarn start

```

### Implementation Notes on Requirements

**1. The API must be able to handle high throughput (~1k requests per second)**

From doing some load tests, we can see that our API can handle 1000 requests per second.

https://ldr.io/33ktsGx

This load test is simulating 1000 users making calls to endpoint `https://fib-api.herokuapp.com/api/v1/current?position=1` every second for 15 seconds.

We can see from the *details* tab, that we have all success responses up to 11 sec. After that, we start to get a few timeout errors.


To alleviate the timeouts, we could add multiple Redis servers and a load balancer to evenly distribute the requests to each server.
We could also calculate the previous and next numbers of each requested position on a worker instance and preload those into our cache. That way, when the user clicks the next or previous button, we would have those numbers ready for him.

**2. The API should also be able to recover and restart if it unexpectedly crashes.**

Heroku dynos will automatically restart if the server were to crash. [Docs here](https://devcenter.heroku.com/articles/dynos#dyno-crash-restart-policy)

**3. Assume that the API will be running on a small machine with 1 CPU and 512MB of RAM.**

The only thing in the app that will use extensive server memory is the cache layer. The cache allows us to save fibonacci numbers based on position so we don't need to recalculate them again. I've set my cache memory to be at 512MB. If it reaches the limit, it will start removing least used key-values pairs from the cache object.
