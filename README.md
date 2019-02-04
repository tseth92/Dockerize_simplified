# Dockerize_simplified
A simple Dockerization of any application( Used Flask APP here ) using Dockerfile

## Docker build commands:
##### normally :
docker build -t flask_simplified:1.0 . (this last . is important as this specifies docker context)

##### in case you are under a secure network and have internet access via proxy :
docker build -t flask_simplified:1.0 --build-arg http_proxy=http://<IP>:<PORT> --build-arg https_proxy=http://<IP>:<PORT> . (this last . is important as this specifies docker context)

## Docker run commands:
docker run -d -p 5000:5000 flask_simplified:1.0 bash (first one is host port, second is docker port)
(in case no version is given in build or run command, latest is the tag used)

## cURL commands to test the application:
curl -F "FILES_LIST=@./sourceFiles/file1.jpg" -F "FILES_LIST=@./sourceFiles/file2.jpg" -F "FILE_NAME=new_file" localhost:5005/uploadFiles
curl localhost:5005/getJsonFromFile/labelsFile.json


### Note:
In case of building docker in a different context, ie, if Dockerfile is kept in a different location, then context needs to be set properly. Eg. if you were building Docker image from "sourceFiles" directory , then command will become:
##### docker build -t flask_simplified:1.0 ../ -f ../Dockerfile
Here ,  ../ defines the Docker context, ie, all the files under this directory will be available for docker daemon. Then -f ../Dockerfile gives the location of Dockerfile . The Dockerfile here can be given any name , but recommended is to name it as Dockerfile only . Reason being, no editor eg. vim, will provide highlights when working on Dockerfile
