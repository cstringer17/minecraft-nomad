
job "pr1sm-minecraft" {
  
  datacenters = ["dc1"]
  type = "service"
  group "mc" {
    count = 1
    network {
      port "mc-vanilla-port" {
        to = 25565
      }
      port "mc-uhc-port" {
        to = 25566
      }
      port "mc-modded-port" {
        to = 25567
      }
    }


    task "minecraft-server" {
      driver = "docker"
      config {
        image = "itzg/minecraft-server"
        ports = ["mc-vanilla-port"]
        volumes = [
          "/data/:/data",
          enabled = true
        ]
      }
      resources {
        cpu    = 1000 # 500 MHz
        memory = 2048 # 256MB
      }
      env {
        EULA = "TRUE"
      } 
    }

    task "minecraft-uhc-server" {
      driver = "docker"
      config {
        image = "itzg/minecraft-server"
        ports = ["mc-uhc-port"]
      }
      resources {
        cpu    = 1000 # 500 MHz
        memory = 2048 # 256MB
      }
      env {
        EULA = "TRUE"
        TYPE = "BUKKIT"
      } 
    }

    task "minecraft-modded-server" {
      driver = "docker"
      config {
        image = "itzg/minecraft-server"
        ports = ["mc-modded-port"]
      }
      resources {
        cpu    = 1000 # 500 MHz
        memory = 2048 # 256MB
      }
      env {
        EULA = "TRUE"
        TYPE = "FORGE"
      } 
    }
  }
}
