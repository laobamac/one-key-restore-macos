# 此项目开源，转载、二开请遵循GPLv3协议！

# 定义全局变量
$file_mark
$file_mark_1

# 定义启动界面及菜单
function startting_print {
    echo '================================================================================'
    echo '/----\   | \    |   |------     |    /     |------     \      /'
    echo '|    |   |  \   |   |           |___/      |            \    /'
    echo '|    |   |   \  |   |---   ---  |   \      |---          \  /'
    echo '|    |   |    \ |   |           |    \     |              ||'
    echo '|____|   |     \|   |______     |     \    |______        ||        Restore macOS'
    echo '================================================================================='
    echo '         项目地址：https://github.com/laobamac/one-key-restore-macos'
    # 字符拼接logo并输出
    echo ''
    echo '菜单：'
    # 输出菜单
    echo '   1.恢复macOS到硬盘'
    echo '   2.从硬盘备份macOS到镜像'
    echo '   3.关于此脚本'
    # 获取用户输入并赋值，菜单项
    $menu_choice = Read-Host "请输入"
    deal_choice($menu_choice) # 传入中继方法，进行下一步操作
}

# 获取硬盘列表方法
function get_disks {
    $disk_list = Get-PhysicalDisk
    $file_mark = Get-Date -Format "HHmmss"
    $file_mark_1 = $file_mark
    echo $disk_list >> $file_mark
}

# 获取指定硬盘信息方法
function get_install_disk($get_insttall_disk_number) {
    $install_disk_informatin = Get-PhysicalDisk | Where-Object DeviceID -eq $get_insttall_disk_number
    echo $install_disk_informatin
}

# 获取镜像列表方法
function get_imgs {

}

# 还原镜像方法
function img_to_disk($img_file, $disk_number) {
    echo '将执行 ' + $img_file + ' 还原至 '+ $disk_number

}

# 选项中继方法
function deal_choice($choice_number) {
    if ($choice_number = '1') {
        echo '1.全盘安装     2.分区安装（慎选！）'
        $choice_number_2 = Read-Host("请输入") # if中赋值第二层传参
        if ($choice_number_2 = '1') {
            # 获取硬盘物理路径
            get_disks
            echo $file_mark_1
            # echo $PSScriptRoot
            Set-Location $PSScriptRoot && C:\Windows\System32\notepad.exe $file_mark
            $install_disk_number = Read-Host("请输入硬盘序号")
            #get_install_disk($install_disk_number)
        }

    }

    # 备份区域未添加，请等待后续版本 20240227
    elseif ($choice_number = '2') {
        echo '1.全盘备份     2.分区备份'
        $choice_number_2 = Read-Host("请输入") # if中赋值第二层传参
    }
}

# 主程序
startting_print