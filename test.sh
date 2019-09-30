#!/usr/bin/env bash
##############################################################
# File Name: test.sh
# Version: 1.0.0
# Author: shiwei-Du
# Web Site: https://www.dushiwei.cn
# Created Time : 2019-09-26 10:53:18
##############################################################

set -e

function test_upper(){
	result="$(upper "HeLlO")"
    assert_equals "$result" "HELLO"
}

function test_lower(){
	result="$(lower "HeLlO")"
    assert_equals "$result" "hello"
}

function test_mkdircd(){
	dname='test'
	# current pwd
	old_pwd=`pwd`
	# new pwd
	new_pwd=`mkdircd $dname && pwd`
	assert_equals $old_pwd"/"$dname $new_pwd
	rm -rf $dname
}

function test_backup(){
	result="$(backup ".travis.yml")"
	tmp=`echo $result | awk -F '->' '{print $2}'`
	assert_equals  $tmp ".travis.yml.bak"
	rm -rf $tmp
}

function test_trim_string() {
    result="$(trim_string "    Hello,    World    ")"
    assert_equals "$result" "Hello,    World"
}

function test_dirname(){
	result="$(dirname "/Users/shiwei/Documents/mybook/awesome-bash-aliases/test.sh")"
    assert_equals "$result" "/Users/shiwei/Documents/mybook/awesome-bash-aliases"
}

function test_basename(){
	result="$(basename "/Users/shiwei/Documents/mybook/awesome-bash-aliases/test.sh")"
    assert_equals "$result" "test.sh"
}

function assert_equals() {
    if [[ "$1" == "$2" ]]; then
        ((pass+=1))
        status=$'\e[32m✔'
    else
        ((fail+=1))
        status=$'\e[31m✖'
        local err="(\"$1\" != \"$2\")"
    fi

    printf ' %s\e[m | %s\n' "$status" "${FUNCNAME[1]/test_} $err"
}

main(){
	# awesome bash aliases
	printf "$GREEN"
	cat <<-'EOF'
	.............................................
              Awesome Bash Aliases
	.............................................
	                     _ooOoo_
	                    o8888888o
	                    88" . "88
	                    (| -_- |)
	                     O\ = /O
	                 ____/`---'\____
	               .   ' \\| |// `.
	                / \\||| : |||// \
	              / _||||| -:- |||||- \
	                | | \\\ - /// | |
	              | \_| ''\---/'' | |
	               \ .-\__ `-` ___/-. /
	            ___`. .' /--.--\ `. . __
	         ."" '< `.___\_<|>_/___.' >'"".
	        | | : `- \`.;`\ _ /`;.`/ - ` : | |
	          \ \ `-. \_ __\ /__ _/ .-` / /
	  ======`-.____`-.___\_____/___.-`____.-'======
	                     `=---='
	 
    .............................................
            佛祖保佑             永无BUG
    .............................................
	EOF
	
	printf "$RESET"
	head="-> Running awesome bash aliases tests."
    printf '\n%s\n%s\n' "$head" "${head//?/-}"

    # load bash_functions
    cat .bash_functions > tmp.sh && source tmp.sh

    # Generate the list of tests to run.
    for func in `declare -F | awk -F '-f' '{print $2}'`;
    do
    	# echo $func
    	[[ "$func" == test_* ]] && "$func";
    done

    # done
    printf '%s\n' "${head//?/-}"
    print_style "Completed $((fail+pass)) tests." "info"
    print_style "${pass:-0} passed." "success"
    print_style "${fail:-0} failed." "danger"
    rm -rf tmp.sh
    # If a test failed, exit with '1'.
    ((fail>0)) || exit 0 && exit 1
}

main