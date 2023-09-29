# RSpec tests for mlibrary/aspace-oauth

This project has a basic setup for running unit tests.\
It should be sufficient for writing and testing aspects of the code which do not rely on ArchivesSpace directly.

## Building and running tests

To run `rspec` using Docker, use the following commands.

```
docker compose build
docker compose run test bundle exec rspec
```

Note that the `Dockerfile` makes use of a CRuby version equivalent to the JRuby version ArchivesSpace 3.4.1 is currently using.
There were issues building with JRuby, but we may switch to that at a later time.
