NAME = mkovac/stretch
VERSION = $(shell date +%Y%m%d)

.PHONY: all build latest diff

all: build

build:
	docker build --rm -t $(NAME):$(VERSION) \
	 ${DOCKER_BUILD_FLAGS} \
	 --build-arg "ftp_proxy=${ftp_proxy}" \
	 --build-arg "http_proxy=${http_proxy}" \
	 --build-arg "https_proxy=${https_proxy}" \
	 .

latest: build
	docker tag $(NAME):$(VERSION) $(NAME):latest

diff: dpkg-new.txt
	diff dpkg-new.txt dpkg.txt 2>&1 >/dev/null || { \
	 mv -f dpkg-new.txt dpkg.txt; \
	 git add dpkg.txt; \
	 git commit -nm 'new package updates'; \
	 git push; }

dpkg-new.txt: build
	docker run --rm $(NAME):$(VERSION) dpkg -l > dpkg-new.txt
