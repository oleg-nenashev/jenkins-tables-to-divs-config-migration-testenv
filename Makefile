IMAGE_NAME=jenkins4eval/jenkins-62437-config-tables-to-divs

build:
	docker build -t ${IMAGE_NAME} .

#TODO: Add for Pipeline development demo: -v maven-repo:/root/.m2 -v ${MY_PIPELINE_LIBRARY_DIR}:/var/jenkins_home/pipeline-library -v ${MY_OTHER_PIPELINE_LIBS_DIRS}:/var/jenkins_home/pipeline-libs -e DEV_HOST=${CURRENT_HOST}
run:
	docker run --rm  -p 8080:8080 -p 50000:50000 ${IMAGE_NAME}

run-preview:
	docker run --rm  -e EXPERIMENTAL_UI=true -p 8080:8080 -p 50000:50000 ${IMAGE_NAME}

run-dark:
	docker run --rm  -e DARK_THEME=true -p 8080:8080 -p 50000:50000 ${IMAGE_NAME}

run-preview-dark:
	docker run --rm  -e DARK_THEME=true EXPERIMENTAL_UI=true -p 8080:8080 -p 50000:50000 ${IMAGE_NAME}
