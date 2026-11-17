# Git 仓库操作说明
仓库地址：https://github.com/Jiayi0317/LC3.git
本地路径：`E:\vscode\ICS`
默认分支：main
> 本仓库存放 ICS、LC-3 实验与学习笔记

## 前置要求
每次操作前，在 VSCode 终端进入仓库目录
```bash
cd E:\vscode\ICS
 
 
1. 新增 / 修改文件（最常用）
 
修改、新增 md、txt 笔记之后，依次执行：
 
bash
  
git add .
git commit -m "填写本次改动说明，例如：补充LC3移位指令笔记、更新lab1实验报告"
git push
 
 
建议提交备注写清晰，方便后续回溯历史
 
2. 删除文件
 
方式一（推荐，资源管理器手动删除）
删掉文件后，正常提交推送：
 
bash
  
git add .
git commit -m "删除xxx.md无用笔记"
git push
 
 
方式二（命令行删除）
 
bash
  
git rm 文件名.md
git commit -m "删除xxx.md"
git push
 
 
3. 文件重命名
 
直接在资源管理器修改文件名，然后执行常规三步：
 
bash
  
git add .
git commit -m "重命名xxx.md为xxx"
git push
 
 
4. 拉取远程更新（重要）
 
适用场景：在GitHub网页端修改文件、换电脑写笔记、多人协作
修改文件之前先拉取，避免版本冲突
 
bash
  
git pull
 
 
5. 查看提交历史
 
bash
  
# 完整日志
git log
# 简洁单行日志
git log --oneline
 
 
6. .gitignore 忽略配置
 
在仓库根目录  .gitignore  里写入下面内容，匹配的文件不会被git追踪、上传：
 
plaintext
  
# 系统缓存
.DS_Store
Thumbs.db
# VSCode配置缓存
.vscode/
# 草稿临时文件
*draft.txt
# 如需禁止上传pdf，取消下面注释
# *.pdf
 
 
⚠️ 避坑提醒
 
1. 不要在子文件夹执行  git init ，禁止嵌套Git仓库
2. 推送报错优先执行  git pull  同步远程最新版本
3. 谨慎使用  git push -f  强制推送，会直接覆盖远程仓库内容
4. 公开仓库不要上传包含个人隐私、未提交作业等敏感内容
 
📌 极简速记
 
bash
  
# 上传改动
cd E:\vscode\ICS
git add .
git commit -m "备注"
git push

# 同步远程
git pull
 
 
plaintext
  

复制全部内容，新建 `Git操作说明.md` 放到ICS文件夹里，然后用刚才的流程上传：
```bash
git add .
git commit -m "新增Git操作说明文档"
git push
 
 
上传完成后，这个操作指南就永久存在你的仓库里了。