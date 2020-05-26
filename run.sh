#! /usr/bin/env bash

set -eo pipefail

git clone https://github.com/higherkindness/mu-scala.git

# Overwrite stack.yaml to point at Mu-Haskell master HEAD
sha=$(curl -s https://api.github.com/repos/higherkindness/mu-haskell/branches/master | jq -j '.commit.sha')
sed -e "s/HEAD/$sha/" stack.yaml > mu-scala/modules/haskell-integration-tests/mu-haskell-client-server/stack.yaml

pushd mu-scala/modules/haskell-integration-tests/mu-haskell-client-server
./build.sh
popd

cd mu-scala
sbt haskell-integration-tests/test
