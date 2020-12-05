default:
	vagrant up; vagrant ssh;
reload:
	vagrant reload --provision
clean:
	docker stop dev-js && docker ps -a --filter name=dev-js | awk 'FNR == 2 {print $$2}'| xargs docker rmi -f && docker rm dev-js