#set page(
  paper: "a4",
  margin: 2cm
)
#let main_font = "Times New Roman"
#let sans_font = "Noto Sans"
#let mono_font = "FiraCode Nerd Font Mono"
#set text(
  font: main_font,
  size: 14pt
)
#set par(
  justify: true,
  first-line-indent: 1.25cm,
  leading: 1.25em,
  spacing: 1.25cm
)
#set heading(
  numbering: "1.",
)
#show heading: set align(center)
#show heading: it => [
  #it
  #text(size:0pt)[
    #par(leading: 0pt, spacing: 0pt)[
      #{""}
    ]
  ]
  #v(-0.6em)
]

#align(center + top)[
  #par(spacing: 0.75em)[
    Министерство науки и образования РФ
    
    Федеральное государственное бюджетное учреждение

    высшего образования 

    "Тверской Государственный Технический Университет"

    (ТвГТУ)

    Кафедра Программного обеспечения

    #{""}

    Отчет по лабораторной работе №2

    По дисциплине: «Анализ больших данных»
    
    Тема: "Исследовательский анализ данных. Постановка гипотез 
    
    Категориальные данные"

  ]
]
#align(right + horizon)[
  #par(spacing: 0.75em)[
    Выполнил:

    студент группы

    Б.ПИН.РИС-21.06

    Миронов М.В.

    #{""}

    Проверила: 

    старший преподаватель
    
    кафедры ПО
    
    Корнеева Е.И.

  ]
]
#align(center + bottom)[
  #strong[Тверь #datetime.today().year() г.]
]
#pagebreak()
#outline(title: "Содержание")
#pagebreak()
#counter(page).update(1)
#set page(
  paper: "a4",
  margin: (left: 3cm, right: 1cm, top: 2cm, bottom: 2cm),
  numbering: ("1 / 1")
)

= Задача
-=-

Сложность "Well-done"
= Вариант задачи
Kensho Derived Wikimedia Dataset @kensho
= Ссылка на код
Дамп таблиц не будет предоставлен, так как БД содержит слишком много данных для системы elearning. Взамен будет предоставлен DDL.

https://github.com/NydusBorn/big-data
#pagebreak()
= Описание проделанной работы
-=-
= Вывод
-=-
#pagebreak()
#bibliography("refs.bib", title: "Список Литературы", full: true)