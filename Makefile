.PHONY: build
build:
	./theme.rb > colors/adCode.vim

.PHONY: dev
dev:
	bundle exec guard
