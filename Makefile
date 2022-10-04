CXX := g++
LINKER := g++
CXXFLAGS := -std=c++17 -Wall -Wextra -MMD -MP
#CXXFLAGS := -std=c++11 -Wall -Wextra -std=c++1z -MMD -MP
#LDFLAGS := -std=c++11 -Wall -Wextra
LDFLAGS := 

app := demo
src := $(wildcard *.cc) 
obj := $(patsubst %.cc,%.o,$(src))
dep := $(patsubst %.cc,%.d,$(src))

$(app): $(obj)
	$(LINKER) $^ $(LDFLAGS) -o $@ 

%.o: %.cc
	$(CXX) $(CXXFLAGS) -o $@ -c $<

.PHONY: clean
clean:
	rm -f $(obj) $(app) $(dep)

-include $(dep)
