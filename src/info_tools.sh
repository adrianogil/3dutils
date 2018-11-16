
function mesh-info-vertices()
{
    file3d=$1
    assimp info $file3d
}

function mesh-info-vertices()
{
    file3d=$1
    number_vertices=$(assimp info $file3d | grep Vertices | awk '{print $2}')

    echo $file3d":"
    echo "  - "$number_vertices" vertices"
}