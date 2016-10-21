# swift-perfect-example

## About

This project is based on the PerfectTemplate - https://github.com/PerfectlySoft/PerfectTemplate.

## Building & Running

### Xcode

Simply open PerfectTemplate.xcodeproj and hit the Run button or use the keyboard shortcut:

```
CMD + R
``` 

### Terminal

If you want to build and run in the terminal, please view the PerfectTemplate readme linked above.

## Output

You should see the following output:

```
Starting HTTP server on 0.0.0.0:8181 with document root ./webroot
```

This means the server is running and waiting for connections. Access [http://localhost:8181/](http://127.0.0.1:8181/) to see the greeting. 

### Stopping the Server

#### Terminal
Hit control-c to terminate the server.

#### Xcode
Press the Stop button or command-. (command period).

## Playground

There is also a 'TestBench.playground' file in the root directory. Note that it is currently not configured to allow use of Perfect, but feel free to use it to test out the rest of Swift.
