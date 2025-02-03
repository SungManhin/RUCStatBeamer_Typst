# RUCStatBeamer_Typst
这个模版基于 [Typst](https://typst.app/) 排版语言和 [Touying](https://touying-typ.github.io/zh/) 幻灯片包，整体风格与 [Stargazer](https://touying-typ.github.io/zh/docs/themes/stargazer) 主题保持一致，进行了一些颜色和布局上的微调，使之更适合中国人民大学统计学院的风格。

优点包括：语法简单，类似 markdown, 熟悉 $\LaTeX$ 也能很快上手；编译速度极快（增量编译，与 markdown 渲染速度相当，无需等待）；环境搭建简单，仅需安装一二扩展。

在 Typst 简单语法的基础上，本模版已包含公式（带样式）、定理块、有序无序列表、图片、代码、文献引用等实现的示例，通过该模版微调即可获得美观大方的 Slides, 可用于课程汇报、论文分享、讨论班组会等场合。

## 使用说明

你当然可以按照 [Typst 教程](https://typst.app/docs/tutorial/) 描述的那样去安装 Typst 语言，或者直接使用官网提供的[在线 app](https://typst.app/), 这里提供通过 VS Code 本地使用该模版的办法。

1. 在 VS Code 中安装 [Tinymist Typst ](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist) 和 [vscode-pdf](https://marketplace.visualstudio.com/items?itemName=tomoki1207.pdf) 扩展（可能需要几分钟）

2. 将本仓库下载至本地，设为工作目录，打开其中的 main.typ 文件

3. 点击 VS Code 右上角的 Show exported PDF 按钮，预览生成的 PDF.

## 基本语法
更多更详细的语法规则请参考 [Typst 官方文档](https://typst.app/docs/reference/)和 [Typst 中文文档](https://typst-doc-cn.github.io/docs/reference/).

## 注意事项 ⚠️

1. 若按照章节顺序汇报论文，请在模版第 30 行处取消注释 `#set heading(numbering: numbly("{1}.", default: "1.1"))`, 可实现一级标题和二级标题按照 1.1 1.2 自动编码。
2. 数学表达式以单独文本块显示时，默认从 (1) 开始编号，如果想跳过编号，请使用模版定义的 `nonum` 函数，语法为 `#nonum($ a^2+b^2=c^2 $)`.
3. 若需要给数学表达式使用颜色标记时，请使用模版定义的 `colmath` 函数，语法为 `#colmath($a^2+b^2=c^2$, blue)`.
4. 模版默认展示 `references.bib` 中全部文献, 并使用 Taylor & Francis 期刊风格展示引用；如仅展示引用文献，可在 `#bibliography` 函数中修改为 `full: false` ；如需使用其他引用风格，请修改 `style: "taylor-and-francis-national-library-of-medicine"` 参数，参考 [https://typst.app/docs/reference/model/bibliography/#parameters-style](https://typst.app/docs/reference/model/bibliography/#parameters-style).
4. 本模版默认为英文排版，Typst 中文排版还有一些[小问题](https://typst-doc-cn.github.io/docs/chinese/).

