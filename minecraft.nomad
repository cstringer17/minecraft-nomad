
job "minecraft-uhc" {
  
  datacenters = ["dc1"]
  type = "service"
  group "mc" {
    count = 1
   
    network {
      port "mc-port" {
        to = 25565
      }
    }


    task "minecraft-server" {
      driver = "docker"
      config {
        image = "itzg/minecraft-server"
        ports = ["mc-port"]
      }
      resources {
        cpu    = 500 # 500 MHz
        memory = 4096 # 256MB
      }
      env {
        EULA = "TRUE"

      } 

    }
  }
}
