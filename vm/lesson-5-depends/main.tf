
resource "google_compute_instance" "default" {

 #   count = "1"
    name = "test-1"
    machine_type = "${var.machine_type["dev"]}"
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

    depends_on = ["google_compute_instance.second"]

}

resource "google_compute_instance" "second" {
    
 #   count = "1"
    name = "test-2"
    machine_type = "${var.machine_type["dev"]}"
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