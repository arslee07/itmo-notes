#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3": plot, chart
#import "@preview/theorion:0.4.1": *
#import cosmos.clouds: *

#show: show-theorion

#let Eps = text(size: 20pt, $epsilon$)
#let vector(x) = $accent(#x, ->)$

#set page(margin: 1cm, numbering: "1")
#set text(lang: "ru", size: 14pt)

= Евклидовы пространства

#definition(title: "Метрическое пространство")[
  _Метрическое пространство_ --- множество $M$, на котором задана функция $rho : M times M -> RR$, удовлетворяющая свойствам:

  1. Положительная определенность:

  $
    rho (x, y) >= 0 \ quad rho(x, y) = 0 <==> x = y
  $

  2. Симметричность:

  $
    rho(x, y) = rho(y, x)
  $

  3. Неравенство треугольника:

  $
    rho(x, z) <= rho(x, y) + rho(y, z)
  $
]

#example[
  1. $x in RR : quad rho(x, y) = abs(x - y)$

  2. $x, y in RR^n : quad rho(x, y) = sqrt(sum_(i=1)^n (x_i - y_i)^2)$

  3. Пусть дано:
    - $C_[a; b]$ -- множество определенных и непрерывных на $[a; b]$ функций,
    - $f(t), g(t) in C_[a; b], space t in [a; b]$.

    Тогда $rho(f, g) = max_(t in [a, b]) abs(f(t) - g(t))$.
]

#definition(title: "Нормированное пространство")[
  _Нормированное пространство_ --- линейное пространство $V$, в котором задано отображение $norm(x) : V -> RR$ --- _норма_, удовлетворяющее свойствам:

  1. Положительная определенность:

  $
    forall x in V. quad norm(x) >= 0 \
    forall x in V. quad norm(x) = 0 <==> x = 0
  $

  2. Линейность:

  $
    forall x in V. quad forall lambda in RR. quad norm(lambda x) = abs(lambda) dot norm(lambda x)
  $

  3. Неравенство треугольника:

  $
    forall x, y in V. quad norm(x + y) <= norm(x) + norm(y)
  $
]

#example[
  1. $x in RR^n, quad norm(x)_p = root(p, sum_(i = 1)^n abs(x_i)^p)$

  2. $x in RR^n, quad norm(x)_max = max_(i = overline(1"," n)) (abs(x_i))$
]

#definition(title: "Скалярное произведение")[
  _Скалярное произведение_ --- функция, определенная на вещественном линейном пространстве $V$ вида $(x, y) : V times V -> RR$, удовлетворяющая свойствам:

  1. Симметричность:

  $
    (x, y) = (y, x)
  $

  2. Билинейность:

  $
    (lambda x, y) = (x, lambda y) = lambda (x, y)
  $

  3. Положительная определенность:

  $
    (x, x) >= 0, space (x, x) = 0 <==> x = 0
  $
]

#definition(title: "Евклидово пространство")[
  Линейное пространство $V$, на котором определено скалярное произведение, называется _евклидовым пространством_ и обозначается $Eps$ _(как маленькая епсилон, но как бы большая)_.

  $
    dim Eps = dim V
  $
]

#example[
  1. $V = RR^n : quad (x, y) = abs(x) dot abs(y) dot cos angle(x, y)$

  2. $V = RR^n : quad (x, y) = sum_(i = 1)^n = x_i y_i$

  3. $C_[a; b] : quad (f, g) = integral_a^b f(t) g(t) d t$
]

#definition(title: "Эрмитово пространство")[
  _Эрмитово пространство_ --- линейное пространство $V$ на множестве $CC$ со скалярным произведением $(x, y) : V times V -> CC$, удовлетворяющее свойствам:

  1. Полуторалинейность:
  $
    forall x, y in V. quad forall z in CC. quad (z x, y) = z (x, y) = (x, overline(z) y)
  $
  2. Эрмитова симметричность:
  $
    forall x, y in V. quad (x, y) = overline((y, x))
  $
  3. Положительная определенность:
  $
    forall x in V without {0}. quad (x, x) > 0
  $
]

#theorem(title: "Неравенство Коши-Буянковского")[
  $
    forall x, y in Eps. quad abs((x, y)) <= sqrt((x, x)) dot sqrt((y, y))
  $

  Причем равенство достигается тогда и только тогда, когда векторы $x$ и $y$ линейно зависимы.
]

#proof[
  Рассмотрим два случая.

  1. *$y = vector(0)$*.
  $
    (x, vector(0)) = (x, 0 dot vector(0)) = 0 dot (x, vector(0)) = 0
  $

  2. *$y != vector(0)$*.

    Пусть $f(t) = (x + t y, x + t y), space t in RR$.

    Преобразуем $f$:
    $
      f(t) &= (x, x) + t(x, y) + t(y, x) + (y, y) \
           &= t^2 (y, y) + 2 t (x, y) + (x, x) \
           &>= 0 quad ("по определению")
    $

    Рассмотрим ее дискриминант:

    $
      &D/4 = (x, y)^2 - (x, x) (y, y) <= 0 \
      &wide ==> (x, y)^2 <= (x, x) dot (y, y) \
      &wide ==> abs((x, y)) <= sqrt((x, x)) sqrt((y, y)) \
    $

    Теперь покажем линейную зависимость.

    $
      cases(
        D / 4 <= 0,
        f(t) >= 0
      ) quad ==> quad t_0 - "единственный корень для" f(t) = 0
    $

    Рассмотрим уравнение $f(t) = 0$:

    $
      f(t) = 0 quad<==>quad (x + t_0 y, x + t_0 y) = 0 quad<==>quad x + t_0 y = 0 quad<==>quad x = - t_0 y
    $

    Из последнего перехода следует, что $x$ и $y$ линейно зависимы.
]

= Евклидово нормированное пространство

#definition(title: "Норма евклидового пространства")[
  Пусть $Eps$ --- евклидово пространство. _Нормой_ (длиной) вектора $x in Eps$ называется число
  $
    norm(x) = sqrt((x, x)), quad norm(x) = sqrt(sum_(i = 1)^n x_i^2), quad x in RR^n
  $
]

#property(title: "Свойства нормы")[
  1. $norm(x) >= 0, quad norm(x) = 0 <==> x = 0$
  2. $norm(lambda x) = abs(lambda) dot norm(x)$
  3. $norm(x + y) <= norm(x) + norm(y)$
]

#proof[
  1. По определению.

  2. $(lambda x, lambda x) = sum_(i = 1)^n lambda^2 (x_i, x_i) = lambda^2 sum_(i = 1)^n x_i^2$ \

    $norm(lambda x) = sqrt(lambda^2 sum_(i = 1)^n) x_i^2 = abs(lambda) sqrt(sum_(i = 1)^n x_i^2) = abs(lambda) norm(x)$

  3. *TODO* дописать
]

= Евклидовы пространства

#definition[
  1. Стандартная/евклидова/шаровая/сферическая норма:

  $
    norm(x)_Eps = norm(x)_2 = sqrt(sum_(i = 1)^n x_i^2)
  $

  2. Окаэдрическая/манхэттенская норма:
  $
    norm(x)_1 = sum_(i = 1)^n abs(x_i)
  $

  Если $norm(x)_1 <= 1$ при $x in RR^3$, то ГМТ --- октаэдр:

  #align(center)[
    #image("assets/octaedr.png", width: 60%)
  ]

  3. Кубическая/чебышевская норма:

  $
    norm(x)_oo = max_(i = overline(1"," n)) (abs(x_i))
  $

  4. $C_[a; b], quad norm(f) = sqrt(integral_a^b f^2(t) d t)$

  5. Норма матриц --- неотрицательное число, характеризующее "размер" или "величину" матрицы. Норма матрицы удовлетворяет всем свойствам нормы. Различные виды представлены в определениях ниже.
]

#definition(title: "Операторные нормы матриц")[
  - Столбцовая норма:
  $
    norm(A)_1 = max_(i = overline(1"," n)) sum_(j = 1)^m abs(a_(i j))
  $
  - Строчная норма:
  $
    norm(A)_oo = max_(j = overline(1"," m)) sum_(i = 1)^n abs(a_(i j))
  $
  - Спектральная норма (для квадратной матрицы):
  $
    norm(A)_2 = sqrt(lambda_max (A^T dot A))
  $
  где $lambda_max$ --- максимальное собственное значение матрицы $A^T dot  A$
]

#definition(title: "Неоператорные нормы матриц")[
  Норма Фробениуса (для квадратной матрицы):
  $
    norm(A)_F = sqrt(sum_(i, j = 1)^n a_(i j)^2) = sqrt(tr(A^T dot A))
  $
]

= Угол между векторами. Ортогональность

По неравенству Коши-Буянковского:

$
  abs((x, y)) <= norm(x) dot norm(y) wide x, y in Eps
$

Отсюда:

*TODO* дописать

= Ортогональные системы векторов

*TODO* дописать

#theorem(title: "О линейной независимости ортогональной системы")[
  Ортогональная система ненулевых векторов линейно независима.
]

#proof[
  От противного. Пусть дана ортогональная система $vector(a_1), vector(a_2), ..., vector(a_n)$. Тогда, в линейной комбинации вида

  $
    c_1 vector(a_1) + c_2 vector(a_2) + ... + c_n vector(a_n) = vector(0)
  $

  есть хотя бы один ненулевой коэффициент $c_i$.

  Умножим данное равенство на $vector(a_1)$:

  $
    c_1 vector(a_1) vector(a_1) + c_2 vector(a_1) vector(a_2) + ... + c_n vector(a_1) vector(a_n) = vector(0).
  $

  Поскольку система ортогональная, то

  $
    c_1 vector(a_1) vector(a_1) = 0.
  $

  Следовательно, $c_1 = 0$.

  Если исходную линейную комбинацию умножать на любой другой $vector(a_i)$, то получим $c_i = 0$. То есть, все коэффициенты равны нулю. Значит, система линейно независима. Противоречие.
]

