#include <assimp/Importer.hpp>      // C++ importer interface
#include <assimp/scene.h>           // Output data structure
#include <assimp/postprocess.h>     // Post processing flags

#include <iostream>

bool ImportModel(const std::string& pFile)
{
	// Create an instance of the Importer class
	Assimp::Importer importer;

	// And have it read the given file with some example postprocessing
	// Usually - if speed is not the most important aspect for you - you'll
	// probably to request more postprocessing that we do in this example
	const aiScene* scene = importer.ReadFile(pFile, 
			aiProcess_JoinIdenticalVertices);

	// If the import faield, report it
	if (!scene)
	{
		return false;
	}

	std::cout << "Number of meshes: " <<  scene->mNumMeshes << std::endl;

	int i = 0;

	for (i = 0; i < scene->mNumMeshes; i++)
	{
		std::cout << "Number of Vertices: " << 
			scene->mMeshes[0]->mNumVertices << std::endl;
	}

	
	
	return true;
}

int main()
{
	std::cout << "Model import result" << std::endl;
	
	bool result = ImportModel("proceduralmesh.stl");

	return  0;
}
