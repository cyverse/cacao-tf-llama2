resource "local_file" "ansible-inventory" {
    count = var.power_state == "active" ? 1 : 0
    content = templatefile("${path.module}/hosts.yml.tmpl",
    {
        server_ips = openstack_compute_floatingip_associate_v2.os_floatingips_associate.*.floating_ip
        server_names = openstack_compute_instance_v2.os_instances.*.name # we could use this instead of an generically generated index name
        username = var.username
    })
    filename = "${path.module}/ansible/hosts.yml"
}

resource "null_resource" "ansible-execution" {
    count = var.do_ansible_execution ? 1 : 0

    triggers = {
        always_run = "${timestamp()}"
    }

    provisioner "local-exec" {
        command = "ANSIBLE_HOST_KEY_CHECKING=False ANSIBLE_SSH_PIPELINING=1 ANSIBLE_CONFIG=ansible.cfg ansible-playbook -i hosts.yml playbook.yaml"
        working_dir = "${path.module}/ansible"
    }

    depends_on = [
        local_file.ansible-inventory
    ]
}
