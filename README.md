Nightly integration tests for gRPC communication between Mu-Scala and
Mu-Haskell.

## How it works

1. Clones the Mu-Scala repo (which is where the tests live)
2. Updates `stack.yaml` to use the master branch of Mu-Haskell instead of the
   latest release version
3. Builds the `cb372/mu-scala-haskell-integration-tests` Docker image
4. Runs the tests: `sbt haskell-integration-tests/test`

This means it is testing the master `HEAD` of Mu-Scala against the master `HEAD`
of Mu-Haskell every night.

## Where it runs

The tests run every night on
[CircleCI](https://app.circleci.com/pipelines/github/higherkindness/mu-scala-haskell-integration-tests).

They can't run as a GitHub Actions workflow because building the Docker image
needs too much disk space.

They used to run on Travis CI until it stopped being free.
