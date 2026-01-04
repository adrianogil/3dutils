# export UTILS3D_DIR=<path>
# source $UTILS3D_DIR/src/bashrc.sh

source $UTILS3D_DIR/src/info_tools.sh

export UTILS3D_DOCKER_IMAGE=${UTILS3D_DOCKER_IMAGE:-3dutils}

function utils3d-docker-run()
{
    docker run --rm -v "$PWD":/work -w /work "$UTILS3D_DOCKER_IMAGE" "$@"
}

function docker-mesh-info-vertices()
{
    utils3d-docker-run mesh-info-vertices "$@"
}

function docker-meshdetails()
{
    utils3d-docker-run meshdetails "$@"
}
