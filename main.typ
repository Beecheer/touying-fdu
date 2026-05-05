#import "globals.typ":*

#show: fdu-theme.with(aspect-ratio: "16-9")

#title-slide(
    author: [作者],
    date: [#datetime.today().display()],
    title: [标题],
    subtitle: [副标题],
    footer: [单位],
)

#outline-slide()

#include "content.typ"
