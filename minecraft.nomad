
job "pr1sm-minecraft" {
  
  datacenters = ["dc1"]
  type = "service"
  group "mc" {
    count = 1
    network {
      port "mc-vanilla-port" {
        to = 25565
        static = 25565
      }
      port "mc-vanilla-rcon" {
        to = 25575
        static = 25575
      }
      mode = "bridge"
    }

    volume "minecraft-data" {
      type = "host"
      read_only = false
      source = "minecraft-data"
    }


    task "minecraft-server" {
      driver = "docker"
      volume_mount {
        volume = "minecraft-data"
        destination = "/data"
        read_only  = false
      }
      config {
        image = "itzg/minecraft-server"
        ports = ["mc-vanilla-port","mc-vanilla-rcon"]
      }
      resources {
        cpu    = 1000 # 500 MHz
        memory = 2048 # 256MB
      }
      env {
        EULA = "TRUE"
      } 
    }

  }
}
