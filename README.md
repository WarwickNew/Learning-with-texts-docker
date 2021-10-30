# Learning with texts - docker image
## Building
Fist make sure you have docker installed and available in PATH for your os.

Then we need to download and unzip learning with texts, this simple deployment script works with version 2.0.2. The directory should look like this once your done.

`Dockerfile LICENSE LWT_INSTALLATION.txt README.md README.txt deploy.sh lwt_v_2_0_2.zip run.sh`

Feel free to adapt the files in this repo to work with later versions.

Next we need to make sure a docker volume is created for the image to use. This is to make sure you don't lose you progress if the image stops running or needs to be relaunched..

```bash
# docker volume create lwt-database
```

Then we need to build the image.

```bash
# docker build -t $(whoami)/learning-with-texts .
```

Then you can deploy the image any time byt running the command in deploy.sh, and access the site at `http://localhost/lwt/` Feel free to adapt the command to change the port number if your deploying this image on your own server or something.

You can stop the server by running:
```bash
# docker stop learning-with-texts
```
