DIRS = $(sort $(dir $(wildcard */)))
export LANG=en_US.UTF-8

all:
	@for dir in $(DIRS); do \
		if [ -d $$dir ]; then \
			(cd $$dir && $(MAKE)) || exit 1 ; \
		fi \
	done

clean:
	@for dir in $(DIRS); do \
		if [ -d $$dir ]; then \
			(cd $$dir && $(MAKE) clean) || exit 1 ; \
		fi \
	done

run:
	./run_benchmarks

perf:
	./run_perfstats

.phony: all clean run perf

