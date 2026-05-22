#import "../template.typ": *
#show: template.with([Математический анализ --- II. Лекции])

#let replacement(..items) = $mat(delim: "[", align: #left, ..items)$
#let eval = $lr(|, size: #24pt)$

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
    integral f(u(x)) phi'(x) d x = replacement(u = phi(x); d u = u'(x) d x) = integral f(u) d u = F(u) + C
  $
]

#example[
  $
    integral e^(sin x) cos x d x = integral e^(sin x) d(sin x) = e^(sin x) + C
  $
]

#property(title: "Линейность неопределенного интеграла")[
  $
    &integral a_1 f_1(x) + a_2 f_2(x) + ... + a_n f_n(x) \
    &wide = a_1 integral f_1(x) d x + a_2 integral f_2(x) d x + ... + a_n integral f_n(x) d x
  $
]

#theorem(title: "Таблица интегралов")[
  + $integral x^n d x = x^(n + 1)/(n + 1) + C$

  + $integral a^x d x = a^x/(ln a) + C$
  + $integral e^x d x = e^x + C$
  + $integral sin x space d x = -cos x + C$
  + $integral cos x space d x = sin x + C$
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
  + $integral (d x)/(x^2 - a^2) = 1/(2a) ln abs((x-a)/(x+a)) + C quad$ ("высокий" логарифм)
  + $integral (d x)/sqrt(x^2 + a^2) = ln abs(x + sqrt(x^2 plus.minus a^2)) + C quad$ ("длинный" логарифм)
  + $integral sqrt(a^2 - x^2) space d x = a^2/2 arcsin x/a + x/2 sqrt(a^2 - x^2) + C$
  + $integral sqrt(a^2 + x^2) space d x = a^2/2 ln abs(x + sqrt(x^2 + a^2)) + x/2 sqrt(x^2 + a^2) + C$
  + $integral (d x)/(x^2 + a^2)^n$ --- домашка, по частям
]

Методы интегрирования:
+ Непосредственное интегрирование: преобразование подинтегральной функции (выражения) для сведения интеграла с использованием свойств к одному или нескольким табличным интегралам. Пример:
  $
    integral (d x) / (x^2 + x^4) &= integral ((1 + x^2) - x^2)/(x^2 (1 + x^2)) d x = integral (1/x^2 - 1/(1 + x^2)) d x \
    &= integral (d x)/x^2 - integral (d x)/(1 + x^2) = - 1 / x + "arctg" x + C
  $
+ Замена переменной или подстановка
  + Подстановка:
    $
      integral f(x) d x &= replacement(x = phi(t); d x = u'(t) d t) = integral (f(phi(t))) dot phi'(t) d t \
      &= Phi(t) + C = replacement(t = phi^-1(x)) = F(x) + C
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

= Лекция 2 (17.02.2026)

сори заболел

= Лекция 3 (24.02.2026)

== Тригонометрические подстановки

1. $ integral R(x, sqrt(a^2 - x^2)) d x = replacement(x = a sin t space (x = a cos t)"," d x = a cos d t; t = arcsin x/a) = integral R(sin t, cos t) d t $
2. $ integral R(x, sqrt(a^2 + x^2)) d x = replacement(x = a tg t space (a = ctg t)"," d x = (a d t)/(cos^2 t); t = "arctg" x/a) = integral R(sin t, cos t) d t $
3. $ integral R(x, sqrt(x^2 - a^2)) d x = replacement(x = a/(cos t) = a sec t space (x = "cosec" t = a / (sin t)); d x = - (a sin t) / (cos^2 t) d t) = integral R(sin t, cos t) d t $

== Интегрирование тригонометрических выражений

=== Тип I

1. $ integral sin m x dot cos n x space d x = replacement(sin alpha cos beta = 1/2(sin(alpha - beta) + sin(alpha + beta))) $
2. $ integral sin m x dot sin n x space d x = replacement(sin alpha sin beta = 1/2 (cos(alpha - beta) - cos(alpha + beta))) $
3. $ integral cos m x dot cos n x space d x = replacement(cos alpha cos beta = 1 / 2 (cos(alpha - beta) + cos(alpha + beta))) $

=== Тип II

$
  integral tg^n x space d x = integral tg^(n - 2) x tg^2 x space d x wide tg^2 x = 1 / (cos^2 x) - 1
$

$
  integral ctg^n x space d x = integral ctg^(n - 2) x ctg^2 x space d x wide ctg^2 x = 1 / (sin^2 x) - 1
$

Примеры:

$
  integral tg^3 d x = integral tg x dot (1/(cos^2 x) - 1) d x = integral (tg x d x)/(cos^2 x) - integral tg x d x = (tg^2 x) / 2 + ln abs(cos x) + C
$

$
  integral ctg^7 x d x = integral ctg^5 x (1 / (sin^2 x) - 1) d x = integral (ctg^5 d x)/(sin^2 x) - integral ctg^5 x d x = ...
$

=== Тип III

$
  integral sin^m x dot cos^n x space d x
$

1. $m$ или $n$ --- положительное нечетное

  $
    cos^n x = cos^(n+1) x = cos^(2 k + 1) x = cos^(2 k) dot cos x = (cos^2 x)^k dot cos x = (1 - sin^2 x)^k cos x
  $

  $
    integral ((1 - sin^2 x)^k cos x)/(sin^m x) d x = integral ((1 - sin^2 x)^k d (sin x))/(sin^m x)
  $

  Пример:

  $
    integral (cos^2 x)/(sin^5 x) d x = integral (cos^2 x sin x)/(sin^6 x) d x
  $

2. $m$ и $n$ --- отрицательное четное

  $
    sin^2 x = 1/2 (1 - cos 2 x) \
    cos^2 x = 1/2 (1 + cos 2 x) \
    2 sin x cos x = sin 2 x
  $

  Пример:

  $
    integral sin^4 x cos^2 x space d x &= integral 1/8 (1 - cos 2 x)^2 (1 + cos 2 x) space d x \
    &= 1/8 integral (1 - cos^2 2 x - cos 2 x + cos^3 2 x) space d x \
    &= 1/8 integral d x - 1/8 integral cos 2 x d x - 1/8 integral 1/ 2 (1 + cos 4 x) space d x + 1/8 integral cos^2 2 x cos 2 x space d x \
    &= x/8 - 1/16 - x/16 - 1/64 sin 4 x + 1 /8 dot 1/2 integral (1 - sin^2 2 x) space d(sin 2 x) \
    &= ...
  $

3. $m$ и $n$ --- четные, хотя бы одно из них отрицательное ($m + n = 2 k $, то есть отрицательное четное)

  $
    sin x = t / sqrt(1 + t^2) wide cos x = 1 / sqrt(1 + t^2) wide replacement(t = tg x ; x = "arctg" x ; d x = (d t)/(1 + t^2))
  $

  $
    sin x = (sin x)/sqrt(sin^2 x + cos^2 x) = (tg x)/sqrt(tg^2 x + 1) = t/sqrt(t^2 + 1) \
    cos x = (cos x)/sqrt(sin^2 x + cos^2 x) = 1/sqrt(tg^2 x + 1) = 1/sqrt(t^2 + 1)
  $

  Пример:

  $
    (sin^4 x)/(cos^8 x) d x &= integral tg^4 x (d x)/(cos^4 x) = replacement(t = tg x; x = "arctg" t; d x = (d t)/(1+t^2); cos x = 1/sqrt(1 + t^2)) \
    &= integral t^4 space ((d t)/(1 + t^2))/((1/sqrt(1+t^2))^4) \
    &= t^5 / 5 + t^7 / 7 + C \
    &= (tg^5 x)/5 + (tg^7 x)/7 + C
  $

=== Тип IV

Рациональная функция относительно $sin x$ и $cos x$:

$
  integral R(sin x, cos x) space d x
$

Универсальная тригонометрическая подстановка:

$
  replacement(t = tg x / 2; x = 2 "arctg" t; 1/2 d x = (d t)/(1 + t^2), d x = (2 d t)/(1 + t^2))
$

$
  sin x = (2 sin x/2 cos x/2)/(cos^2 x/2 + sin^2 x/2) = (2 tg x/2)/(1 + tg (2 x)/2) = (2 t)/(1 + t^2) \
  cos x = (cos^2 x/2 - sin^2 x/2)/(cos^2 x/2 + sin^2 x/2) = (1 - tg^2 x/2)/(t + tg^2 x/2) = (1-t^2)/(1+t^2)
$

Пример:

$
  integral (sin x + 3 cos x)/(1 + 4 sin x - 5 cos x) d x &= replacement(tg = tg x/2; d x = (2 d t)/(1 + t^2); sin x = t/(1 + t^2); cos x = (1 - t^2)/(1 + t^2)) \
  &= integral (t / (1 + t^2) + (3(1 - t^2))/(1 + t^2))/(1 + (4 t)/(1 + t^2) - (5(1 - t^2))/(1 + t^2)) dot (2 d t)/(1 + t^2) \
  &= integral (t + 3 (1 - t^2))/(1 + t^2 + 4 t - 5(1 - t^2)) dot (2 d t)/(1 + t^2) = ...
$

1. $R(sin x, cos x)$ --- нечетная относительно $sin x$, то есть $R(-sin x, cos x) = -R(sin x, cos x)$:

  $
    t = cos x
  $

2. $R(sin x, cos x)$ --- нечетная относительно $cos x$, то есть $R(sin x, -cos x) = -R(sin x, cos x)$:

  $
    t = sin x
  $

3. $R(sin x, cos x)$ --- четная относительно $sin x$ и $cos x$, то есть $R(-sin x, -cos x) = R(sin x, cos x)$:

  $
    t = tg x
  $

Примеры:

$
  integral (d x)/(sin^2 x + 2 sin x cos x - cos^2 x) &= replacement(R(-sin x, -cos x) = -R(sin x, cos x); t = tg x; x = "arctg" x; d x = (d t)/(1 + t^2); sin x = t/sqrt(1 + t^2); cos x = 1/sqrt(1 + t^2)) \
  &= integral ((d t)/(1 + t^2))/((t^2)/(1+t^2) + (2 t)/(1 + t^2) - 1/(1 + t^2)) = integral (d t)/(t^2 + 2 t - 1) \
  &= integral (d t)/((t + 1)^2 - 2) = 1/(2 sqrt(2)) ln abs((t + 1 - sqrt(2))/(t + 1 + sqrt(2))) + C
$

$
  integral (d x)/(cos x) = replacement(t = tg x/2; d x = (2 d t)/(1 + t^2); sin x = (2 t)/(1 +  t^2)) = integral ((2 d t)/(1 + t^2))/((2 t)/(1 + t^2)) = integral (d t)/t = ln abs(t) + C = ln abs(tg (x/2 + pi/4)) + C
$

$
  integral (d x)/(sin x) = replacement(cos x = sin(x + pi/2); d x = d(x + pi/2)) = integral (d(x + pi/2))/sin(x + pi/2) = ln abs(tg (x + pi/2)/2) + C = ln abs(tg x/2) + C
$

= Лекция 4 (03.03.2026)

== Берущиеся и неберущиеся интегралы

#table(
  columns: (1fr, 1fr),
  align: center,
  table.header([*Берущиеся*], [*Неберущиеся*]),
  stroke: (x, y) => if (x == 0) { (right: 1pt) } + if (y == 0) { (bottom: 1pt) },
  [$ integral P_n (x) sin n x space d x $], [$ integral (sin n x)/(P_n (x)) space d x $],
  [$ integral P_n (x) cos n x space d x $], [$ integral (cos n x)/(P_n (x)) space d x $],
  [$ integral e^(a x) sin b x space d x $], [$ (e^(a x ))/(P_n (X)) space d x $],
  [$ integral e^(a x) cos b x space d x $], [$ integral R(x, sqrt(a x^3 + b x^2 + c x + d)) space d x $],
  [$ integral R(x, sqrt(a x^2 + b^x + c)) space d x $], [$ integral R(x, sqrt(a x^3 + b x^2 + c x + d)) space d x $],
  [], [$ R(x, sqrt(a x^4 + b x^3 + c x^2 + d x + e)) space d x $],
  [], [$ e^x^2 space d x $]
)

== Определенный интеграл

Бла бла бла и картинки прикольные

== Определение интеграла Римана

#definition(title: [разбиение])[
  _Разбиением_ $r$ отрезка $[a; b]$ называется конечное множество точек $r = {x_0, x_1, ..., x_n}$ такое, что $a = x_0 < x_1 < ... < x_n = b$, отрезки $[x_(i - 1), x_i]$ --- частичные (элементарные) отрезки

  Длина $i$-го отрезка: $Delta x_i = x_(i - 1) - x_i, space i = overline(1"," n)$
]

#definition(title: "ранг разбиения")[
  _Рангом_ разбиения называется величина
  $
    lambda (r) = max_(1 <= i <= n) {Delta x_i}
  $
]

#definition(title: "выборка")[
  Набор произвольных точек
  $
    xi = {x_i}, quad xi_i in [x_(i - 1), x_i], quad i = overline(1"," n)
  $

  называется _выборкой_ (оснащением разбиения).
]

#definition(title: "интегральная сумма Римана")[
  _Интегральной суммой Римана_ функции $f(x)$ на $[a; b]$ называется число
  $
    delta_tau (f, xi) = sum_(i = 1)^n f(xi_i) Delta x_i
  $
]

#definition(title: "интеграл Римана")[
  Число $I$ называется _определенным интегралом Римана_ от функции $f(x)$ на $[a; b]$, если $forall epsilon > 0 : exists delta > 0$ такое, что $forall tau$ с $lambda(tau) < delta$ и для любого выбора выполняется неравенство
  $
    abs(delta_tau (f, xi) - I) < epsilon
  $

  Тогда $f(x)$ называется интегрируемой по Риману на $[a; b]$.

  $
    I = integral_a^b f(x) d x = lim_(lambda(tau) -> 0) delta_tau (f, xi) = lim_(lambda(tau) -> 0 \ n->oo) sum_(i = 1)^n f(xi_i) delta x_i
  $
]

#definition(title: "определенный интеграл по Риману")[
  $
    integral_a^b f(x) d x 
  $

  - $a$ --- верхний предел интегрирования
  - $b$ --- нижний предел интегрирования
  - $f(x) d x$ --- подынтегральное выражение
  - $f(x)$ --- подынтегральная функция
]

#definition(title: "интегрируемая функция")[
  Если для $f(x)$ существует интеграл Римана на $[a; b]$, то функция называется _интегрируемой на $[a; b]$_.
]

#example[
  $f(x) = C$ интегрируема на $[a; b]$:

  $
    delta_tau (f, xi) = sum_(i = 1)^n f(xi_i) Delta x_i = sum_(i = 1)^n C Delta x_i = C sum_(i = 1)^n Delta x_i = C (b - a) =  integral C d x
  $
]

= Лекция 5 (10.03.2026)

== Основные свойства определенного интеграла

Подразумевается, что все функции из данных свойств интегрируемы на $[a; b]$ и рассматриваются только на этом отрезке.

<def-int-prop-1>
#property(title: 1)[
  $
    integral_a^b c f(x) d x = c integral_a^b f(x) d x
  $
]

#proof[
  $
    integral_a^b c f(x) d x = lim_(n->oo) sum_(i=1)^n c f(xi_i) Delta x_i = c lim_(n->oo) sum_(i=1)^n f(xi_i) Delta x_i = c integral_a^b f(x) d x
  $
]

<def-int-prop-2>
#property(title: 2)[
  $
    integral_a^b (f_1 (x) + f_2 (x)) d x = integral_a^b f_1 (x) d x + integral_a^b f_2 (x) d x
  $
]

#proof[
  Аналогично по определению.
]

#property(title: 3)[
  $
    integral_a^b f(x) d x = integral_a^c f(x) d x + integral_c^b f(x) d x, quad c in [a; b]
  $
]

#proof[
  $
    integral_a^b f(x) d x &= lim_(n->oo) sum_(i=1)^n f(xi_i) Delta x_i \
    &= lim_(n->oo) (sum_(i=1)^k f(xi_i) + sum_(i=k+1)^n f(xi_i)) Delta x_i \
    &= lim_(n->oo) sum_(i=1)^k f(xi_i) Delta x_i + lim_(n->oo) sum_(i=k+1)^n f(xi_i) Delta x_i \
    &= integral_a^c f(x) d x + integral_c^b f(x) d x
  $
]

<def-int-prop-4>
#property(title: 4)[
  $
    f(x) >= 0 wide==>wide integral_a^b f(x) d x >= 0 \
    f(x) <= 0 wide==>wide integral_a^b f(x) d x <= 0 \
  $
]

#proof[
  
]

#property(title: 5)[
  $
    f(x) >= g(x) wide==>wide integral_a^b f(x) d x >= integral_a^b g(x) d x
  $
]

#proof[
  По свойству #link(<def-int-prop-4>)[(4)]:

  $
    f(x) - g(x) >= 0 quad ==> quad integral_a^b (f(x) - g(x)) d x >= 0
  $

  Отсюда из свойств #link(<def-int-prop-2>)[(1)] и #link(<def-int-prop-2>)[(2)]:

  $
    integral_a^b (f(x) - g(x)) d x = integral_a^b f (x) d x - integral_a^b g (x) d x >= 0 wide==>wide integral_a^b f(x) d x >= integral_a^b g(x) d x
  $
]

#property(title: 6)[
  ...
]

#proof[
  ...
]

#property(title: [7, теорема о среднем])[
  $
    exists c in [a; b] : quad integral_a^b f(x) d x = f(c) (b - a)
  $
]

#proof[
  Пусть на $[a; b]$ выполняется $m <= f(x) <= M$. Отсюда имеем, что
  $
    m (b-a) <= integral_a^b f(x) d x <= M (b-a).
  $

  Разделим неравенство на $b-a$:

  $
    m <= 1/(b-a) integral_a^b f(x) d x <= M.
  $

  Так как $f$ непрерывна на $[a; b]$, тогда найдется такая $c in [a; b]$, что
  $
    f(c) = 1/(b-a) integral_a^b f(x) d x.
  $

  Умножив равенство на $b-a$ получаем, что
  $
    integral_a^b f(x) d x = f(c) (b - a)
  $
]

#property(title: 8)[
  $
    abs(integral_a^b f(x) d x) <= integral_a^b abs(f(x)) d x
  $
]

== Вычисление определенного интеграла

#definition(title: [Интеграл с переменным верхним пределом])[
  Пусть $f(x)$ интегрируема на $[a; b]$. Выберем произвольное $x in [a; b]$. Тогда:

  $
    integral_a^x f(t) d  t = F(x)
  $

  называется _интегралом с переменным верхним пределом_.
]

#theorem(title: [Барроу])[
  Если $f$ непрерывна на $[a; b]$, то
  $
    F'(x) = (integral_a^x f(t) d t)' = f(x)
  $
]

#theorem(title: [Основная теорема интегрального исчисления])[
  Если $f$ непрерывна на $[a; b]$ и $Phi(x)$ --- ее любая первообразная, то:

  $
    integral_a^b f(x) d x = Phi(x) eval_a^b = Phi(b) - Phi(a)
  $
]

#proof[
  Если $x = a$, то:
  $
    integral_b^a f(t) d t = Phi(a) + C \
    0 = Phi(a) + C \
    C = -Phi(a)
  $

  Если $x = b$, то:
  $
    integral_b^a f(t) d t = Phi(b) + C = Phi(b) - Phi(a)
  $
]

== Замена переменной в определенном интеграле

#theorem(title: [Замена переменной])[
  Пусть дано:
  - $f(x)$ непрерывна на $[a; b]$
  - $phi(t)$ дифференцируема на $[alpha; beta]$
  - $phi : [alpha; beta] -> [a; b]$
  - $phi(alpha) = a$
  - $phi(beta) = b$

  Тогда:

  $
    integral_a^b f(x) d x = replacement(x = phi(t); d x = phi'(t) d t; alpha = phi^(-1) (a); beta = phi^(-1) (b)) = integral_alpha^beta f(phi(t)) space phi'(t) space d t
  $
]

== Формула интегрирования по частям в определенном интеграле

#theorem(title: [Интегрирование по частям])[
  Если $u(x)$ и $v(x)$ дифференцируемы на $[a; b]$, то:

  $
    integral_a^b u d v = u v eval_b^a - integral_a^b v d u
  $
]

#example[
  $
    &integral_0^1 x sqrt(1 - x^2) d x = replacement(x = sin t; d x = cos t d t; 0 = sin t"," t = 0; 1 = sin t"," t = pi/2) \
    &wide = integral_0^(pi/2) sin t space sqrt(1 - sin^2 t) cos t space d t = integral_0^(pi/2) cos^2 t space sin t space d t = - integral_0^(pi/2) cos^2 t space d cos t = -(cos^3 t)/3 eval_0^(pi/2) = 1/3
  $
]

= Лекция n (31.03.2026)

== Несобственные интегралы

Пусть дано:
- $f(x)$ определена и непрерывна на $[a; +oo)$
- $xi in [a; +oo)$, $xi >= a$, $[a; xi]$
Тогда $integral_a^xi f(x) d x$ существует и зависит от $xi$.

#definition(title: "Несобственный интеграл")[
  _Несобственным интегралом_ от функции $f(x)$ по неограниченному промежутку $[a; +oo)$ называется
  $
    lim_(xi -> +oo) integral_a^xi f(x) d x quad =_"def" quad integral_a^(+oo) f(x) d x
  $

  (несобственный интеграл 1-го рода)
]

#definition(title: "Сходящийся несобственный интеграл")[
  Несобственный интеграл $integral_a^(+oo) f(x) d x$ называется _сходящимся_, если
  $
    lim_(xi -> +oo) integral_a^xi f(x) d x quad "конечный"
  $
]

#definition(title: "Расходящийся несобственный интеграл")[
  Несобственный интеграл $integral_a^(+oo) f(x) d x$ называется _расходящимся_, если
  $
    lim_(xi -> +oo) integral_a^xi f(x) d x quad "бесконечный или не существует"
  $
]

#definition[
  Если несобственный интеграл сходится, то $f(x)$ является интегрируемой в несобственном смысле
]

#definition(title: [Несобственный интеграл на $(-oo; a]$])[
  $
    integral_(-oo)^a f(x) d x = lim_(xi -> -oo) integral_xi^a f(x) d x
  $
]

#definition(title: [Несобственный интеграл на $(-oo; +oo)$])[
  $
    integral_(-oo)^(+oo) f(x) d x = integral_(-oo)^a f(x) d x + integral_a^(+oo) f(x) d x
  $
]

#example[
  Исследовать интеграл $integral_1^(+oo) (d x)/(x^alpha)$ на сходимость.

  $
    integral_1^(+oo) (d x)/(x^alpha) = lim_(x->+oo) integral_1^xi (d x)/(x^alpha) = lim_(xi->+oo) (x^(1 - alpha)/(1 - alpha) eval_1^xi) = lim_(xi->+oo) (xi^(1-alpha)/(1 - alpha) - 1/(1 - alpha)) = cases(1 / (alpha - 1) quad alpha > 1, +oo quad alpha < 1)
  $

  Рассмотрим случай $alpha = 1$.

  $
    integral_1^(+oo) (d x)/x = lim_(xi->+oo) integral_1(xi) (d x)/x = lim_(xi -> +oo) (ln x eval_1^xi) = lim_(xi->+oo) ln xi = +oo
  $

  То есть, данный интеграл сходится при $alpha > 1$ и расходится при $alpha <= 1$.
]

#example[
  Исследовать интеграл $integral_0^1 (d x)/(x^alpha)$ на сходимость.

  $
    integral_0^1 (d x)/(x^alpha) = lim_(epsilon -> 0) integral_epsilon^1 (d x)/(x^alpha) = lim_(epsilon->0) (1/(alpha - 1) (1 - epsilon^(1 - alpha))) = cases(-oo quad &alpha > 1, 1/(alpha - 1) quad &alpha < 1)
  $

  Рассмотрим случай $alpha = 1$.

  $
    integral_0^1 (d x)/(x^alpha) = lim_(epsilon -> 0) integral_epsilon^1 (d x)/x = lim_(epsilon -> 0) (ln x eval_epsilon^1) = lim_(epsilon -> 0) (ln 1 - ln epsilon) = +oo
  $

  То есть, данный интеграл сходится при $alpha >= 1$ и расходится при $alpha < 1$.
]

== Свойства несобственных интегралов

Рассмотрим $integral_a^b f(x) d x$, предполагая, что:
- $f(x)$ определена на $[a; b)$, где $a in RR$, $b in RR union {+oo}$;
- $f(x)$ интегрирумый по Риману на $[a; xi]$ при $forall xi in (a; b)$, а также
  $
    integral_a^b f(x) d x = lim_(xi -> b - 0) integral_a^xi f(x) d x quad b != +oo \
    integral_a^(+oo) f(x) d x = lim_(xi -> +oo) integral_a^xi f(x) d x quad b = +oo \
  $

#property(title: "Линейность")[
  Если $f(x)$ и $g(x)$ сходятся на $[a; b)$, то
  $
    forall lambda, mu in RR. quad integral_a^b (lambda f(x) + mu g(x)) d x = lambda integral_a^b f(x) d x + mu integral_a^b g(x) d x
  $
]

#property(title: "Формула Ньютона-Лейбница")[
  Если $f(x)$ непрерывна на $[a; +oo)$ и $F(x)$ --- первообразная $f(x)$, то $integral_a^b f(x) d x$ сходится тогда и только тогда, когда
  $
    lim_(xi->b) F(xi) = F(b - 0)
  $
  причем
  $
    integral_a^b f(x) d x = F(b - 0) - F(a) quad "(ф. Ньютона-Лейбница)"
  $
]

#property(title: "Аддитивность")[
  $
    integral_a^(+oo) f(x) d x = integral_a^c f(x) d x + integral_c^(+oo) f(x) d x
  $
]

#theorem(title: "Признак сравнения")[
  Пусть даны $f(x)$ и $g(x)$, непрерывные на $[a; b)$, причем $forall x in [a; b). space 0 <= f(x) <= g(x)$. Тогда:
  1. Из сходимости $integral_a^b g(x) d x$ следует сходимость $integral_a^b f(x) d x$
  2. Из расходимости $integral_a^b f(x) d x$ следует расходимость $integral_a^b g(x) d x$
]

#theorem(title: "Следствие")[
  Если $forall x in [a; b)$ выполняются $f(x) > 0$ и $g(x) > 0$, а также $f(x) ~ g(x)$ при $x -> b-0$, то $integral_a^b f(x) d x$ и $integral_a^b g(x) d x$ сходятся или расходятся одновременно.
]

Полезные интегралы:

+ $display( integral_a^(+oo) A/(x^alpha) d x quad A != 0 )$
  - сходится при $alpha > 1$
  - расходится при $alpha <= 1$

+ $display( integral_2^(+oo) (d x)/(x^alpha ln^beta x) )$
  - сходится при $alpha > 1$ или при $alpha = 1$ и $beta > 1$
  - расходится при остальных значениях $alpha, beta$

+ $display( integral_0^(1/2) (d x)/(x^alpha abs(ln x)^beta) )$
  - сходится при $alpha < 1$ или $alpha = 1$ и $beta > 1$
  - расходится при остальных значениях $alpha, beta$

+ $display( integral_0^(+oo) (ln(e^x - x)) / (x^alpha) d x )$
  - сходится при $2 < alpha < 3$
  - расходится при остальных значениях $alpha$

+ $display( integral_0^(+oo) ln(1 + x^alpha)/sqrt(x + sqrt(x)) d x )$
  - сходится при $alpha < -1/2$
  - расходится при $alpha >= -1/2$

#theorem(title: "Критерий коши сходимости несобственных интегралов")[
  Для сходимости $integral_a^b f(x) d x$ (при $b != +oo$) необходимо и достаточно, чтобы выполнялось условие Коши:

  $
    forall epsilon > 0. quad exists delta(epsilon) in (a, b). quad forall xi_1, xi_2 in (delta(epsilon), b). quad xi_1 < xi_2 ==> abs( integral_(xi_1)^(xi_2) f(x) d x ) < epsilon
  $
]

_Замечание_. Если условие Коши не выполняется, то $integral_a^b f(x) d x$ расходится.

= Лекция ??? (19.05.2026)

== Разложение в ряд Фурье функций произвольного периода

$ f(x), quad T = 2 pi, quad [-pi, pi] $


1. $display(S(x) = f(x))$

   $display(S(x) = a_0 / 2 + sum_(n=1)^(oo) (a_n cos(n x) + b_n sin(n x))) $

   $display(a_0 = 1/pi integral_(-pi)^(pi) f(x) dif x) $

   $display(a_n = 1/pi integral_(-pi)^(pi) f(x) cos(n x) dif x) $

   $display(b_n = 1/pi integral_(-pi)^(pi) f(x) sin(n x) dif x) $

2. $S(x) = 1/2 (f(x_0 - 0) + f(x_0 + 0))$, где $x_0$ — точка разрыва $1$-го рода.

3. $S(x) = 1/2 (f(-pi + 0) + f(pi - 0))$

Пусть $f(x)$ определена на $[-l; l]$ и $T = 2l$, т.е. $f(x+2l) = f(x)$, где $l > 0$ --- произвольное число. Функция $f(x)$ на $[-l; l]$ удовлетворяет условиям Дирихле.

Подстановка:

$ T = 2pi quad &==> quad T = 2l \
  y = (x pi)/l quad &==> quad x = (y l)/pi \
  y in [-pi; pi] quad &==> quad x in [-l; l] \
  phi(y) &==> f((y l)/pi) quad "при" space -pi <= y <= pi, quad -l <= x <= l $

$ phi(y) : quad phi(y + 2pi) = f(l/pi (y + 2pi)) = f((y l)/pi + 2l) = f((y l)/pi) = phi(y). $

Тогда ряд Фурье для $phi(y)$ на $[-l; l]$:

$ phi(y) &= a_0 / 2 + sum_(n=1)^(oo) ( a_n cos(n y) + b_n sin(n y) ) \
         &= replacement(y = (x pi)/l) = a_0 / 2 + sum_(n=1)^(oo) ( a_n cos((n pi)/l x) + b_n sin((n pi)/l x) ), $

т.е. $f(x)$ на $[-l; l]$ при $T = 2l$:

$ f(x) = a_0 / 2 + sum_(n=1)^(oo) ( a_n cos((n pi)/l x) + b_n sin((n pi)/l x) ), $

где коэффициенты определяются как:

$
a_n &= 1/pi integral_(-pi)^(pi) phi(y) cos(n y) dif y \
    &= replacement(y = (pi x)/l space, dif y = pi/l dif x space, y in [-pi; pi]; x = (y l)/pi, x in [-l; l]) = \
    &= 1/pi integral_(-l)^(l) phi((pi x)/l) cos((n pi x)/l) dot pi/l dif x = \
    &= 1/pi dot pi/l integral_(-l)^(l) f(x) cos((n pi x)/l) dif x \
    &= 1/l integral_(-l)^(l) f(x) cos((n pi x)/l) dif x, wide n = 0, 1, 2, ...
$

$ \
  b_n = 1/l integral_(-l)^(l) f(x) sin((n pi)/l x) dif x, wide n = 1, 2, 3 ...
$

Можно показать, что тригонометрическая система функций
$ lr({ 1, cos((k pi x)/l), sin((k pi x)/l) })_(k=1)^(+oo) $
ортогональна на $[-l; l]$, то есть любую интегрируемую функцию $f(x)$ можно представить тригонометрическим рядом Фурье.

Разложение функции в тригонометрический ряд Фурье с последующим анализом каждой гармоники называется _гармоническим анализом_.

#theorem(title: "Дирихле")[
  Пусть функция $f(x)$ определена и кусочно-непрерывна на $[-l; l]$. Тогда тригонометрический ряд Фурье этой функции сходится в каждой точке $x in [-l; l]$, и для суммы $S(x)$ верны равенства:

  1. $S(x) = f(x) space$ во всех точках непрерывности $f(x)$, где $x in (-l; l)$.

  2. $S(x_k) = 1/2 (f(x_k - 0) + f(x_k + 0)), space$ где $x_k$ --- точка разрыва $1$-го рода, $x_k in (-l; l)$.

  3. $S(-l) = S(l) = 1/2 (f(-l + 0) + f(l - 0))$.
]

_Замечание._ Если функция $f(x)$ определена на $RR$, является периодической с периодом $T = 2l$ и всюду кусочно-непрерывна, тогда тригонометрический ряд Фурье сходится везде, и для его суммы выполняются равенства:
1. $S(x_k) = f(x_k)$, если $x_k$ — точка непрерывности, $x_k in RR$.
2. $S(x_k) = 1/2 (f(x_k - 0) + f(x_k + 0))$, если $x_k$ --- точка разрыва функции $f(x)$, $x_k in RR$.

== Ряд Фурье для четных и нечетных функций

Если на $[-pi; pi]$ (или $[-l; l]$) разлагаемая в ряд Фурье функция $f(x)$ является четной или нечетной, то ряд Фурье этих функци неполный:

- Если $f(x)$ --- _четная_, то $b_n = 0$ (разложение по косинусам):

  $
    a_n = 1/pi integral_(0)^(pi) f(x) cos(n x) dif x,
    wide
    ( a_n = 1/l integral_(0)^(l) f(x) cos((n pi)/l x) dif x )
  $

  $ S(x) = a_0 / 2 + sum_(n=1)^(oo) a_n cos(n x)
    wide
    ( S(x) = a_0 / 2 + sum_(n=1)^(oo) a_n cos((n pi)/l x) )
  $

- Если $f(x)$ --- _нечетная_, то $a_n = 0$ (разложение по синусам):

  $
    b_n = 1/pi integral_(0)^(pi) f(x) sin(n x) dif x
    wide
    ( b_n = 1/l integral_(0)^(l) f(x) sin((n pi)/l x) dif x ) $

  $
    S(x) = sum_(n=1)^(oo) b_n sin(n x)
    wide
    ( S(x) = sum_(n=1)^(oo) b_n sin((n pi)/l x) )
  $

== Примеры. Разложение функции в ряд Фурье

=== Пример 1

$ f(x) = x, quad [-pi; pi] $

#figure(
  image("assets/fourier-ex1.png", width: 75%)
)

По теореме Дирихле:
$
  S(-pi) = S(pi) = 1/2 ( f(-pi + 0) + f(pi - 0) ) = 0
$

Так как $f(x) = x$ на $[-pi; pi]$ --- нечетная функция, ряд Фурье неполный и разложение только по синусам:


$
  b_n &= 1/pi integral_(-pi)^(pi) x sin(n x) dif x \
      &= replacement(u = x, dif u = dif x; dif v = sin(n x) dif x space, v = -1/n cos(n x) ) \
      &= 1/pi ( -x/n cos(n x) eval_(-pi)^(pi) + 1/n integral_(-pi)^(pi) cos(n x) dif x ) \
      &= -1/(pi n) ( pi cos(n pi) + pi cos(n pi) + 1/n^2 sin(n x) eval_(-pi)^(pi) ) \
      &= -(2pi)/(pi n) (-1)^n \
      &= (2(-1)^(n+1))/n
$

Итак,

$
  f(x) = sum_(n=1)^(oo) (2(-1)^(n+1))/n sin(n x) = 2 sum_(n=1)^(oo) ((-1)^(n+1))/n sin(n x)
$

=== Пример 2


$ f(x) = x^2, quad [-pi; pi] $

#figure(
  image("assets/fourier-ex2.png", width: 60%)
)

$f(x) = x^2$ --- четная функция на $[-pi; pi]$

$
  S(-pi) = S(pi) = 1/2 ( f(-pi + 0) + f(pi - 0) ) = pi^2
$

Ряд Фурье неполный, разложение по косинусам ($b_n = 0$).

$
a_n &= 1/pi integral_(-pi)^(pi) x^2 cos(n x) dif x \
    &= replacement(x^2 = u, dif u = 2x dif x; dif v = cos(n x) dif x space, v = 1/n sin(n x) ) \
    &= 1/pi ( (x^2)/n sin(n x) eval_(-pi)^(pi) - 2/n integral_(-pi)^(pi) x sin(n x) dif x ) \
    &= 1/pi ( (pi^2)/n sin(n pi) + (pi^2)/n sin(n pi) ) - 2/n ( (2(-1)^(n+1))/n ) \
    &= (-4(-1)^(n+1))/n^2 \
    &= ((-1)^n dot 4)/n^2
$

$ \
  a_0 = 1/pi integral_(-pi)^(pi) x^2 dif x = 1/pi dot (x^3)/3 eval_(-pi)^(pi) = 1/(3pi) ( pi^3 - (-pi)^3 ) = (2pi^3)/(3pi) = (2pi^2)/3
$

Итак,

$
  f(x) = pi^2 / 3 + sum_(n=1)^(oo) ((-1)^n dot 4)/n^2 cos(n x)
$

=== Пример 3

$ f(x) = cases(1"," quad -1 < x < 0, x"," quad 0 <= x < 1) $

$
  (-1; 1), quad l = 1, quad T = 2
$

#figure(
  image("assets/fourier-ex3.png", width: 60%)
)

$f(x)$ --- функция общего вида на $(-1; 1)$.

$
  a_0 = integral_(-1)^(0) 1 dif x + integral_(0)^(1) x dif x = x eval_(-1)^(0) + (x^2)/2 eval_0^1 = 1 + 1/2 = 3/2
$

$ a_n &= integral_(-1)^(0) cos(n pi x) dif x + integral_(0)^(1) x cos(n pi x) dif x \
      &= 1/(n pi) sin(n pi x) eval_(-1)^(0) + x/(n pi) sin(n pi x) eval_(0)^(1) - 1/(n pi) integral_(0)^(1) sin(n pi x) dif x = \
      &= 1/((n pi)^2) cos(n pi x) eval_(0)^(1) \
      &= 1/(n^2 pi^2) (cos(n pi) - cos(0)) \
      &= 1/(n^2 pi^2) ( (-1)^n - 1 ) \
      &= cases(0 quad &n = 2k, display(-2/(n^2 pi^2)) quad &n = 2k - 1) wide k = 1, 2, dots $

$
b_n &= integral_(-1)^(0) sin(n pi x) dif x + integral_(0)^(1) x sin(n pi x) dif x = \
    &= -1/(n pi) cos(n pi x) eval _(-1)^(0) + ( -x/(n pi) cos(n pi x) eval _(0)^(1) + 1/(n pi) integral_(0)^(1) cos(n pi x) dif x ) = \
    &= 1/(n pi) (1 - (-1)^n) + ( -1/(n pi) (-1)^n - 0 + 1/(n^2 pi^2) sin(n pi x) eval _(0)^(1) ) = \
    &= 1/(n pi) - ((-1)^n)/(n pi) - ((-1)^n)/(n pi) \
    &= 1/(n pi) quad "(проверить!!!)" $

Значения суммы ряда $S(x)$ в характерных точках:
- При $x = 0$ (точка разрыва):
  $ S(0) = 1/2 ( f(0 - 0) + f(0 + 0) ) = 1/2 (1 + 0) = 1/2 $

- При $x = plus.minus 1$ (границы интервала):
  $ S(-1) = S(1) = 1/2 ( f(-1 + 0) + f(1 - 0) ) = 1/2 (1 + 1) = 1 $

Итак,

$
  f(x) = 3/4 - 2/pi^2 sum_(n=1)^(oo) (cos((2n-1)pi x))/( (2n-1)^2 ) + 1/pi sum_(n=1)^(oo) (sin(n pi x))/n
$

При этом:

$
  S(0) = S(0 + n T) = replacement(T = 2) = 1/2 \
  S(-1) = S(1) = S(-1 + n T) = S(1 + n T) = 1
$
