# vim: ts=2:tw=78: et:

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "${var.aws_region}"
}

module "cf-install" {
  source = "./cf-install"
  network = "${var.network}"
  aws_key_name = "${var.aws_key_name}"
  aws_access_key = "${var.aws_access_key}"
  aws_secret_key = "${var.aws_secret_key}"
  aws_region = "${var.aws_region}"
  aws_key_path = "${var.aws_key_path}"
  cf_admin_pass = "${var.cf_admin_pass}"
  install_docker_services = "${var.install_docker_services}"
  cf_size = "${var.cf_size}"
  aws_tags = "${var.aws_tags}"
  deployment_size = "${var.deployment_size}"
  cf_release_version = "${var.cf_release_version}"
  cf_boshworkspace_version = "${var.cf_boshworkspace_version}"
  debug = "${var.debug}"
  private_cf_domains = "${var.private_cf_domains}"
}

module "cloudera" {
  source = "./cdh"
  network = "${var.network}"
  aws_centos_ami = "${var.aws_centos_ami}"
  aws_key_name = "${var.aws_key_name}"
  aws_key_path = "${var.aws_key_path}"
  aws_access_key = "${var.aws_access_key}"
  aws_secret_key = "${var.aws_secret_key}"
  aws_vpc_id = "${module.cf-install.aws_vpc_id}"
  aws_region = "${var.aws_region}"
  aws_route_table_private_id = "${module.cf-install.aws_route_table_private_id}"
  aws_subnet_bastion = "${module.cf-install.aws_subnet_bastion}"
  hadoop_worker_count = "${var.hadoop_worker_count}"
  hadoop_instance_type = "${var.hadoop_instance_type}"
  ansible_repo_path = "${var.ansible_repo_path}"
  security_group = "${module.cf-install.cf_sg_id}"
  tags_IAP = "${module.cf-install.tags.IAP}"
  tags_Project = "${module.cf-install.tags.Project}"
  tags_Environment = "${module.cf-install.tags.Environment}"
}

output "aws_access_key" {
  value = "${module.cf-install.aws_access_key}"
}

output "aws_secret_key" {
  value = "${module.cf-install.aws_secret_key}"
}

output "aws_region" {
  value = "${module.cf-install.aws_region}"
}

output "bosh_subnet" {
  value = "${module.cf-install.bosh_subnet}"
}

output "ipmask" {
  value = "${module.cf-install.ipmask}"
}

output "cf_api_id" {
  value = "${module.cf-install.cf_api_id}"
}

output "cf_subnet1" {
  value = "${module.cf-install.cf_subnet1}"
}

output "cf_subnet1_az" {
  value = "${module.cf-install.cf_subnet1_az}"
}

output "cf_subnet2" {
  value = "${module.cf-install.cf_subnet2}"
}

output "cf_subnet2_az" {
  value = "${module.cf-install.cf_subnet2_az}"
}

output "bastion_az" {
  value = "${module.cf-install.bastion_az}"
}

output "bastion_id" {
  value = "${module.cf-install.bastion_id}"
}

output "lb_subnet1" {
  value = "${module.cf-install.lb_subnet1}"
}

output "cf_sg" {
  value = "${module.cf-install.cf_sg}"
}

output "cf_boshworkspace_version" {
  value = "${module.cf-install.cf_boshworkspace_version}"
}

output "cf_size" {
  value = "${module.cf-install.cf_size}"
}

output "docker_subnet" {
  value = "${module.cf-install.docker_subnet}"
}

output "install_docker_services" {
  value = "${module.cf-install.install_docker_services}"
}

output "bastion_ip" {
  value = "${module.cf-install.bastion_ip}"
}

output "cf_domain" {
  value = "${module.cf-install.cf_domain}"
}

output "cf_api" {
  value = "${module.cf-install.cf_api}"
}

output "aws_subnet_docker_id" {
  value = "${module.cf-install.aws_subnet_docker_id}"
}

output "aws_vpc_id" {
  value = "${module.cf-install.aws_vpc_id}"
}

output "aws_internet_gateway_id" {
  value = "${module.cf-install.aws_internet_gateway_id}"
}

output "aws_route_table_public_id" {
  value = "${module.cf-install.aws_route_table_public_id}"
}

output "aws_route_table_private_id" {
  value = "${module.cf-install.aws_route_table_private_id}"
}

output "aws_subnet_bastion" {
  value = "${module.cf-install.aws_subnet_bastion}"
}

output "aws_subnet_bastion_availability_zone" {
  value = "${module.cf-install.aws_subnet_bastion_availability_zone}"
}

output "cf_admin_pass" {
  value = "${module.cf-install.cf_admin_pass}"
}

output "aws_key_path" {
  value = "${module.cf-install.aws_key_path}"
}

output "cf_release_version" {
	value = "${module.cf-install.cf_release_version}"
}

output "backbone_z1_count" { value = "${module.cf-install.backbone_z1_count}" }
output "api_z1_count"      { value = "${module.cf-install.api_z1_count}" }
output "services_z1_count" { value = "${module.cf-install.services_z1_count}" }
output "health_z1_count"   { value = "${module.cf-install.health_z1_count}" }
output "runner_z1_count"   { value = "${module.cf-install.runner_z1_count}" }
output "backbone_z2_count" { value = "${module.cf-install.backbone_z2_count}" }
output "api_z2_count"      { value = "${module.cf-install.api_z2_count}" }
output "services_z2_count" { value = "${module.cf-install.services_z2_count}" }
output "health_z2_count"   { value = "${module.cf-install.health_z2_count}" }
output "runner_z2_count"   { value = "${module.cf-install.runner_z2_count}" }

output "debug" {
	value = "${module.cf-install.debug}"
}

output "private_cf_domains" {
  value = "{$module.cf-install.private_cf_domains}"
}
