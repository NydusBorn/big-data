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

    Отчет по лабораторной работе №1

    По дисциплине: «Анализ больших данных»
    
    Тема: "Реляционные данные. Исследовательский анализ данных. 
    
    Построение визуализаций данных OLAP"

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
1. Произвести подключение к базе данных из python.
2. Описать данные, таблицы, признаки.
3. Провести одномерный анализ количественных признаков. 
4. Многомерный анализ
Сложность "Well-done"
= Вариант задачи
Kensho Derived Wikimedia Dataset @kensho
= Ссылка на код
Дамп таблиц не будет предоставлен, так как БД содержит слишком много данных для системы elearning. Взамен будет предоставлен DDL.

https://github.com/NydusBorn/big-data
#pagebreak()
= Описание проделанной работы
== База данных
Был произведен импорт данных из csv в БД postgres при помощи средств DataGrip. После создания связей между таблицами была получена следующая схема таблиц.
#figure(image("diagram.png"), caption: "Схема связей в базе данных")
Для подключения к базе данных были сгенерированы маппинги для peewee при помощи встроенного в него инструмента pwiz.

== Описание данных
=== Таблицы
В датасете 7 таблиц, но таблица "link_annotated_text" включена не была, так как не содержит анализируемых данных, и при том содержит 18 гб данных.

Основные данные в таблицах - связи и текст. Числовое поле только одно.

=== Признаки
Количественные: page.views

Также можно выделить несколько виртуальных количественных признаков: COUNT(item_aliases.item_id == item.item_id), COUNT(statements.source_item_id == item.item_id), COUNT(statements.target_item_id == item.item_id), COUNT(statements.edge_property_id == property.property_id)

Номинальные: property
== Одномерный анализ
=== views
#figure(image("views_top10.png"), caption: "Топ 10 страниц по просмотрам")<pages>
Как мы видим между страницами большой разрыв. Поэтому график будет представлен для страниц с количеством просмотров < 200.
#figure(image("views_less200.png"), caption: "Страницы с менее чем 200 просмотров")
Как можно увидеть значительная часть страниц имеет меньше 50 просмотров.
=== Виртуальные счетчики
#figure(image("item_alias_counts.png"), caption: "item_aliases")
#figure(image("sources_count.png"), caption: "source_items")
#figure(image("targets_count.png"), caption: "target_items")
#figure(image("props_count.png"), caption: "property_uses")<props>

Во всех графиках были выбросы, поэтому при формировании графиков были отфильтрованы экстремальные значения.
Все графики кроме property_uses(@props) приближены к нормальному распределению (с значительным отклонением в меньшую сторону). property_uses имеет распределение близкое к равномерному

== Многомерный анализ
Так как есть только 2 количественные характеристики (которые можно как то интерпретировать), то будет 1 график - views x item_alias_counts.
#figure(image("views_count.png"), caption: "x - views, y - alias count")
Как мы видим, зависимостей нет.

== Средства
Для выполнения задачи использовались в том числе средства datagrip и pycharm, позволяющие проводить анализ напрямую на таблицах sql и датафреймах из python.

#text(style: "italic")[Зачем что то делать когда можно не делать?] Поэтому для задачи визуализации предлагается использовать metabase. (можно развернуть следующей командой: #text(font: mono_font)[docker run -d -p 32019:3000 metabase/metabase])
#figure(image("app.png"), caption: "Интерфейс приложения metabase с одним из графиков")

= Вывод
Была проведена работа по анализу датасета @kensho, в результате было изучено несколько новых инструментов. Из датасета не удалось получить какие либо очевидные знания, поэтому стоит предположить что: 
1. Просмотры в значительной мере зависят от контента страницы, в частности популярности темы (датасет был создан \~2020 году, и 3 из 10 в топ 10 - фильмы вышедшие в 2019).
2. Влияние остальных входных незначительно по сравнении с 1.
#pagebreak()
#bibliography("refs.bib", title: "Список Литературы", full: true)