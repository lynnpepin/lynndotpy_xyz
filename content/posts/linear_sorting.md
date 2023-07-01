+++
title = "You can sort in linear time!"
date = 2022-01-07

aliases = ["posts/linear_sorting.html"]

[taxonomies]
tags = ["post", "rust", "python", "project"]
+++

{{figure(
  src="/posts/images/countsort_graph.jpeg"
  alt="A log-scale graph showing the runtime (ns) of sorting N elements for different integer depths. They all show a trend towards linear runtime for large N.",
  position="center",
  style="width:70%",
  caption="A log-scale graph showing the linear runtime of count-sort"
)}}

> **TLDR:** Yes-- you can sort numbers in linear time. Yes, including floats! The proof that you can sort in $O(n \log n)$ time is still true, but that assumes you're sorting on the infinite set of real numbers (or integers.) We can sort in linear time because we work with finite sets: Floats and ints.  The algorithm is very simple, and is called counting sort (or bin sort or radix sort.)
> 
> See the [Python notebook](https://github.com/lynnpepin/rust_projects/blob/master/countsort/plot_stats.ipynb) wrapping an unoptimized [Rust countsort implementation](https://github.com/lynnpepin/rust_projects/tree/master/countsort): 

--

Is this truly $O(n)$? Yes!

 - Counting sort is not a randomized algorithm, it always outputs the correct solution.
 - Counting sort is not a parallelized algorithm. (And you can't use parallelism to speed past a worst-case big-O run time anyway!)
 - Counting sort is not an amortized algorithm. It is truly O(n), not 'expected' or 'amortized' O(n).
 - Counting sort is technically Θ(n), that is, the worst and best case running time is linear. 
 - This can be used in the real world.
 - However, it is not an in-place sorting algorithm.

<!-- more -->


# ok, how does counting sort work?

The idea of the algorithm is that you count how many times a number appears in a list.

1. Get input a list `L` of numbers from some finite set `K`.
2. Instantiate a dictionary `S` with zeros, with one element for each item in `K`.
3. For each item in `L`, increment the corresponding element in `S` by one.
4. Then, for each item `k in K`, output `k` a total of `L[k]` times each.

Here's a simple implementation in Python.

```python
set_of_numbers_to_sort = list(range(0, 256)) 
counted_numbers = {kk : 0 for kk in set_of_numbers_to_sort}

numbers_in = input("Enter values in [0, 255] separated by space:\n")
numbers_in = numbers_in.split(' ')
for number in numbers_in:
    counted_numbers[int(number)] += 1

for number in set_of_numbers_to_sort:
    for _ in range(counted_numbers[number]):
        print(number)
```

> Note: This example implementation uses a dict for clarity and generality, so it's technically not guaranteed Θ(k+n)!

# a real-world example of counting sort on integers

> **TLDR:** Imagine you have a 1-billion letter corpus. Here, n = 1000000000 and k=26. So, the O(n+k) counting-sort algorithm will be faster than the conventional O(n log n) sorting algorithms.

So, counting-sort can be used in the real world when you have to sort a very large list of values that belong to a relatively small set. This could be 8-bit or 16-bit floats or ints, or even smaller sets like the 26-character alphabet.

For this example, let's say you wanted to see the frequency of letters in a 1-billion-character English text. You can count each character to see how many of the 26 letters appear. This is equivalent to sorting.

1. Get an input `L` which is the 1-billion-character text, where `K = {A, B, C, ..., X, Y, Z}`.
2. Instantiate the dict `S = {A : 0, B : 0, C : 0, ..., Z : 0}`.
3. For each character in in `L`, increase the corresponding element in `S` by one.

    - E.g. For 'C', we get `S = {A : 0, B : 0, C : 1, ..., Z : 0}`.

    - E.g. And then if we get an A for the next, we get `S = {A : 1, B : 0, C : 1, ... }`.
4. And then print each element from S.

This algorithm is `O(|L| + |K|)`. This is also written as `O(n + k)`, where `k` is the size of the set we want to sort.

# tell me more about sorting

So far we assume you need to perfectly sort an arbitrary list of values. 

You can speed things up if:

1. You know something about the distribution of values, or
2. You know something about the application of the sort.

If you're sorting floats, but you know most of your values are NaN or 0.0, you can use counting-sort for NaN and 0.0, and use a traditional sort on the rest.

What if your sort doesn't need to be super accurate? Say, for a very niche case, you want to sort a histogram on the logarithm of some list of values. Then, you can sort your float64s on the 11-bit exponent, which means k = 2^11 = 2048, which means you can use counting-sort!

# okay so what's the take-away here

Well, I've only ever written sorting algorithms in job-interviews and university exams. I'm happy to say some of them were linear, and I'm very happy to say I've never had to performance-engineer things like this.

There is a small rift between the model of computing used in computer-science and the actual computers we use. The space between that rift is really cool, and leads to fun facts like "you can sort in linear time".

Remember to like, comment, and subscribe\* for more fun blog-posts, such as:

1. "Sorry Amdahl, but parallel computing DOES give you superlinear speedup"
2. "P and NP don't matter if you're not in aerospace because randomized algorithms are magic"
3. "Moore's Law isn't exponential, and it's not sigmoidal either. It's a distribution, I'm afraid we're nearing it's peak, and I'm frightened about the world beyond it: A Short Treatise on Why 640KB ought to be enough for anyone because you won't have a choice in 200 years"

---

\*This is a joke, I'm not actually writing these blogposts, and you can't like, comment, or subscribe.

