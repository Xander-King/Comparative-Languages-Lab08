
check: check-delegates check-parameters
	@echo Success

check-delegates: delegates.output
	cmp delegates.output delegates.expected 

check-parameters: parameters.output
	cmp parameters.output parameters.expected

%.output: %.exe 
	mono $*.exe < $*.input > $*.output

%.exe : %.cs
	mcs $*.cs

update:
	git stash
 	git pull https://gitlab.csi.miamioh.edu/cse465/instructor/lab08 master
	git stash pop

submit: check
	git add -u 
	git commit -m "Submitting"
	git push origin master

