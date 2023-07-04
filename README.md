<div align="center">
<h1>diffutils4cj</h1>
</div>

<p align="center">
<img alt="" src="https://img.shields.io/badge/release-v0.0.1-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/build-pass-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/cjc-v0.39.4-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/cjcov-93.3%25-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/project-open-brightgreen" style="display: inline-block;" />
</p>

## 介绍

该库可以逐行比对两个字符串的差异，并按行将差异展示出来，提供补丁打包和添加功能。文档和数据的对比需要先转换为字符串数组再使用该库进行逐行比对。

参考地址： https://code.google.com/archive/p/java-diff-utils  版本1.3.0

### 特性

- 🚀 对比两组字符串之间的差异
- 💪 提供添加和打包补丁的功能
- 🚀 固定格式显示两组字符串的差异


## 软件架构

### 源码目录

```shell
.
├── doc
├── src
│   ├── change_delta.cj
│   ├── chunk.cj
│   ├── delete_delta.cj
│   ├── delta_comparator.cj
│   ├── delta.cj
│   ├── diff_algorithlm.cj
│   ├── diff_exception.cj
│   ├── diff_node.cj
│   ├── differentiation_failedexception.cj
│   ├── diffutils.cj
│   ├── equalizer.cj
│   ├── insert_delta.cj
│   ├── myers_diff.cj
│   ├── patch.cj
│   ├── path_faulled_exception.cj
│   └── path_node.cj
│   └── snake.cj
└── test
│   ├── HLT
│   └── LLT
├── CHANGELOG.md
├── gitee_gate.cfg
├── LICENSE.txt
├── module.json
├── README.md
└── README.OpenSource
```

- `doc`  文档目录，用于存API接口文档
- `src`  是库源码目录
- `test` 存放 HLT 测试用例、LLT 自测用例

### 接口说明

主要类和函数接口说明详见 [API](./doc/feature_api.md)


## 使用说明

### 编译构建

描述具体的编译过程：

```shell
cpm update
cpm build
```

### 功能示例
#### 对比两组字符串之间的差异功能示例

功能示例描述:

示例代码如下：

```cangjie
from diffUtils4cj import diffUtils4cj.*
from std import collection.*

main(): Int64 {
    var patch:  Patch<String>= DiffUtils.diff(ArrayList<String>("hhh"), ArrayList<String>("hhh", "jjj", "kkk"))
    if (patch.getDeltas().isEmpty()) {
        return 1
    }
    if (1 != patch.getDeltas().size) {
        return 1
    }
    var  delta = patch.getDeltas().get(0).getOrThrow()
    if (!(delta is InsertDelta<String>)) {
        return 1
    }
    if(!delta.getOriginal().getLines().isEmpty()) {
        return 1
    }
    if(delta.getRevised().getLines().getRawArray() != ["jjj", "kkk"]) {
        return 1
    }
    println("pass")
    return 0
}
```

执行结果如下：

```shell
pass
```

#### 提供添加和打包补丁的功能

示例代码如下：

```cangjie
from diffUtils4cj import diffUtils4cj.*
from std import collection.*

main(): Int64 {
    var rev = ArrayList<String>("hhh", "jjj", "kkk")
    var orig= ArrayList<String>()
    var patch:  Patch<String>= DiffUtils.diff(rev, orig)
    var res = DiffUtils.patch(rev,patch)
    if (res == orig) {
    println("pass")
        return 0
    }
    return 1
}
```

执行结果如下：

```shell
pass
```

#### 固定格式显示两组字符串的差异

示例代码如下：

```cangjie
main(): Int64 {
    var first = "anything \n \nother\nmore lines";
    var second ="anything\n\nother\nsome more lines";
    var generator = Builder()
         .ignoreWhiteSpaces(true)
         .columnWidth(Int64.Max) // do not wrap
         .build();
    var rows = generator.generateDiffRows(split(first), split(second))
    if(4 != rows.size) {
         return 1
    }
    if(rows.get(0).getOrThrow().getTag().toString() != "EQUAL") {
         retutn 1
    }
    if(rows.get(1).getOrThrow().getTag().toString() != "EQUAL") {
         retutn 1
    }
    if(rows.get(2).getOrThrow().getTag().toString() != "EQUAL") {
         retutn 1
    }
    if(rows.get(3).getOrThrow().getTag().toString() != "CHANGE") {
         retutn 1
    }
    println("pass")
    return 0
}
```

执行结果如下：

```shell
pass
```

## 参与贡献

欢迎给我们提交PR，欢迎给我们提交Issue，欢迎参与任何形式的贡献。