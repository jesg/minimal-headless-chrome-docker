
run the following to build the image.

```
docker image build --tag=headless-chrome .
```

run

```
docker run -p 127.0.0.1:4444:4444 -e DOCKER_HOST=$(ip -4 addr show docker0 | grep -Po 'inet \K[\d.]+')  -t headless-chrome
```

see https://stackoverflow.com/questions/33102813/how-to-get-local-host-ip-address-in-docker-container for more information on getting the right ip address.
