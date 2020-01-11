
resource "google_compute_instance" "default" {

 #   count = "1"
    name = "test-1"
    machine_type = "${var.environment != "production" ? var.machine_type : var.machine_type_dev}"
    zone = "asia-south1-a"
  


    boot_disk {
        initialize_params {
            image = "${var.image}"
        }
    }

    network_interface {
        network = "default"
    }

    service_account {
        scopes = ["userinfo-email", "compute-ro", "storage-ro"]
    }

}