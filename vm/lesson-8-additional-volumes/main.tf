
resource "google_compute_instance" "default" {

    count = "1"
    name = "list-${count.index+1}"
    machine_type = "${var.environment != "production" ? var.machine_type : var.machine_type_dev}"
    

    zone = "asia-south1-a"
    can_ip_forward = "false"
    description = "This is our virtual machines"

        tags = ["allow-http","allow-https"]

  


    boot_disk {
        initialize_params {
            image = "${var.image}"
            size = "20"
        }
    }


    network_interface {
        network = "default"
    }


    metadata = {
        size = "20"
        foo = "bar"
    }

    metadata_startup_script = "echo Hello World"


    service_account {
        scopes = ["userinfo-email", "compute-ro", "storage-ro"]
    }

}

resource "google_compute_disk" "default" {
    name = "test-disk"
    type = "pd-ssd"
    zone = "asia-south1-a"
    size = "10"
      
}

resource "google_compute_attached_disk" "default" {
    disk = "${google_compute_disk.default.self_link}"
    instance = "${google_compute_instance.default.self_link}"

}

