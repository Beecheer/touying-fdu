#import "@preview/touying:0.7.3": *

#let slide(
    config: (:),
    repeat: auto,
    setting: body => body,
    composer: auto,
    ..bodies,
)=touying-slide-wrapper(
    self => {
        let header(self) = {
            place(top + left, polygon(
                fill: self.colors.neutral-lighter,
                (0pt, 0pt),
                (50pt, 0pt),
                (0pt, 70pt),
            ))
            set align(bottom)
            block(
                inset: (x: 1.5em, y: 0em),
                components.left-and-right(
                    grid(
                        rows: (auto, auto),
                        align: (top, bottom),
                        row-gutter: 1em,
                        grid(
                            columns: (auto, auto),
                            column-gutter: 5%,
                            emph(text(
                                size: 1.5em,
                                fill: self.colors.primary,
                                utils.display-current-heading(
                                    depth: self.slide-level,
                                    level: 1,
                                    numbered: false,
                                ),
                            )),
                            strong(
                                text(
                                    size: 1.7em,
                                    fill: self.colors.primary-darker,
                                    utils.display-current-heading(depth: self.slide-level, level: 2),
                                ),
                            ),
                        ),
                        grid(
                            columns: (10em, 1fr, 0.3fr),
                            gutter: 1em,
                            line(
                                length: 100%,
                                stroke: 5pt + self.colors.neutral-dark,
                            ),
                            line(
                                length: 100%,
                                stroke: 3pt + self.colors.neutral-light,
                            ),
                        ),
                    ),
                    image("../assets/复旦大学-校徽+校名.svg"),
                ),
            )
        }
        let footer(self) = {
            place(bottom + left, polygon(
                fill: self.colors.neutral-lighter,
                (0pt, 0pt),
                (80pt, 50pt),
                (0pt, 50pt),
            ))
            block(
                inset: (x: 0em, y: 0em),
                grid(
                    rows: (auto, auto),
                    row-gutter: 0.5em,
                    line(
                        start: (60%, 0%),
                        end: (99%, 0%),
                        stroke: 3pt + self.colors.secondary-lightest,
                    ),
                    grid(
                        align: center + horizon,
                        columns: (2fr, 7fr, 1fr),
                        components.cell(
                            utils.call-or-display(self, self.store.footer-left),
                        ),
                        components.cell(
                            utils.call-or-display(self, self.store.footer-center),
                        ),
                        components.cell(
                            fill: self.colors.primary-lighter,
                            text(
                                size: 1.5em,
                                emph(context utils.slide-counter.display()),
                            ),
                        ),
                    ),
                ),
            )
        }
        let self = utils.merge-dicts(self, config-page(
            fill: self.colors.neutral-lightest,
            header: header,
            footer: footer,
        ))
        let new-setting = body=>{
            show heading.where(level: 3):it=>{
                text(size: 1.2em, it.body)
            }
            set align(center)
            block(
                width: 100%,
                inset: (top: 0em, y: 0em),
                grid(
                    columns: (1em, 1fr),
                    align: (center, left),
                    column-gutter: 15pt,
                    line(
                        start: (0%, 0%),
                        end: (0%, 80%),
                        stroke: 5pt + self.colors.tertiary-lightest,
                    ),
                    block(
                        width: 100%,
                        height: 100%,
                        inset: (x: 1.5em, y: 1.2em),
                        fill: self.colors.neutral-lightest,
                        stroke: 2pt + self.colors.primary-lightest,
                        radius: 0.5em,
                    )[
                        #setting(body)
                    ],
                ),
            )
        }
        touying-slide(
            self: self,
            config: config,
            repeat: repeat,
            setting: new-setting,
            composer: composer,
            ..bodies,
        )
    },
)

#let title-slide(
    config: (:),
    title: [],
    subtitle: [],
    author: [],
    date: [],
    footer: [],
)=touying-slide-wrapper(
    self => {
        let self = utils.merge-dicts(
            self,
            config-common(freeze-slide-counter: true),
            config-page(
                margin: (top: 0em, bottom: 0em, x: 0em),
                fill: rgb("#0a3665f8"),
                header: none,
                footer: none,
            ),
        )

        let title-setting = body=>{
            // 背景
            place(top + left, rect(
                width: 100%,
                height: 100%,
                fill: gradient.linear(
                    rgb("#0A2B4E"),
                    rgb("#163A5F"),
                    angle: 45deg,
                ),
            ))

            // 网格线
            for i in range(0, 16) {
                place(
                    top + left,
                    dx: i * (6.25%),
                    line(
                        start: (0pt, 0pt),
                        end: (0pt, 100%),
                        stroke: 0.35pt + white.transparentize(88%),
                    ),
                )
            }
            for i in range(0, 10) {
                place(
                    top + left,
                    dy: i * 10%,
                    line(
                        start: (0pt, 0pt),
                        end: (100%, 0pt),
                        stroke: 0.35pt + white.transparentize(88%),
                    ),
                )
            }

            // 实心大圆
            place(
                horizon + right,
                dx: -15%,
                dy: -10%,
                circle(
                    radius: 8.2em,
                    fill: rgb("#2E86C1").transparentize(70%),
                    stroke: 1pt + rgb("#5DADE2").transparentize(5%),
                ),
            )
            // 实心小圆
            place(
                horizon + right,
                dx: -30%,
                dy: -30%,
                circle(
                    radius: 4em,
                    fill: gradient.linear(
                        rgb("#3f52dfc8"),
                        rgb("#0625538d"),
                        angle: 90deg,
                    ),
                    stroke: 1pt + rgb("#105cbf").transparentize(45%),
                ),
            )
            // 虚线大圆
            place(
                horizon + right,
                dx: -5%,
                dy: -4%,
                circle(radius: 10em, fill: none, stroke: (
                    paint: white.transparentize(60%),
                    thickness: 1.6pt,
                    dash: (6pt, 5pt),
                )),
            )
            // 虚线小圆
            place(
                horizon + right,
                dx: -10%,
                dy: 14%,
                circle(
                    radius: 4em,
                    fill: none,
                    stroke: (
                        paint: rgb("#85C1E9").transparentize(45%),
                        thickness: 1.2pt,
                        dash: (3pt, 4pt),
                    ),
                ),
            )

            // 圆角矩形条
            place(
                top + right,
                dx: -5%,
                dy: 30%,
                rotate(
                    120deg,
                    reflow: false,
                    rect(
                        width: 15em,
                        height: 2em,
                        radius: 1em,
                        fill: gradient.linear(
                            rgb("#5DADE2").transparentize(12%),
                            rgb("#85C1E9").transparentize(25%),
                            angle: 0deg,
                        ),
                    ),
                ),
            )
            place(
                top + right,
                dx: -15%,
                dy: 70%,
                rotate(
                    120deg,
                    reflow: false,
                    rect(
                        width: 12em,
                        height: 2em,
                        radius: 1em,
                        fill: gradient.linear(
                            rgb("#3FA7D6").transparentize(18%),
                            rgb("#85C1E9").transparentize(35%),
                            angle: 0deg,
                        ),
                    ),
                ),
            )
            place(
                top + right,
                dx: -25%,
                dy: 50%,
                rotate(
                    120deg,
                    reflow: false,
                    rect(
                        width: 10em,
                        height: 1.5em,
                        radius: 0.75em,
                        fill: gradient.linear(
                            rgb("#5DADE2").transparentize(35%),
                            white.transparentize(82%),
                            angle: 0deg,
                        ),
                    ),
                ),
            )
            place(
                top + right,
                dx: -0%,
                dy: 50%,
                rotate(
                    120deg,
                    reflow: false,
                    rect(
                        width: 11em,
                        height: 1.8em,
                        radius: 0.9em,
                        fill: gradient.linear(
                            rgb("#85C1E9").transparentize(30%),
                            rgb("#3497d9").transparentize(55%),
                            angle: 0deg,
                        ),
                    ),
                ),
            )

            // 点阵
            for i in range(0, 10) {
                for j in range(0, 10) {
                    place(
                        bottom + right,
                        dx: -6% - i * 1.08%,
                        dy: -8% - j * 1.92%,
                        circle(
                            radius: 1.8pt,
                            fill: rgb("#85C1E9").transparentize(20%),
                        ),
                    )
                }
            }

            place(
                top + left,
                dx: 1em,
                dy: 1em,
                image("../assets/复旦大学-校徽.svg", height: 7em),
            )

            place(
                left + horizon,
                dx: 5em,
                dy: 0em,
                block(grid(
                    rows: (auto, auto, auto),
                    row-gutter: (0.8em, 0.5em),
                    text(
                        fill: white,
                        size: 4em,
                        weight: "bold",
                    )[#title],
                    // 橙色短横线
                    rect(
                        width: 40%,
                        height: 0.42em,
                        fill: orange,
                        radius: 0.2em,
                    ),
                    text(
                        fill: rgb("#B3D4F0"),
                        size: 1.5em,
                        tracking: 0.12em,
                    )[
                        #subtitle
                    ],
                )),
            )

            // =========================
            // 底部信息区
            // =========================
            place(
                bottom + left,
                dx: 5em,
                dy: -3.2em,
                block(
                    width: 35%,
                    inset: (x: 1.2em, y: 1em),
                    fill: white.transparentize(92%),
                    stroke: 0.8pt + white.transparentize(78%),
                    radius: 0.6em,
                )[
                    #grid(
                        columns: (auto, 1fr),
                        column-gutter: 1em,
                        row-gutter: 0.45em,
                        align: (left, horizon),
                        text(
                            fill: rgb("#B3D4F0"),
                            size: 0.9em,
                            weight: "bold",
                        )[汇报人],
                        text(
                            fill: rgb("#A0C4E2"),
                            size: 0.9em,
                        )[#author],
                        text(
                            fill: rgb("#A0C4E2"),
                            size: 0.9em,
                            weight: "bold",
                        )[日期],
                        text(fill: rgb("#A0C4E2"), size: 0.9em)[#date],
                    )
                ],
            )

            place(
                bottom + center,
                block(inset: 0.6em, text(fill: white)[#footer]),
            )
        }

        touying-slide(
            self: self,
            config: config,
            setting: title-setting,
        )
    },
)

#let new-section-slide(config: (:), body) = touying-slide-wrapper(
    self => {
        let self = utils.merge-dicts(
            self,
            // config-common(freeze-slide-counter: true),
            config-page(
                margin: (top: 0em, bottom: 0em, x: 0em),
                fill: rgb("#0a3665f8"),
                header: none,
                footer: none,
            ),
        )
        let slide-body = {
            place(top + left, polygon(
                fill: rgb("#18518e9a"),
                (0%, 0%),
                (80%, 0%),
                (0%, 80%),
            ))
            place(top + left, polygon(
                fill: rgb("#0d63be86"),
                (100%, 100%),
                (80%, 100%),
                (100%, 80%),
            ))
            place(
                top + left,
                dx: 1em,
                dy: 1em,
                image("../assets/复旦大学-校徽.svg", height: 7em),
            )
            place(
                center + horizon,
                dx: 0%,
                grid(
                    rows: (auto, auto, auto),
                    row-gutter: (1.2em, 0.8em),
                    align: right,
                    text(
                        fill: white,
                        size: 4em,
                        [#utils.display-current-heading(level: 1)],
                    ),
                    line(
                        length: 70%,
                        stroke: 0.3em + rgb("#e18c2aed"),
                    ),
                    line(
                        length: 30%,
                        stroke: 0.2em + rgb("#da852470"),
                    ),
                ),
            )
            body
        }
        touying-slide(self: self, config: config, slide-body)
    },
)

#let outline-slide(config: (:)) = touying-slide-wrapper(
    self => {
        let self = utils.merge-dicts(
            self,
            config-common(freeze-slide-counter: true),
            config-page(
                margin: (top: 0em, bottom: 0em, x: 0em),
                fill: rgb("#0a3665f8"),
                header: none,
                footer: none,
            ),
        )

        let outline-body = {
            place(top + left, polygon(
                fill: rgb("#18518e9a"),
                (0%, 0%),
                (80%, 0%),
                (0%, 80%),
            ))
            place(top + left, polygon(
                fill: rgb("#0d63be86"),
                (100%, 100%),
                (80%, 100%),
                (100%, 80%),
            ))
            place(
                top + left,
                dx: 1em,
                dy: 1em,
                image("../assets/复旦大学-校徽.svg", height: 7em),
            )
            place(
                horizon + left,
                dx: 30%,
                dy: -5%,
                block(
                    fill: rgb("#0074d998"),
                    outset: 3em,
                    stack(
                        dir: ttb,
                        spacing: 1em,
                        .."目录".clusters().map(ch => text(
                            fill: white,
                            size: 3em,
                            weight: "bold",
                            ch,
                        )),
                    ),
                ),
            )
            place(
                center + horizon,
                dx: 18%,
                block(
                    inset: 2em,
                    context{
                        let heads = query(heading.where(level: 1))

                        grid(
                            rows: heads.len(),
                            row-gutter: 1.5em,
                            ..heads.enumerate().map(
                                ((i, h))=>{
                                    grid(
                                        columns: (10%, 45%),
                                        align: (left + top, right + bottom),
                                        column-gutter: 0.5em,
                                        text(
                                            fill: white,
                                            size: 2.6em,
                                            numbering("01", i + 1),
                                        ),
                                        grid(
                                            rows: 2,
                                            align: right,
                                            row-gutter: 0.8em,
                                            link(
                                                h.location(),
                                                text(fill: white, size: 2.6em, h.body),
                                            ),
                                            line(
                                                length: 100%,
                                                stroke: 0.2em + rgb("#da85248c"),
                                            ),
                                        ),
                                    )
                                },
                            ),
                        )
                    },
                ),
            )
        }
        touying-slide(self: self, config: config, outline-body)
    },
)

#let fdu-theme(
    aspect-ratio: "16-9",
    footer-left: self => self.info.author,
    footer-center: self => if self.info.short-title == auto {
        self.info.title
    } else {
        self.info.short-title
    },
    ..args,
    body,
) = {
    set text(size: 21pt)

    show: touying-slides.with(
        // config page
        config-page(
            ..utils.page-args-from-aspect-ratio(aspect-ratio),
            margin: (top: 5em, bottom: 2.3em, x: 1em),
            numbering: "1",
        ),
        // config color
        config-colors(
            neutral: rgb("#94A3B8"),
            neutral-dark: rgb("#64748B"),
            neutral-darker: rgb("#334155"),
            neutral-darkest: rgb("#0F172A"),
            neutral-light: rgb("#CBD5E1"),
            neutral-lighter: rgb("#E1E5E9"),
            neutral-lightest: rgb("#FFFFFF"),
            primary: rgb("#1E3A8A"),
            primary-dark: rgb("#172E6E"),
            primary-darker: rgb("#102152"),
            primary-darkest: rgb("#081536"),
            primary-light: rgb("#3B82F6"),
            primary-lighter: rgb("#BFDBFE"),
            primary-lightest: rgb("#EFF6FF"),
            secondary: rgb("#0F766E"),
            secondary-dark: rgb("#115E59"),
            secondary-darker: rgb("#134E4A"),
            secondary-darkest: rgb("#042F2E"),
            secondary-light: rgb("#2DD4BF"),
            secondary-lighter: rgb("#99F6E4"),
            secondary-lightest: rgb("#ECFEFF"),
            tertiary: rgb("#F59E0B"),
            tertiary-dark: rgb("#B45309"),
            tertiary-darker: rgb("#92400E"),
            tertiary-darkest: rgb("#78350F"),
            tertiary-light: rgb("#FBBF24"),
            tertiary-lighter: rgb("#FDE68A"),
            tertiary-lightest: rgb("#FFFBEB"),
        ),
        // config methods
        config-methods(alert: utils.alert-with-primary-color),
        // config common
        config-common(
            slide-fn: slide,
            new-section-slide-fn: new-section-slide,
        ),
        // config store
        config-store(
            footer-left: footer-left,
            footer-center: footer-center,
        ),
        ..args,
    )

    show heading.where(level: 1):set heading(numbering: "一、")

    body
}
