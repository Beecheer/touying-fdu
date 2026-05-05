#import "@preview/touying:0.7.3": *
#import "../template/touying-fdu.typ": *

#show: fdu-theme.with(aspect-ratio: "16-9")

#title-slide(
    author: [beecheer],
    date: [#datetime.today().display()],
    title: [模版·演示],
    subtitle: [使用Typst制作],
    footer: [复旦大学],
)

#outline-slide()

= 文字

== 段落

=== #lorem(2)

#lorem(30)

#lorem(30)

== 列举

+ #lorem(1)
    - #lorem(5)
    - #lorem(3)
    - #lorem(4)
    - #lorem(6)
+ #lorem(1)
    - #lorem(5)
    - #lorem(3)
    - #lorem(4)
    - #lorem(6)

= 图片

== 单张

#block(
    // width: 80%,
    fill: rgb("#122c7296"),
    image(
        "../assets/复旦大学-校徽.svg",
        width: 70%,
    ),
)

== 多张

#block(
    fill: rgb("#274493e1"),
    outset: (x: 5%, y: 10%),
    stack(dir: ltr, spacing: 5%, image(
        "../assets/复旦大学-校徽.svg",
        width: 20%,
    ), image(
        "../assets/复旦大学-校徽+校名.svg",
        height: 50%,
    )),
)

= 表格

#table(
    columns: (1fr, 2fr, 2fr),
    rows: (1.5em, 2em, 2em, 2em),
    align: (
        right + horizon,
        center + horizon,
        center + horizon,
    ),
    table.header([表1], [表2], [表3]),
    [content11],
    [content12],
    [content13],
    [content21],
    [content22],
    [content23],
    [content31],
    [content32],
    [content33],
    [content41],
    [content42],
    [content43],
)

= 第四章

== 第四节
== 第五节
== 第六节

= 第五章


== 第七节
asdfasfdfadfdsa

=== 第十三小节

=== 第十四小节

== 第八节

== 第九节

