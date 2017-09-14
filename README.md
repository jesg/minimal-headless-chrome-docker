
run the following to build the image.

```
docker image build --tag=headless-chrome .
```

run

```
docker run -p 127.0.0.1:4444:4444 -t headless-chrome
```
