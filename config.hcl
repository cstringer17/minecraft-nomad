bind_addr = "0.0.0.0"
data_dir = "/var/lib/nomad"

leave_on_interrupt = true
leave_on_terminate = true

disable_update_check = true

client {
  servers = []
      host_volume "minecraft-data" {
      	path = "/data"
                      read_only = false
      }
}
