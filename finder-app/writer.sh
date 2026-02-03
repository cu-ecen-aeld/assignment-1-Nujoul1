#!/bin/bash

writefile="${1:-}"
writestr="${2:-}"

if [ -z "$writefile" ] || [ -z "$writestr" ]; then
    echo "params number error!!!"
    exit 1
fi

#提取出目录路径
path="$(dirname "$writefile")"

#创建目录
if [ ! -d "$path" ]; then
    mkdir -p "$path" || {
        echo "create directory fail"
        exit 1
    }
fi

#创建文件
printf '%s\n' "$writestr" > "$writefile" || {
    echo "write file fail"
    exit 1
}
