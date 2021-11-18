#1.把该脚本放在需要修改的pdf目录中
#2.如果无法修改：请修改dirname
#3.请先安装packagewin32com 和 os   python -m pip install pypiwin32



"""
1. 如何设置编辑器字体的大小?
File(文件)-> Settings(设置) -> Editor(编辑器) -> Font(字体), 修改字体的大小
2. 注释: 代码的解释说明
"""

# 1). 导入需要的模块(打开应用程序的模块)
import win32com.client
import os
def ppt2pdf(filename, output_filename):
    """
    PPT文件导出为pdf格式
    :param filename: PPT文件的名称
    :param output_filename: 导出的pdf文件的名称
    :return:
    """
    # 2). 打开PPT程序
    ppt_app = win32com.client.Dispatch('PowerPoint.Application')
    # ppt_app.Visible = True  # 程序操作应用程序的过程是否可视化

    # 3). 通过PPT的应用程序打开指定的PPT文件
    # filename = "C:/Users/Administrator/Desktop/PPT办公自动化/ppt/PPT素材1.pptx"
    # output_filename = "C:/Users/Administrator/Desktop/PPT办公自动化/ppt/PPT素材1.pdf"
    ppt = ppt_app.Presentations.Open(filename)

    # 4). 打开的PPT另存为pdf文件。17数字是ppt转图片，32数字是ppt转pdf。
    ppt.SaveAs(output_filename, 32)
    print("导出成pdf格式成功!!!")
    # 退出PPT程序
    ppt_app.Quit()


# 要处理的目录名称
dirname = os.path.dirname(os.path.realpath(__file__))
# 列出指定目录的内容
filenames = os.listdir(dirname)
# for循环依次访问指定目录的所有文件名
for filename in filenames:
    # 判断文件的类型，对所有的ppt文件进行处理(ppt文件以ppt或者pptx结尾的)
    if filename.endswith('ppt') or filename.endswith('pptx'):
        # print(filename)           # PPT素材1.pptx -> PPT素材1.pdf
        # 将filename以.进行分割，返回2个信息，文件的名称和文件的后缀名
        base, ext = filename.split('.')  # base=PPT素材1 ext=pdf
        new_name = base + '.pdf'         # PPT素材1.pdf
        # ppt文件的完整位置: C:/Users/Administrator/Desktop/PPT办公自动化/ppt/PPT素材1.pptx
        filename = dirname + '/' + filename
        # pdf文件的完整位置: C:/Users/Administrator/Desktop/PPT办公自动化/ppt/PPT素材1.pdf
        output_filename = dirname + '/' + new_name
        # 将ppt转成pdf文件
        ppt2pdf(filename, output_filename)

