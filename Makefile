SAXON=saxon-xslt

run-tests: 
	@for i in tests/*.xml; do \
		name=`echo $$i | sed -rn 's/.xml/.html/p'`; \
		echo "Converting $$i to $$name"; \
		./convert.sh $$i $$name; \
	 done 
