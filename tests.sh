. assert

. mktemp.bash

tmp=$(mktemp -d)

assert_raises "bmktemp" 1

for i in {1..5} # according to the specification, the template must be at least 6 X long
do
    assert_raises "bmktemp ${tmp}/t.$(printf 'X%.0s' $(eval "echo {1..${i}}"))" 1
done

assert_raises "test -f ${tmp}/t.*" 1

for i in {6..252} # 255 is maximum file name length for Linux and Windows 
do
    r=$(eval "echo {1..${i}}")

    assert_raises "bmktemp ${tmp}/t.$(printf 'X%.0s' $r)"
    assert_raises "test -f ${tmp}/t.$(printf '?%.0s' $r)"
done

assert_end bmktemp
