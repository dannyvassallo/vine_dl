#Ruby Vine Downloader

A proof of concept ruby Vine video ripper.

####How To Use

```shell
  git clone http://github.com/dannyvassallo/vine_downloader.git
  cd vine-downloader
  bundle install
```

Create a `.env` modeled after `.env.example`.

Add your Vine login credentials to the `.env` file.

```shell
  ruby vine_downloader.rb
```

The script will create a `downloads` directory in the root
of the project folder with the returned video files in it.
