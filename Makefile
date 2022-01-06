# init:
# 	docker run --mount type=bind,source=$$(pwd),target=/work blog sh -c "jekyll new --skip-bundle ./docs"


JEKYLL_VERSION=3.8

init:
	docker run --rm \
		--volume="$$PWD:/srv/jekyll" \
		-it jekyll/jekyll:$(JEKYLL_VERSION) \
		jekyll new --skip-bundle ./docs

build:
	docker run --rm \
		--volume="$$PWD:/srv/jekyll" \
		-it jekyll/jekyll:$(JEKYLL_VERSION) \
		jekyll build

serve:
	docker run --rm \
		-p 4000:4000 \
		--volume="$$PWD:/srv/jekyll" \
		-it jekyll/jekyll:$(JEKYLL_VERSION) \
		jekyll serve
