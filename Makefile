source_keystone:
	source cmd.multipass.prepare_env.sh

multipass_start_env:
	@start_env

keystone-bootstrap-all:
	@keystone-manage --config-dir ./etc/keystone bootstrap --bootstrap-username admin --bootstrap-password secret --bootstrap-project-name admin --bootstrap-role-name admin --bootstrap-service-name keystone --bootstrap-region-id RegionOne --bootstrap-public-url http://0.0.0.0:5000

source_cmd:
	cat $(PWD)/cmd/commands
	@bash $(PWD)/cmd/commands


run:
	@uwsgi --procname-prefix keystone --ini /etc/keystone/keystone-uwsgi-public.ini
