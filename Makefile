NAME = mkovac/stretch
VERSION = $(shell date +%Y%m%d)

.PHONY: all
all: build

.PHONY: build
build:
	docker build --rm -t $(NAME):$(VERSION) \
	 ${DOCKER_BUILD_FLAGS} \
	 --build-arg CACHE_DATE=$(shell date +%Y-%m-%d) \
	 --build-arg "ftp_proxy=${ftp_proxy}" \
	 --build-arg "http_proxy=${http_proxy}" \
	 --build-arg "https_proxy=${https_proxy}" \
	 .

.PHONY: latest
latest: build
	docker tag $(NAME):$(VERSION) $(NAME):latest

.PHONY: diff
diff: dpkg-new.txt
	diff dpkg-new.txt dpkg.txt 2>&1 >/dev/null && { \
	  docker image rm $(NAME):$(VERSION); \
	} || { \
	  mv -f dpkg-new.txt dpkg.txt; \
	  git add dpkg.txt; \
	  git commit -nm 'new package updates'; \
	  git push; \
	  docker tag $(NAME):$(VERSION) $(NAME):latest; \
	  docker push $(NAME):latest; \
	}

dpkg-new.txt: build
	docker run --rm $(NAME):$(VERSION) dpkg -l > dpkg-new.txt
