score_file="score.txt"

# 创建成绩单文件如果不存在
if [ ! -e "$score_file" ]; then
    touch "$score_file"
fi

add_student() {
    read -p "请输入学号: " student_id
    read -p "请输入姓名: " student_name
    read -p "请输入成绩: " student_score

    # 将学生信息写入成绩单文件
    echo "$student_id $student_name $student_score" >> "$score_file"
    echo "学生信息已添加。"
}

delete_student() {
    read -p "请输入要删除的学号: " student_id

    # 使用grep和反向匹配来创建新的成绩单文件，删除指定学号的学生信息
    grep -v "$student_id" "$score_file" > temp_score.txt
    mv temp_score.txt "$score_file"
    echo "学生信息已删除。"
}

query_student() {
    read -p "请输入要查询的学号: " student_id

    # 使用grep查找学号对应的学生信息
    result=$(grep "$student_id" "$score_file")
    if [ -n "$result" ]; then
        echo "学生信息: $result"
    else
        echo "未找到该学号对应的学生信息。"
    fi
}

while true; do
    echo "1. 添加学生信息"
    echo "2. 删除学生信息"
    echo "3. 查询学生信息"
    echo "4. 退出"
    read -p "请选择操作(1/2/3/4): " choice

    case $choice in
        1) add_student ;;
        2) delete_student ;;
        3) query_student ;;
        4) exit ;;
        *) echo "无效的选项，请重新选择。" ;;
    esac
done
