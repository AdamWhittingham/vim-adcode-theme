.PHONY: dev
dev:
	bundle exec guard

.PHONY: build
build:
	bundle exec palette adCode.palette > colors/adCode.vim
