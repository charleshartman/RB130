#### exercise4.md

Explain how & works in a method invocation:

```ruby
[1, 2, 3, 4, 5].map(&:to_s)
```

When `&` is prepended to the argument name in a method invocation, Ruby expects a `Proc` object, which it will then convert to a block. If the argument is not already a `Proc`, Ruby will attempt to call `#to_proc` on the argument. In the case above, because the argument is a symbol, Ruby will call `Symbol#to_proc`. Now that Ruby has the `Proc` it desires, it will convert that `Proc` to a block:

```ruby
[1, 2, 3, 4, 5].map { |n| n.to_s }
```
