#!/bin/bash

# 定义源文件夹路径和目标文件路径
source_dir="./"  # 替换为你的文件夹路径
output_file="references.bib"

# 如果目标文件已存在，先删除以避免内容叠加
if [ -f "$output_file" ]; then
    rm "$output_file"
fi

# 遍历 source_dir 中的所有 .bib 文件
find "$source_dir" -type f -name "*.bib" | while read -r file; do
    # 写入文件来源注释
    echo "\n% From file: $file\n" >> "$output_file"
    
    # 将 .bib 文件内容追加到目标文件中
    cat "$file" >> "$output_file"
    
    # 添加空行分隔内容
    echo "\n" >> "$output_file"
done

echo "合并完成，所有内容已写入 $output_file"
