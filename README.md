Simple Server to mimic file downloads protected with basic authentication.

To run the server

`docker run docker run -v ./host_files_folder:/code/files -p 9090:4567 gravboy/http_auth`

- ./host_files_folder -> Folder that contains the files that you want to download.
- /code/files -> This path should not be altered, this is where the server looks for the files.
- 9090 -> host port.
- 4567 -> server runs under this port.

To download the file

On your browser or any other application, pass the following url

`localhost:9090/download/uploads/feed.xml?username=username&password=1234`

- uploads/feed.xml -> this is the path for the file within the /code/files folder, the absolute path within the container would be `/code/files/uploads/feed.xml`.
- username -> username for basic auth.
- password -> password for basic auth.

You can verify if the volume is properly mounted by checking the container folder.

- First run the docker run command, mentioned above.
- Get the container id for gravboy/http_auth, by running the command `docker ps`.
- `docker exec -ti <container id> sh`.


