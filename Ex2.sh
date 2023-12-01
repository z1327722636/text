
find_palindromes() {
    local n=$1
    local count=0

    for ((i = 1; i <= n; i++)); do
        #反转结果
        res=`echo $i|rev`

        if [ $res -eq $i ]; then
            echo $i
            count=$((count + 1))
        fi

    done

    echo "总共有 $count 个回文数。"
}

# 获取用户输入
read -p "请输入一个正整数n: " n

# 判断是不是数字并且大于0
if [[ $n =~ ^[0-9]+$ && $n -gt 0 ]]; then
    find_palindromes $n
else
    echo "请输入有效的正整数。"
fi
