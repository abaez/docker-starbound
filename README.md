# docker-starbound
## A container for the [starbound][2] server by [Alejandro Baez][1]


### DESCRIPTION
A server container for the lovely starbound game. Nothing too fancy.


### USAGE
ou can run this container in 2 ways: `docker run` or sytemd unit service file.
The two methods need both the port you will be using for the container and
the volume location of the `/srv/starbound` path.

#### docker run
To run using docker, naturally you would use the setup below, with of course
changing the volume and port location to your liking:

```
docker run -v ./starbound:/srv/starbound \
  -p 21025:21025 -p 21025:21025/udp -p 21026:21026 -p 21026:21026/udp \
  --name=starbound abaez/starbound
```

#### systemd unit file
If you want to have the docker container running automagically on your
machine, then this is the place to go.

All you need to do is first copy to your systemd service directory and do a
quick `daemon-reload`.

```
sudo cp <docker-shout source>/starbound.service /usr/lib/systemd/system
sudo systemctl daemon-reload
```

Finally, you can append to your systemd setup by giving the port you
desire for the service to run under.

```
sudo systemctl enable starbound
```

You don't need to declare the user, since it uses the default user of the
running service. However, if you want to be specific, you can always change
the user by replacing `%u`, on line 8 with your user, in the unit file.

Lastly, unless you want the volume configuration auto mounted to
`/srv/starbound`,
change the volume location to whatever desire you may have.


### LICENSE
The MIT License (MIT)

Copyright (c) 2015 [Alejandro Baez][1]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.


[1]: https://twitter.com/a_baez
[2]: http://playstarbound.com/
