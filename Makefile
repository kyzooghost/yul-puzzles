.PHONY: test

# make test file=<TestFile> log=1
test:
	@if [ -z "$(file)" ]; then echo "Usage: make test file=<TestFile>"; exit 1; fi
	@if [ -n "$(log)" ]; then \
		forge test --mp test/$(file).t.sol -vvvv; \
	else \
		forge test --mp test/$(file).t.sol; \
	fi

# Create a new branch
new:
	git checkout -b new

# Push PR
push:
	git add . && git commit -m "push" && git push --set-upstream origin new
	gh repo set-default kyzooghost/yul-puzzles
	gh pr create --title new --body new
	gh pr merge new --delete-branch --merge