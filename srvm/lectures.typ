#import "@preview/theorion:0.4.1": *
#import cosmos.clouds: *
#show: show-theorion
#set-inherited-levels(0)

#set document(title: [Специальные разделы высшей математики. Лекции])
#set page(margin: 1cm, numbering: "1")
#set text(lang: "ru", size: 12pt)

#show math.equation.where(block: true): eq => {
  block(width: 100%, inset: 0pt, align(center, eq))
}

#let Eps = text(size: 18pt, $epsilon$)
#let pr = $"pr"$
#let ort = $"ort"$
#let vector(x) = $accent(#x, ->)$
#let lo(x) = $cal(#x)$
#let loA = $lo(A)$
#let loB = $lo(B)$

#title()
#outline()
#pagebreak()

= Лекция 1 (04.02.2026)

== Евклидовы пространства

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
    (lambda x, y) = (x, lambda y) = lambda (x, y), quad (x + z, y) = (x, y) + (z, y), quad (x, y + z) = (x, y) + (x, z)
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

== Евклидово нормированное пространство

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

  2.
    $
      norm(lambda x) = sqrt((lambda x, lambda x)) = sqrt(sum_(i = 1)^n lambda^2 x_i^2) = sqrt(lambda^2 sum_(i = 1)^n x_i^2) = abs(lambda) sqrt(sum_(i = 1)^n x_i^2) = abs(lambda) sqrt((x, x)) = abs(lambda) dot norm(x)
    $

  3.
    #[
      #let gb(it) = text(fill: green.darken(25%), it)
      #let rb(it) = text(fill: red.darken(25%), it)

      $
        norm(x + y)^2 &= (x + y, x + y) \
          &= (x, x) + 2(x + y) + (y, y) \
          &= norm(x)^2 + 2 rb((x, y)) + norm(y)^2 wide ("по Коши-Буянковского:" rb((x, y)) <= abs((x, y)) <= gb(norm(x) norm(y))) \
          &<= norm(x)^2 + 2 gb(norm(x) norm(y)) + norm(y)^2 \
          &= (norm(x) + norm(y))^2
      $

      Следовательно, $norm((x, y)) <= norm(x) + norm(y)$.
    ]
]

== Евклидовы пространства

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

== Угол между векторами. Ортогональность

По неравенству Коши-Буянковского:

$
  abs((x, y)) <= norm(x) dot norm(y) wide x, y in Eps
$

Отсюда:

$
  abs((x, y))/(norm(x) dot norm(y)) <= 1 wide abs(cos phi) <= 1 wide 0 <= cos phi <= 1, space phi in [0; pi]
$

#definition(title: "Ортогональные векторы")[
  Векторы $x$, $y$ --- _ортогональны_, если $phi = pi / 2$, то есть

  $
    (x, y) = 0
  $
]

== Ортогональные системы векторов

#definition(title: "Ортогональная система векторов")[
  Система $(a_1, a_2, ..., a_n) in Eps$ называется _ортогональной_, если все векторы попарно ортогональны:

  $
    (a_i, a_j) = 0, quad i != j
  $
]

#definition(title: "Ортонормированная система векторов")[
  Система векторов $(a_1, a_2, ..., a_n) in Eps$ называется _ортонормированной_, если она ортогональная и норма каждого вектора равна 1:

  $
    forall i in overline(1"," n). quad norm(a_i) = 1
  $
]

#theorem(title: "О линейной независимости ортогональной системы")[
  Ортогональная система ненулевых векторов линейно независима.
]

#proof[
  Пусть дана ортогональная система $vector(a_1), vector(a_2), ..., vector(a_k)$. Рассмотрим ее линейную комбинацию

  $
    vector(y) = lambda_1 vector(a_1) + lambda_2 vector(a_2) + ... + lambda_k vector(a_k) = vector(0).
  $

  Возьмем скалярное произведение двух частей равенства на вектор $vector(a_1)$:

  $
    (vector(a_1), vector(y)) &= (vector(a_1), space lambda_1 vector(a_1) + lambda_2 vector(a_2) + ... + lambda_k vector(a_k)) \
    &= (vector(a_1), lambda_1 vector(a_1)) + (vector(a_1), lambda_2 vector(a_2)) + ... + (vector(a_1), lambda_k vector(a_k)) \
    &= lambda_1 (vector(a_1), vector(a_1)) + lambda_2 (vector(a_1), vector(a_2)) + ... + lambda_k (vector(a_1), vector(a_k)) \.
  $

  Рассмотрим первое слагаемое. Поскольку система ортогональная, то

  $
    lambda_1 (vector(a_1), vector(a_1)) = 0.
  $

  Произведение $(vector(a_1), vector(a_1))$ не может быть равно нулю, так как по свойству скалярного произведения следовало бы $vector(a_1) = vector(0)$, что противоречит формулировке теоремы. Значит, $lambda_1 = 0$.

  Аналогично переберем все векторы и получим, что все $lambda_i$ равны нулю.
]

= Лекция 2 (11.02.2026)

== Ортогональные системы векторов. Матрица Грама

#theorem(title: "Пифагора, обобщенная")[
  Для любой ортогональной системы $a_1, a_2, ..., a_k$ выполняется

  $
    norm(sum_(i = 1)^k a_i)^2 = sum_(i = 1)^k norm(a_i)^2
  $
]

#proof[
  $
    norm(sum_(i = 1)^k a_i)^2 &= sum_(i = 1)^k (a_i, a_i) \
    &= (a_1 + a_2 + ... + a_k, space a_1 + a_2, ..., a_k) \
    &= (a_1, a_1) + (a_1, a_2) + ... + (a_1, a_k) + "ну крч все комбинации" \
    &wide "/ну крч все" (a_i, a_j) "равны нулю тк ортогональн/" \
    &= norm(a_1)^2 + norm(a_2)^2 + ... + norm(a_k)^2 \
    &= sum_(i = 1)^k norm(a_i)^2
  $
]

#theorem(title: "Обобщенная формула скалярного произведения")[
  Пусть дано:
  - Линейно независимая система $S = (l_1, l_2, ... l_n) in Eps^n$
  - $x = x_1 l_1 + x_2 l_2 + ... + x_n l_n$
  - $y = y_1 l_1 + y_2 l_2 + ... + y_n l_n$

  Тогда:

  $
    (x, y) = sum_(i = 1)^n sum_(j = 1)^n x_i y_j (l_i, l_j)
  $
]

#proof[
  todo
]

#definition(title: "Матрица Грама")[
  _Матрицей Грама_ системы веткоров $S = (l_1, l_2, ..., l_n)$ называется матрица $G_S$ размера $k times k$, элементы которой являются скалярным произведением векторов системы:

  $
    G_S = mat(
      (l_1, l_1), (l_1, l_2), ..., (l_1, l_n); 
      (l_2, l_1), (l_2, l_2), ..., (l_2, l_n);
      dots.v, dots.v, dots.down, dots.v;
      (l_n, l_1), (l_n, l_2), ..., (l_n, l_n);
    )
  $
]

#property(title: "Свойства матрицы Грама")[
  + Симметричность: $G = G^T$
  + Положительная определенность всех главных угловых миноров:
    $
      abs((l_1, l_1)) >= 0, quad mat(delim: "|", (l_1, l_1), (l_1, l_2); (l_2, l_1), (l_2, l_2)) >= 0
    $
  + Если $S$ линейно независимая, то $det G_S != 0$
  + Если $S$ ортогональная, то $G_S$ --- диагональная
  + Если $S$ ортонормированная, то $G_S = E$
    - $(x, y) =$ todo
]

#theorem[
  todo крч пусть даны две лком по базису ну тогда
  $
    (x, y) = X^T G_S Y
  $

  где X, Y todo
]

#theorem[
  Любую линейно независимую систему векторов евклидового пространства можно ортогонализовать.
]

#proof[
  Конструктивный процесс ортогонализации Грама-Шмидта.

  впадлу
]

== QR-разложение $A_n$

1. Считая каждый столбец $A_n$ вектором $a_i$, необходимо ортогонализировать систему векторов с последующим нормированием, получить матрицу $Q_n$, где каждый вектор-столбец ортонормирован
2. $A = Q R$, где $R$ --- матрица проекций, получавшихся в процессе ортогонализации (верхнетреуголоьная):
  $
    cases(
      R = Q^(-1) A,
      Q^T = Q^(-1)
    ) wide==>wide R = Q^T A
  $

== Ортогональное дополнение

Пусть даны $x, (a_1, a_2, ..., a_n) in Eps^n$ такие, что $x perp (a_1, a_2, ..., a_k)$. Отсюда:
$
&x perp (a_1, a_2, ..., a_k) \
&quad ==> x perp sum_(i = 1)^n lambda_i a_i \
&quad ==> x perp L(a_1, a_2, ..., a_k) \
&quad ==> x perp "подпространству" Eps^n \
$

Проверим:

$
  (x, sum_(i = 1)^n lambda_i a_i) = sum_(i = 1)^n lambda_i (x, a_i) = 0 wide square
$

#definition(title: "Ортогональное дополнение")[
  Множество векторов

  $
    L^perp = {x in Eps^n | forall a in L : (x, a) = 0}
  $

  называется _ортогональным дополнением_ к подпространству $L subset Eps$
]

#property(title: [Свойства $L^perp$])[
  1. $L^perp subset Eps^n$
  2. $Eps = L xor L^perp$
  3. $dim Eps = dim L + dim L^perp$
  4. $(L^perp)^perp$
]

#proof[
  (Пункты 2-3, остальные самостоятельно).

  Рассмотрим $L subset Eps$. Пусть $S = {l_1, l_2, ..., l_k}$ --- ортонормированный базис $L$ (он существует, так как можно ортонормировать).

  Дополним $S$ до ортонормированного базиса $Eps^n$:

  $
    S_Eps = {underbrace(l_1"," l_2"," ..."," l_k, L)"," underbrace(l_(k+1)"," l_(k+2)"," ..."," l_(n), L_1)}
  $

  Пусть $x in Eps^n$:
  $
    x = sum_(i = 1)^n x_i l_i = underbrace(sum_(i=1)^k x_i l_i, in L \ dim L = k) + underbrace(sum_(i = k + 1)^n x_i l_i, in L_1 subset Eps^n \ dim L_1 = n - k)
  $

  Подпространство $L_1$ совпадает с ортогональным дополнением $L^perp$, т.к. векторы $l_(k + 1), ..., l_n$ ортогональны всем векторам из $L$, следовательно, эти векторы ортогональны подпространству $L$, то есть принадлежат $L^perp$. Так как $L^perp$ --- подпространство по свойству (1), то $L_1 subset L^perp$.

  Обратно. Покажем, что $L^perp subset L_1$. Выберем $y in Eps^m$, $y = sum_(i=1)^n y_i l_i$. Пусть $y in L^perp$, то есть $y perp {l_1, ..., l_k}$, то есть $y perp L$.

  $
    (y, l_1) = 0 wide (sum_(i = 1)^k y_i l_i + sum_(i = k + 1)^n y_i l_i, space l_1) = 0 wide y_1 (l_1, l_1) + 0 = 0 wide y_1 = 0 \
    (y, l_2) = 0 wide (sum_(i = 1)^k y_i l_i + sum_(i = k + 1)^n y_i l_i, space l_2) = 0 wide y_2 (l_2, l_2) + 0 = 0 wide y_2 = 0 \
    \
    ... \
    \
    (y, l_n) = 0 wide (sum_(i = 1)^k y_i l_i + sum_(i = k + 1)^n y_i l_i, space l_n) = 0 wide y_n (l_n, l_n) + 0 = 0 wide y_n = 0 \
  $

  Итак,

  $
    cases(
      y = sum_(i = k + 1)^n y_i l_i = y_(n + 1) l_(k + 1) + ... + y_n l_n,
      y_1"," y_2"," ..."," y_n = 0
    ) quad==>quad y in L^(perp)
  $

  Наконец,

  $
    cases(
      L_1 subset L^perp,
      L^perp subset L_1,
    ) quad==>quad L^perp = L_1
  $

  Таким образом, $Eps^n = L xor L^perp$.

  Если $L = k$, а $L^perp = n = k$, то $dim Eps^n = k + n - k = n$.
]

= Лекция 3 (18.02.2026)

== Ортогональная проекция, ортогональная составляющая

Рассмотрим $L$ и $L^perp$, $L xor L^perp = Eps^n$

#definition(title: "Коэффициенты Фурье")[
  Пусть дано:
  - Ортонормированная система $S = {a_1, a_2, ..., a_k} subset Eps^n$
  - $b in Eps^n$

  Тогда $(b, a_1)$, $(b, a_2)$, ..., $(b, a_n)$ называются _коэффициентами Фурье_ вектора $b$ относительно $S$.
]

#definition(title: "Ортогональная проекция на подпространство")[
  Ортогональной проекцией вектора $b$ на подпространство $L$ называют вектор-проекцию, ортогональную дополнению $L^perp$.

  - $b_1 = pr_L b$ --- ортогональная проекция $b$ на $L$
  - $b_2 = ort_L b$ --- ортогональная составляющая к $L$

  $
    b = b_1 + b_2, quad b_1 in L, quad b_2 in L^perp
  $
]

#theorem[
  Пусть дано:
  - $(l_1, l_2, ..., l_k)$ --- ортонормированный базис подпространства $L$
  - $a$ --- произвольный вектор $Eps^n$

  Тогда координаты $pr_L a$ в этом базисе являются коэффициентами Фурье вектора $a$ относительно $(l_1, l_2, ..., l_k)$, то есть

  $
    pr_L a = sum
  $
]

= Лекция 4 (25.02.2026)

== Линейный оператор

#definition(title: "Оператор")[
  _Оператором_ называется отображение, действующее из одного линейного пространства в другое или внутри одного пространства.

  Обозначения:
  - $cal(A), cal(B), cal(C)...$ --- оператор
  - $A, B, C, ...$ --- матрица оператора
  - $loA(x) eq.triple loA x$
]

#definition(title: "Линейный оператор")[
  Пусть $V$ и $W$ --- линейное пространство над полем $F$. Отображение $cal(A) : V -> W$ называется _линейным оператором_, если

  $
    forall x, y in V. quad forall alpha in F. quad
    cases(
      loA(x + y) = loA(x) + loA(y) wide &"(аддитивность)",
      loA(lambda dot x) = lambda dot loA(x) wide &"(однородность)"
    )
  $

  Если $V = W$, то есть $loA : V -> V$, то $loA$ называется _линейным преобразованием_ в пространстве $V$.

  Два оператора $loA$ и $loB$ совпадают, если
  $
    forall x in V. quad loA x = loB x
  $
]

#example[
  1. Нулевой оператор:
    $
      lo(O) : V -> V wide lo(O)(x) = vector(0)
    $
  2. Тождественный оператор:
    $
      lo(I) : V -> V wide lo(I)(x) = x
    $
  3. Пусть $V = L_1 xor L_2$. Оператор проектирования (проектор):
    $
      lo(P)_(L_1)^(parallel L_2) : V -> L_1 wide
      lo(P)_(L_2)^(parallel L_1) : V -> L_2
    $
  4. Оператор дифференцирования:
    $
      lo(D) : P[x]_n -> P[x]_n wide lo(D)(1) = 0 quad lo(D)(x) = 1 quad lo(D)(x^2) = 2x quad ...
    $
  5. Оператор интегрирования:
    $
      lo(P) : C[a; b] -> RR wide lo(P)(f) = integral_b^a f(x) d x
    $
  6. Оператор вида $loA(B) = A dot B$, где $A, B in M_n$
  7. Оператор поворота
]

== Матрица линейного оператора

Пусть дано:
- Линейное пространство $V$, $dim V = n$ ${e_i}^n_(i=1)$ --- базис
- Линейное пространство $W$, $dim W = m$ ${u_i}^m_(i=1)$ --- базис
- Линейный оператор $loA : V -> W$

Воздействуем $loA$ на базис $V$:

$
  loA e_1 = alpha_(1 1) u_1 + alpha_(1 2) u_2 + ... + alpha_(1 m) u_m \
  loA e_2 = alpha_(2 1) u_1 + alpha_(2 2) u_2 + ... + alpha_(2 m) u_m \
  ... \
  loA e_n = alpha_(n 1) u_1 + alpha_(n 2) u_2 + ... + alpha_(n m) u_m \
$

Выделим коэффициенты $alpha_(i j)$ в матрицу:

$
  A = mat(
    alpha_(1 1), alpha_(1 2), ..., alpha_(1 n);
    alpha_(2 1), alpha_(2 2), ..., alpha_(2 n);
    dots.v, dots.v, dots.down, dots.v;
    alpha_(m 1), alpha_(m 2), ..., alpha_(m n);
  )_(m times n)
$

#definition(title: "Матрица линейного оператора")[
  _Матрицей линейного оператора $loA$_ в базисах $e$ и $u$ называется матрица $A_e^u = (alpha_(i j)) in F_(m times n)$, столбцы которой являются координатами образов базисных векторов $loA e_j$ в базисе $u$:

  $
    loA e_j = sum_(i = 1)^m a_(i j) u_i wide j = overline(1"," n)
  $
]

#example[
  Оператор проектирования:

  $
    lo(P)_(O x y)^(parallel O z) : RR^3 -> RR^2 wide A_lo(P) = mat(1, 0, 0; 0, 1, 0; 0, 0, 0)
  $
]

#property(title: "Свойства матрицы линейного оператора")[
  Пусть дано:
  1. $(loA x)_e = A_e x$
  2. Матрица единичного (нулевого) оператора является единичной (нулевой)
  3. Матрица суммы операторов равна сумме операторов: $(A + B)_e = A_e + B_e$
  4. $(alpha A)_e = alpha dot A_e$
  5. $(A dot B)_e = A_e dot B_e$
  6. todo
  7. todo
]

#theorem[
  Задание линейного оператора равносильно заданию его матрицы в фиксированной паре базисов.
]
