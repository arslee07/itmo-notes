#import "@preview/theorion:0.4.1": *
#import cosmos.clouds: *
#show: show-theorion
#set-inherited-levels(0)

#set document(title: [Математический анализ --- 2. Лекции])
#set page(margin: 1cm, numbering: "1")
#set text(lang: "ru", size: 12pt)

#show math.equation.where(block: true): eq => {
  block(width: 100%, inset: 0pt, align(center, eq))
}

#let replacement(..items) = $mat(delim: "[", align: #left, ..items)$

#title()
#outline()
#pagebreak()

= Лекция 1 (10.02.2026)

== Первообразная. Неопределенный интеграл

#definition(title: "Первообразная")[
  Пусть на $(a; b)$ определена и непрерывна функция $f(x)$. Функция $F(x)$, дифференцируемая на $(a; b)$ называется _первообразной_ функции $f(x)$, если

  $
    F'(x) = f(x) space "или" space d F(x) = f(x) d x
  $
]

#theorem[
  Если $F_1(x)$ и $F_2(x)$ --- первообразные функции $f(x)$ на $(a; b)$, то они отличаются на константу.
]

#proof[
  Пусть $F_1(x)$ и $F_2(x)$ --- первообразные $f(x)$. Рассмотрим $phi(x) = F_1 (x) - F_2(x)$.

  $
    phi'(x) = F_1'(x) - F_2'(x) = f'(x) - f'(x) = 0
  $

  То есть, $phi'(x) = 0$ на $(a; b)$.

  Пусть $phi(x) = C$, $F_1(x) - F_2(x) = C$, $F_1(x) = F_2(x) = + C$.

  По теореме Лагранжа: $[x_0; x]$, $x_0$ --- фиксированная, $x$ --- произвольная, $[x_0; x] subset (a; b)$.

  Для $phi(x) : zeta in [x_0 x]$

  $
    phi(x) - phi(x_0) = phi'(zeta)(x - x_0) \
    phi'(zeta) = 0 \
    phi(x) - phi(x_0) = 0 \
    phi(x) = phi(x_0)
  $
]

#definition[
  График первообразной называется _интегральной кривой_.
]

#definition[
  Множество всех первообразных на $(a; b)$ называется _неопределенным интегралом_:

  $
    F(x) + C = integral f(x) d x
  $

  - $d x$ --- переменная (выражение) интегрирования
  - $f(x)$ --- подинтегральная функция
  - $f(x) d x$ --- подинтегральное выражение
]

#definition[
  Процесс нахождения неопределенного интеграла называется _интегрированием_. Правильность проверяется дифференцированием.
]

#property(title: "Основные свойства неопределенного интеграла")[
  1. $(integral f(x) d x)' = f(x)$
  2. $d integral f(x) d x = f(x) d x$
  3. $integral d F(x) = F(x) + C$
  4. $integral a f(x) d x = a integral f(x) d x, quad a!=0, a in RR$
  5. $integral (f_1(x) plus.minus f_2(x)) d x = integral f_1(x) d x + integral f_2(x) d x$
]

#property(title: "Инвариантность формулы интегрирования")[
  $phi(x) d x = d phi(x)$.

  Если $integral f(x) d x = F(x) + C$, то $integral f(u) d u = F(u) + C$, где $u = phi(x)$  --- произвольная дифференцируемая функция.
]

#proof[
  $
    integral f(u(x)) phi'(x) d x = cases(delim: "[", u = phi(x), d u = u'(x) d x) = integral f(u) d u = F(u) + C
  $
]

#example[
  $
    integral e^(sin x) cos x d x = integral e^(sin x) d(sin x) = e^(sin x) + C
  $
]

#property(title: "Линейность определенного(???) интеграла")[
  $
    integral a_1 f_1(x) + a_2 f_2(x) + ... + a_n f_n(x) = a_1 integral f_1(x) d x + a_2 integral f_2(x) d x + ... + a_n integral f_n(x) d x
  $
]

#proof[
  Пусть $F_1(x), F_2(x), ..., F_n(x)$ --- первообразные для соответствующих функций. Тогда

  $
    Phi(x) = a_1 F_1(x) + a_2 F_2(x) + ... + a_n F_n(x)
  $

  *TODO*
]

#theorem(title: "Таблица интегралов")[
  + $integral x^n d x = x^(n + 1)/(n + 1) + C$

  + $integral a^x d x = a^x/(ln a) + C$
  + $integral e^x d x = e^x/ + C$
  + $integral sin x d x = -cos x + C$
  + $integral cos x d x = sin x + C$
  + $integral (d x) / (cos^2 x) = tg x + C$
  + $integral (d x) / (sin^2 x) = -ctg x + C$
  + $integral (d x) / sqrt(1 - x^2) = arcsin x + C$
  + $integral (d x) / (1 + x^2) = "arctg" x + C$
  + $integral "sh" x d x = "ch" x + C$
  + $integral "ch" x d x = "sh" x + C$
  + $integral (d x)/("ch"^2 x) = "th" x + C$
  + $integral (d x)/("sh"^2 x) = -"cth" x + C$
  + $integral (d x) / x = ln abs(x) + C$
  + $integral (d x) / (a x + b) = 1/a ln abs(a x + b) + C$
  + $integral (d x)/sqrt(a^2 - x^2) = arcsin x / a + C$
  + $integral (d x)/(a^2 + x^2) = 1 / a "arctg" x / a + C$
  + $integral tg x d x = - ln abs(cos x) + C$
  + $integral ctg x d x = ln abs(sin x) + C$
  + $integral (x d x)/(x^2 plus.minus a^2) = 1/2 ln abs(x^2 + a^2) + C$
  + $integral (x d x)/sqrt(a^2 plus.minus x^2) = plus.minus sqrt(a^2 plus.minus x^2) + C$
  + $integral (d x)/(x^2 - a^2) = 1/2 ln abs((x-a)/(x+a)) + C quad$ ("высокий" логарифм)
  + $integral (d x)/sqrt(x^2 + a^2) = ln abs(x + sqrt(x^2 plus.minus a^2)) + C$
  + $integral sqrt(a^2 - x^2) d x = a^2/2 arcsin x/a + x/2 sqrt(a^2 - x^2) + C$
  + $integral sqrt(a^2 + x^2) d x = a^2/2 ln abs(x + sqrt(x^2 + a^2)) + x/2 sqrt(x^2 + a^2) + C$
  + $integral (d x)/(x^2 + a^2)^n$ --- *TODO* домашка, по частям
]

#note-box[
  Вывод формулы 24:

  $
    "TODO"
  $

  Вывод формулы 25:

  $
    "TODO"
  $

]

Методы интегрирования:
+ Непосредственное интегрирование: преобразование подинтегральной функции (выражения) для сведения интеграла с использованием свойств к одному или нескольким табличным интегралам. Пример:
  $
    integral (d x) / (x^2 + x^4) = integral ((1 + x^2) - x^2)/(x^2 (1 + x^2)) d x = integral (1/x^2 - 1/(1 + x^2)) d x = integral (d x)/x^2 - integral (d x)/(1 + x^2) = - 1 / x + "arctg" x + C
  $
+ Замена переменной или подстановка
  + Подстановка:
    $
      integral f(x) d x = replacement(x = phi(t); d x = u'(t) d t) = integral (f(phi(t))) dot phi'(t) d t = Phi(t) + C = replacement(t = phi^-1(x)) = F(x) + C
    $
  + Замена переменной (подстановка $phi(x) = t$ подбирается):
    $
      integral f(phi(x)) phi'(x) d x = replacement(phi(x) = t; d t = phi'(x) d x) = integral f(t)d t
    $
+ Интегрирование по частям

  #theorem[
    Пусть дано:
    - $u(x)$ и $v(x)$ определены и дифференцируемы на $(a; b)$
    - $u'(x) v(x)$ и $u(x) v'(x)$ имеют первообразные

    Тогда:
    $
      integral u d v = u v - integral v d u
    $

    Так называемая формула интегрирования по частям.
  ]

  #proof[
    $
      d (u v) = v d u + u d v \
      integral d (u v) = integral v d u + integral u d v \
      u v = integral v d u + integral u d v \
      integral u d v = u v - integral v d u
    $
  ]

  Хотим проинтегрировать $integral P_n (x) f(x) d x$, где $P_n(x)$ --- многочлен $n$-ой степени. Типы $f(x)$:
  - I тип: $e^x, a^x, tg x, ctg x, sin x, cos x, ...$
    - $u = P_n (x)$
    - $d v = f(x) d x$
  - II тип: $ln x, log_a x, "arctg" x, "arcctg" x, arcsin x, arccos x, ...$
    - $u = f(x)$
    - $d v = P_n(x) d x$
  - III тип: $sqrt(a^2 - x^2)$, ... (так называемые возвратные интегралы)

  Пример:

  $
    integral x sqrt(x - 3) d x &= mat(delim: "[", t = sqrt(x - 3); t^2 + 3 = x; d x = 2 t d t) = integral (t^2 + 3) t dot 2 t dot d t \
    &= 2 integral (t^4 + 3 t^2) d t \
    &= 2/5 t^5 + 2 t^3 + C \
    &= 2/5 (sqrt(x - 3))^5 + 2 (sqrt(x - 3))^3 + C
  $

  $
    integral sqrt(2 - x^2) d x = ...
  $

= Лекция 3 (17.02.2026)

сори заболел
