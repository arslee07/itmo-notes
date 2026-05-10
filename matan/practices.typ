// TODO:
// - всякий стафф с неопределенными интегралами (по частям и всякое такое)
// - еще всякого с определенными интегралами
// - интегралы с первой ргр
// - ну еще что мы там на практике писали
// - желательно наверно парочку примеров на каждую шнягу дописать

#import "../template.typ": *
#show: template.with([Математический анализ. Конспект из практик])

#let int = $integral$
#let arctg = math.op("arctg")
#let sh = math.op("sh")
#let ch = math.op("ch")
#let th = math.op("th")
#let cth = math.op("cth")

#let force-display(it) = {
  if it.body.fields().at("size", default: none) != "display" {
    return math.display(it)
  }
  it
}

= Интегралы элементарных функций

#[
  #show math.equation: force-display

  + $int (a x + b)^n space d x = 1/a dot ((a x + b)^(n+1))/(n + 1) + C$

  + $int e^(a x + b) space d x = 1/a dot e^(a x + b) + C$
  + $int a^(k x + b) space d x = 1/k dot a^(k x + b)/(ln a) + C$
  + $int cos(a x + b) space d x = 1/a dot sin(a x + b) + C$
  + $int sin(a x + b) space d x = -1/a dot cos(a x + b) + C$
  + $int (d x)/(a x + b) = 1/a dot ln abs(a x + b) + C$
  + $int (d x)/(cos^2(a x + b)) = 1/a dot tg(a x + b) + C$
  + $int (d x)/(sin^2 (a x + b)) = -1/a dot ctg(a x + b) + C$
  + $int (d x)/(sqrt(1 - (a x + b)^2)) = 1/a dot arcsin(a x + b) + C$
  + $int (d x)/(1 + (a x + b)^2) = 1/a dot arctg(a x + b) + C$
  + $int sh(a x + b) space d x = 1/a dot ch(a x + b) + C$
  + $int ch(a x + b) space d x = 1/a dot sh(a x + b) + C$
  + $int (d x)/(ch^2 (a x + b)) = 1 / a dot th(a x + b) + C$
  + $int (d x)/(sh^2 (a x + b)) = -1 / a dot cth(a x + b) + C$
  + $int (d x)/sqrt(a^2 - x^2) = arcsin x/a + C$
  + $int (d x)/(a^2 + x^2) = 1/a dot arctg x/a + C$
  + $int (d x)/(x^2 - a^2) = 1/(2 a) dot ln abs((x - a)/(x + a)) + C$
  + $int (d x)/sqrt(x^2 plus.minus a^2) = ln abs(x + sqrt(x^2 plus.minus a^2)) + C$
  + $int (x d x)/(x^2 plus.minus a^2) = 1/2 ln abs(x^2 plus.minus a^2) + C$
  + $int (x d x)/sqrt(a^2 plus.minus x^2) = plus.minus sqrt(a^2 plus.minus x^2) + C$
  + $int sqrt(a^2 - x^2) space d x = x/2 sqrt(a^2 - x^2) + a^2/2 arcsin x/a + C$
  + $int sqrt(a^2 + x^2) space d x = x/2 sqrt(a^2 + x^2) + a^2/2 ln abs(sqrt(x^2 + a^2) + x) + C$
  + $int tg x space d x = -ln abs(cos x) + C$
  + $int ctg x space d x = ln abs(sin x) + C$
  + $int arctg x space d x = x arctg x - 1/2 ln abs(x^2 + 1) + C$
  + $int arcsin x space d x = x arcsin x + sqrt(1 - x^2) + C$
  + $int ln x space d x = x ln x - x + C$
  + $int 1/(sin x) space d x = ln abs(tg x/2) + C$
  + $int 1/(cos x) space d x = ln abs(tg(x/2 + pi/4)) + C$
]

= Специальные функции

== Гамма-функция

Определение:
$
  Gamma (s) = integral_0^oo e^(-t) s^(s-1) space d t
$

Для $1 < s < 2$ есть таблица приближенных значений. Задача --- по крайней мере свести $Gamma (s)$ к этому диапазону аргументов.

Свойства $Gamma (s)$:

+ $Gamma(s + 1) = s Gamma(s)$. Полезно для понижения аргумента (при $s > 2$).

+ $Gamma(s) = display(Gamma(s + 1) / s)$. Полезно для повышения аргумента (при $s < 1$).

+ $Gamma(1) = Gamma(2) = 1, quad Gamma(n + 1) = n!, quad Gamma(n) = (n - 1)!$

+ $Gamma(1/2) = sqrt(pi)$

+ $Gamma(n + 1/2) = display((2n)!/(n! space 2^(2 n))) space Gamma(1/2)$

+ $Gamma(s) Gamma(1 - s) = display(pi/(sin(pi s)))$

// TODO: пара примеров

== Бета-функция

Ее определение на данный момент не очень интересно, но интересны ее свойства:

+ $Beta(p, q) = display((Gamma(p) Gamma(q)) / Gamma(p + q))$

+ $Beta(p, q) = integral_0^1 x^(p - 1) (1-x)^(q - 1) space d x$

+ $Beta(p, q) = display(2 integral_0^(pi\/2) (sin phi)^(2 p - 1) (cos phi)^(2 q - 1)) space d phi$

// TODO: примеры для триги и вот этого а-ля чебышева

== Свертка функций

Пусть даны $f_1(t)$ и $f_2(t)$. Их _свертка_:

$
  f_1(t) compose f_2(t) = integral_0^t f_1(s) f_2(t - s) space d s = integral_0^t f_1(t - s) f_2(s) space d s
$

// TODO: пример

= Признаки сходимости числовых рядов

+ Необходимое условие сходимости ряда:

  $
    sum_(n = 0)^oo a_n "сх." space ==> space lim_(n -> oo) a_n = 0
  $

  Условие не работает в обратную сторону. Если $lim_(n->oo) a_n = 0$, то не факт, что ряд сходится.

  Полезное следствие:

  $
    lim_(n->oo) a_n != 0 space ==> space sum_(n = 0)^oo a_n "расх."
  $

2. Признак Даламбера:

  $
    lim_(n -> oo) a_(n + 1)/a_n = q, quad
    cases(
      q < 1 quad => quad "сх.",
      q = 1 quad => quad "неизвестно",
      q > 1 quad => quad "расх."
    )
  $

3. Радикальный признак Коши:

  $
    lim_(n -> oo) root(n, a_n) = q, quad
    cases(
      q < 1 quad => quad "сх.",
      q = 1 quad => quad "неизвестно",
      q > 1 quad => quad "расх."
    )
  $

4. Интегральный признак Коши:

  Создаем $f(x)$ такую, что $a_n = f(n)$ и $f'(x) < 0$.

  $
    integral_1^oo f(x) space d x "сх." quad ==> quad sum_(n = 0)^oo a_n "сх."
  $

5. Признак сравнения:

  Пусть есть два числовых ряда с общими членами $a_n$ и $b_n$.

  $
    cases(
      display(lim_(n -> oo) a_n / b_n = A),
      A != 0,
      A != oo
    )  
    quad ==> quad
    sum_(n = 0)^oo a_n "и" sum_(n = 0)^oo b_n "сх. или расх. одновременно"
  $

  Пусть $b_n = display(1 / n^p)$ (гармонический ряд). Тогда:

  $
    cases(
      a_n >= b_n,
      display(sum_(n = 0)^oo b_n) "сх."
    )
    quad ==> quad
    display(sum_(n = 0)^oo a_n) "сх."

    #h(3em)

    cases(
      a_n >= b_n,
      display(sum_(n = 0)^oo b_n) "расх."
    )
    quad ==> quad
    display(sum_(n = 0)^oo a_n) "расх."
  $

= Сходимость знакочередующихся числовых рядов

Пусть дан ряд $sum_(n = 0)^oo (-1)^n a_n$. Для этого проверим признак Лейбница:
$
  cases(
    display(lim_(n -> oo) a_n = 0),
    abs(a_n) > abs(a_(n + 1)) > ...
  )
$

- Если это условие не выполняется, то ряд расходится.
- Если условие выполняется, то, проверяем ряд $sum_(n = 0)^oo abs(a_n)$ на сходимость.
  - Если этот ряд сходится, то исходный ряд сходится абсолютно.
  - Если этот ряд расходится, то исходный ряд сходится условно.

Можно пойти другим путем. Для этого проверим $sum_(n = 0)^oo abs(a_n)$ на сходимость.
- Если сходится, то исходный ряд сходится абсолютно.
- Если расходится, то проверяем признак Лейбница.
  - Если условие выполняется, то исходный ряд сходится условно.
  - Если не выполняется, то расходится.

// TODO пример

= Сходимость степенных рядов

Пусть дан степенной ряд с общим членом $c_n$. Найдем его центр $a$ и радиус $R$ сходимости. По обобщенному признаку Даламбера:

$
  lim_(n -> oo) abs(c_(n + 1) / c_n) = abs(x - a) / R.
$

Отсюда:

$
  abs(x - a) < R, quad -R < x - a < R, quad underline(-R + a < x < R + a)
$

Отдельно исследуем точки $-R + a$ и $R + a$ и включим в диапазон, если ряд в них сходится (в т.ч. условно).

// TODO: primer

= Элементарные ряды Маклорена

#[
  #show math.equation: force-display
  
  + $e^x = sum_(n = 0)^oo x^n/n!, quad x in (-oo, +oo)$

  + $cos x = sum_(n = 0)^oo (-1)^n x^(2 n)/(2 n)!, quad x in (-oo; +oo)$
  + $sin x = sum_(n = 0)^oo (-1)^n x^(2 n + 1)/(2 n + !)!, quad x in (-oo; +oo)$
  + $(1 + x)^m = 1 + sum_(n = 1)^oo (m(m - 1)...(m-n+1))/n! x^n, quad x in (-1; 1)$
  + $1/(1+x) = sum_(n=0)^00 (-1)^n x^n, quad x in (-1; 1)$
  + $ln(1 + x) = sum_(n = 1)^oo (-1)^(n-1) x^n/n$
]
