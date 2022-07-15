terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.75"


/*
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "my--bucket1"
    region     = "ru-central1"
    key        = "terraform/terraform.tfstate"
    skip_region_validation      = true
    skip_credentials_validation = true

}
*/
}


provider "yandex" {
  service_account_key_file = "key.json"
  cloud_id  = "${var.yandex_cloud_id}"
  folder_id = "${var.yandex_folder_id}"
 
}

resource "yandex_compute_instance" "clickhouse" {
  name                      = "clickhouse-01"
  zone                      = "ru-central1-a"
  hostname                  = "clickhouse-01.netology.cloud"
  allow_stopping_for_update = true

 
  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.centos-7-base}"
      name        = "root-clickhouse"
      type        = "network-nvme"
      size        = "20"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.default.id}"
    nat       = true
  }

  /*
  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}", "serial-port-enable": "1"
    
  }
*/

metadata = {
    ssh-keys = "ilya:${file("~/.ssh/id_rsa.pub")}", "serial-port-enable": "1"
    user-data = "${file("meta.txt")}"
}
 description = "clickhouse-01"


lifecycle {
    create_before_destroy = true

  }
}


