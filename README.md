# Learning with texts - docker image
## Building
First make sure you have docker installed and available in PATH.

Then we need to download and unzip learning with texts, this simple deployment
script works with version 2.0.3. The directory should look like this once you're
done.

`Dockerfile LICENSE LWT_INSTALLATION.txt README.md README.txt deploy.sh
lwt_v_2_0_3.zip run.sh`

Feel free to adapt the files in this repo to work with later versions.

Next we need to make sure a docker volume is created for the image to use. This
is to make sure you don't lose your progress if the image stops running or needs
to be relaunched.

```bash
# docker volume create lwt-database
```

Then we need to build the image.

```bash
# docker build -t $(whoami)/learning-with-texts .
```

Then you can deploy the image any time by running the command in deploy.sh, and
access the site at `http://localhost/` Feel free to adapt the command to change
the port number if you're deploying this image on your own server or something.

You can stop the server by running:
```bash
# docker stop learning-with-texts
```

## Common Problems
This repository contains my docker build for hosting learning with texts. This
build is used on an arm64 raspberry pi 3. If the version of debian the docker
image pulls down uses `systemctl` over the `service` command, you may need to
replace the service command in run.sh with the systemctl equivelent.
