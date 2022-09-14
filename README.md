# docker-chef

A containerised runtime environment for the [Chef](https://esolangs.org/wiki/Chef) esolang, using a fork of the [RChef interpreter](https://github.com/booleancoercion/rchef) originally written by GitHub user [booleancoercion](https://github.com/booleancoercion). 

#### A note on RChef
Due to RChef having more stringent requirements than most Chef interpreters, some programs that run fine on other implementations may exhibit unexpected behaviour. This will be resolved once time and effort allows for it.

# Build

Before proceeding, please ensure that you have Docker and Git installed on your machine.

Next, clone the repository and build the Docker image as follows:
```
git clone https://github.com/richarah/docker-chef.git
cd docker-chef
docker build . -t docker-chef
```

# Run
Once the image is built, it may be run as follows. By default, the image includes a `recipes` folder for example programs, though additional folders may be mounted using the `-v` flag.
```
docker run -it docker-chef
```
The Chef interpreter may now be run from within the container.

For instance, to run the Fibonacci example (using the `-s` spaced mode flag for neater formatting):

```
rchef -s FibonacciDuFromage.chef
```

Bon appetit!
