# SetupDebianDevEnv

After blowing up my environment a enough times messing around with this finally made a quick script to reinstall the dev environment automatically

Download and run from your home directory to set up environment. At the start it will ask your email for github but runs on its own from there

```bash
$ git clone https://github.com/cmelgreen/SetupDebianDevEnv
$ bash SetupDebianDevEnv/setup.sh
```

Install includes:
* Golang
* Node.js / NPM
* VS Code
* Anaconda
* Docker
* Protobuf
* gRPC Compiler
* Chromium
* And generates an ssh key for github

