install:
	pip3 install omnigraffle-stencil

vendor:
	mkdir -p vendor
	git clone --depth=1 https://github.com/kubernetes/community.git vendor/community

build:
	mkdir -p output
	version=$$(git -C vendor/community log --format="%h" icons/svg | head -n 1)
	omnigraffle-stencil --svg ./vendor/community/icons/svg --stencil-file ./output/kubernetes-$(version).gstencil
	zip -r ./output/kubernetes-$(version).gstencil.zip ./output/kubernetes-$(version).gstencil
