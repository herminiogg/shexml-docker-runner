# ShExML-runner
This is the dockerized version of ShExML. You can use ShExML engine as a Docker container with the same parameters as in its Java CLI library counterpart.

# Installation
Pull the latest version or any version that you want:
```
$ docker pull herminiogg/shexml-runner
$ docker pull herminiogg/shexml-runner:v0.2.5 # or whichever version you want
```
Or just build with the given Dockerfile
```
$ docker build . -t shexml-runner
```
# Usage
To run ShExML-runner you have to input the following command, which will mount your current directory, using $(pwd), to get the input files and to save output files.
```
$ docker run -v $(pwd):/workspace herminiogg/shexml-runner -m mappingFile.shexml
```