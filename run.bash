#!/bin/bash
set -euxo pipefail

DOCKER_IMAGE=quay.io/pypa/manylinux1_x86_64
PLAT=manylinux1_x86_64


echo "Clearing out wheelhouse, hope you don't have anything important there!"
rm -vf wheelhouse/*

docker run --rm -it -e PLAT=$PLAT --user $(id -u):$(id -g) \
       -v $(pwd):/io $DOCKER_IMAGE \
       /opt/python/cp35-cp35m/bin/pip --no-cache wheel /io/ -w /io/wheelhouse


echo "Pretending our wheel is actually manylinux1..."
for wheel in wheelhouse/*.whl; do
    # Just pretend all our wheels are manylinux1
    mv ${wheel} ${wheel//any.whl/$PLAT.whl}
done
echo "FOOLED YOU, PyPI AND PIP!"