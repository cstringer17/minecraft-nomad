# minecraft-nomad

A nomad file to run a minecraft docker container

Run the job with the following command:

```
nomad job run minecraft.nomad
```

This file runs the following docker container [itzg/minecraft-server](https://hub.docker.com/r/itzg/minecraft-server).

Add the config.hcl file to you nomad agent config to make sure the volume works!
