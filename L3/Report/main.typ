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

    Отчет по лабораторной работе №3

    По дисциплине: «Анализ больших данных»
    
    Тема: "Бинарная и многоклассовая классификация. Оценка качества 
    
    задачи классификации"

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
1.	Провести разведочный анализ данных, ответив на следующие вопросы:
  - Сколько строк в датафрейме, сколько столбцов
  - Сколько места занимает датафрейм в оперативной памяти
  - Для каждой интервальной переменной подсчитать следующее - мин, медиана, среднее, макс и персентили 25, 75
  -	Для каждой категориальной переменной рассчитать моду и сколько раз мода встречается в данных
2.	Подготовка датасета к построению моделей ML
  -	Провести анализ и обработку пропусков (либо заменить, либо удалить)
  -	Провести анализ и обработку выбросов (либо заменить, либо удалить)
  -	Провести анализ и обработку категориальных переменных (сколько таких переменных, закодируйте категориальные переменные одним из методов ( one hot encoding, mean target, frequence encoding)
  -	Разделить датасет на трейн и тест
3.	Построить следующие классификационные алгоритмы:
  -	Knn
  -	Logistic regression
  -	SVM
4.	Оценить качество алгоритмов, выбрать самый оптимальный алгоритм
5.	Возможно ли улучшить алгоритм, предложите идеи?

Сложность "Well-done"
= Вариант задачи
Binary Classification with a Tabular Pulsar Dataset @pulsar

Wine Quality Dataset 
= Ссылка на код
https://github.com/NydusBorn/big-data
#pagebreak()
= Описание проделанной работы

= Вывод
Мы использовали средства python и IDE pycharm для анализа датасетов seaborn.mpg и Pulsar.
#pagebreak()
#bibliography("refs.bib", title: "Список Литературы", full: true)