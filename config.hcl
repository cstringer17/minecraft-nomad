client {
  servers = []
      host_volume "minecraft-data" {
      	path = "/data"
        read_only = false
      }
}

