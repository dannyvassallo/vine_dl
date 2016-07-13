#VineDl

A Vine video ripper written in Ruby.

####How To Use

```shell
  git clone http://github.com/dannyvassallo/vine_dl.git
  cd vine-downloader
  bundle install
```

Create a `.env` modeled after `.env.example`.

Add your Vine login credentials to the `.env` file.

```shell
  ruby vine_dl.rb
```

The script will create a `downloads` directory in the root
of the project folder with the returned video files in it.

####Development

###Running tests

Simply run the rake command.

```shell
rake
# or
rake test
```

You can configure `.env` to disable mocks in tests.
This requires valid credentials in ENV.

```shell
VINE_USERNAME=YOUR_REAL_VINE_USERNAME
VINE_PASSWORD=YOUR_REAL_VINE_PASSWORD
NO_MOCKS=false
```

You can tell the tests not to delete the files it downloads.

```shell
VINE_USERNAME=YOUR_REAL_VINE_USERNAME
VINE_PASSWORD=YOUR_REAL_VINE_PASSWORD
NO_MOCKS=false
NO_DELETE_DOWNLOADED_FILES=false
```
