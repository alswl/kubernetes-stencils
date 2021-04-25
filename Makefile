install:
	pip3 install omnigraffle-stencil

vendor:
	mkdir -p vendor
	git clone --depth=1 https://github.com/kubernetes/community.git vendor/community

build:
	omnigraffle-stencil --svg ./vendor/community/icons/svg --stencil-file kubernetes-$$(git -C vendor/community log --format="%h" icons/svg | head -n 1).gstencil
