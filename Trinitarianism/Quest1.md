# Dependent Types

In a 'place to do maths'
we would like to be able to express and 'prove'
the statement
> There exists a natural that is even.
This requires the notion of a __predicate_.
In general a predicate on a type `A` is a term of type 
`A → Type u`, for example

```agda
isEven : ℕ → Type u
isEven n = ? 
```
