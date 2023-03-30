# Learning with texts - docker image
## Building
First make sure you have docker installed and available in PATH.

Then we need to download and unzip learning with texts, this simple deployment
script works with version 2.0.3. The directory should look like this once you're
done.

`Dockerfile LICENSE LWT_INSTALLATION.txt README.md README.txt deploy.sh
lwt_v_2_0_3.zip run.sh`

Feel free to adapt the files in this repo to work with later versions.

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

## Modifying the volume name.
By default the current build will create it's own persistent volume with the
name being generated as a random hash. This is because I have to let docker
create the volume itself if I want it to use the database generated in the
dockerfile as a template.

Mounting a volume you've created yourself will not have the database set up so
you may have to enter the image once it's launched with
`podman exec -it learning-with-texts /bin/bash` and run
`mysqladmin -u root password 'abcxyz'` given the database service has actually
launched.

## Common Problems
This repository contains my docker build for hosting learning with texts. This
build is used on an arm64 raspberry pi 3. If the version of debian the docker
image pulls down uses `systemctl` over the `service` command, you may need to
replace the service command in run.sh with the systemctl equivelent.
