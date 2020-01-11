output "machine_type" {
  value = "${google_compute_instance.default.*.machine_type}"
}

output "name" {
  value = "${google_compute_instance.default.*.name}"
}

output "instance_id" { value = "${join(",",google_compute_instance.default.*.id)}"}

