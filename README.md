# NVIDIA SDK Manager in docker

### Install Docker
Install Docker:  
https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository

Run docker without sudo (be aware of the risks):  
https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user

### Download NVIDIA SDK Manager
Download the package of NVIDIA SDK Manager from <https://developer.nvidia.com/nvidia-sdk-manager> 
and put it in `sdk_manager_gui` folder with name `sdkmanager.deb`.
Tested with version `1.4.0-7363`.

### Build Docker image
```bash
./build_image.sh
```

### Using NVIDIA SDK Manager in docker
To run image, use
```bash
./run_image.sh
```
Container will be run with very low to none isolation, same users as on the host and mounted your home directory.
This is meant to maximize compatibility and user comfort on Linux desktop distros.

In one of the steps when building jetson image, sdkmanager requires Linux kernel to have registered qemu to run ARM binaries under x86 machine.
You can do this by running this command in container terminal before using sdkmanager (users are the same as on the host)
```bash
sudo /configure_qemu.sh
```
This step is probably unnecessary if you have qemu installed on the host.

To run sdk manager, use
```bash
sdkmanager
```
or `/opt/nvidia/sdkmanager/sdkmanager-gui` command, which will block terminal until close.
This can came in handy when you put it to `CMD` command in `Dockerfile`.

### Tips
If you do not want to pollute your home directory, change
`--mount type=bind,source=$HOME,target=$HOME` to existing directory on host
`--mount type=bind,source=/absolute/path/to/dir,target=$HOME` or use docker volumes.

This mount `--mount type=bind,source=/usr/share/icons,target=/usr/share/icons,readonly`
is for beter visual experience. 
It reuses your cursor from host and not using default X11 cursor. 
It's not necessary and sometimes causes problems when installing packages which writes to this directory.

### Credits

Huge thanks goes to:
https://github.com/atinfinity/sdk_manager_docker/
